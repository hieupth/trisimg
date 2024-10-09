# Triton Inference Server Images
Triton Inference Server images which remove unused backends when inference. The following images are available:
* **hieupth/tritonserver:xx.xx**: support for ONNXRuntime, TensorRT and Python (both cpu & gpu).
* **hieupth/tritonserver:xx.xx-trtllm**: support for TensorRT-LLM and Python only.
* **hieupth/tritonserver:xx.xx-vllm**: support for vLLM and Python only.

## Models from Huggingface
There is a script to load models from Huggingface that can executed before tritonserver as below:
```docker-compose
services:
  tritonserver:
    image: hieupth/tritonserver:24.08
    container_name: tritonserver
    environment:
      HF_CONFIG_FILE: /hf.json
      HF_MODEL_REPO: /models
    volumes:
      - ./configs/hf.json:/hf.json
    tty: true
    ports:
      - "8000:8000"
      - "8001:8001"
      - "8002:8002"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8000/v2/health/ready"]
      interval: 30s
      timeout: 5s
      retries: 2
    command: >
      bash -c "python3 -u /hf.py && tritonserver --model-repository=/models"
```
Where hf.json is the configuration file tell that which huggingface should be downloaded as below:
```json
{
  "token": "abc",
  "models": [
    {
      "name": "hieupth/triton.viencoder",
      "ref": "v1",
      "token": "abc"
    }
  ]
}
```
The HF_CONFIG_FILE points to hf.json and HF_MODEL_REPO is directory that downloaded models will be saved (must be same as Triton Inference Server model repository).

## License
[Apache License 2.0](LICENSE).<br>
Copyright &copy; 2024 [Hieu Pham](https://github.com/hieupth). All rights reserved.