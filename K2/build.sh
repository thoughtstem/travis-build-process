#Exit if commands fail.  Fail fast!
set -e


echo "**************************"
echo "INSTALLING RACKET CHIPMUNK"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/racket-chipmunk.git#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast racket-chipmunk 

echo "**************************"
echo "INSTALLING RATCHET"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/ratchet.git#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast ratchet

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
echo "CLONING TS-K2-Katas"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-K2-Katas.git

echo "**************************"
echo "CLONING TS-K2-Languages"
echo "**************************"
git clone -b $TRAVIS_BRANCH https://github.com/thoughtstem/TS-K2-Languages.git

echo "**************************"
echo "INSTALLING GAME-ENGINE-*"
echo "**************************"
sudo apt-get update
sudo apt-get install libportaudio2
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/game-engine.git#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast game-engine
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/game-engine-rpg.git#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast game-engine-rpg
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/game-engine-demos.git?path=game-engine-demos-common#$TRAVIS_BRANCH
raco setup --no-docs --fail-fast game-engine-demos-common


echo "**************************"
echo "INSTALLING TS-K2-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-K2-Languages && raco install-all-here --no-docs

echo "**************************"
echo "TESTING TS-K2-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-K2-Languages && raco test-all-here 

echo "**************************"
echo "INSTALLING TS-K2-Katas"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-K2-Katas && raco install-all-here

