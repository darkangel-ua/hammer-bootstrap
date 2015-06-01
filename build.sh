#!/bin/bash

set -e

function download()
{
   url=$1
   filename=$2
   unpack_dest=$3

   wget -c "$url/$filename"
   tar -xf "$filename" -C ./dependencies/$unpack_dest
}

download 'http://downloads.sourceforge.net/project/boost/boost/1.40.0' 'boost_1_40_0.tar.bz2' 'boost'
cd ./dependencies/boost && patch -p1 < ../../patches/boost_1_40_0_thread.patch && cd ../../
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'libantlr3c-3.1.1.tar.bz2' 'libantlr3c'
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'boost.guid-1.40.0.tar.bz2' 'boost/guid'
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'boost.crypto-1.40.0.tar.bz2' 'boost/crypto'
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'boost.process-1.40.0.tar.bz2' 'boost/process'
svn checkout -r 617 http://svn.code.sf.net/p/buildhammer/code/hammer

if [ -d ./build ]; then
   rm -R ./build
fi

mkdir build && cd build

cmake ../ && make -j 4
