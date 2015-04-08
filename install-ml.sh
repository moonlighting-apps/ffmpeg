#!/bin/bash

make clean
make distclean

./configure --enable-gpl --enable-libass --enable-libfaac \
    --enable-libfdk-aac --enable-libmp3lame \
    --enable-libopencore-amrnb --enable-libopencore-amrwb \
    --enable-libspeex --enable-librtmp --enable-libtheora \
    --enable-libvorbis  --enable-libx264 --enable-nonfree \
    --enable-version3 --prefix=/usr --enable-frei0r \
    --extra-cflags="-fPIC" --enable-shared

make -j$(nproc)
sudo checkinstall --pkgname=ffmpeg --pkgversion="n2.6" --backup=no \
    --deldoc=yes --fstrans=no --default
hash -r
