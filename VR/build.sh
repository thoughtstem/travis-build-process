#Exit if commands fail.  Fail fast!
set -e

echo "**************************"
echo "CLONING and INSTALLING ts-kata-util"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-Kata-Collections.git
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections/ts-kata-util && raco pkg install --deps search-auto --no-setup
raco setup --no-docs --fail-fast ts-kata-util

echo "**************************"
echo "INSTALLING vr-engine"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/vr-engine.git#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast vr-engine

echo "**************************"
echo "INSTALLING vr-assets"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/vr-assets.git#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast vr-assets

echo "**************************"
echo "cd $TRAVIS_BUILD_DIR"
echo "**************************"
cd $TRAVIS_BUILD_DIR

echo "**************************"
echo "CLONING TS-VR-Katas"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-VR-Katas.git

echo "**************************"
echo "CLONING TS-VR-Languages"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-VR-Languages.git

echo "**************************"
echo "INSTALLING ts-kata-util"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections/ts-kata-util && raco pkg install --deps search-auto --no-setup   
raco setup --no-docs --fail-fast ts-kata-util

echo "**************************"
echo "INSTALLING TS-VR-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-VR-Languages && raco install-all-here --no-docs

echo "**************************"
echo "TESTING TS-VR-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-VR-Languages && raco test-all-here 

echo "**************************"
echo "INSTALLING TS-VR-Katas"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-VR-Katas && raco install-all-here

