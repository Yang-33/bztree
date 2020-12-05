#!/bin/sh

DIR=out/release/volatile
CMAKE=cmake

#rm -rf $DIR
mkdir -p ${DIR}

JOBS=$(nproc)
${CMAKE} -B${DIR} -H. \
-DCMAKE_BUILD_TYPE=Release \
-DPMEM_BACKEND=VOLATILE \
-DGOOGLE_FRAMEWORK=1 \
-DBUILD_TESTS=1 \
-DENABLE_MERGE=1 \
|| exit 1

${CMAKE} --build ${DIR} -- "VERBOSE=1 -j ${JOBS}" || exit 1
