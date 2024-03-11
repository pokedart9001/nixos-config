#!/usr/bin/env bash

BASE_URL='https://myrient.erista.me/files/'

URL=$BASE_URL
while [[ $URL =~ .*/$ ]]; do
  URL_ENCODED=$(jq -sRr @uri <<<"$URL" | sed -e 's/%3A/:/g' -e 's/%2F/\//g' -e 's/%0A//g')

  EXT=$(curl -s "$URL_ENCODED" | rg 'td class="link".*title=' | sed -E 's/.*<a.*>(.*)<\/a>.*/\1/' | fzf)
  if [[ -z $EXT ]]; then
    if [[ $URL == "$BASE_URL" ]]; then
      exit 1
    else
      URL="$(echo "$URL" | awk -F '/' '(NF=NF-2) 1' OFS='/')/"
    fi
  fi

  URL="$URL$EXT"
done

download "$URL"
