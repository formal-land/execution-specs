"""
Translate the Python source code of the EVM to Coq
"""
import ast
from pathlib import Path


# For now, we only translate the Cancun version
source_root_dir = Path("../src/ethereum/cancun")


def to_coq(tree: ast.AST) -> str:
    if isinstance(tree, ast.Module):
        output = ""

        if len(tree.body) >= 1 and \
            isinstance(tree.body[0], ast.Expr) and \
            isinstance(tree.body[0].value, ast.Constant):
            output += f"(*{tree.body[0].value.value}*)\n\n"
        else:
            return "No description available at the beginning of the file"

        import_aliases: dict[str, str] = {}
        for node in tree.body[1:]:
            if isinstance(node, ast.ImportFrom):
                if node.module is not None:
                    for alias in node.names:
                        import_aliases[alias.name] = node.module
                    output += f"Require {node.module}.\n"

        return output

    return "Expected a Module node at top-level"


def to_ast(tree: ast.AST) -> str:
    return ast.dump(tree, indent=4)


def translate_file(file_path: Path) -> None:
    with open(file_path) as f:
        source = f.read()
    tree = ast.parse(source)
    output_file_path = Path("translation") / file_path.relative_to(source_root_dir)

    # Create the output directory if it does not exist
    output_file_path.parent.mkdir(parents=True, exist_ok=True)

    # Output the AST file
    with open(output_file_path.with_suffix(".ast"), "w") as f:
        f.write(ast.dump(tree, indent=4))

    # Output the Coq file
    with open(output_file_path.with_suffix(".v"), "w") as f:
        f.write(to_coq(tree))


# We iterate over all the files in the source directory, recursively
for file_path in source_root_dir.rglob("*.py"):
    translate_file(file_path)
