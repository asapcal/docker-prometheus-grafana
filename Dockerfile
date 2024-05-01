# Use a base image for the web service
FROM kubedevio/rotten-potatoes:v1

# Expose port 8080 for the web service
EXPOSE 8080

# Set environment variables for MongoDB
ENV MONGODB_DB=admin \
    MONGODB_HOST=mongodb \
    MONGODB_PORT=27017 \
    MONGODB_USERNAME=mongouser \
    MONGODB_PASSWORD=mongopwd

# Use a base image for the MongoDB service
FROM mongo:7.0

# Define a volume for MongoDB data
VOLUME /data/db

# Set environment variables for MongoDB initialization
ENV MONGO_INITDB_ROOT_USERNAME=mongouser \
    MONGO_INITDB_ROOT_PASSWORD=mongopwd

# Use a base image for the Prometheus service
FROM prom/prometheus:v2.47.2

# Expose port 9090 for the Prometheus service
EXPOSE 9090

# Mount Prometheus configuration file
COPY prometheus.yaml /etc/prometheus/prometheus.yml

# Define extra hosts for Prometheus
EXTRA_HOSTS host.docker.internal:172.27.130.69

# Use a base image for the Grafana service
FROM grafana/grafana:10.2.2

# Expose port 3000 for the Grafana service
EXPOSE 3000
