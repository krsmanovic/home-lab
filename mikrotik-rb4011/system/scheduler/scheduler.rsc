/system scheduler
add interval=15s name=check-failover on-event=check-failover policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=jun/20/2016 start-time=08:00:00
add name=startup on-event=startup policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive start-time=startup
add name=reboot on-event=tool-reboot policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=sep/05/2021 start-time=04:30:00
add interval=1w name=clear-dhcp-lease-conflicts on-event=tool-dhcp-lease-clear-conflicts policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=may/24/2021 start-time=06:00:00