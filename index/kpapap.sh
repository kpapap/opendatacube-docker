#!/usr/bin/env bash

# Echo lines and exit
set -ex

docker-compose up -d
docker-compose exec -T index datacube system init
docker-compose exec -T index datacube system check
echo "Adding Product..."
docker-compose exec -T index wget https://datacubepublicbucket.s3.us-west-2.amazonaws.com/s2_l2a.odc-product.yaml
docker-compose exec -T index datacube product add s2_l2a.odc-product.yaml
echo "Checking STAC API indexing..."
docker-compose exec -T index stac-to-dc \
    --bbox='20,39,25,41' \
    --catalog-href='https://earth-search.aws.element84.com/v1/' \
    --limit=500 \
    --collections='sentinel-2-l2a' \
    --datetime='2023-01-01/2023-11-01'
echo "Checking Indexed Datasets Count..."
docker-compose exec -T postgres psql -U postgres -c "SELECT count(*) from agdc.dataset"
echo "Initializing Explorer..."
docker-compose exec -T explorer cubedash-gen --init --all