# amazonlinux:2023.5.20240624.0 linux/amd64
FROM amazonlinux@sha256:5bf791027b4659e73c33a88a3fa2b314b8e2c0ee60cb1088a097171ee7f180db

# Install nitro-cli
RUN dnf install aws-nitro-enclaves-cli aws-nitro-enclaves-cli-devel -y

# Get custom kernel
RUN mkdir /output

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint (build EIF)
ENTRYPOINT ["/entrypoint.sh"]
