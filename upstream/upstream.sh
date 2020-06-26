# This scripts gets the lastest source of BSD 
# depending of your configuration
# use this to upstream and reapply the patches
# contributions are very very welcome :)
# Author Diego Magdaleno <diegomagdaleno@protonmail.com>

CWD="$(pwd)"
TMPDIR="$(gmktemp -d --tmpdir=${CWD})"
BSDSOURCEFOLDER="BSDSOURCE"
. ${CWD}/upstream.conf

fail_and_exit() {
    cd ${CWD}
    rm -rf ${TMPDIR}
    exit 1
}

cd $TMPDIR
echo $SRC
pwd
curl $SRC -O -J -L

unzip freebsd-release-12.1.0.zip -d $TMPDIR
cd freebsd-release-12.1.0
LIBSRC="lib/libutil"

[ -d ${CWD}/src/${dp} ] || mkdir -p ${CWD}/src/${dp}
cp -pr $LIBSRC/* ${CWD}/src/${dp}

rm -rf ${TMPDIR}
