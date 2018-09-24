## Description
ghost-on-github is a Docker container for running Ghost blog on docker and publising on github pages. 
This is a combination of official [Ghost](https://hub.docker.com/_/ghost/) docker image and [ghost-on-github](https://github.com/paladini/ghost-on-github-pages) scripts on one docker image for ease of deployment and publishing.

Visit https://github.com/najarramsada/ghost-on-github.git for more information.
Visit https://hub.docker.com/_/ghost/ for official Ghost Docker image.
Visit https://github.com/paladini/ghost-on-github-pages for Ghost on Github scripts.

Credits to Ghost community and Fernando Paladini for Ghost on Github scripts. All I have done here is combined them both to run the Ghost blog on Docker and also publish on Github pages.

## Requirements
 - Docker installation is required, make sure your host has Docker installed and you can run docker containers.
 - New Github Repository to publish the ghost blog on github. (This is optional, you run the ghost blog as is on host server)
 
## Install

###To Run Ghost blog
	`docker-compose up -d`
	
Contents of docker-compose.yml file
	
	`version: '3'

	services:
	  ghost:
        image: najarramsada/ghost-on-github
        container_name: ghost #name your container for easy identification.
        restart: always
        ports:
          - 8880:2368 #Ghost is running on 2368, map a custom port to your host server.
        volumes:
          - ghost:/home/node/.ghost/content	#Always a good idea to have a volume for persistent data. If not used, each time you start the container a new instance of blog will be deployed  

    volumes:
      ghost:`
 
###To publish the Ghost blog on your github pages.
Go to https://github.com/ and create a new repository. Copy the HTTPS URL of your repository, e.g. `https://github.com/najarramsada/ghost-on-github.git` 

####For first run below commands are required to establish the github identity
	`docker exec -it <Container name or id> gosu node git config --global user.email "<Your Github useremail>"`
	`docker exec -it <Container name or id> gosu node git config --global user.name "<Your Github username>"`
 
####Publish the blog
	`docker exec -it <Container name or id> gosu node /tmp/install.sh`
For first commit you will need to supply the Github repository URL which was copied in earlier step (e.g. https://github.com/najarramsada/ghost-on-github.git). This script will also prompt you to login to github, enter your username and password.
Wait till the repository is pushed to Github pages, than goto settings page of your github repository and it will show you the URL it is published as. Your blog is live on github pages.

## Ongoing Updates
Downside of hosting Ghost blog on Github is that each time you write a new post, you need to update the static pages on github, to do that just run below command on host where your Ghost docker is running. This is a same command that was used for first commit and applies for ongoing update.
	`docker exec -it ghost gosu node /tmp/install.sh`

## Contact
`ramsadanajar@gmail.com`
