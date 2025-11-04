# Use official Node.js image
FROM node:18

# Build-time argument (you can pass it during docker build)
ARG mongoDbUrl

# Runtime environment variable (used by your app)
ENV mongoDbUrl=${mongoDbUrl}

# Create and set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose your app port
EXPOSE 4000

# Start the app
CMD ["node", "index.js"]

#docker build -t todo-nodejs \
#  --build-arg mongoDbUrl="mongodb://username:password@host:27017/todo_db" .
# docker run -dit -p 4000:4000 todo-nodejs
