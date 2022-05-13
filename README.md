# Docker-Soap UI-groovy

Docker image with SoapUI-5.7.0 and Groovy-4.02. based on OpenJDK:11-jdk-slim. 

## General

This image is not posted on Dockerhub, so you can't pull it from there. And there are several reasons for such 
decision: 

 - initially container is made for internal needs.
 - it's kinda stupid to install groovy in parallel with SoapUI because SoapUi supports groovy. For example, if you 
   run load test, you can call an external groovy script, if needed.
 - I simply want to keep it as an example. 

### Details

Nothing changed in soapui settings, so for more details check official documentation: https://www.soapui.org/docs/test-automation/running-from-command-line/soap-mock/
Groovy can be found here `/home/groovy`, SoapUI there `/home/soapui`.

## Usage

As this is a personal sandbox use at your own risk.