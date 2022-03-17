FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy app.py source code to working directory
COPY . game.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Download the game files
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -L https://github.com/gabrielecirulli/2048/tarball/master > game.tar.gz &&\
    FOLDER=$(tar -tf game.tar.gz | head -n 1) &&\
    tar -xzf game.tar.gz &&\
    mv "${FOLDER}" templates &&\
    rm game.tar.gz

## Step 5:
# Expose port 80
EXPOSE 80

## Step 6:
# Run app.py at container launch
CMD ["python", "game.py"]
