raco pkg install --deps search-auto https://github.com/thoughtstem/racket-chipmunk.git#dev
raco pkg install --deps search-auto https://github.com/thoughtstem/ratchet.git#dev

raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine.git#dev
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine-rpg.git#dev
raco pkg install --deps search-auto https://github.com/thoughtstem/game-engine-demos.git#dev?path=game-engine-demos-common

cd $TRAVIS_BUILD_DIR
git clone -b dev https://github.com/thoughtstem/TS-Kata-Collections.git
git clone -b dev https://github.com/thoughtstem/TS-Languages.git
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections/ts-kata-util && raco pkg install --deps search-auto
cd $TRAVIS_BUILD_DIR/TS-Languages && git pull origin master && raco install-all-here
cd $TRAVIS_BUILD_DIR/TS-Kata-Collections && git pull origin master && raco install-all-here

