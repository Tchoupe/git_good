git bisect reset &> /dev/null
git bisect start &> /dev/null
git bisect bad &> /dev/null
git rev-list --max-parents=0 HEAD | xargs git bisect good  &> /dev/null
echo "cat source-code | grep 'YES BUG'
CONT=\$?
if [ \$CONT == 0 ]; then
	exit 1
else
	exit 0
fi" > ~/Desktop/script_bisect.sh  > /dev/null
chmod 755 ~/Desktop/script_bisect.sh  > /dev/null
git bisect run ~/Desktop/script_bisect.sh  > /dev/null
git rev-parse HEAD
rm -rf ~/Desktop/script_bisect.sh > /dev/null

