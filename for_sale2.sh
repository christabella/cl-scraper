#!/bin/zsh

typeset -A country_links

country_links=(
vancouver http://vancouver.craigslist.ca/ 
)

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
    sleep 300
    # Kill it
    kill $PID
done