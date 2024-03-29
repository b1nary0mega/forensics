Write-host "[+] Starting the acquisition process..." -foregroundcolor green 

date | out-file -append ".\hash.txt"

#collect general info
Systeminfo | out-file -append ".\results.txt"

#collect network info
ipconfig /all | out-file -append "results.txt"

#list local users
Net user | out-file -append ".\results.txt"

#display connections and open ports
Net user | out-file -append ".\results.txt"

#treeview of the processes and associated users from Sparc FLOW
.\pstree.ps1 | out-file -append ".\processes.txt"

#copy journal events
wevtutil epl security .\security.evtx

#hash all the things
get-filehash ".\results.txt" | format-list | out-file -append ".\hash.txt"
get-filehash ".\processes.txt" | format-list | out-file -append ".\hash.txt"
get-filehash ".\security.evtx" | format-list | out-file -append ".\hash.txt"

write-host "[+] End" -foregroundcolor green 