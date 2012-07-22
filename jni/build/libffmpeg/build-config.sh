#!/bin/bash

export TMPDIR=E:/android/ndk/tmp
#export PATH=$PATH:${PREBUILT}/bin

ANDROID_API=android-9
NDK=E:/android/ndk
SYSROOT=${NDK}/platforms/${ANDROID_API}/arch-arm
PREBUILT=${NDK}/toolchains/arm-linux-androideabi-4.4.3/prebuilt/windows
CROSS_PREFIX=${PREBUILT}/bin/arm-linux-androideabi-
ARM_INCLUDE=${SYSROOT}/usr/include
ARM_LIB=${SYSROOT}/usr/lib
EXTRA_CFLAGS=" -std=c99 -fPIC -DANDROID"
EXTRA_LDFLAGS=" -nostdlib -lc -lm -ldl -llog"
PREFIX=../../libffmpeg
OPTIMIZE_CFLAGS=" -marm -march=armv6 "
ADDITIONAL_CONFIGURE_FLAG=

./configure \
 --arch=arm \
 --target-os=linux \
 --enable-cross-compile \
 --cross-prefix=${CROSS_PREFIX} \
 --prefix=${PREFIX} \
 --sysroot=${SYSROOT} \
 --extra-cflags=" -I${ARM_INCLUDE} $(EXTRA_CFLAGS) ${OPTIMIZE_CFLAGS}" \
 --extra-ldflags=" -L${ARM_LIB} $(EXTRA_LDFLAGS)" \
 --disable-debug \
 --disable-ffprobe \
 --disable-ffserver \
 --enable-avfilter \
 --enable-decoders \
 --enable-encoders \
 --enable-filters \
 --enable-gpl \
 --enable-nonfree \
 ${ADDITIONAL_CONFIGURE_FLAG}

sed -i "s/HAVE_SYMVER 1/HAVE_SYMVER 0/g" config.h
sed -i "s/HAVE_SYMVER_GNU_ASM 1/HAVE_SYMVER_GNU_ASM 0/g" config.h
sed -i "s/#define restrict restrict/#define restrict/g" config.h