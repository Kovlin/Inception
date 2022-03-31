#distribution utilisée pour faire fonctionner le conteneur
FROM debian:buster

#RUN<command> : the command is run in a shell, wich by default is /bin/sh -c
#-c option means command are read from string
#APT stands for Advance Packaging Tool: used to manage software on the system
RUN apt-get update #update package sources list to get the latest list of available package
# -y option: Automatic yes to prompt
RUN apt-get upgrade -y #updates all the packages presently installed in our Linux system to their latest versions


#COPY <src> <dst>: copy new files from src> and add them to the filesystem of the container at path <dest>
#EXPOSE <port> : to inform Docker that the container listens to the specified port
