# lispy-fedora

Scripts to set up a Lisp environment on a new Fedora machine.

# setup.sh

## Packages

Update DNF package database.

Install C compiler, SBCL, a few utils, and dependencies for Lem and Qlot.

## Config

- Clone my Lem config
- Copy `.bashrc` into `~/` and source it

## Applications

### Quicklisp

Fetch [Quicklisp install script](https://beta.quicklisp.org/quicklisp.lisp) and install it, `yes` is piped in but you might have to manually hit enter when Quicklisp is added to the `.sbclrc` file.

### Qlot

Clone and build Qlot according to it's manual.

### Lem

Clone and build ncurses and jsonrpc versions, then install binaries into `$PATH`
