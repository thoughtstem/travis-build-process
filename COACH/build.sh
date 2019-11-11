#Exit if commands fail.  Fail fast!
set -e

echo "**************************"
echo "INSTALLING ts-kata-util"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/TS-GE-Katas.git?path=ts-kata-util#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast ts-kata-util

echo "**************************"
echo "cd $TRAVIS_BUILD_DIR"
echo "**************************"
cd $TRAVIS_BUILD_DIR

echo "**************************"
echo "CLONING TS-Coach"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-Coach.git

echo "**************************"
echo "INSTALLING TS-Coach"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-Coach && raco install-all-here

