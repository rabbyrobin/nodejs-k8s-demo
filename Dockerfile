# Use an official Node.js runtime as the base image
FROM node:14-alpine AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install --production

# Copy the application code to the working directory
COPY . .

# Use a smaller base image for the final output
FROM node:14-alpine AS production

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy only the necessary files from the previous stage
COPY --from=build /usr/src/app ./

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["node", "app.js"]
