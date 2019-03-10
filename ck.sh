#!/bin/bash
#code by budakjalanan & silentc0ders

#color
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
Default='\e[39m'

#FORMATING
Bold='\e[1m'
Dim='\e[2m'
Underline='\e[4m'
Blink='\e[5m'
Inveterted='\e[7m'

#clear all formating
crotclear='\e[0m'

ngecurl(){
	kentod_kimcil=$(timeout 10 curl -s -o /dev/null -w '%{http_code}' --socks5-hostname $sock http://wildan-fajriansyah.org/)
	if [[ $kentod_kimcil == 200 ]]; then
		echo -e $Bold$sock "-> $okegreen LIVE"$crotclear
	else 
		echo -e $Bold$sock "->$red DIE"$crotclear
	fi
}

kimcil=$(curl -s http://free-proxy.cz/en/proxylist/country/all/socks5/speed/all \
-H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
-H "Accept-Language: en-US,en;q=0.8" \
-H "Referer: http://free-proxy.cz/en" \
-H "Upgrade-Insecure-Requests: 1")

ip=$(echo $kimcil | grep -Po '(?<=.decode\(")[^"]*')
port=$(echo $kimcil | grep -Po "(?<=''>)[0-9]*")

IFS=" " read -r -a aipi <<< $ip
IFS=" " read -r -a porrt <<< $port
clear
echo -e $Bold"-==[Proxy Grabber & Check Live -$okegreen NAONLAH.NET$crotclear &$Bold$red BC0DE.NET$crotclear$Bold]==-"$crotclear
for i in "${!aipi[@]}"; do
	ipdecode=$(echo ${aipi[$i]} | base64 -d)
	sock="$ipdecode:${porrt[$i]}"
	ngecurl $sock
done
