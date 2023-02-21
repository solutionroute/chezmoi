#!/bin/sh
# outputs patch for modified and new files; mostly here for creating dwm/dmenu/st or other patches for void-packages
alias gdnew="for next in \$( git ls-files --others --exclude-standard ) ; do git --no-pager diff --no-index /dev/null \$next; done;"
{ git --no-pager diff; gdnew }
