@echo off

SET CURRENT_PATH="%cd%"
cd "%CURRENT_PATH%"
SET GITHUB_REPO_URL=https://github.com/aspirina765/angular-app-docker-example.git
SET REPO_NAME=%undefined%
SET PATH_REPO_TEST="%CURRENT_PATH%/repo-test"
sudo "chown" "-R" "%USER%:users" "%CURRENT_PATH%/repo-test"
DEL /S "%PATH_REPO_TEST%/%REPO_NAME%"
mkdir "-p" "%CURRENT_PATH%/repo-test"
sudo "chown" "-R" "%USER%:users" "%PATH_REPO_TEST%"
git "clone" "%GITHUB_REPO_URL%" "%PATH_REPO_TEST%/%REPO_NAME%"
DEL /S "%PATH_REPO_TEST%/%REPO_NAME%/Dockerfile"
DEL /S "%PATH_REPO_TEST%/%REPO_NAME%/compose.yaml"
cd "%PATH_REPO_TEST%/%REPO_NAME%" && SET PATH_TO_PACKAGE_JSON=%undefined% && SET PATH_TO_PACKAGE_JSON=%undefined% && SET PATH_TO_PACKAGE_JSON=%undefined% && SET PATH_TO_ANGULAR_REPO=%undefined%
echo "%PATH_TO_ANGULAR_REPO%"
COPY  "%CURRENT_PATH%/Dockerfile" "%PATH_TO_ANGULAR_REPO%/Dockerfile"
COPY  "%CURRENT_PATH%/compose.yaml" "%PATH_REPO_TEST%/%REPO_NAME%/compose.yaml"
cd "%PATH_TO_ANGULAR_REPO%" && docker "build" "-t" "my-angular-app" "."
cd "%PATH_REPO_TEST%/%REPO_NAME%" && docker-compose "up"

