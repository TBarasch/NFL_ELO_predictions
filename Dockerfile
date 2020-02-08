# Copy from Tiffany Timbers' work Jan, 2020

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install R packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    cowsay \
    here \
    feather \
    ggridges \
    ggthemes \
    e1071 \
    caret

# install the kableExtra package using install.packages
RUN Rscript -e "install.packages('kableExtra')"

RUN Rscript -e "install.packages('reticulate')"

# install the anaconda distribution of python
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy && \
    /opt/conda/bin/conda update -n base -c defaults conda

# put anaconda python in path
ENV PATH="/opt/conda/bin:${PATH}"

ENV RETICULATE_PYTHON="/opt/conda/bin/python"

RUN conda config --set allow_conda_downgrades true

RUN conda install conda=4.6.11

# install docopt python package
RUN conda install -y -c anaconda \
    docopt \
    requests \
    altair \
    pandas \
    scikit-learn=0.22.1 \
    requests \
    matplotlib

RUN conda install -y -c conda-forge feather-format

CMD /bin/bash
