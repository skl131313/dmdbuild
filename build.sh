#!/bin/bash

set -uexo pipefail

export PATH="$PWD/tools/:$PWD/host/dmd2/windows/bin/:$PATH"
export DMD="$PWD/host/dmd2/windows/bin/dmd.exe"

which dmd
dmd --version

# vcbuild/dmc-msvc uses this environment variable for the MSVC compiler
# otherwise it defaults to using only the amd64 version
export MSVC_CC=`which cl`

# 32mscoff

cd $ROOT/src/dmd/src/
make -f win64.mak MODEL=32mscoff OBJ_MSVC='$G/strtold.obj $G\longdouble.obj' debdmd

# cd $ROOT/src/druntime
# make -f win64.mak clean
# make -f win64.mak VCDIR="${VCINSTALLDIR::-1}" DMD=../dmd/src/dmd druntime32mscoff

# cd $ROOT/src/phobos
# make -f win64.mak clean
# make -f win64.mak VCDIR="${VCINSTALLDIR::-1}" DMD=../dmd/src/dmd phobos32mscoff

# 32 dmc

# cd $ROOT/src/dmd/src/
# make -f win32.mak debdmd

# cd $ROOT/src/druntime
# make -f win32.mak clean
# make -f win32.mak DMD=../dmd/src/dmd

# cd $ROOT/src/phobos
# make -f win32.mak clean
# make -f win32.mak DMD=../dmd/src/dmd

# cd $ROOT/src/dmd/test
# gnumake -j4 all LIB="../../phobos;$LIB"

echo "--- Done ---"



