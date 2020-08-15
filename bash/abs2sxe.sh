#!/bin/sh -xu
filebot -rename --db TheTVDB --order airdate --mapper "order.absolute.episode" -non-strict --format "{plex.name}" --mode interactive "$@"
