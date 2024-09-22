FROM hieupth/tritonserver

RUN pip install --no-cache-dir \
      scikit-learn \
      transformers \
      tokenizers \
      numpy \
      pyvi
