import sys


def get_handler(*, project=None, logger_name=None):
    """Return a handler based on the environment."""
    try:
        import google.cloud.logging
        from google.cloud.logging.handlers import CloudLoggingHandler

        client = google.cloud.logging.Client(project=project)
        return CloudLoggingHandler(client, name=logger_name)
    except Exception as e:
        print(f"Failed to create logging client: {e}", file=sys.stderr)
        raise
