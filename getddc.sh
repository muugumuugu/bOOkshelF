d=${1%/}
while IFS= read -r line; do
    bash ddclookup.sh $line $d
done < "$d-isbn.lst"
while IFS= read -r line; do
    bash ddclookuptitle.sh "$line" $d
done < "$d-title.lst"