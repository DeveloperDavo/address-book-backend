#!/bin/bash

set -e
set -o nounset
set -o pipefail

curl --verbose \
	--request PATCH \
	--header "Content-Type: application/json" \
	--data '{
		"contact": {
			"first_name": "Emily",
			"last_name": "Van"
		}
	}' \
http://localhost:3000/api/contacts/52
