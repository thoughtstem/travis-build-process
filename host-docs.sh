git clone http://0b03942875bd44437ba32a2a43c9ec28e571d034@github.com/thoughtstem/katas.thoughtstem.com.git

cd katas.thoughtstem.com 
cp -r $TRAVIS_BUILD_DIR/TS-Kata-Collections/* . 
git add .
git commit -m "Travis: auto-hosting docs"
git push origin master
