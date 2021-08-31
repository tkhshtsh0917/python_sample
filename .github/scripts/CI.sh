#!/bin/bash

echo "exec 'python -m isort . --check --diff'"
python -m isort . --check --diff
echo

echo "exec 'python -m black . --check --diff'"
python -m black . --check --diff
echo

echo "exec 'python -m mypy sample tests --config-file ./mypy.ini'"
python -m mypy sample tests --config-file ./mypy.ini
echo

echo "exec 'python -m pytest tests -v --cov=sample --cov-branch'"
python -m pytest tests -v --cov=sample --cov-branch
echo
