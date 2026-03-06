# Update all plugin lockfiles in plugins/requirements/.
# The cooldown prevents picking up packages published less than N days ago.
# Usage: just update-lockfiles        (defaults to 7 days)
#        just update-lockfiles P14D   (14-day cooldown)
update-lockfiles cooldown="P7D":
    rm -f plugins/requirements/requirements.*.txt
    UV_EXCLUDE_NEWER={{cooldown}} prek run pip-compile -a
