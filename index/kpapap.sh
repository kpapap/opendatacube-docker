#!/usr/bin/env bash

# Echo lines and exit
set -ex

docker-compose up -d
docker-compose exec -T index datacube system init
docker-compose exec -T index datacube system check
echo "Adding Product..."
docker-compose exec -T index wget https://eo4naturapublicbucket.s3.us-west-2.amazonaws.com/s2_l2a.odc-product.yaml
docker-compose exec -T index datacube product add s2_l2a.odc-product.yaml
echo "Checking STAC API indexing..."
docker-compose exec -T index stac-to-dc \
    --bbox='23.70,40.49,25.00,41.33' \
    --catalog-href='https://earth-search.aws.element84.com/v1/' \
    --limit=1000 \
    --collections='sentinel-2-l2a' \
    --datetime='2023-01-01/2023-01-31'
echo "Checking Indexed Datasets Count..."
docker-compose exec -T postgres psql -U postgres -c "SELECT count(*) from agdc.dataset"
echo "Initializing Explorer..."
docker-compose exec -T explorer cubedash-gen --init --all