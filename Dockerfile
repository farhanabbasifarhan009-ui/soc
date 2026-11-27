FROM node:20-alpine

WORKDIR /app
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci
COPY frontend /app

ARG VITE_API_BASE_URL=http://localhost:8000/api/v1
ARG VITE_WS_URL=ws://localhost:8000/ws/alerts
ENV VITE_API_BASE_URL=${VITE_API_BASE_URL} \
    VITE_WS_URL=${VITE_WS_URL}

EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
