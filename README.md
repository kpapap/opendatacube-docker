# Project eo4natura: datacube-docker

Docker Images related to the Open Data Cube project

## List of images

ODC Index:

- Docker image: https://hub.docker.com/r/opendatacube/datacube-index
- GitHub: https://github.com/opendatacube/datacube-docker/blob/main/index/readme.md

ODC Explorer:

- Docker image: https://hub.docker.com/r/opendatacube/explorer
- GitHub: https://github.com/opendatacube/datacube-explorer

## First time install

Launch an AWS (t2.large) 50GB instance.

Install docker, docker-compose, make, give your user permission to run docker without sudo.
Pull docker images for ODC Index and ODC Explorer.
Rename images to ...:local.

After that, run:

```
cd opendatacube-docker/eo4natura/
sudo make kpapap
```

The instance will run a script and index 'sentinel-2-l2a' datasets from 'https://earth-search.aws.element84.com/v1/', bbox '20,39,25,41', from 2023-01-01 to 2023-11-01, limit 1000.

**ODC Explorer will be available on host port 9000.**

## Included commands

### Most commonly used

- `s3-to-dc` A tool for indexing from S3.
- `sqs-to-dc` A tool to index from an SQS queue

the doc for commonly used commands are available here: https://github.com/opendatacube/odc-tools/tree/develop/apps/dc_tools

### Other commands

- `s3-find` list S3 bucket with wildcard
- `s3-to-tar` fetch documents from S3 and dump them to a tar archive
- `gs-to-tar` search GS for documents and dump them to a tar archive
- `dc-index-from-tar` read yaml documents from a tar archive and add them to datacube

description for the above 4 commands are available here: https://github.com/opendatacube/odc-tools#apps

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
