#!/bin/sh
# runlevel - runlevel(1) lookalike for runit

prev=$(readlink /run/runit/runsvdir/previous || echo N)
level=$(readlink /run/runit/runsvdir/current || echo unknown)
echo ${prev#/run/runit/runsvdir/} ${level#/run/runit/runsvdir/}
