#!/bin/bash
RESPONSE="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n${2:-"OK"}\r\n"
while { echo -en "$RESPONSE"; } | nc -l "${1:-8080} -K ${3:-private.pem} -C ${4:-public.pem}"; do
  echo "================================================"
done
