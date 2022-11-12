#FROM ubuntu:20.04
#RUN apt-get update
#RUN apt-get install openjdk-8-jdk -y
#CMD touch fatec-araras
#ENTRYPOINT ["/bin/bash"]
FROM httpd:2.4
COPY ./index.html /usr/local/apache2/htdocs/