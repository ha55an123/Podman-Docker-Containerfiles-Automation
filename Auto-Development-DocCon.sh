#!/bin/bash

echo "======================================="
echo " Containerfile / Dockerfile Generator"
echo "======================================="

# Get user inputs
read -p "Enter base image (e.g. python:3.11-alpine): " BASE_IMAGE
read -p "Enter maintainer name: " MAINTAINER
read -p "Enter working directory (e.g. /app): " WORKDIR
read -p "Enter port to expose: " PORT
read -p "Enter command to run (CMD) (e.g. python app.py): " CMD
read -p "Enter RUN commands (comma separated): " RUN_CMDS
read -p "Enter file to copy (e.g. .): " COPY_SRC
read -p "Enter destination path (e.g. /app): " COPY_DEST

RUN_FORMATTED=$(echo $RUN_CMDS | tr ',' '\nRUN ')

echo ""
echo "Generating files..."

cat <<EOF > Dockerfile
# Auto Generated Dockerfile

FROM $BASE_IMAGE

LABEL maintainer="$MAINTAINER"

WORKDIR $WORKDIR

COPY $COPY_SRC $COPY_DEST

RUN $RUN_FORMATTED

EXPOSE $PORT

CMD ["$CMD"]
EOF


cat <<EOF > Containerfile
# Auto Generated Containerfile

FROM $BASE_IMAGE

LABEL maintainer="$MAINTAINER"

WORKDIR $WORKDIR

COPY $COPY_SRC $COPY_DEST

RUN $RUN_FORMATTED

EXPOSE $PORT

CMD ["$CMD"]
EOF

echo ""
echo "Files created successfully:"
echo "Dockerfile"
echo "Containerfile"
