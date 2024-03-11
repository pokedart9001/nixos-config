#!/usr/bin/env bash

aria2c -s 64 -d ~/Downloads --seed-time=0 "$1"
