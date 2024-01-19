FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-runtime

COPY requirements.txt /tmp/requirements.txt

RUN python -m pip install --no-cache-dir -r /tmp/requirements.txt
#
# ! install this packages manually
RUN pip install torch-cluster -f https://data.pyg.org/whl/torch-2.1.0+cu121.html
RUN pip install torch-geometric -f https://data.pyg.org/whl/torch-2.1.0+cu121.html
RUN pip install torch-scatter torch-sparse -f https://data.pyg.org/whl/torch-2.1.0+12.2.html
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y  git  cmake g++
RUN pip install git+https://github.com/dgasmith/gau2grid.git gdown

RUN pip install git+https://github.com/e3nn/e3nn-jax.git@0.20.1
RUN pip install e3nn
RUN pip install jupyter plotly kaleido
#
#
#RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
#    -t https://github.com/denysdovhan/spaceship-prompt \
#    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
#    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
#    -p git \
#    -p ssh-agent \
#    -p https://github.com/zsh-users/zsh-autosuggestions \
#    -p https://github.com/zsh-users/zsh-completions
#
##RUN mamba shell init --shell zsh --root-prefix=~/mamba
##RUN echo "mamba activate /opt/conda/envs/e3nndens" >> ~/.zshrc \
#    && echo "mamba activate /opt/conda/envs/e3nndens" >> ~/.bashrc
# git submodule add git@github.com:atomicarchitects/equiformer_v2.git
# git submodule add https://github.com/Open-Catalyst-Project/ocp
#     cd ocp
#     git checkout 5a7738f
#     pip install -e .
# pip install lmdb
