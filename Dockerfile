FROM mcr.microsoft.com/azure-functions/python:3.0-python3.7-appservice

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY requirements.txt /requirements.txt
COPY environment.yml /environment.yml

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda-install.sh && \
    chmod 755 conda-install.sh && \
    sh conda-install.sh -b -p $HOME/miniconda && \
    rm -f conda-install.sh

ENV PATH="${HOME}/miniconda/bin:${PATH}"

RUN conda init bash && \
    pip install -r /requirements.txt && \
    conda env update --name base --file /environment.yml

COPY . /home/site/wwwroot
