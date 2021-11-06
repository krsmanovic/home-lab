:local ip;
:local comment;

:foreach i in=[/ip firewall address-list find list=SOURCE-ADDRESS-LIST] do={
      :set ip [/ip firewall address-list get $i address];
      :set comment [/ip firewall address-list get $i comment];
#      :set comment "something";
      :do { /ip firewall address-list add list=DESTINATION-ADDRESS-LIST address=$ip comment=$comment } on-error={}
}
