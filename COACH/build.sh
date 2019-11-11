#Exit if commands fail.  Fail fast!
set -e

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

