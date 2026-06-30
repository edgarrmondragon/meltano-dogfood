# Update all plugin lockfiles in plugins/requirements/.
update-lockfiles:
    rm -f plugins/requirements/requirements.*.txt
    prek run pip-compile -a

# Install/refresh the Quarto dashboard's Python dependencies into quarto/.venv.
quarto-install:
    uv venv quarto/.venv --allow-existing
    uv pip install --python quarto/.venv/bin/python -r quarto/requirements.txt

# Preview the Quarto dashboard locally. Requires MOTHERDUCK_TOKEN in the environment.
quarto-preview: quarto-install
    QUARTO_PYTHON={{justfile_directory()}}/quarto/.venv/bin/python quarto preview quarto
