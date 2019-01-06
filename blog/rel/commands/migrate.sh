#!/bin/sh

release_ctl eval --mfa "Blog.ReleaseTasks.migrate/1" --argv -- "$@"
