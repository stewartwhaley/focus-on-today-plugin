# Focus On Today for Claude

Lets Claude read and change the tasks in [Focus On Today](https://focusonto.day), the Mac menu-bar to-do app. Ask what's due today, tomorrow, this week or overdue; search by text, completion and priority; add tasks and subtasks with notes, due dates and priorities; and complete, move, recolor and delete tasks. Edits show up in the running app within a moment.

## Requirements

- A Mac running macOS 15.1 or later
- [Focus On Today](https://focusonto.day) installed, with the **Automation** purchase. Exporting the whole list also needs **Storage**. Without Automation, Claude still connects and lists the tools, and each call answers with what to unlock.

## Where it works

The tools run on your Mac, so they work in **Claude Code** and in **Cowork** tasks that run on your computer. They don't run in Claude chats on the web or the mobile apps, which can't start programs on your Mac.

## Tools

| Tool | What it does |
|---|---|
| `find_tasks` | Search by text, completion, due date (`overdue`, `today`, `tomorrow`, `thisWeek`, …), priority, and when a task was last changed or created |
| `get_task` | One task and its direct subtasks |
| `add_task` | Add a task or subtask, with notes, due date (optionally at your morning, afternoon or evening time) and priority |
| `update_task` | Change a task's title, notes, due date or priority |
| `complete_task` | Mark a task done, or reopen it |
| `move_task` | Move a task under a new parent, or to the top level |
| `delete_task` | Delete a task and its subtasks |
| `list_colors` | The palette's color ids and their current colors |
| `set_task_colors` | Add a palette color to a task, or clear its colors |
| `export_tasks` | The whole task list in Focus On Today's Export JSON format |

Weeks start on Monday. Dates are ISO 8601; a date without a UTC offset is in your local time zone.

## What it runs and sends

The plugin contains one shell script, [`server/focusontoday-mcp.sh`](server/focusontoday-mcp.sh). It finds Focus On Today on your Mac (in `/Applications`, `~/Applications`, or wherever Spotlight finds it) and starts the app's own binary with `/mcp`, which serves the tools over standard input and output.

- Nothing is downloaded or installed, and the plugin makes no network connections.
- Your tasks go only to Claude, as answers to the tools Claude calls.
- The server reads and writes the same task store as the menu-bar app on your Mac. It doesn't sync to iCloud itself; if you use iCloud sync, the menu-bar app syncs the changes as it does for edits you make yourself.

Privacy policy: [focusonto.day/privacy](https://focusonto.day/privacy/). Support: [focusonto.day/support](https://focusonto.day/support/).

## License

MIT. See [LICENSE](LICENSE). The license covers the files in this plugin, not the Focus On Today app.
