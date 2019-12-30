#!/bin/bash

set -e
set -o nounset
set -o pipefail

curl --verbose \
	--request DELETE \
http://localhost:3000/api/contacts/6
