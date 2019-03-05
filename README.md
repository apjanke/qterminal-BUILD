qterminal-BUILD
=================

This is apjanke's repo of stuff for getting [QTerminal](https://github.com/lxqt/qterminal) to build on macOS with a Homebrew-installed Qt.

Usage
=====

* Install QTermWidget using https://github.com/apjanke/qtermwidget-BUILD
* Clone https://github.com/lxqt/qterminal somewhere
* Clone this repo (https://github.com/apjanke/qterminal-BUILD) next to it
* `cd qterminal-BUILD`
* `. ./get_ready.sh`
* `. ./my_cmake.sh`
* `make`
* `make install`

You can clean this directory by running:

* `./clean.sh`
