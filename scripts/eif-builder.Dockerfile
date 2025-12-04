FROM amazonlinux@2023

# Install nitro-cli
RUN dnf install aws-nitro-enclaves-cli aws-nitro-enclaves-cli-devel -y

# Get custom kernel
RUN mkdir /output

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint (build EIF)
ENTRYPOINT ["/entrypoint.sh"]
