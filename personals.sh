#!/bin/zsh

typeset -A country_links

country_links=(adelaide http://adelaide.craigslist.com.au auckland http://auckland.craigslist.org bangalore http://bangalore.craigslist.co.in/ bangladesh http://bangladesh.craigslist.org/ beijing http://beijing.craigslist.com.cn/ brisbane http://brisbane.craigslist.com.au/ chennai http://chennai.craigslist.co.in/ christchurch http://christchurch.craigslist.org/ delhi http://delhi.craigslist.co.in/ "hong kong" http://hongkong.craigslist.hkhyderabad http://hyderabad.craigslist.co.in/ jakarta http://jakarta.craigslist.org/ kuwait http://kuwait.craigslist.org/ kerala http://kerala.craigslist.co.in/ kolkata http://kolkata.craigslist.co.in/ malaysia http://malaysia.craigslist.org/ manila http://manila.craigslist.com.ph/ melbourne http://melbourne.craigslist.com.au/ micronesia http://micronesia.craigslist.org/ mumbai http://mumbai.craigslist.co.in/ osaka http://osaka.craigslist.jp/ perth http://perth.craigslist.com.au/ pune http://pune.craigslist.co.in/ seoul http://seoul.craigslist.co.kr/ shanghai http://shanghai.craigslist.com.cn/ sydney http://sydney.craigslist.com.au/ taiwan http://taipei.craigslist.com.tw/ thailand http://bangkok.craigslist.co.th/ tokyo http://tokyo.craigslist.jp/ vietnam http://vietnam.craigslist.org/ wellington http://wellington.craigslist.org/ beirut http://beirut.craigslist.org/ vienna http://vienna.craigslist.at/ cairo http://cairo.craigslist.org/ emirates http://dubai.craigslist.org/ haifa http://haifa.craigslist.org/ jerusalem http://jerusalem.craigslist.org/ pakistan http://pakistan.craigslist.org "tel aviv" http://telaviv.craigslist.org/ amsterdam http://amsterdam.craigslist.org/ berlin http://berlin.craigslist.org/ brussels http://brussels.craigslist.org/ budapest http://budapest.craigslist.org/ copenhagen http://copenhagen.craigslist.org/ "côte d'azur" http://cotedazur.craigslist.org/ dublin http://dublin.craigslist.org/ edinburgh http://edinburgh.craigslist.co.uk/ florence http://florence.craigslist.org/ london http://london.craigslist.co.uk/ munich http://munich.craigslist.org/ oslo http://oslo.craigslist.org/ oxford http://oxford.craigslist.co.uk/ paris http://paris.craigslist.org/ prague http://prague.craigslist.cz/ rome http://rome.craigslist.org/ stockholm http://stockholm.craigslist.se/ venice http://venice.craigslist.org/ istanbul http://istanbul.craigslist.com.tr/ baghdad http://baghdad.craigslist.org/ ramallah http://ramallah.craigslist.org/ boston http://boston.craigslist.org/ chicago http://chicago.craigslist.org/ "los angeles" http://losangeles.craigslist.org/ miami http://miami.craigslist.org/ montreal http://montreal.craigslist.ca/ "new york" http://newyork.craigslist.org/ seattle http://seattle.craigslist.org/ "sf bayarea" http://sfbay.craigslist.org/ toronto http://toronto.craigslist.ca/ vancouver http://vancouver.craigslist.ca/ "washington dc" http://washingtondc.craigslist.org/ capetown http://capetown.craigslist.co.za/ durban http://durban.craigslist.co.za/ egypt http://cairo.craigslist.org/ ethiopia http://addisababa.craigslist.org/ ghana http://accra.craigslist.org/ johannesburg http://johannesburg.craigslist.co.za/ morocco http://casablanca.craigslist.org/ pretoria http://pretoria.craigslist.co.za/ tunisia http://tunis.craigslist.or/)

for k in "${(@k)country_links}"; do
    echo "$k -> $country_links[$k]"
    # set ENV variables
    mkdir for_sale/$k
    export COUNTRY=$k
    export LINK=$country_links[$k]
    # Launch script in background
    node for_sale/scraper.js &
    # Get its PID
    PID=$!
    # Wait for 5 minutes
    sleep 300
    # Kill it
    kill $PID
done