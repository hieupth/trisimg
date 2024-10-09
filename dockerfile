ARG BASE=hieupth/tritonserverbuild:24.08

FROM ${BASE}
RUN pip install --no-cache-dir huggingface_hub transformers tokenizers numpy scikit-learn pyvi
ADD ./scripts/* /