# Image of the container
FROM node:22-slim

# Landing Directory 
WORKDIR /var/www/

# Package transfer
COPY package*.json ./

# Modules Installation
RUN npm install

# All files transfer
COPY . .

# Build the server (TypeScript -> dist/) and the admin dashboard (-> dist/dashboard)
RUN npm run build && npx vite build

# Run in production mode
ENV APP_ENV=prod

# Listerning Port
EXPOSE 3000

# Trigger Command
CMD ["node", "dist/index.js"]

