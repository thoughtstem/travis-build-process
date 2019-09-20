#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  if [ "$TRAVIS_REPO_SLUG" = "thoughtstem/TS-VR-Katas"]
    echo "*****************************"
    echo "Cloning katas.thoughtstem.com"
    echo "*****************************"

    git clone https://$GH_TOKEN@github.com/thoughtstem/katas.thoughtstem.com.git

    echo "*****************************"
    echo "Moving over doc files"
    echo "*****************************"
    mkdir -p katas.thoughtstem.com/VR &&
      rm -rf katas.thoughtstem.com/VR/* && 
      find $TRAVIS_BUILD_DIR/TS-VR-Katas/* -name "doc" | xargs cp -r --parents -t ./katas.thoughtstem.com/VR/ &&
      mv ./katas.thoughtstem.com/VR/$TRAVIS_BUILD_DIR/TS-VR-Katas/* ./katas.thoughtstem.com/VR/ && 
      rm -r ./katas.thoughtstem.com/VR/$TRAVIS_BUILD_DIR/TS-VR-Katas && 
      cp $TRAVIS_BUILD_DIR/TS-VR-Katas/index.html ./katas.thoughtstem.com/VR/ && 
      cp $TRAVIS_BUILD_DIR/TS-VR-Katas/unlisted.html ./katas.thoughtstem.com/VR/

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
