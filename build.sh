rm -Rf  target/*


# now cd into the store display, build it, and then copy the artefacts back out into the container folder
./mvnw package -Dmaven.test.skip=true

