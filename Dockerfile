# DESCRIPTION: Basic extensible Jupyter Notebook/Lab Container
# BUILD: docker build --rm -t docker-jupyter .
# Inspired by https://github.com/augusto-herrmann/docker-jupyter-extensible

FROM jupyter/scipy-notebook

# Never prompt the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Define locales.
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

USER root

USER $NB_UID

# install Python packages you often use
RUN set -ex \
    && conda install --quiet --yes \
    # choose the python packages you need
    'plotly==4.14.3' \
    'folium==0.11.0' \
    'python-slugify[unidecode]==4.0.1' \
    && conda clean --all -f -y \
    # install jupyter lab extensions you need
    && jupyter labextension install jupyterlab-plotly@4.14.3 --no-build \
    && jupyter lab build -y \
    && jupyter lab clean -y \
    && rm -rf "/home/${NB_USER}/.cache/yarn" \
    && rm -rf "/home/${NB_USER}/.node-gyp" \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

# install other dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
