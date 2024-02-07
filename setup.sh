#!/bin/bash

set -x

### Packages
dnf update -y
dnf install -y sbcl git make gcc ncurses-devel redhat-rpm-config curl rlwrap

### Config
git clone https://github.com/garlic0x1/.lem ~/.config/lem
curl https://raw.githubusercontent.com/garlic0x1/dotfiles/master/.bashrc > ~/.bashrc
source ~/.bashrc

### Applications
mkdir tools
pushd tools

# install quicklisp
curl https://beta.quicklisp.org/quicklisp.lisp > ql-install.lisp
yes "" | sbcl \
	--load ql-install.lisp \
	--eval '(quicklisp-quickstart:install)' \
	--eval '(ql:add-to-init-file)' \
	--eval '(quit)'


# install qlot
git clone https://github.com/fukamachi/qlot
pushd qlot
./scripts/setup.sh
./scripts/install.sh
popd

# install lem
git clone https://github.com/lem-project/lem
pushd lem
make ncurses
cp lem /usr/bin/lem
make jsonrpc
cp lem-jsonrpc /usr/bin/lem-jsonrpc
popd

popd
