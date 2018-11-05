FROM python:3.6

RUN mkdir -p /pipenv-issue-testing
WORKDIR /pipenv-issue-testing

RUN pip install --upgrade pip==18.1
RUN pip install --no-cache-dir pipenv

COPY Pipfile Pipfile.lock /pipenv-issue-testing/

# Install dependencies to system
RUN pipenv install --system --deploy
RUN pip list
RUN pipenv install --system --deploy
RUN pip list
