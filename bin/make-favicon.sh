#!/usr/bin/env bash -x

# Refer to http://www.imagemagick.org/Usage/thumbnails

in_file=$HOME/Taylor/Writing/Graphics/TU_logo518.png
tmp_file=foo.png
out_file=../public/favicon.ico

convert \
	$in_file \
	-thumbnail '256x256>' \
    -background white \
	-gravity center \
	-extent 256x256 \
	$tmp_file

identify $tmp_file

convert \
	$tmp_file \
	-background white \
    \( -clone 0 -resize 16x16 -extent 16x16 \) \
    \( -clone 0 -resize 32x32 -extent 32x32 \) \
    \( -clone 0 -resize 48x48 -extent 48x48 \) \
    \( -clone 0 -resize 64x64 -extent 64x64 \) \
    -delete 0 \
	-alpha off \
	-colors 256 \
	$out_file

identify $out_file

rm $tmp_file
