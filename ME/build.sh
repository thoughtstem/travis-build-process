#Exit if commands fail.  Fail fast!
set -e

echo "**************************"
echo "INSTALLING cutscene"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/TS-ME-Languages.git?path=cutscene#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast fundamentals

echo "**************************"
echo "cd $TRAVIS_BUILD_DIR"
echo "**************************"
cd $TRAVIS_BUILD_DIR

echo "**************************"
echo "CLONING TS-ME-Katas"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-ME-Katas.git

echo "**************************"
echo "CLONING TS-ME-Languages"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-ME-Languages.git

echo "**************************"
echo "INSTALLING TS-ME-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-ME-Languages && raco install-all-here --no-docs

echo "**************************"
echo "TESTING TS-ME-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-ME-Languages && raco test-all-here 

echo "**************************"
echo "INSTALLING TS-ME-Katas"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-ME-Katas && raco install-all-here

