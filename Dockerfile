FROM python:3.11

# Set the working directory
WORKDIR /TeamUltroid

# Copy the entire context to the /app directory
COPY . .

# Install virtualenv and create a virtual environment
RUN pip3 install virtualenv

# Activate the virtual environment
SHELL ["/bin/bash", "-c"]
RUN source venv/bin/activate

# Install Python dependencies within the virtual environment
RUN apt-get update && \
    apt-get install -y git

RUN pip3 install --upgrade pip && \
    apt-get install -y \
    libavformat-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavutil-dev \
    libswscale-dev \
    libswresample-dev \
    libavfilter-dev \
    pkg-config \
    build-essential

RUN pip3 install -U -r re*/st*/optional-requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Define the entry point
CMD ["bash", "startup"]
