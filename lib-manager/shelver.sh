title=$(sed -e 's|.*/||' <<<" $PWD");
rm index.html;
header="<!DOCTYPE html>
<html><head>
<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">
<meta charset=\"utf-8\">
<meta name=\"viewport\" content=\"width=device-width\">
<title>$title shelf</title>
<link rel=\"stylesheet\" href=\"/styles/home.css\">
<style>img{width:200px;height:200px;}	div.bend{width:200px;border:none; padding:0px; margin:0px;text-align:center;}	div{margin:5px;padding:2px; border-width:0.2; border:dotted; border-color:white;}</style>
</head>
<body>
<header>
<h1> $title shelf</h1>
</header>
<span class=\"qtlink\"><b>\n\n
<div class=\"flex\" style=\"border:none\">";
ls -I thumbs -I  f.txt> f.txt
sed -i -e "s|.*/||"  f.txt
sed -E  -i "s|^(.*)\.(.*)$|<div><a href=\"\1.\2\"><img src=\"thumbs/\1.webp\" title=\"\1\" alt=\"\1\"><div class=\"bend\">\1.\2</a></div></div>|" f.txt
footer="\n\n</div>
</b></span>
<footer style=\"background:rgba(0,0,0,0.1); margin:0px;\">
	<center><a style=\"color:#b5e853; font-size:20px;\" href=\"../index.html\">bOOkshelf</a></center>
</footer>
</body></html>"

echo -e $header >index.html
cat f.txt>>index.html
echo -e $footer>> index.html
rm f.txt;