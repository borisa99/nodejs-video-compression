FROM node:16
# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Install FFmpeg
RUN apt-get update
RUN apt-get install ffmpeg -y

# Install app dependencies
RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source

# Copy app source to /usr/src/app
COPY . .

# Run the app
EXPOSE 5000
CMD [ "npm", "run", "start" ]