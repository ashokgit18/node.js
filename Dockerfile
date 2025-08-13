# Step 1: Use official Node.js image
FROM node:18

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Step 4: Copy all files
COPY . .

# Step 5: Expose port
EXPOSE 3000

# Step 6: Start the app
CMD ["npm", "start"]
