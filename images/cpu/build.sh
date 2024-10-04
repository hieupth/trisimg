#!/bin/bash

set -e;

git clone https://github.com/triton-inference-server/server.git
cd server
git checkout r24.08
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