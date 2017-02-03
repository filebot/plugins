#!/bin/sh -u

for TAG in latest node watcher; do
    curl -H "Content-Type: application/json" --data "{\"docker_tag\": \"$TAG\"}" -X POST https://registry.hub.docker.com/u/rednoah/filebot/trigger/06323d5b-28a2-4332-8f84-66587f27dea9/
    sleep 300
done
