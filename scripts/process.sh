#!/bin/bash 

wget -O ../data/hydrant.osm --post-file=hydrant_request.osm "https://overpass-api.de/api/interpreter"

ogr2ogr -f "GEOJSON" ../data/hydrant_conv.geojson ../data/hydrant.osm points

ogr2ogr -clipsrc ../data/tn.geojson ../data/hydrant.geojson ../data/hydrant_conv.geojson

var="var hydrant = {"
sed -i "1s/.*/$var/" ../data/hydrant.geojson 
