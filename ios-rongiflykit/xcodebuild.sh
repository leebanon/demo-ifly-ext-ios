BIN_DIR="bin"
if [ ! -d "$BIN_DIR" ]; then
mkdir -p "$BIN_DIR"
fi

BIN_DIR_TMP="bin_tmp"
if [ ! -d "$BIN_DIR_TMP" ]; then
mkdir -p "$BIN_DIR_TMP"
fi

DST_DIR="./../ios-rongimdemo/framework"
if [ ! -d "$DST_DIR" ]; then
mkdir -p "$DST_DIR"
fi

DST_DIR1="./../ios-rongenterpriseapp/framework"
if [ ! -d "$DST_DIR1" ]; then
mkdir -p "$DST_DIR1"
fi

cp -af ./RongiFlyKit/Engine/iflyMSC.framework ${BIN_DIR}/
cp -af ./RongiFlyKit/Resource/RongCloudiFly.bundle ${BIN_DIR}/

cp -af ${BUILT_PRODUCTS_DIR}/${TARGET_NAME}.framework/ ${BIN_DIR_TMP}/${PLATFORM_NAME}-${TARGET_NAME}.framework
cp -af ${BUILT_PRODUCTS_DIR}/${TARGET_NAME}.framework/ ${BIN_DIR}/${TARGET_NAME}.framework
lipo -create $BIN_DIR_TMP/*-${TARGET_NAME}.framework/${TARGET_NAME} -output ${BIN_DIR}/${TARGET_NAME}.framework/${TARGET_NAME}


cp -af ${BIN_DIR}/* ${DST_DIR}/
cp -af ${BIN_DIR}/* ${DST_DIR1}/
