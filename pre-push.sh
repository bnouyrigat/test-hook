#!/bin/bash
# Prevents force-pushing to master

BRANCH=`git rev-parse --abbrev-ref HEAD`
PUSH_COMMAND=`ps -ocommand= -p $PPID`
PROTECTED_BRANCHES="^(master|dev)"
FORCE_PUSH="force|delete|-f"

if [[ "$BRANCH" =~ $PROTECTED_BRANCHES && "$PUSH_COMMAND" =~ $FORCE_PUSH ]]; then
    echo "Prevented force-push to protected branch \"$BRANCH\""
    exit 1
fi

exit 0
