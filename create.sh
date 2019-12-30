#!/bin/bash

set -e
set -o nounset
set -o pipefail

curl --verbose \
	--header "Content-Type: application/json" \
	--data '{
		"contact": {
			"first_name": "David"
		}
	}' \
http://localhost:3000/api/contacts
