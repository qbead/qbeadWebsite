#set suffix ".jpg"
set suffix ".png"

cd content
for file in (find images/ -type f -name "*$suffix")
  if [ (du $file | cut -d"	" -f1) -le 500 ] # filter for bigger than 500kb
    if [ (identify -format '%w' $file) -le 2500 ] # filter for width
      if [ (identify -format '%h' $file) -le 2500 ] # filter for height
        continue
      end
    end
  end
  if grep -r "$file" book
  else
    continue
  end
  identify -format '%w %h ' $file
  du $file
  echo ""
  #cp $file $file.auto_compless_orig$suffix
  #mogrify -adaptive-resize 1800 $file
end
