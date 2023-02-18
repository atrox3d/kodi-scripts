#!/bin/bash

script="${BASH_SOURCE[0]}"
dir="$(dirname $script)"
dir="$(readlink -e $dir)"
[ $# -ge 1 ] || {
	echo "missing method"
	echo "available methods:"
	"${dir}/getmethods.sh"
	exit 1
}

#HOST=192.168.1.10
HOST=localhost
PORT=8080
METHOD="$1"
printf -v DATA '{ "jsonrpc": "2.0", "method": "%s", "id": "mybash"}' "$METHOD"

HEADERS='content-type: application/json;'

SERVER="$HOST:$PORT"
URL="http://$SERVER/jsonrpc"

echo "METHOD : $METHOD"
echo "DATA   : $DATA"
echo "HEADERS: $HEADERS"
echo "URL    : $URL"

echo curl --data-binary "$DATA" -H "$HEADERS" $URL
which jq &> /dev/null && {
	curl --data-binary "$DATA" -H "$HEADERS" $URL | jq .
} || {
        curl --data-binary "$DATA" -H "$HEADERS" $URL
}
echo ""





