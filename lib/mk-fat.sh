for i in libEpidemic.a libSDL2.a libSDL2_mixer.a \
         libcairo.a libfreetype.a libpixman-1.a libpng.a libz.a; do

  CMD="lipo armv7/$i aarch64/$i -create -output $i"
  echo $CMD
  $CMD

done

mv libEpidemic.a libEpidemic-plus.a
lipo -remove armv7s libEpidemic-plus.a -output libEpidemic.a
rm libEpidemic-plus.a
