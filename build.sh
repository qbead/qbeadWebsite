#!/bin/bash

rm -rf build/*

cp -r content/images build/images
cp -r static/* build/

for mdfile in content/main/*md; do\
    name=$(basename -s .md $mdfile)
    echo $name
    pandoc -o build/"$name".html -s -f markdown+emoji --mathjax --css="/custom.css" --css="/custom_main_v2.css" --template="custom_v2" --data-dir="data-dir" $mdfile;\
    mkdir build/$name
    cp build/$name.html build/$name/index.html
    pandoc -o build/"$name"v1.html -s -f markdown+emoji --mathjax --css="/custom.css" --css="/custom_main_v1.css" --template="custom_v1" --data-dir="data-dir" $mdfile;\
    mkdir build/"$name"v1
    cp build/"$name"v1.html build/"$name"v1/index.html
done

for mdfile in content/book/*md; do\
    name=$(basename -s .md $mdfile)
    echo $name
    pandoc -o build/"$name".html -s -f markdown+emoji --mathjax --css="/custom.css" --css="/custom_book.css" --template="custom_book" --data-dir="data-dir" $mdfile;\
    mkdir build/$name
    cp build/$name.html build/$name/index.html
done

cp -r codedoc build/codedoc

#grep "title: " content/*.md | sort | sed -E "s/content\/([0-9\.a-zA-Z_]*)\.md:title: ([a-zA-Z ]*)/<a href='\\1.html'>\2<\/a><br>/" > build/all.html
