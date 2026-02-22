# Run with Dagster

```shell
uv venv -p 3.12
source .venv/bin/activate
uv pip install --exact -r requirements.txt
dagster dev --log-level debug -f project/meltano.py
```
