#!/bin/bash

# https://programminghistorian.org/en/lessons/json-and-jq#core-jq-filters
curl -s http://192.168.1.10:8080/jsonrpc | jq '.methods|keys|.[]'
