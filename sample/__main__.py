# pylint: disable=missing-module-docstring, no-value-for-parameter

import click


@click.command(name="addition")
@click.argument("augend", type=click.INT)
@click.argument("addend", type=click.INT)
def add(augend: int, addend: int) -> int:
    """add"""

    answer: int = augend + addend
    print(answer)

    return answer


if __name__ == "__main__":
    add()
