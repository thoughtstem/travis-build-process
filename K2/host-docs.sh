#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  if [ "$TRAVIS_REPO_SLUG" = "thoughtstem/TS-K2-Katas" ]
  then
    echo "*****************************"
    echo "Cloning katas.thoughtstem.com"
    echo "*****************************"

    git clone https://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

    echo "*****************************"
    echo "Moving over doc files"
    echo "*****************************"
    mkdir -p katas.thoughtstem.com/K2 &&
      rm -rf katas.thoughtstem.com/K2/* && 
      find $TRAVIS_BUILD_DIR/TS-K2-Katas/* -name "doc" | xargs cp -r --parents -t ./katas.thoughtstem.com/K2/ &&
      mv ./katas.thoughtstem.com/K2/$TRAVIS_BUILD_DIR/TS-K2-Katas/* ./katas.thoughtstem.com/K2/ && 
      rm -r ./katas.thoughtstem.com/K2/$TRAVIS_BUILD_DIR/TS-K2-Katas && 
      cp $TRAVIS_BUILD_DIR/TS-K2-Katas/index.html ./katas.thoughtstem.com/K2/ && 
      cp $TRAVIS_BUILD_DIR/TS-K2-Katas/unlisted.html ./katas.thoughtstem.com/K2/

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
