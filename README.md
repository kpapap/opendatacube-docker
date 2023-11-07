# datacube-docker

Docker Images related to the Open Data Cube project

## List of images

- [opendatacube/datacube-index](index/readme.md): A suite of tools to manage indexing into an Open Data Cube database
- [https://github.com/kpapap/datacube-docker/tree/mymain/explorer](explorer): Files where I based the docker image for explorer

## First time install

Launch an AWS (t2.large) 50GB instance.

Install docker, docker-compose, make, give your user permission to run docker without sudo.

Run sudo make kpapap

The instance will run a script and index 'sentinel-2-l2a' datasets from 'https://earth-search.aws.element84.com/v1/', bbox '20,39,25,41', from 2023-01-01 to 2023-11-01, limit 1000.

## Original contents below

## How this works

Each folder has a Dockerfile and a version.txt, as a minimum. There are two GitHub Actions
pipelines per image, one to test and one to build. In order to rebuild an image and have
it pushed to GitHub, you should increment the number in the version.txt file. Changing _anything_
in the folder of an Image currently triggers a run too.

Each project should have a docker-compose file that can be used to run and test the image.

## List of images

- [opendatacube/datacube-statistician](https://github.com/opendatacube/odc-stats/): Obsolete beyond 0.4.17 in this repo. The new location is [odc-stats/docker](https://github.com/opendatacube/odc-stats/tree/develop/docker)
- [opendatacube/datacube-index](index/readme.md): A suite of tools to manage indexing into an Open Data Cube database
