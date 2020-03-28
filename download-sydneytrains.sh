#!/bin/sh

ZIPFILE="./data/sydneytrains.zip"
API_KEY=`cat ./data/dataviz-api-key`

curl -X GET 
  --header 'Accept: application/zip' 
  --header 'Authorization: apikey $API_KEY' 
  'https://api.transport.nsw.gov.au/v1/gtfs/schedule/sydneytrains' > $ZIPFILE

unzip $ZIPFILE

# Rename .txt files to .csv
for file in ./data/*.txt
do
  mv "$file" "${file%.txt}.csv"
done

# The End
