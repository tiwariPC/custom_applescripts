## mkdir -p ~/Screenshots
## defaults write com.apple.screencapture location ~/Desktop
## defaults write com.apple.screencapture type jpeg
## defaults write com.apple.screencapture name -string "ScreenShot"
## defaults write com.apple.screencapture include-date -bool false

## Use Automator app to create a workflow by selecting Folder Action.
## Then choose Desktop folder
## Add Run Shell Script option then add the script below to the box and save it in ~/Library/Workflows/Applications/Folder Actions/

#!/bin/bash

processed_dir="/Users/ptiwari/Screenshots"
latest_file="$(find "$@" -type f -name "ScreenShot*" -exec ls -t {} + | head -n1)"

if [ -n "$latest_file" ]; then
    DATE_TIME=$(date +"%Y%m%d_at_%H%M%S")
    FILENAME=$(basename -- "$latest_file")
    # Remove anything after "ScreenShot"
    FILENAME="${FILENAME%%[^ScreenShot]*}"
    EXTENSION="${latest_file##*.}"
    NEW_FILENAME="ScreenShot_${DATE_TIME}.${EXTENSION}"
    mv "$latest_file" "$processed_dir/$NEW_FILENAME"
fi
