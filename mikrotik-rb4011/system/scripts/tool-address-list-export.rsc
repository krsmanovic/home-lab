:global content "/ip firewall address-list" 
:local ip;
:local list;
:local comment;
/file print file=list;
:foreach i in=[/ip firewall address-list find list=ADDRESS-LIST] do={
      :set ip [/ip firewall address-list get $i address];
      :set comment [/ip firewall address-list get $i comment];
      :set content ("$content\r\nadd list=ADDRESS-LIST address=$ip comment=$comment");
}
/file set list.txt contents=$content;

###################### 4KB LIMIT INFO ########################
#
#    If you get wrong contents of the file "list.txt", that
#    means the script did not write out variable "content"
#    properly. The reason is current (Aug 2015) buffer size
#    for writing files in MikroTik RouterOS, which is limited
#    to 4KB. Solve it by entering this command in terminal:
#    :put $content
#    and copy and paste screen to desired location. This is
#    the main reason I've made variable "content" to be global.
#                                                Che, Aug 2015
###################### 4KB LIMIT INFO ########################