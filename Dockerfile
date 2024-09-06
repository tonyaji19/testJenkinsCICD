FROM node:18-alpine

# Set environment variable
ENV NODE_ENV=production

WORKDIR /app

COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --production

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
