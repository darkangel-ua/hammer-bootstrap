#!/bin/bash

set -e

function download()
{
   url=$1
   filename=$2
   unpack_dest="./dependencies/"$3

   if [ ! -d $unpack_dest ]; then
      mkdir $unpack_dest
   fi

   curl -L "$url/$filename" > $filename
   tar -xf "$filename" -C $unpack_dest
}

download 'http://downloads.sourceforge.net/project/boost/boost/1.58.0' 'boost_1_58_0.tar.bz2' 'boost'
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'libantlr3c-3.1.1.tar.bz2' 'libantlr3c'
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'boost.sandbox.guid-1.58.0.tar.bz2' 'boost/guid/1.58.0'
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'boost.sandbox.crypto-1.58.0.tar.bz2' 'boost/crypto/1.58.0'
download 'https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/' 'boost.sandbox.process-1.58.0.tar.bz2' 'boost/process/1.58.0'

git clone https://github.com/darkangel-ua/hammer.git
cd hammer && git reset --hard 67eb8d41730b810745d036f93f55729d48a42d0c && cd ..

if [ -d ./build ]; then
   rm -R ./build
fi

mkdir build && cd build && cmake ../ && make -j 4 && cpack
