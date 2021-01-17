#intro using minicoda as base

FROM continuumio/miniconda3:latest

RUN apt-get update -y; apt-get upgrade -y; apt-get install -y vim-tiny vim-athena ssh

# always save environments in a conda env file
# this makes it easier to fix your environment
#copy (Relative to project)(/root)

COPY environment.yml environment.yml
RUN conda env create -f environment.yml
RUN echo "alias l='la -lah'" >> ~/.bashrc


RUN echo "source activate python-app" >> ~/.bashrc

#this is the equivalent of running source activate
#it is handy to have incase you want to run additional commands in the dockerfile
#env > before_activate.txt
# course activate python-app
# env > after_activate.txt
# diff before activate.txt after_activate.txt

ENV CONDA_EXE /opt/conda/bin/conda
ENV CONDA_PREFIX /opt/conda/envs/python-app
ENV CONDA_PYTHON_EXE /opt/conda/bin/python
ENV CONDA_PROMPT_MODIFIER (python-app)
ENV CONDA_DEFAULT_ENV python-app
ENV PATH /opt/conda/envs/python-app/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD echo "hello"

