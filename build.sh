#!/bin/bash

wget https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/libantlr3c-3.1.1.tar.bz2
wget https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/boost.guid-1.40.0.tar.bz2
wget https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/boost.crypto-1.40.0.tar.bz2
wget https://dl.dropboxusercontent.com/u/13148925/hammmer-bootstrap-libs/boost.process-1.40.0.tar.bz2

tar -xf libantlr3c-3.1.1.tar.bz2 -C ./dependencies/libantlr3c
tar -xf boost.guid-1.40.0.tar.bz2 -C ./dependencies/boost/guid
tar -xf boost.crypto-1.40.0.tar.bz2 -C ./dependencies/boost/crypto
tar -xf boost.process-1.40.0.tar.bz2 -C ./dependencies/boost/process

mkdir build
cd build

cmake ../ && cmake --build ./
