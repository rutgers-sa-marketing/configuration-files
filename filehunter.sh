# more to come...
echo "Documents on the server as of `date +'%Y-%m-%d %H:%M:%S'`" >> server-files.txt && find /Users/brd48/Desktop -type f \( -iname \*.pdf -o -iname \*.doc -o -iname \*.docx -o -iname \*.txt \) -print >> server-files.txt