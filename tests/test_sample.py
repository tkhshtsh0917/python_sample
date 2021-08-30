import click
from click.testing import CliRunner

from sample.__main__ import sum


def test_sum():
    runner = CliRunner()
    actual = runner.invoke(sum, ["1", "2"])

    assert actual.exit_code == 0
    assert actual.output == "3\n"

