#!/bin/bash

REMARKABLE_DIR="$HOME/Documents/writing/Remarkable"

inotifywait -m -e close_write --format "%w%f" "$REMARKABLE_DIR" | while read FILE
do
    if [[ $FILE == *.md ]]; then
        # Convert markdown to PDF
        PDF_FILE="${FILE%.md}.pdf"
        pandoc "$FILE" -o "$PDF_FILE"
        
        if [ $? -eq 0 ]; then
            rmapi put "$PDF_FILE"
            if [ $? -eq 0 ]; then
                echo "Successfully uploaded $PDF_FILE to Remarkable"
            # remove the files after successful upload
                rm "$FILE"
                rm "$PDF_FILE"
            else
                echo "Failed to upload $PDF_FILE to Remarkable"
            fi
        else
            echo "Failed to convert $FILE to PDF"
        fi
    elif [[ $FILE == *.pdf ]]; then
        # Directly upload PDF files
        rmapi put "$FILE"
        if [ $? -eq 0 ]; then
            echo "Successfully uploaded $FILE to Remarkable"
        # remove the file after successful upload
            rm "$FILE"
        else
            echo "Failed to upload $FILE to Remarkable"
        fi
    fi
done
