#!/bin/bash 

wget -O ../data/hydrant.osm --post-file=hydrant.osm "https://overpass-api.de/api/interpreter"

ogr2ogr -f "GEOJSON" ../data/hydrant.geojson ../data/hydrant.osm points

var="var hydrant = {"
sed -i "1s/.*/$var/" ../data/hydrant.geojson 
