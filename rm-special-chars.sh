find . -maxdepth 1 -type f -print0 | sort -z | \
while IFS= read -r -d $'\0' f; do 
    dir=$(dirname "$f")
    base=$(basename "$f")
    newbase=$(echo "$base" | sed 's/[^a-zA-Z0-9._-]/_/g')
    mv -v "$f" "$dir/$newbase"
done

