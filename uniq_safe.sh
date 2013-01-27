#!/bin/sh

cat *.txt | sed 's/[^a-zA-Z0-9_\.-]/-/g;s/--+/-/g' | grep -vE '^$' | uniq | sort
