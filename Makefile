VENV_PATH?=venv
PYTHON?=python3

clean:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete
	rm -rf dist build
	rm -rf .pytest_cache
	rm -rf .tox
	rm -rf .coverage
	rm -rf .coverage.*
	rm -rf "$(VENV_PATH)"

venv:
	"$(PYTHON)" -m venv "$(VENV_PATH)"
	"$(VENV_PATH)"/bin/pip install --upgrade setuptools wheel
	"$(VENV_PATH)"/bin/pip install --upgrade pytest pytest-asyncio pytest-mock
	"$(VENV_PATH)"/bin/pip install --upgrade tox flake8 isort coverage
	"$(VENV_PATH)"/bin/pip install --editable ../pyimgbox
	"$(VENV_PATH)"/bin/pip install --editable .
