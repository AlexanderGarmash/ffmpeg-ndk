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
PREFIX=../jni/libffmpeg
OPTIMIZE_CFLAGS=" -marm -march=armv6 "
ADDITIONAL_CONFIGURE_FLAG=

./configure \
 --arch=arm \
 --target-os=linux \
 --enable-cross-compile \
 --cross-prefix=${CROSS_PREFIX} \
 --prefix=${PREFIX} \
 --sysroot=${SYSROOT} \
 --extra-cflags=" -I${ARM_INCLUDE} -DANDROID ${OPTIMIZE_CFLAGS}" \
 --extra-ldflags=" -L${ARM_LIB}" \
 --disable-debug \
 --disable-ffplay \
 --disable-ffprobe \
 --disable-ffserver \
 --enable-avfilter \
 --enable-decoders \
 --enable-demuxers \
 --enable-encoders \
 --enable-filters \
 --enable-indevs \
 --enable-network \
 --enable-parsers \
 --enable-protocols \
 --enable-swscale \
 --enable-gpl \
 --enable-nonfree \
 ${ADDITIONAL_CONFIGURE_FLAG}

sed -i "s/HAVE_SYMVER 1/HAVE_SYMVER 0/g" config.h
sed -i "s/HAVE_SYMVER_GNU_ASM 1/HAVE_SYMVER_GNU_ASM 0/g" config.h
sed -i "s/#define restrict restrict/#define restrict/g" config.h
sed -i 's/HAVE_LRINT 0/HAVE_LRINT 1/g' config.h
sed -i 's/HAVE_LRINTF 0/HAVE_LRINTF 1/g' config.h
sed -i 's/HAVE_ROUND 0/HAVE_ROUND 1/g' config.h
sed -i 's/HAVE_ROUNDF 0/HAVE_ROUNDF 1/g' config.h
sed -i 's/HAVE_TRUNC 0/HAVE_TRUNC 1/g' config.h
sed -i 's/HAVE_TRUNCF 0/HAVE_TRUNCF 1/g' config.h