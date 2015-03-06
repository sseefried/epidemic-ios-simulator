#!/bin/bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$THIS_DIR"

for i in libEpidemic.a libSDL2.a libSDL2_mixer.a \
         libcairo.a libfreetype.a libpixman-1.a libpng.a\
         libogg.a libvorbis.a libvorbisfile.a libz.a; do

  for arch in i386 armv7 aarch64; do 
    if [ ! -f $arch/$i ]; then
      echo "Could not find $arch/$i!"
    fi
  done

  CMD="lipo i386/$i armv7/$i aarch64/$i -create -output $i"
  echo $CMD
  $CMD

done

mv libEpidemic.a libEpidemic-plus.a
lipo -remove armv7s libEpidemic-plus.a -output libEpidemic.a
rm libEpidemic-plus.a
