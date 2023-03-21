FROM python:3.7-slim-bullseye as build
WORKDIR /wheels

COPY requirements.txt /opt/sherlock/
RUN apt-get update \
  && apt-get install -y build-essential \
  && pip3 wheel -r /opt/socialhunt/requirements.txt

FROM python:3.7-slim-bullseye
WORKDIR /opt/socialhunt

ARG VCS_REF
ARG VCS_URL="https://github.com/CVEDB/socialhunt"

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL

COPY --from=build /wheels /wheels
COPY . /opt/socialhunt/

RUN pip3 install --no-cache-dir -r requirements.txt -f /wheels \
  && rm -rf /wheels

WORKDIR /opt/socialhunt/socialhunt

ENTRYPOINT ["python", "socialhunt.py"]
