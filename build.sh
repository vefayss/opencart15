#!/bin/bash
# fail on error
set -e

# find the source dir
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# make a target dir so we can have a clean distribution
echo "[Copying extension files to target]"
mkdir -p ${DIR}/out/src
rsync -a ${DIR}/admin ${DIR}/catalog ${DIR}/expressly ${DIR}/out/src

# install dependencies
echo "[Installing dependencies]"
pushd "${DIR}/out/src/expressly"
composer install --no-dev
popd

# remove unnecessary files
VENDOR_DIR=${DIR}/out/src/expressly/vendor
rm -rf ${VENDOR_DIR}/doctrine/collections/tests
rm -rf ${VENDOR_DIR}/expressly/php-common/docs
rm -rf ${VENDOR_DIR}/expressly/php-common/tests
rm -rf ${VENDOR_DIR}/kriswallsmith/buzz/test
rm -rf ${VENDOR_DIR}/monolog/monolog/doc
rm -rf ${VENDOR_DIR}/monolog/monolog/tests
rm -rf ${VENDOR_DIR}/pimple/pimple/ext/pimple/tests
rm -rf ${VENDOR_DIR}/predis/predis/examples
rm -rf ${VENDOR_DIR}/symfony/config/Symfony/Component/Config/Tests
rm -rf ${VENDOR_DIR}/symfony/debug/Symfony/Component/Debug/Tests
rm -rf ${VENDOR_DIR}/symfony/event-dispatcher/Symfony/Component/EventDispatcher/Tests
rm -rf ${VENDOR_DIR}/symfony/filesystem/Tests
rm -rf ${VENDOR_DIR}/symfony/http-foundation/Symfony/Component/HttpFoundation/Tests
rm -rf ${VENDOR_DIR}/symfony/http-kernel/Symfony/Component/HttpKernel/Tests
rm -rf ${VENDOR_DIR}/symfony/monolog-bridge/Symfony/Bridge/Monolog/Tests
rm -rf ${VENDOR_DIR}/symfony/yaml/Symfony/Component/Yaml/Tests

# build the distribution
echo "[Packaging extension]"
tar -czf ${DIR}/out/expressly-${1-dev}-opencart-1.5.tgz -C ${DIR}/out/src .
pushd ${DIR}/out/src
pwd
zip -r ${DIR}/out/expressly-${1-dev}-opencart-1.5.zip .
popd