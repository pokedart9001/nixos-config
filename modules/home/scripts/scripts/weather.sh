#!/usr/bin/env bash

for _ in {1..5}; do
    city=$(curl -s https://ipinfo.io/city)

    if [[ $? == 0 ]]; then
        text=$(curl -s "https://wttr.in/$city?u&format=%c%t")

        if [[ $? == 0 ]]; then
            text=$(echo "$text" | sed -E "s/\s+/ /g")
            tooltip=$(curl -s "https://wttr.in/$city?u&format=4")

            if [[ $? == 0 ]]; then
                tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
                echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
                exit
            fi
        fi
    fi

    sleep 2
done

echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
