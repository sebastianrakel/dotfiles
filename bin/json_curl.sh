#!/bin/sh

curl "${@}" | python -m json.tool
