echo "#########################################################"
echo "# jkcoxson and spidy123222's DolphiniOS install script. #"
echo "#########################################################\n\n\n"

if [ "$EUID" -eq 0 ]
  then echo "Please run as root. Exiting..."
  exit
fi

## thanks dracc#8170 in discord for code cleanup

echo "Root check passed, continue install."

pkexec apt-get update

pkexec apt-get install -y \
       autoconf \
       autoheader \
       automake \
       build-essential \
       checkinstall \
       clang \
       cpp \
       cython

pkexec dpkg --configure -a

pkexec apt-get install -y \
       gcc-8 \
       git \
       glibtool \
       libavahi-client-dev \
       libc6-dev \
       libc6-udeb \
       libplist++ \
       libplist++-dev \
       libssl-dev \
       libtool \
       libtool-bin \
       libusb-1.0-0-dev \
       m4 \
       make \
       pkg-config \
       python-dev

pkexec apt-get install python-dev --fix-missing -y

pkexec python setup.py install

mkdir openssl
pushd openssl
wget https://www.openssl.org/source/openssl-${OPENSSL_VER}.tar.gz
tar xf openssl-${OPENSSL_VER}.tar.gz
cd openssl-${OPENSSL_VER}
./config zlib shared no-ss13
make -j4
pkexec make install
popd

git clone https://github.com/libimobiledevice/libplist
pushd libplist
./autogen.sh --enable-debug
./autogen.sh --enable-debug
make
pkexec make install
popd


git clone https://github.com/jkcoxson/libusbmuxd
pushd libusbmuxd
./autogen.sh --enable-debug
./autogen.sh --enable-debug
make
pkexec make install
popd

git clone https://github.com/jkcoxson/libimobiledevice
pushd libimobiledevice
./autogen.sh --enable-debug
./autogen.sh --enable-debug
make
pkexec make install
popd

git clone https://github.com/jkcoxson/usbmuxd2
pushd usbmuxd2
./autogen.sh --enable-debug
./autogen.sh --enable-debug
make
pkexec make install
popd

git clone https://github.com/tihmstar/libgeneral.git
pushd libgeneral
./autogen.sh --enable-debug
./autogen.sh --enable-debug
make
pkexec make install
popd

pkexec ldconfig

echo "
##############################
#   Installation Completed.  #
##############################"

idevice_id
