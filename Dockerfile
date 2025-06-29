FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache curl bash gnupg

# Add Cloudsmith repo and install kea
RUN curl -1sLf 'https://dl.cloudsmith.io/public/isc/kea-3-0/setup.alpine.sh' | bash && \
    apk update && \
    apk add --no-cache kea

# Copy config
COPY kea.conf /etc/kea/kea.conf

# Entrypoint script to create /run/kea at runtime
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

