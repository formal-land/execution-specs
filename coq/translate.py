"""
Translate the Python source code of the EVM to Coq
"""
import ast
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Literal


source_root_dir = Path("../src")


def indent(text: str) -> str:
    levels = 2
    return "\n".join(
        (
            " " * levels + line
            if line.strip() != ""
            else line
        )
        for line in text.splitlines()
    )


@dataclass(frozen=True)
class Environment:
    import_aliases: dict[str, str]
    local_variables: set[str]


def to_coq_expression(environment: Environment, node: ast.expr) -> str:
    if isinstance(node, ast.Attribute):
        return \
            "M.get_field ~(| " + \
                to_coq_expression(environment, node.value) + ", " + \
                "\"" + node.attr + "\"" + \
            " |)"
    if isinstance(node, ast.Call):
        return \
            to_coq_expression(environment, node.func) + " ~(|\n" + \
            indent(
                ',\n'.join(to_coq_expression(environment, arg) for arg in node.args)
            ) + "\n" + \
            "|)"
    if isinstance(node, ast.Constant):
        if node.value is None:
            return "tt"
        if isinstance(node.value, int):
            return str(node.value)
        return "(* TODO constant *)"
    if isinstance(node, ast.Name):
        if node.id in environment.import_aliases:
            return environment.import_aliases[node.id] + "." + node.id
        if node.id in environment.local_variables:
            return node.id
        return "M.get_local ~(| \"" + node.id + "\" |)"
    return "(* TODO expression *)"


def to_coq_statement(environment: Environment, node: ast.stmt) -> str:
    if isinstance(node, ast.Expr):
        if isinstance(node.value, ast.Constant):
            return f"(*{node.value.value}*)"
        return \
            "do* [[ " + to_coq_expression(environment, node.value) + " ]] in"
    if isinstance(node, ast.Assign):
        if len(node.targets) != 1:
            return "(* TODO multiple assignment *)"
        if isinstance(node.targets[0], ast.Name):
            return \
                "do* M.assign \"" + node.targets[0].id + "\" [[\n" + \
                indent(
                    to_coq_expression(environment, node.value) + " in"
                ) + "\n" +\
                "]] in"
        return "(* TODO assignment *)"
    if isinstance(node, ast.AugAssign):
        return \
            "do* M.aug_assign " + \
            "[[ " + to_coq_expression(environment, node.target) + " ]] [[\n" + \
            indent(
                to_coq_expression(environment, node.value)
            ) + "\n" +\
            "]] in"
    return "(* TODO statement *)"


def to_coq_type(environment: Environment, node: ast.expr) -> str:
    if isinstance(node, ast.Name):
        return node.id
    if isinstance(node, ast.Constant):
        if node.value is None:
            return "unit"
        return "(* TODO constant type *)"
    return "(* TODO type *)"


def to_coq_function_def(environment: Environment, node: ast.FunctionDef) -> str:
    arguments = "".join(
        " (" + arg.arg + " : " + to_coq_type(environment, arg.annotation) + ")"
        for arg in node.args.args
        if arg.annotation is not None
    )
    local_variables: set[str] = set(arg.arg for arg in node.args.args)
    return_type = \
        to_coq_type(environment, node.returns) \
        if node.returns is not None \
        else "unit"
    output = f"Definition {node.name}{arguments} : M {return_type} :=\n"

    local_environment = replace(environment, local_variables=local_variables)
    for statement in node.body:
        output += indent(to_coq_statement(local_environment, statement)) + "\n"
    output += indent("M.pure tt.")

    return output


def dir_parent_n_times(dir_path: Path, n: int) -> Path:
    for _ in range(n):
        dir_path = dir_path.parent
    return dir_path


ToCoqMode = Literal['header_comment', 'imports', 'definitions']


def to_coq(dir_path: Path, tree: ast.AST) -> str:
    if isinstance(tree, ast.Module):
        output = "(* Generated *)\n"
        mode: ToCoqMode = 'header_comment'
        environment: Environment = Environment(
            import_aliases={},
            local_variables=set()
        )

        for node in tree.body:
            if mode == 'header_comment':
                if isinstance(node, ast.Expr) and isinstance(node.value, ast.Constant):
                    output += f"(*{node.value.value}*)\n\n"
                    mode = 'imports'
                    continue
                else:
                    return "No description available at the beginning of the file"
            if mode == 'imports':
                if isinstance(node, ast.ImportFrom):
                    module = node.module if node.module is not None else "__init__"
                    for alias in node.names:
                        environment.import_aliases[alias.name] = module
                    prefix = (
                        str(dir_parent_n_times(
                            dir_path.relative_to(source_root_dir),
                            node.level - 1,
                        )).replace("/", ".") + "."
                        if node.level != 0
                        else ""
                    )
                    output += f"Require {prefix}{module}.\n"
                else:
                    mode = 'definitions'
            if isinstance(node, ast.FunctionDef):
                output += '\n'
                output += to_coq_function_def(environment, node) + "\n"

        return output

    return "Expected a Module node at top-level"


def to_ast(tree: ast.AST) -> str:
    return ast.dump(tree, indent=4)


def translate_file(file_path: Path) -> None:
    with open(file_path) as f:
        source = f.read()
    tree = ast.parse(source)
    output_file_path = file_path.relative_to(source_root_dir)

    # Create the output directory if it does not exist
    output_file_path.parent.mkdir(parents=True, exist_ok=True)

    # Output the AST file
    with open(output_file_path.with_suffix(".ast"), "w") as f:
        f.write(ast.dump(tree, indent=4))

    # Output the Coq file
    with open(output_file_path.with_suffix(".v"), "w") as f:
        f.write(to_coq(file_path.parent, tree))


# We iterate over all the files in the source directory, recursively
for file_path in source_root_dir.rglob("*.py"):
    translate_file(file_path)
