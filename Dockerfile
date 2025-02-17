FROM quay.io/stewhite/ubi9-cuda-py:latest-devel

RUN pip install --upgrade pip wheel setuptools
RUN pip install torch
RUN pip install flash-attn

RUN pip install 'instructlab[cuda]' \
    -C cmake.args="-DLLAMA_CUDA=on" \
    -C cmake.args="-DLLAMA_NATIVE=off"

RUN pip install vllm==0.7.2