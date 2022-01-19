#!/bin/sh

# Takes single argument of a HTML file
# Script only works if file is from the official university website

name="$(grep -e le.Dep "$1" | sed 's/.*- // ; s/<.*$//')"
edu="$(sed -n '/h3.*Edu/,/p>/p' $1 | grep body | sed 's/.*<p>// ; s/<.*$//')"
res="$(sed -n '/h3.*Int/,/p>/p' $1 | grep body | sed 's/.*<p>// ; s/<.*$//')"
loc="$(sed -n '/h3.*Loc/,/p>/p' $1 | grep \/p | sed 's/<..><.*$// ; s/.*>//')"
url="$(grep -e h3.*Homepage "$1" | sed 's/.*f="// ; s/".*$//')"

echo "Name: $name" > info.txt
echo "Education: $edu" >> info.txt
echo "Research Interests: $res" >> info.txt
echo "Office: $loc" >>info.txt
echo "Webpage: $url" >> info.txt
