#!/bin/bash

mkdir images
pdfimages -all abc.pdf images/

# create directory to place script output, images and text
mkdir -p out/text

for file in images/*; do
	#echo $file
	tmp=${file##*/}
	name=${tmp%%.*}
	#echo $name
    #mv $file "${file//-/}"
    # convert to plaintext with tesseract
	tesseract $file out/text/"${name##*/}" 
    convert -resize 30% $file out/"${file##*/}"
done

# create new book 
convert out/*.jpg abc_of_unix.pdf


