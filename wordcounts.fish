for AUTHOR in "" # (git shortlog -s | cut -c8-) ""
    echo $AUTHOR
    set COUNT_TOTAL 0
    for COMM in (git log --all --pretty=format:'%H' --no-merges --author="$AUTHOR")
        set COUNT (git diff "$COMM"~ "$COMM" --word-diff=porcelain -- content/book/ 2>/dev/null | grep "^+" | grep -v "^+++" | wc -w)
        if test 5000 -gt $COUNT
            set COUNT_TOTAL (math $COUNT_TOTAL + $COUNT)
        end
    end
    echo $COUNT_TOTAL
end

