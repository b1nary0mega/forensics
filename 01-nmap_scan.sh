#!/bin/bash
# quick scan of IP
# probe open ports for service and version info
# scan ports from 1 through 65535
# output to all formats (in working folder)
nmap -sV -p- 10.100.197.13 -oA nmap_scan_machine