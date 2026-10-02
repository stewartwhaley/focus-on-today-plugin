#!/bin/sh
# Starts Focus On Today's MCP server on stdio: the installed app's own binary,
# run with /mcp. Direct-execs it so stdin/stdout pass straight through to
# Claude. Nothing is downloaded and nothing goes over the network.
#
# Looks for the app in FOCUSONTODAY_APP_PATH (if set), then /Applications,
# then ~/Applications, then anywhere Spotlight knows of it.

set -eu

app="${FOCUSONTODAY_APP_PATH:-}"
if [ -z "$app" ] || [ ! -d "$app" ]; then
    if [ -d "/Applications/Focus On Today.app" ]; then
        app="/Applications/Focus On Today.app"
    elif [ -d "$HOME/Applications/Focus On Today.app" ]; then
        app="$HOME/Applications/Focus On Today.app"
    else
        # Skip Xcode build products: a stale debug build may predate /mcp.
        app=$(mdfind "kMDItemCFBundleIdentifier == 'ITP.focusontoday'" 2>/dev/null | grep -v '/DerivedData/' | head -n 1)
    fi
fi

binary="$app/Contents/MacOS/Focus On Today"
if [ ! -x "$binary" ]; then
    echo "Focus On Today: couldn't find the app. Install it from https://focusonto.day, then restart Claude." >&2
    exit 2
fi

exec "$binary" /mcp
