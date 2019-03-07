echo "INSTALLING RACKET CHIPMUNK"
raco pkg install --deps search-auto https://github.com/thoughtstem/racket-chipmunk.git#dev

echo "INSTALLING RATCHET"
raco pkg install --deps search-auto https://github.com/thoughtstem/ratchet.git#dev

echo "INSTALLING GAME-ENGINE-*"
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine.git#dev
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine-rpg.git#dev
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine-demos.git?path=game-engine-demos-common#dev

echo "cd $TRAVIS_BUILD_DIR"
cd $TRAVIS_BUILD_DIR
echo "CLONING TS-Kata-Collections"
git clone -b dev https://github.com/thoughtstem/TS-Kata-Collections.git
echo "CLONING TS-Languages"
git clone -b dev https://github.com/thoughtstem/TS-Languages.git

echo "INSTALLING ts-kata-util"
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections/ts-kata-util && raco pkg install --deps search-auto

echo "INSTALLING TS-Languages"
cd $TRAVIS_BUILD_DIR/TS-Languages && git pull origin master && raco install-all-here

echo "INSTALLING TS-Kata-Collections"
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections && git pull origin master && raco install-all-here

