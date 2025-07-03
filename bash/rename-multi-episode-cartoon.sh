#!/bin/sh -xu
filebot -rename "$@" \
  --db TheMovieDB::TV -non-strict \
  --format "{plex.name}" \
  --mapper "any{ if (regular) episode.number(null).map(episodelist.findAll{ airdate == it.airdate && !it.special }.episode).reverse() }{ episode.number(null) }" \
  --mode interactive
