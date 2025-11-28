## Use Automator app to create a Quick Action.
## Choose Run AppleScript from sidebar
## Workflow receives no input in {Notes.app}
## Input is entire selection Output replaces selected text
## Image {©Action}
## Colour {Black}
## Keep a png file of a line at /Users/ptiwari/Public/Blackline/hLine.png

set lineImage to (read "/Users/ptiwari/Public/Blackline/hLine.png" as picture)
set the clipboard to lineImage

delay 0.05
tell application "System Events" to keystroke "v" using command down
