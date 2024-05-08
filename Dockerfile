FROM node:lts-buster

# Update and upgrade packages
RUN sudo apt -y update && \
    sudo apt -y upgrade

# Install Git
RUN sudo apt -y install git

# Install FFmpeg
RUN sudo apt -y install ffmpeg

# Install Curl
RUN sudo apt -y install curl

# Remove existing Node.js
RUN sudo apt -y remove nodejs

# Install Node.js LTS
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash - && \
    sudo apt -y install nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt -y update && \
    sudo apt -y install yarn

# Install PM2 globally
RUN sudo yarn global add pm2

# Clone the repository
RUN git clone https://github.com/asonmotivation/Suhail-Md

# Change directory to cloned repository
RUN cd Suhail-Md

# Install dependencies with Yarn
RUN yarn install --network-concurrency 1
EXPOSE 8000 7860 80
# Start the application
RUN npm start
