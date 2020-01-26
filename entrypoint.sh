#!/bin/bash

key=${GANDI_API_KEY:-""}
domain=${DOMAIN:-""}
record=${RECORD:-"@"}
ttl=${TTL:-300}

# Get env var for execution interval in hours, or 24 by default
interval=${UPDATE_INTERVAL:-24}


cp /gandyn/config.ini-dist /gandyn/config.ini
sed -i .bak -e "s/{{GANDI_API_KEY}}/$key/g" /gandyn/config.ini
sed -i .bak -e "s/{{DOMAIN}}/$domain/g" /gandyn/config.ini
sed -i .bak -e "s/{{RECORD}}/$record/g" /gandyn/config.ini
sed -i .bak -e "s/{{TTL}}/$ttl/g" /gandyn/config.ini

while true;do
	python3 /gandyn/dyn_gandi.py --conf=/gandyn/config.ini
	sleep $(($interval * 60 * 60))
done
