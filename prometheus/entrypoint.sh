#!/bin/sh

# Apply environment variables to config (defaults to 15s if not set)
sed "s/\${PROMETHEUS_SCRAPE_INTERVAL}/${PROMETHEUS_SCRAPE_INTERVAL:-15s}/g" \
  /etc/prometheus/prom.yml > /tmp/prom.yml

# Start Prometheus
exec /bin/prometheus \
  --config.file=/tmp/prom.yml \
  --storage.tsdb.path=/prometheus \
  $PROMETHEUS_FLAGS
