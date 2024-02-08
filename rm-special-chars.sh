find . -type f -print0 | sort -rz | \
while IFS= read -r -d $'\0' f; do 
    newname=$(echo "$f" | sed 's/[^a-zA-Z0-9._-]/=/g')
    mv -v "$f" "$newname"
done
