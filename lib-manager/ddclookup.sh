cd goDewey
ddcfull=$(go run ddclassify.go -i $1)
ddcId=$(sed -E 's/(.*?):.*/\1/g' <<<"$ddcfull" )
ddcStr=$(sed -E 's/.*?: (.*)/\1/g' <<<"$ddcfull")
echo -e "$1" "\t" "$ddcId" "\t" "$ddcStr"