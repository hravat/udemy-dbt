FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl git unzip bash && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/app

# Set SHELL env so installer works
ENV SHELL=/bin/bash

# Use bash as default shell
SHELL ["/bin/bash", "-c"]

# Install dbt Fusion CLI
RUN curl -fsSL https://public.cdn.getdbt.com/fs/install/install.sh | bash -s -- --update

# Add Fusion CLI to PATH
ENV PATH="/root/.local/bin:${PATH}"

# Keep container alive
CMD ["sleep", "infinity"]
