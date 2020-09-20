FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#ENV TOMCAT_MAJOR_VERSION 8
#ENV TOMCAT_MINOR_VERSION 8.0.11
#ENV CATALINA_HOME /tomcat

# Install dependencies
RUN apt-get update && \
apt-get install -y git build-essential curl wget software-properties-common zip unzip

# Install JDK 8
RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer wget unzip tar && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


#ADD user.sh /user.sh
#ADD run.sh /run.sh
RUN chmod +x /*.sh

#EXPOSE 8080

#CMD ["/run.sh"]
