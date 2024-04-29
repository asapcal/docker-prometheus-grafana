# Use the base image (you can choose a different base image if needed)
FROM node:lts-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 5000 (the same as in your docker-compose.yaml)
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
