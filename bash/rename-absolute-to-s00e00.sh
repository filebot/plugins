#!/bin/sh -xu
filebot -rename \
  --db TheMovieDB::TV -non-strict \
  --order airdate \
  --mapper 'order.absolute.episode' \
  --format '{plex.name}' \
  --mode interactive \
  -r "$@"
