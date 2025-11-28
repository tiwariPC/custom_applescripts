## Use Automator app to create a Quick Action.
## ## Workflow receives no input in {any application}
## Input is entire selection Output replaces selected text
## Image {©Action}
## Colour {Black}




on run {input, parameters}
	-- Get date and time
	set dateTimeString to do shell script "date +'%d/%m/%Y %H:%M:%S'"
	
	-- Copy to clipboard
	set the clipboard to dateTimeString
	
	-- Paste it using Command+V
	tell application "System Events"
		keystroke "v" using {command down}
	end tell
end run
