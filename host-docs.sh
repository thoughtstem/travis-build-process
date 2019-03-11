#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  echo "*****************************"
  echo "Cloning katas.thoughtstem.com"
  echo "*****************************"

  git clone https://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

  echo "*****************************"
  echo "Moving over doc files"
  echo "*****************************"
  rm -rf katas.thoughtstem.com/* && find $TRAVIS_BUILD_DIR/TS-Kata-Collections/* -name "doc" | xargs cp -r --parents -t ./katas.thoughtstem.com/ && mv ./katas.thoughtstem.com/$TRAVIS_BUILD_DIR/TS-Kata-Collections/* ./katas.thoughtstem.com/ && rm -r ./katas.thoughtstem.com/$TRAVIS_BUILD_DIR/TS-Kata-Collections && cp $TRAVIS_BUILD_DIR/TS-Kata-Collections/index.html ./katas.thoughtstem.com/ && cp $TRAVIS_BUILD_DIR/TS-Kata-Collections/unlisted.html ./katas.thoughtstem.com/

  echo "*****************************"
  echo "PUSHING it back to github"
  echo "*****************************"
  cd katas.thoughtstem.com 
  echo "katas.thoughtstem.com" > CNAME
  git add .
  git commit -m "Travis Build: $TRAVIS_BUILD_NUMBER"
  git push origin master
else
  echo "NOT MASTER, SO NOT PUSHING DOCS"
fi
