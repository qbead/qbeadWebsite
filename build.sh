#!/bin/bash

shopt -s nullglob # permit empty set globs

rm -rf build
mkdir build

cp -r content/images build/images
cp -r content/data build/data
cp -r static/* build/

echo "MAIN"
for mdfile in content/main/*{index,$@}*md; do\
    name=$(basename -s .md $mdfile)
    echo $name
    pandoc -o build/"$name".html -s -f markdown+emoji --mathjax --css="/custom.css" --css="/custom_main_v2.css" --template="custom_v2" --data-dir="data-dir" $mdfile
    mkdir build/$name
    mv build/$name.html build/$name/index.html
done
cp build/index/index.html build/index.html

echo "BOOK"
for mdfile in content/book/*{book,$@}*md; do\
    name=$(basename -s .md $mdfile)
    echo $name
    if grep -Fxq "toc: yes" $mdfile
    then
        pandoc -o build/"$name".html -s --toc -f markdown+emoji --mathjax --css="/custom.css" --css="/custom_book.css" --template="custom_book" --data-dir="data-dir" $mdfile
    else
        pandoc -o build/"$name".html -s       -f markdown+emoji --mathjax --css="/custom.css" --css="/custom_book.css" --template="custom_book" --data-dir="data-dir" $mdfile
    fi
    mkdir build/$name
    mv build/$name.html build/$name/index.html
done

echo "SLIDES"
mkdir build/slides
for mdfile in content/slides/*$@*md; do\
    name=$(basename -s .md $mdfile)
    echo $name
    pandoc -t revealjs -s -o build/slides/"$name".html -V theme=black -V revealjs-url=/reveal.js $mdfile
    mkdir build/slides/$name
    mv build/slides/$name.html build//slides/$name/index.html
done
