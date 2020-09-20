FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME


# Install Maven
RUN sudo apt update && \
    sudo apt install maven && \
    

RUN echo JAVA_HOME
RUN java -version
RUN mvn -version

#ADD user.sh /user.sh
#ADD run.sh /run.sh
#RUN chmod +x /*.sh

#EXPOSE 8080

#CMD ["/run.sh"]
