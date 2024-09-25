# Use an official Node.js LTS runtime as a parent image
FROM node:lts AS runtime

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 4321

# Command to run the application
CMD ["node", "./dist/server/entry.mjs"]