#!/bin/sh -xu
filebot -rename --db TheTVDB --order Airdate --mapper "order.absolute.episode" --format "{plex.name}" -non-strict "$@"
