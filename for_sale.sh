#!/bin/zsh

typeset -A country_links

country_links=(
bangalore http://bangalore.craigslist.co.in/ 
beijing http://beijing.craigslist.com.cn/ 
brisbane http://brisbane.craigslist.com.au/ 
kuwait http://kuwait.craigslist.org/ 
kolkata http://kolkata.craigslist.co.in/ 
malaysia http://malaysia.craigslist.org/ 
melbourne http://melbourne.craigslist.com.au/ 
micronesia http://micronesia.craigslist.org/ 
mumbai http://mumbai.craigslist.co.in/ 
pune http://pune.craigslist.co.in/ 
seoul http://seoul.craigslist.co.kr/ 
sydney http://sydney.craigslist.com.au/ 
taiwan http://taipei.craigslist.com.tw/ 
thailand http://bangkok.craigslist.co.th/ 
tokyo http://tokyo.craigslist.jp/ 
vienna http://vienna.craigslist.at/ 
pakistan http://pakistan.craigslist.org 
amsterdam http://amsterdam.craigslist.org/ 
budapest http://budapest.craigslist.org/ 
dublin http://dublin.craigslist.org/ 
edinburgh http://edinburgh.craigslist.co.uk/ 
london http://london.craigslist.co.uk/ 
oslo http://oslo.craigslist.org/ 
oxford http://oxford.craigslist.co.uk/ 
stockholm http://stockholm.craigslist.se/ 
istanbul http://istanbul.craigslist.com.tr/ 
baghdad http://baghdad.craigslist.org/ 
ramallah http://ramallah.craigslist.org/ 
chicago http://chicago.craigslist.org/
miami http://miami.craigslist.org/ 
montreal http://montreal.craigslist.ca/ 
"new york" http://newyork.craigslist.org/ 
"sf bayarea" http://sfbay.craigslist.org/ 
toronto http://toronto.craigslist.ca/ 
vancouver http://vancouver.craigslist.ca/ 
"washington dc" http://washingtondc.craigslist.org/ 
capetown http://capetown.craigslist.co.za/ 
durban http://durban.craigslist.co.za/ 
egypt http://cairo.craigslist.org/ 
ethiopia http://addisababa.craigslist.org/ 
morocco http://casablanca.craigslist.org/ 
pretoria http://pretoria.craigslist.co.za/ 
tunisia http://tunis.craigslist.or/)

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
    sleep 180
    # Kill it
    kill $PID
done