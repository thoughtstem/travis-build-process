#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  if [ "$TRAVIS_REPO_SLUG" = "thoughtstem/TS-Kata-Collections" ]
  then
    echo "*****************************"
    echo "Cloning katas.thoughtstem.com"
    echo "*****************************"

    git clone https://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

    echo "*****************************"
    echo "Moving over doc files"
    echo "*****************************"
    mkdir -p katas.thoughtstem.com/GE &&
      rm -rf katas.thoughtstem.com/GE/* && 
      find $TRAVIS_BUILD_DIR/TS-Kata-Collections/* -name "doc" | xargs cp -r --parents -t ./katas.thoughtstem.com/GE/ &&
      mv ./katas.thoughtstem.com/GE/$TRAVIS_BUILD_DIR/TS-Kata-Collections/* ./katas.thoughtstem.com/GE/ && 
      rm -r ./katas.thoughtstem.com/GE/$TRAVIS_BUILD_DIR/TS-Kata-Collections && 
      cp $TRAVIS_BUILD_DIR/TS-Kata-Collections/index.html ./katas.thoughtstem.com/GE/ && 
      cp $TRAVIS_BUILD_DIR/TS-Kata-Collections/unlisted.html ./katas.thoughtstem.com/GE/

    echo "*****************************"
    echo "PUSHING it back to github"
    echo "*****************************"
    cd katas.thoughtstem.com 
    echo "katas.thoughtstem.com" > CNAME
    git add .
    git commit -m "Travis Build: $TRAVIS_BUILD_NUMBER"
    git push origin master
  else
    echo "NOT KATA COLLECTION, SO NOT PUSHING DOC" 
  fi
else
  echo "NOT MASTER, SO NOT PUSHING DOCS"
fi
