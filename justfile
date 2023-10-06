
default:
  @just --list

# Update the files tracking the SHAs of ubuntu docker image
update-docker-shas:
  @just _update-sha "ubuntu:20.04"
  @just _update-sha "ubuntu:22.04"

_update-sha os:
  echo {{ os }}
  docker image pull {{ os }}
  docker inspect --format='{{{{index .RepoDigests 0}}' {{ os }} > {{ os }}.sha
