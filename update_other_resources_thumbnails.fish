#!/usr/bin/env fish
for i in (grep "<li><img" content/main/other_resources.md | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')
    echo $i
    set name content/images/otherresourcespics/(echo $i | tr "/:" "..")
    cutycapt --url=$i --delay=1000 --min-width=1200 --out=$name.png
    mogrify -crop 1200x1500 $name.png
    mv $name-0.png $name.png
    rm $name-*.png
    mogrify -adaptive-resize 480x600 $name.png
end

