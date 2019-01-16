#Get latest node docker image
FROM node:latest

#Create a working directory
RUN mkdir -p /opt/apps/GrumboBattleBot

#Use new directory as working directory -- set's the working directory for any following COPY, RUN, CMD commands
WORKDIR /opt/apps/GrumboBattleBot

#Grab package.json for npm install
COPY package.json /opt/apps/GrumboBattleBot

RUN npm cache clean --force

#Install dependencies from package.json
RUN npm install

#Copy files into working directory within container
COPY . /opt/apps/GrumboBattleBot

#Expose port 80 to external
EXPOSE 27017

#Start the application
CMD ["node", "bot.js"]


