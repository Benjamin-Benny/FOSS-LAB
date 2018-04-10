FILENAME="$1"
echo "File Modification Time : $(stat -c %y "$FILENAME")"
