## Create following folders in Downloads dir:
##   mkdir -p ~/Downloads/AudioFiles ~/Downloads/Bibliography ~/Downloads/DocxFiles ~/Downloads/eMail ~/Downloads/Presentations ~/Downloads/Skype ~/Downloads/VideoFiles ~/Downloads/Compressed ~/Downloads/TextFiles ~/Downloads/DocFiles ~/Downloads/Documents ~/Downloads/Miscellaneous ~/Downloads/ImageFiles

## Use Automator app to create a workflow by selecting Folder Action.
## Then choose Downloads folder
## Choose Run AppleScript from sidebar


#!/bin/bash

for f in "$@"
do
    DEST=""
    LC_FILE=$(basename "$f" | tr '[:upper:]' '[:lower:]') # Use basename and convert to lowercase

    if [[ $LC_FILE == *".pdf"* ]]; then
        DEST="/Users/ptiwari/Downloads/Documents"
    elif [[ $LC_FILE == *".doc"* ]] || [[ $LC_FILE == *".docx"* ]]; then
        DEST="/Users/ptiwari/Downloads/DocFiles"
    elif [[ $LC_FILE == *".txt"* ]] || [[ $LC_FILE == *".sh"* ]] || [[ $LC_FILE == *".py"* ]] || [[ $LC_FILE == *".ipynb"* ]] || [[ $LC_FILE == *".c"* ]] || [[ $LC_FILE == *".cpp"* ]] || [[ $LC_FILE == *".tex"* ]] || [[ $LC_FILE == *".csv"* ]] || [[ $LC_FILE == *".md"* ]] || [[ $LC_FILE == *".xml"* ]] || [[ $LC_FILE == *".json"* ]]; then
        DEST="/Users/ptiwari/Downloads/TextFiles"
    elif [[ $LC_FILE == *".key"* ]] || [[ $LC_FILE == *".ppt"* ]] || [[ $LC_FILE == *".pptx"* ]]; then
        DEST="/Users/ptiwari/Downloads/Presentations"
    elif [[ $LC_FILE == *".png"* ]] || [[ $LC_FILE == *".jpg"* ]] || [[ $LC_FILE == *".jpeg"* ]] || [[ $LC_FILE == *".gif"* ]] || [[ $LC_FILE == *".bmp"* ]] || [[ $LC_FILE == *".tiff"* ]] || [[ $LC_FILE == *".ico"* ]] || [[ $LC_FILE == *".webp"* ]] || [[ $LC_FILE == *".svg"* ]] || [[ $LC_FILE == *".heic"* ]]; then
        DEST="/Users/ptiwari/Downloads/ImageFiles"
    elif [[ $LC_FILE == *".mov"* ]] || [[ $LC_FILE == *".mp4"* ]] || [[ $LC_FILE == *".avi"* ]] || [[ $LC_FILE == *".mkv"* ]] || [[ $LC_FILE == *".wmv"* ]] || [[ $LC_FILE == *".flv"* ]] || [[ $LC_FILE == *".webm"* ]] || [[ $LC_FILE == *".m4v"* ]]; then
        DEST="/Users/ptiwari/Downloads/VideoFiles"
    elif [[ $LC_FILE == *".mp3"* ]] || [[ $LC_FILE == *".wav"* ]] || [[ $LC_FILE == *".aac"* ]] || [[ $LC_FILE == *".flac"* ]] || [[ $LC_FILE == *".ogg"* ]] || [[ $LC_FILE == *".m4a"* ]] || [[ $LC_FILE == *".wma"* ]]; then
        DEST="/Users/ptiwari/Downloads/AudioFiles"
    elif [[ $LC_FILE == *".bib"* ]] || [[ $LC_FILE == *".ris"* ]]; then
        DEST="/Users/ptiwari/Downloads/Bibliography"
    elif [[ $LC_FILE == *".zip"* ]] || [[ $LC_FILE == *".tar"* ]] || [[ $LC_FILE == *".tar.gz"* ]] || [[ $LC_FILE == *".rar"* ]] || [[ $LC_FILE == *".7z"* ]] || [[ $LC_FILE == *".dmg"* ]] || [[ $LC_FILE == *".iso"* ]]; then
        DEST="/Users/ptiwari/Downloads/Compressed"
    elif [[ $LC_FILE == *"/Documents/"* ]] || [[ $LC_FILE == *"/compressed/"* ]] || [[ $LC_FILE == *"/email/"* ]] || [[ $LC_FILE == *"/imagefiles/"* ]] || [[ $LC_FILE == *"/miscellaneous/"* ]] || [[ $LC_FILE == *"/presentations/"* ]] || [[ $LC_FILE == *"/skype/"* ]] || [[ $LC_FILE == *"/textfiles/"* ]] || [[ $LC_FILE == *"/videofiles/"* ]] || [[ $LC_FILE == *"/audiofiles/"* ]] || [[ $LC_FILE == *"/bibliography/"* ]]; then
        # osascript -e "display notification \"$(basename \"$f\") Not Moved (Destination restricted).\""
    else
        DEST="/Users/ptiwari/Downloads/Miscellaneous"
    fi

    if [[ -n "$DEST" ]]; then
        mkdir -p "$DEST"
        mv "$f" "$DEST"
        # osascript -e "display notification \"Moved $(basename \"$f\") to $DEST\""
    fi
done
