#!/bin/bash
# Check Prometheus health

PROMETHEUS_URL=${PROMETHEUS_URL:-"http://localhost:9090"}

response=$(curl -s -o /dev/null -w "%{http_code}" "$PROMETHEUS_URL/-/healthy")

if [ "$response" = "200" ]; then
    echo "✓ Prometheus is healthy"
    exit 0
else
    echo "✗ Prometheus is unhealthy (HTTP $response)"
    exit 1
fi
