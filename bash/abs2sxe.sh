#!/bin/sh -xu
filebot -rename --db TheTVDB --order Absolute --format "{n} - {order.airdate.sxe} - {t}" -non-strict "$@"
