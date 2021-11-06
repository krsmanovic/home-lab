/user group
set full policy=local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,api,romon,dude,tikapp
add name=sensitive policy=local,telnet,ssh,reboot,read,write,policy,test,winbox,web,sensitive,api,romon,dude,tikapp,!ftp,!password,!sniff
add name=robot policy=local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,api,!romon,!dude,!tikapp