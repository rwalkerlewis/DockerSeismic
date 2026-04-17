# DockerSeismic

A Docker-based development environment for seismic waveform processing using [ObsPy](https://docs.obspy.org/) and JupyterLab.

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows / macOS / Linux)

## Quick start

```bash
# Build the image (first run takes a few minutes)
docker compose up --build

# Subsequent starts
docker compose up
```

Open your browser at **http://localhost:8888** — copy the token printed in the terminal if prompted.

## Project layout

```
DockerSeismic/
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── notebooks/
│   └── waveform_demo.ipynb   ← start here
└── data/                     ← drop your SAC / MiniSEED files here
```

- `notebooks/` and `data/` are bind-mounted, so files you create inside JupyterLab appear on your host machine automatically.

## Demo notebook

`notebooks/waveform_demo.ipynb` walks through:

1. Loading ObsPy's built-in example waveforms
2. Basic waveform plot
3. Bandpass filter comparison
4. Spectrogram
5. Live FDSN data download (IRIS, requires internet)
6. Loading your own files

## Stopping the environment

```bash
docker compose down
```

## Rebuilding after changing requirements

```bash
docker compose up --build
```
