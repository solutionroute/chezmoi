#!/bin/bash
# assumes you want to link /usr/bin/nvim to $HOME/bin/nvim-linux64/bin/nvim; also assumes you have $HOME/bin on your  path.

CONFDIR=$HOME/src/dotfiles/bin
TARGET=$HOME/bin

cd $TARGET

for FILE in *; do

	if test -h "$TARGET/$FILE"; then
		# echo "symlink: $FILE"
		rm $TARGET/$FILE
		if test -f $CONFDIR/$FILE; then
			echo "moved $CONFDIR/$FILE"
			mv $CONFDIR/$FILE $TARGET/.
		fi
		if test -d $CONFDIR/$FILE; then
			echo "moved $CONFDIR/$FILE"
			mv $CONFDIR/$FILE $TARGET/.
		fi
	fi

done

# see if symlink is there
# if ! test -h "/usr/bin/nvim"; then
# 	echo "symlink not found, creating..."
# 	# if distribution package installed/reinstalled, nvim will be a regular file
# 	if test -f "/usr/bin/nvim"; then
# 		echo "moving distro nvim to nvim-dist"
# 		sudo mv /usr/bin/nvim /usr/bin/nvim-dist
# 	fi
# 	sudo ln -sv $BINDIR/$TARGET/bin/nvim /usr/bin/nvim
# fi
