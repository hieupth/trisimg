# Triton Inference Server Images
Smaller custom Triton Inference Server images that fit my works by only install neccessary backends:
* **CPU:** I only need python, onnxruntime and openvino (for Intel cpus).
* **GPU:** I only need python, onnxruntime and tensorrt (for Nvidia cards).

And there are extented images with libraries such as: transformers, tokenizers, pyvi and scikit-learn. OpenCV is not installed because it should be in business logic APIs somewhere else.
## License
[Apache License 2.0](LICENSE).<br>
Copyright &copy; 2024 [Hieu Pham](https://github.com/hieupth). All rights reserved.