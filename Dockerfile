# Docker image to run genBundle.sh script in a Debian container with all the required dependencies
# Usage: docker build --platform linux/amd64 -t oca-xls-parser .
#        docker run --platform linux/amd64 --rm -v ./OCABundles/schema/world-credentials/digital-passport:/data oca-xls-parser -x OCA.xlsx branding.json

FROM debian:bookworm-slim

# Install required dependencies
RUN apt update && apt install -y --no-install-recommends jq bash git curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ARG OCA_PARSER_VERSION=v1.2.1

# Download the parser binary from the specified release and make it executable
RUN curl -L -o /usr/local/bin/parser https://github.com/THCLab/oca-parser-xls/releases/download/${OCA_PARSER_VERSION}/parser.bin && \
    chmod +x /usr/local/bin/parser

# Copy the genBundle.sh script to the appropriate location and make it executable
COPY ./scripts/genBundle.sh /usr/local/bin/genBundle.sh
RUN chmod +x /usr/local/bin/genBundle.sh

# Set default working directory
WORKDIR /data

# Set genBundle.sh as the default entrypoint, so the container user can run it directly
ENTRYPOINT ["/usr/local/bin/genBundle.sh"]

# Specify the help flag (-h) as the default argument to provide guidance when running the container without arguments
CMD ["-h"]