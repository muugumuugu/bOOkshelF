for f in *.epub ;do  epub-thumbnailer "$f" "${f%.epub}.png" 800; done;
mogrify -thumbnail 200 -format webp -path thumbs *.png *.pdf[0] *.djvu[0]