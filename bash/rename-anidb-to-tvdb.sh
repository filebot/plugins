#!/bin/sh -xu
filebot -rename \
  --db TheTVDB -non-strict \
  --mapper 'allOf{ AnimeList.AniDB }{ order.absolute.episode }' \
  --format '{plex.name}' \
  --mode interactive \
  -r "$@"
