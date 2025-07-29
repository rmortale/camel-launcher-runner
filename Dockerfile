FROM eclipse-temurin:21-jdk-ubi9-minimal

ENV CAMEL_VERSION=4.13.0

RUN wget -c https://repo1.maven.org/maven2/org/apache/camel/camel-launcher/$CAMEL_VERSION/camel-launcher-$CAMEL_VERSION-bin.tar.gz -O - | tar xvz


ENV PATH="${PATH}:/camel-launcher-$CAMEL_VERSION/bin"

# used to initiliaze dependencies in the docker image
RUN camel.sh version
    
ENTRYPOINT [ "camel.sh" ]
