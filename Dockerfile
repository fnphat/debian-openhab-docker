FROM fnphat/debian-java:1.7.0

# Install prerequisites
RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install openHAB
RUN wget --no-check-certificate --output-document=/tmp/runtime.zip http://bintray.com/artifact/download/openhab/bin/distribution-1.8.1-runtime.zip && \
    wget --no-check-certificate --output-document=/tmp/addons.zip http://bintray.com/artifact/download/openhab/bin/distribution-1.8.1-addons.zip && \
    mkdir /openhab && \
    unzip /tmp/runtime.zip -d /openhab && \
    unzip /tmp/addons.zip org.openhab.action.mios-1.8.1.jar -d /openhab/addons && \
    rm /tmp/runtime.zip /tmp/addons.zip

ENTRYPOINT bash
