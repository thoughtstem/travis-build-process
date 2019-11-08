#Exit if commands fail.  Fail fast!
set -e

echo "**************************"
echo "INSTALLING ts-kata-util"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/TS-GE-Katas.git?path=ts-kata-util#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast ts-kata-util

echo "**************************"
echo "INSTALLING fundamentals"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/TS-MISC-Languages.git?path=fundamentals#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast fundamentals

echo "**************************"
echo "INSTALLING data-sci"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/TS-MISC-Languages.git?path=data-sci#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast data-sci

echo "**************************"
echo "cd $TRAVIS_BUILD_DIR"
echo "**************************"
cd $TRAVIS_BUILD_DIR

echo "**************************"
echo "CLONING TS-MISC-Katas"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-MISC-Katas.git

echo "**************************"
echo "CLONING TS-MISC-Languages"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-MISC-Languages.git

echo "**************************"
echo "INSTALLING TS-MISC-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-MISC-Languages && raco install-all-here --no-docs

echo "**************************"
echo "TESTING TS-MISC-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-MISC-Languages && raco test-all-here 

echo "**************************"
echo "INSTALLING TS-MISC-Katas"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-MISC-Katas && raco install-all-here

