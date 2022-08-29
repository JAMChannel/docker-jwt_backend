#!/bin/bash
set -e

rm -f /docker-jwt/tmp/pids/server.pid

exec "$@"