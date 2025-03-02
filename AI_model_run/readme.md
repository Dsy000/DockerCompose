# Running GGUF Models with Docker and Ollama

This guide explains how to run a GGUF model using Docker and the Ollama container.

---

## Prerequisites

1. **Docker**: Ensure Docker is installed on your system. Download it from [Docker Desktop](https://www.docker.com/products/docker-desktop).
2. **GGUF Model**: Place your GGUF model file (e.g., `model.gguf`) in a directory on your host machine.

---

## Steps to Run the GGUF Model

### 1. Pull the Ollama Docker Image

Pull the Ollama Docker image from Docker Hub:

```bash
docker pull ollama/ollama
```
### 2. Run the Ollama Container
Run the Ollama container and mount the directory containing your GGUF model:

```bash
docker run -d \
  --name ollama \
  -v /path/to/models:/models \
  -p 11434:11434 \
  ollama/ollama
```
Explanation:
**-d**: Run the container in detached mode (in the background).

**--name** ollama: Name the container ollama.

**-v /path/to/models** :/models: Mount the directory containing your GGUF model to /models inside the container.

**-p 11434:11434**: Expose port 11434 for accessing the Ollama API.

**ollama/ollama**: The Docker image to use.

Replace /path/to/models with the actual path to your GGUF model directory.
