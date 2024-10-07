ARG BASE=hieupth/tritonserver:24.08-base
FROM ${BASE}

RUN pip install --no-cache-dir \
      huggingface_hub transformers tokenizers \
      numpy scikit-learn pyvi
