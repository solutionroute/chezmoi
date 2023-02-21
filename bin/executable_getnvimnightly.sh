#!/bin/bash
# assumes you want to link /usr/bin/nvim to $HOME/.local/bin/nvim-linux64/bin/nvim

LOCALBINDIR=$HOME/.local/bin
TARGET=nvim-linux64

mkdir -p $HOME/bin

cd $LOCALBINDIR
# remove any prior extracted nvim directory
if test -d "$TARGET"; then
	rm -rf $TARGET
fi

# get a new copy, always with the same file name
wget https://github.com/neovim/neovim/releases/download/nightly/$TARGET.tar.gz -O $TARGET.tar.gz

tar zxvf $TARGET.tar.gz
rm $TARGET.tar.gz

# see if symlink is there
if ! test -h "/usr/bin/nvim"; then
	echo "symlink not found, creating..."
	# if distribution package installed/reinstalled, nvim will be a regular file
	if test -f "/usr/bin/nvim"; then
		echo "moving distro nvim to nvim-dist"
		sudo mv /usr/bin/nvim /usr/bin/nvim-dist
	fi
	sudo ln -sv $LOCALBINDIR/$TARGET/bin/nvim /usr/bin/nvim
else
	# recreate the symlink in case we've moved target
	sudo rm /usr/bin/nvim
	sudo ln -sv $LOCALBINDIR/$TARGET/bin/nvim /usr/bin/nvim
	#
fi
