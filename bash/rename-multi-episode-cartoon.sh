#!/bin/sh -xu
filebot -rename \
  --db TheMovieDB::TV -non-strict \
  --mapper 'any{ if (regular) episode.number(null).map(episodelist.findAll{ airdate == it.airdate && !it.special }.episode).reverse() }{ episode.number(null) }' \
  --format '{plex.name}' \
  --mode interactive \
  -r "$@"
