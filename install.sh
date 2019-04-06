#!/bin/bash
echo 'pretty.c is compiling...'
gcc -v -o html2pcat pretty.c
echo 'pretty.c is compiled.'
chmod a+x html2pcat
echo 'permission is granted.'
ln -s html2pcat ~/../../../../usr/local/bin/html2pcat
command -v foo >/dev/null 2>&1 || { echo "symlink is set to usr local bin. ALL DONE!" >&2; exit 1; }


