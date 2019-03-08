git clone http://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

cd katas.thoughtstem.com 
cp -r $TRAVIS_BUILD_DIR/TS-Kata-Collections/* . 
git add .
git commit -m "Travis: auto-hosting docs"
git push origin master
