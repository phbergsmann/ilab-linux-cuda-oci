FROM quay.io/stewhite/ubi9-cuda-py:latest-devel

RUN pip install --upgrade pip wheel setuptools --no-cache-dir
RUN pip install torch --no-cache-dir
RUN pip install flash-attn --no-cache-dir

RUN pip install 'instructlab[cuda]' \
    -C cmake.args="-DLLAMA_CUDA=on" \
    -C cmake.args="-DLLAMA_NATIVE=off"

RUN pip install vllm==0.7.2 --no-cache-dir