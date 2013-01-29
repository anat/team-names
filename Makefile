all:	build/thot.txt build/thot.json

build/thot.txt:		thot_2*.txt
	cat $? | sed 's/[^a-zA-Z0-9_\.-]/-/g;s/--+/-/g' | sort -u > /tmp/thot.txt-a
	sort -u thot_8=*D.txt > /tmp/thot.txt-b
	comm -23 /tmp/thot.txt-a /tmp/thot.txt-b > $@
	rm -f /tmp/thot.txt-a /tmp/thot.txt-b

build/thot.json:	build/thot.txt
	cat $? | python -c 'import sys, json; print json.dumps(sys.stdin.read().split())' > $@

clean:
	rm -f build/*

re:	clean all