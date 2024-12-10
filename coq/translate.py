"""
Translate the Python source code of the EVM to Coq
"""
import ast
from pathlib import Path
from typing import Literal


source_root_dir = Path("../src/ethereum")


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


def to_coq_expression(import_aliases: dict[str, str], node: ast.expr) -> str:
    if isinstance(node, ast.Name):
        if node.id in import_aliases:
            return import_aliases[node.id] + "." + node.id
        return node.id
    if isinstance(node, ast.Call):
        return \
            to_coq_expression(import_aliases, node.func) + " (|\n" + \
            indent(
                ',\n'.join(to_coq_expression(import_aliases, arg) for arg in node.args)
            ) + "\n" + \
            "|)"
    if isinstance(node, ast.Attribute):
        return \
            to_coq_expression(import_aliases, node.value) + ".[\"" + node.attr + "\"]"
    return "(* TODO expression *)"


def to_coq_statement(import_aliases: dict[str, str], node: ast.stmt) -> str:
    if isinstance(node, ast.Expr):
        if isinstance(node.value, ast.Constant):
            return f"(*{node.value.value}*)"
        return \
            "do* " + to_coq_expression(import_aliases, node.value) + " in"
    if isinstance(node, ast.Assign):
        if len(node.targets) != 1:
            return "(* TODO multiple assignment *)"
        if isinstance(node.targets[0], ast.Name):
            return \
                "let* " + node.targets[0].id + " := " + \
                to_coq_expression(import_aliases, node.value) + " in"
        return "(* TODO assignment *)"
    return "(* TODO statement *)"


def to_coq_function_def(import_aliases: dict[str, str], node: ast.FunctionDef) -> str:
    output = f"Definition {node.name} : M unit :=\n"

    for statement in node.body:
        output += indent(to_coq_statement(import_aliases, statement)) + "\n"

    return output


def dir_parent_n_times(dir_path: Path, n: int) -> Path:
    for _ in range(n):
        dir_path = dir_path.parent
    return dir_path


ToCoqMode = Literal['header_comment', 'imports', 'definitions']


def to_coq(dir_path: Path, tree: ast.AST) -> str:
    if isinstance(tree, ast.Module):
        output = ""
        mode: ToCoqMode = 'header_comment'
        import_aliases: dict[str, str] = {}

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
                    if node.module is not None:
                        for alias in node.names:
                            import_aliases[alias.name] = node.module
                        prefix = (
                            str(dir_parent_n_times(
                                dir_path.relative_to(source_root_dir),
                                node.level - 1
                            )).replace("/", ".") + "."
                            if node.level != 0
                            else ""
                        )
                        output += f"Require {prefix}{node.module}.\n"
                else:
                    mode = 'definitions'
            if isinstance(node, ast.FunctionDef):
                output += '\n'
                output += to_coq_function_def(import_aliases, node) + "\n"

        return output

    return "Expected a Module node at top-level"


def to_ast(tree: ast.AST) -> str:
    return ast.dump(tree, indent=4)


def translate_file(file_path: Path) -> None:
    with open(file_path) as f:
        source = f.read()
    tree = ast.parse(source)
    output_file_path = Path("ethereum") / file_path.relative_to(source_root_dir)

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
