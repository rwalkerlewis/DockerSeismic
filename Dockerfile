FROM python:3.11-slim

LABEL description="ObsPy seismic waveform development environment with JupyterLab"

WORKDIR /workspace

# System dependencies required by ObsPy and its scientific stack
RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc \
        g++ \
        gfortran \
        libgeos-dev \
        libproj-dev \
        proj-data \
        proj-bin \
        libhdf5-dev \
        pkg-config \
        libxml2-dev \
        libxslt1-dev \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Use a non-root user for better security
RUN useradd -m -u 1000 seismic && chown -R seismic:seismic /workspace

# Install Python packages as root first, then switch user
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set matplotlib backend to non-interactive (plots render to file / inline in Jupyter)
ENV MPLBACKEND=Agg

USER seismic

EXPOSE 8888

# Start JupyterLab — token is printed to the console on startup
CMD ["jupyter", "lab", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--no-browser", \
     "--notebook-dir=/workspace"]
