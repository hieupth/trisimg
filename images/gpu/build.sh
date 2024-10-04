#!/bin/bash

set -ex;

git clone https://github.com/triton-inference-server/server.git
cd server
git checkout r${TRITON_VERSION}
pip install distro requests
python build.py \
  --enable-gpu \
  --enable-logging \
  --enable-stats \
  --enable-tracing \
  --endpoint=grpc \
  --endpoint=http \
  --backend onnxruntime \
  --backend tensorrt \
  --backend tensorrtllm \
  --backend vllm \
  --backend python \
  --backend identity \
  --backend repeat \
  --backend ensemble \
  --backend fil
docker tag tritonserver ${DOCKERHUB_USERNAME}/tritonserver:gpubase-${TRITON_VERSION}
docker push ${DOCKERHUB_USERNAME}/tritonserver:gpubase-${TRITON_VERSION}