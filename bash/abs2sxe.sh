#!/bin/sh -xu
filebot -rename --db TheTVDB --order Airdate --mode interactive --mapper "order.absolute.episode" --format "{plex.name}" -non-strict "$@"
