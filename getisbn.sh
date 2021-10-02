cd "$1"
d=${1%/}
for f in *.pdf; do
	echo -e $f "\t"  >> "../$d-isbntable.tsv";
	bash ../isbnlookup.sh "$f" >> "../$d-isbntable.tsv";
done;
cd ../
sed  -i -z "s/\t\n/\t /g" "$d-isbntable.tsv"

while IFS= read -r line; do
    isbn=$(sed -E  "s/.*\t.*isbn1. (.*)/\1/"   <<<"$line")
    isbnnum=$(sed -E "s/-//g" <<<"$isbn")
    isbnnum=$(python isbn10to13.py "$isbnnum")
    echo $isbnnum
    title=$(sed -E  "s/(^.*?)\t.*$/\1/"   <<<"$line")
    echo -e "$isbnnum \t" "'$title'" >> "$d-isbnparsed.tsv"
    echo -e "$isbnnum" >> "$d-isbn.lst"
    echo -e "$title" >> "$d-title.lst"
done < "$d-isbntable.tsv"
rm "$d-isbntable.tsv"