#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  if [ "$TRAVIS_REPO_SLUG" = "thoughtstem/TS-ME-Katas" ]
  then
    echo "*****************************"
    echo "Cloning katas.thoughtstem.com"
    echo "*****************************"

    git clone https://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

    echo "*****************************"
    echo "Moving over doc files"
    echo "*****************************"
    mkdir -p katas.thoughtstem.com/ME &&
      rm -rf katas.thoughtstem.com/ME/* && 
      find $TRAVIS_BUILD_DIR/TS-ME-Katas/* -name "doc" | xargs cp -r --parents -t ./katas.thoughtstem.com/ME/ &&
      mv ./katas.thoughtstem.com/ME/$TRAVIS_BUILD_DIR/TS-ME-Katas/* ./katas.thoughtstem.com/ME/ && 
      rm -r ./katas.thoughtstem.com/ME/$TRAVIS_BUILD_DIR/TS-ME-Katas && 
      cp $TRAVIS_BUILD_DIR/TS-ME-Katas/index.html ./katas.thoughtstem.com/ME/ && 
      cp $TRAVIS_BUILD_DIR/TS-ME-Katas/unlisted.html ./katas.thoughtstem.com/ME/

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
