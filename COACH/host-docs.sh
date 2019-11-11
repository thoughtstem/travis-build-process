#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  if [ "$TRAVIS_REPO_SLUG" = "thoughtstem/TS-Coach" ]
  then
    echo "*****************************"
    echo "Cloning katas.thoughtstem.com"
    echo "*****************************"

    git clone https://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

    echo "*****************************"
    echo "Moving over doc files"
    echo "*****************************"
    mkdir -p katas.thoughtstem.com/COACH &&
      rm -rf katas.thoughtstem.com/COACH/* && 
      find $TRAVIS_BUILD_DIR/TS-Coach/* -name "doc" | xargs cp -r --parents -t ./katas.thoughtstem.com/COACH/ &&
      mv ./katas.thoughtstem.com/COACH/$TRAVIS_BUILD_DIR/TS-Coach/* ./katas.thoughtstem.com/COACH/ &&
      rm -r ./katas.thoughtstem.com/COACH/$TRAVIS_BUILD_DIR/TS-Coach && 
      cp $TRAVIS_BUILD_DIR/TS-Coach/index.html ./katas.thoughtstem.com/COACH/ && 
      cp $TRAVIS_BUILD_DIR/TS-Coach/unlisted.html ./katas.thoughtstem.com/COACH/

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
