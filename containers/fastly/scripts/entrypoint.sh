#!/bin/sh
set -e

fastly compute serve --addr 0.0.0.0:7676

exec "$@"
