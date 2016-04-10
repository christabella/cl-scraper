#!/bin/zsh

typeset -A country_links

country_links=(
kuwait http://kuwait.craigslist.org/ 
micronesia http://micronesia.craigslist.org/ 
seoul http://seoul.craigslist.co.kr/ 
amsterdam http://amsterdam.craigslist.org/ 
dublin http://dublin.craigslist.org/ 
istanbul http://istanbul.craigslist.com.tr/ 
capetown http://capetown.craigslist.co.za/ 
durban http://durban.craigslist.co.za/ )

for k in "${(@k)country_links}"; do
    ### TODO: change text in cats.json and script.js
    echo "$k -> $country_links[$k]"
    # set ENV variables
    mkdir for_sale/$k
    export COUNTRY=$k
    export LINK=$country_links[$k]
    # Launch script in background
    node for_sale/scraper.js &
    # Get its PID
    PID=$!
    # Wait for 6 minutes
    sleep 60
    # Kill it
    kill $PID
done