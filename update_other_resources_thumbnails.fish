# getting initial screenshots
for i in (grep "<li><img" content/main/other_resources.md | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')
    echo $i
    set name content/images/otherresourcespics/(echo $i | tr "/:" "..")
    echo $name
    if test -e $name.png
        echo skip
    else
        timeout 10 cutycapt --url=$i --delay=1000 --min-width=1200 --out=$name.png 2> /dev/null
    end
    ls -l $name*
end

# using firefox for other screenshots
for i in (grep "<li><img" content/main/other_resources.md | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')
    echo $i
    set name content/images/otherresourcespics/(echo $i | tr "/:" "..")
    echo $name
    if test -e $name.png
        echo skip
    else
        firefox -p headless --screenshot $i --window-size=1200,2400
        mv screenshot.png $name.png
    end
    ls -l $name*
end

