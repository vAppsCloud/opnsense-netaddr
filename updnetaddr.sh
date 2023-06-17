#!/bin/bash

# Filename variables to overwrite
# netaddr/eui
FNOUI="oui.txt"
FNIAB="iab.txt"
# netaddr/ip
FNIPv4="ipv4-address-space.xml"
FNIPv6="ipv6-address-space.xml"
FNMCAST="multicast-addresses.xml"
FNv6UCAST="ipv6-unicast-address-assignments.xml"

# sources of the file locations are taken from netaddr Makefile
# https://github.com/netaddr/netaddr/blob/master/Makefile
# download: section

# get oui and iab files from ieee.org site
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/eui/$FNOUI http://standards-oui.ieee.org/oui/$FNOUI
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/eui/$FNIAB http://standards-oui.ieee.org/oui/$FNIAB
# generate indices
python3 /usr/local/lib/python3.9/site-packages/netaddr/eui/ieee.py
# get iana ip files in xml format
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNIPv4 https://www.iana.org/assignments/ipv4-address-space/ipv4-address-space.xml
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNIPv6 https://www.iana.org/assignments/ipv6-address-space/ipv6-address-space.xml
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNMCAST https://www.iana.org/assignments/multicast-addresses/multicast-addresses.xml
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNv6UCAST https://www.iana.org/assignments/ipv6-unicast-address-assignments/ipv6-unicast-address-assignments.xml
