FROM python:3.8

ARG INSTALL_PATH="/ito"

ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV FLASK_ENV "development"

WORKDIR ${INSTALL_PATH}

RUN pip install poetry

COPY . ${INSTALL_PATH}/

RUN mv config.py.example config.py && \ 
    poetry config virtualenvs.create false && \
    poetry install

CMD poetry run flask run --port=5001