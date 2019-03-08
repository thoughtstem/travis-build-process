echo "**************************"
echo "INSTALLING RACKET CHIPMUNK"
echo "**************************"
raco pkg install --deps search-auto https://github.com/thoughtstem/racket-chipmunk.git#dev

echo "**************************"
echo "INSTALLING RATCHET"
echo "**************************"
raco pkg install --deps search-auto https://github.com/thoughtstem/ratchet.git#dev

echo "**************************"
echo "INSTALLING GAME-ENGINE-*"
echo "**************************"
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine.git#dev
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine-rpg.git#dev
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine-demos.git?path=game-engine-demos-common#dev

echo "**************************"
echo "cd $TRAVIS_BUILD_DIR"
echo "**************************"
cd $TRAVIS_BUILD_DIR

echo "**************************"
echo "CLONING TS-Kata-Collections"
echo "**************************"
git clone -b dev https://github.com/thoughtstem/TS-Kata-Collections.git

echo "**************************"
echo "CLONING TS-Languages"
echo "**************************"
git clone -b dev https://github.com/thoughtstem/TS-Languages.git

echo "**************************"
echo "INSTALLING ts-kata-util"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections/ts-kata-util && raco pkg install --deps search-auto

echo "**************************"
echo "INSTALLING TS-Languages"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-Languages && git pull origin master && raco install-all-here

echo "**************************"
echo "INSTALLING TS-Kata-Collections"
echo "**************************"
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections && git pull origin master && raco install-all-here

