# pylint: disable=missing-module-docstring

from click.testing import CliRunner

from sample.__main__ import add


def test_add() -> None:
    """test `add`"""

    runner = CliRunner()
    actual = runner.invoke(add, ["1", "2"])

    assert actual.exit_code == 0
    assert actual.output == "3\n"
