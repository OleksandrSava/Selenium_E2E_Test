FROM python:3.12-alpine

RUN apk update && apk add --no-cache \
    chromium \
    chromium-chromedriver \
    nss \
    udev \
    harfbuzz \
    freetype \
    ttf-freefont \
    font-noto \
    curl \
    tar \
    bash \
    openjdk17-jre

RUN apk add --no-cache openjdk11-jre-headless curl tar ca-certificates \
    && curl -fsSLo /tmp/allure.tgz "https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/${ALLURE_VERSION}/allure-commandline-${ALLURE_VERSION}.tgz" \
    && mkdir -p /opt \
    && tar -xzf /tmp/allure.tgz -C /opt \
    && ln -sf /opt/allure-${ALLURE_VERSION}/bin/allure /usr/local/bin/allure \
    && rm -f /tmp/allure.tgz \
    && allure --version

COPY requirements.txt /usr/workspace/requirements.txt

RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip install pytest selenium allure-pytest

COPY . /usr/workspace
