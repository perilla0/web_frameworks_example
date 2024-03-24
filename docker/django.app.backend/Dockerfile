# https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/
# https://gunicorn.org/
# https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/gunicorn/
FROM python:3.12
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app/src
RUN chmod -R 0777 . \
    && mkdir -p public && chmod -R 0777 public
COPY requirements.txt .
RUN pip install -r requirements.txt