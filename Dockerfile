FROM python:3.6

RUN mkdir -p /pipenv-issue-testing
WORKDIR /pipenv-issue-testing

RUN pip install --upgrade pip==18.1
RUN pip install --no-cache-dir pipenv
RUN pip --version
RUN pipenv --version

COPY Pipfile Pipfile.lock /pipenv-issue-testing/

RUN pipenv run pip --version
RUN pipenv run pipenv --version

RUN pipenv sync
RUN pipenv run pip list

# Install dependencies to system
#RUN pipenv install --system --deploy
#RUN pip list
#
