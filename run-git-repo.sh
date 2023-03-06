#!/usr/bin/bash

set -e

CURRENT_PATH="$(pwd)" ;
cd "${CURRENT_PATH}" ;

GITHUB_REPO_URL="https://github.com/aspirina765/angular-app-docker-example-1.git" ;
BRANCH="master" ;
REPO_NAME=$(eval 'basename -s .git $GITHUB_REPO_URL') ;
PATH_REPO_TEST="${CURRENT_PATH}/repo-test" ;

#mkdir -p "${CURRENT_PATH}/repo-test" ;
sudo chown -R $USER:users "${CURRENT_PATH}/repo-test" ;
rm -rf "${PATH_REPO_TEST}/${REPO_NAME}" ;

sudo chown -R $USER:users $PATH_REPO_TEST ;

FILE="${PATH_REPO_TEST}/${REPO_NAME}" ;
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
    git clone --branch $BRANCH $GITHUB_REPO_URL "${PATH_REPO_TEST}/${REPO_NAME}" ;
fi

{
rm -rf "${PATH_REPO_TEST}/${REPO_NAME}/Dockerfile" ;
rm -rf "${PATH_REPO_TEST}/${REPO_NAME}/compose.yaml" ;
rm -rf "${PATH_REPO_TEST}/${REPO_NAME}/docker-compose.yml" ;
rm -rf "${PATH_REPO_TEST}/${REPO_NAME}/docker-compose.yaml" ;
rm -rf "${PATH_REPO_TEST}/${REPO_NAME}/docker-compose.yaml" ;
} || {
  continue
}

cd "${PATH_REPO_TEST}/${REPO_NAME}" && PATH_TO_PACKAGE_JSON=$(eval 'find . -type f -name "*package.json*"') &&
 PATH_TO_PACKAGE_JSON=$(echo $PATH_TO_PACKAGE_JSON | sed "s/\.\///")  && \
 PATH_TO_PACKAGE_JSON=$(echo $PATH_TO_PACKAGE_JSON | sed "s/\/package.json//")  && \
 PATH_TO_ANGULAR_REPO=$(eval echo "${PATH_REPO_TEST}/${REPO_NAME}/${PATH_TO_PACKAGE_JSON}") ;

echo $PATH_TO_ANGULAR_REPO ;

cp "${CURRENT_PATH}/nodejs.Dockerfile" "${PATH_TO_ANGULAR_REPO}/Dockerfile"  ;
cp "${CURRENT_PATH}/nodejs.compose.yaml" "${PATH_REPO_TEST}/${REPO_NAME}/compose.yaml"  ;

## OPÇÃO 1:
cd "${PATH_TO_ANGULAR_REPO}" && docker build -t my-angular-app . ;
## OPÇÃO 2:
#cd "${PATH_REPO_TEST}/${REPO_NAME}" && docker-compose up ;


### DON'T RUN !!!! ###
#rm -rf "${PATH_REPO_TEST}/${REPO_NAME}" ;



