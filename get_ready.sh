# get_ready.sh
#
# Sets up environment variables for building QTerminal based on 
# detected installation locations. After running this, you can then
# call `. ./my_cmake.sh` in the same terminal session and it should
# work.
#
# Expects:
#  * Homebrew-installed Qt 5
#  * Homebrew-installed lxqt-build-tools
#  * QTermWidget installed under prefix /tmp/test-lxqt
#  * The qterminal repo checked out at ../qterminal
#
# I am no expert on using CMake with brewed Qts, so this might not
# actually be doing things the Right Way. Suggestions welcome.

PREFIX=/tmp/test-lxqt

MY_QT_PREFIX=$(brew --prefix qt)
if [[ $? != 0 ]]; then
    echo >&2 Error: Could not locate Homebrewed Qt installation
    return
fi
echo "Found Homebrewed Qt at $MY_QT_PREFIX"

PATH="$MY_QT_PREFIX/bin:$PATH"
export LDFLAGS="$LDFLAGS -L$MY_QT_PREFIX/lib"
export CPPFLAGS="$CPPFLAGS -I$MY_QT_PREFIX/include"
export PKG_CONFIG_PATH="$MY_QT_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"

# We'll use a Homebrewed lxqt-build-tools. This needs to be installed
# from the octave-app/octave-app-bases tap.

BUILD_TOOLS_PREFIX=$(brew --prefix lxqt-build-tools)
if [[ $? != 0 ]]; then
    echo >&2 Error: Could not locate Homebrewed lxqt-build-tools installation
    return
fi
PATH="$BUILD_TOOLS_PREFIX/bin:$PATH"

# We're expecting to be working on the QTermWidget source at the same
# time, so use QTermWidget from /tmp/test-lxqt

if [[ -f $PREFIX/include/qtermwidget5/qtermwidget.h ]]; then
    LDFLAGS="$LDFLAGS -L$PREFIX/lib"
    CPPFLAGS="$CPPFLAGS -I$PREFIX/include"
    PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
else
    echo >&2 Error: Could not locate my QTermWidget installation under $PREFIX
    return
fi

echo "Environment variables set up. Ready to configure."
