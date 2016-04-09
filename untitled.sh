#!/bin/zsh

typeset -A country_links

country_links=("hong kong" "hong kong htp"
    bangalor "httpbang")

for k in "${(@k)country_links}"; do
    ### TODO: change text in cats.json and script.js
    echo "$k -> $country_links[$k]"
done