#!/bin/bash

# Image and container name
IMAGE_NAME="peteindockerhub/hello-neuvector:1.0.1"
CONTAINER_NAME="hello-neuvector-container"

# Start the container
podman run -d --name $CONTAINER_NAME $IMAGE_NAME /bin/sh -c "while true; do sleep 1000; done"

# Copy files from the container to local machine

# Copy the /static directory
podman cp $CONTAINER_NAME:/static ./static

# Copy the /static/dist/semantic.min.css file
podman cp $CONTAINER_NAME:/static/dist/semantic.min.css ./semantic.min.css

# Copy the /static/dist/semantic.min.js file
podman cp $CONTAINER_NAME:/static/dist/semantic.min.js ./semantic.min.js

# Copy the /static/dist/themes/default/ directory
podman cp $CONTAINER_NAME:/static/dist/themes/default ./themes_default

# Copy the /bin/rancher-demo file
podman cp $CONTAINER_NAME:/bin/rancher-demo ./rancher-demo

# Copy the /templates directory
podman cp $CONTAINER_NAME:/templates ./templates

# Stop and remove the container
podman stop $CONTAINER_NAME
podman rm $CONTAINER_NAME

echo "Files copied successfully!"
