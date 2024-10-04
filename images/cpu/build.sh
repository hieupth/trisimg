#!/bin/bash

set -ex;

git clone https://github.com/triton-inference-server/server.git
cd server
git checkout r${TRITON_VERSION}
pip install distro requests
python build.py \
  --enable-logging \
  --enable-stats \
  --enable-tracing \
  --endpoint=grpc \
  --endpoint=http \
  --backend onnxruntime \
  --backend openvino \
  --backend python \
  --backend identity \
  --backend repeat \
  --backend ensemble
docker tag tritonserver ${DOCKERHUB_USERNAME}/tritonserver:cpubase-${TRITON_VERSION}
docker push ${DOCKERHUB_USERNAME}/tritonserver:cpubase-${TRITON_VERSION}