all:	build/thot.txt build/thot.json

build/thot.txt:		thot_2*.txt
	cat $? | sed 's/[^a-zA-Z0-9_\.-]/-/g;s/--+/-/g' | uniq | sort > $@

build/thot.json:	build/thot.txt
	cat $? | python -c 'import sys, json; print json.dumps(sys.stdin.read().split())' > $@

clean:
	rm -f build/*

re:	clean all