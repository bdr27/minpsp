#!/bin/bash
set -e
. ../util/util.sh

LIBNAME=cubicvr
VERSION=1237

svnGet build "https://cubicvr.svn.sourceforge.net/svnroot/cubicvr/trunk/cubicvr" cubicvr
svnGet build "https://cubicvr.svn.sourceforge.net/svnroot/cubicvr/trunk/cubicvr" psp

mv build/cubicvr build/cubicvr_src
mkdir -p build/$LIBNAME
mv build/cubicvr_src build/$LIBNAME/cubicvr
mv build/psp build/$LIBNAME/psp
cd build/$LIBNAME/psp
make -s
make -s install
cd ../../..

makeInstaller $LIBNAME $VERSION

echo "Done!"
