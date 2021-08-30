import click


@click.command(name="addition")
@click.argument("augend", type=click.INT)
@click.argument("addend", type=click.INT)
def sum(augend: int, addend: int) -> int:
    answer: int = augend + addend
    print(answer)

    return answer

if __name__ == "__main__":
    sum()
