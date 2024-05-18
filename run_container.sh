# run a container, per https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/sample-workload.html
# sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi

# run the jupyter container, per https://docs.docker.com/guides/use-case/jupyter/
# docker run --rm -p 8889:8888 quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='my-token'

# mix it up, put em all together!
#! /bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <token>"
    exit 1
fi

TOKEN="$1"

sudo docker run --rm --runtime=nvidia --gpus all -p 8889:8888 quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.Token="$TOKEN"
