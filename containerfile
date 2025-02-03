FROM quay.io/starnold/bootc-securebase:95 

# We make four distinct layers so if there are application changes the library layers can be re-used
RUN mkdir -p /helloapp /helloapp/lib /helloapp/app /helloapp/quarkus 
COPY ./target/quarkus-app/lib/ /helloapp/lib/
COPY ./target/quarkus-app/*.jar /helloapp/
COPY ./target/quarkus-app/app/ /helloapp/app/
COPY ./target/quarkus-app/quarkus/ /helloapp/quarkus/
COPY ./helloapp.service /etc/systemd/system

# Start the store display service
RUN systemctl enable helloapp.service
