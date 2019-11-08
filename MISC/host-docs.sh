#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  if [ "$TRAVIS_REPO_SLUG" = "thoughtstem/TS-MISC-Katas" ]
  then
    echo "*****************************"
    echo "Cloning katas.thoughtstem.com"
    echo "*****************************"

    git clone https://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

    echo "*****************************"
    echo "Moving over doc files"
    echo "*****************************"
    mkdir -p katas.thoughtstem.com/MISC &&
      rm -rf katas.thoughtstem.com/MISC/* && 
      find $TRAVIS_BUILD_DIR/TS-MISC-Katas/* -name "doc" | xargs cp -r --parents -t ./katas.thoughtstem.com/MISC/ &&
      mv ./katas.thoughtstem.com/MISC/$TRAVIS_BUILD_DIR/TS-MISC-Katas/* ./katas.thoughtstem.com/MISC/ && 
      rm -r ./katas.thoughtstem.com/MISC/$TRAVIS_BUILD_DIR/TS-MISC-Katas && 
      cp $TRAVIS_BUILD_DIR/TS-MISC-Katas/index.html ./katas.thoughtstem.com/MISC/ && 
      cp $TRAVIS_BUILD_DIR/TS-MISC-Katas/unlisted.html ./katas.thoughtstem.com/MISC/

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
