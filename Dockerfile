FROM openjdk:11-jdk-slim

# install curl and unzip
RUN apt-get update \
      && apt-get install --no-install-recommends -y  \
        curl  \
        unzip \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

# install groovy
ENV GROOVY_VERSION 4.0.2
RUN curl -kLO https://archive.apache.org/dist/groovy/${GROOVY_VERSION}/distribution/apache-groovy-binary-${GROOVY_VERSION}.zip \
      && unzip "apache-groovy-binary-${GROOVY_VERSION}.zip" \
      && mv "/groovy-${GROOVY_VERSION}" "/home/groovy" \
      && rm apache-groovy-binary-${GROOVY_VERSION}.zip

ENV GROOVY_HOME "/home/groovy"
ENV PATH "$PATH:/home/groovy/bin"

# install soapui
ENV SOAPUI_VERSION 5.7.0
RUN curl -kLO https://s3.amazonaws.com/downloads.eviware/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
      && tar xf SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
      && mv SoapUI-${SOAPUI_VERSION} home/soapui \
      && rm SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz

ENV SOAPUI_HOME "/home/soapui"

#set workdir and copy files
WORKDIR /home/soapui
COPY soapui-projects projects
