#!/usr/bin/env bash

export PATH=$PATH:`pwd`/../armeabi-v7a-android-toolchain/bin
export TOOLCHAIN=`pwd`/../armeabi-v7a-android-toolchain
export SYS_INCLUDE=$TOOLCHAIN/sysroot/usr/include
export SYS_LIB=$TOOLCHAIN/sysroot/usr/lib
export SYSROOT=`pwd`/../armeabi-v7a-android-toolchain/sysroot
#export CROSS_COMPILE="arm-linux-androideabi"
export CPPFLAGS="-I$SYS_INCLUDE" #path to zlib and openssl header folder
export LDFLAGS="-L$SYS_LIB" #path to zlib and openssl library folder
export AR=arm-linux-androideabi-ar
export AS=arm-linux-androideabi-as
export LD=arm-linux-androideabi-ld
export RANLIB=arm-linux-androideabi-ranlib
export CC=arm-linux-androideabi-gcc
export CXX=arm-linux-androideabi-g++
export NM=arm-linux-androideabi-nm
# export LIBS="-lmmssl -lmmcrypto"

echo "**********************************************"
echo "export PATH=${PATH}"
echo "export CC=${CC}"
echo "export CXX=${CXX}"
echo "export LINK=${LINK}"
echo "export LD=${LD}"
echo "export AR=${AR}"
echo "export RANLIB=${RANLIB}"
echo "export STRIP=${STRIP}"
echo "export CPPFLAGS=${CPPFLAGS}"
echo "export CFLAGS=${CFLAGS}"
echo "export CXXFLAGS=${CXXFLAGS}"
echo "export LDFLAGS=${LDFLAGS}"
echo "export LIBS=${LIBS}"
echo "**********************************************"

mkdir -p build
./Configure android-armeabi --prefix=`pwd`/build  \
          --with-zlib-include=$SYS_INCLUDE \
          --with-zlib-lib=$SYS_LIB \
          --sysroot=$SYSROOT \
          zlib \
          no-asm \
          no-unit-test


make
make install