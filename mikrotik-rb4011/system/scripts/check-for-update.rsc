/system package update
check-for-updates once
:delay 3s;
:if ( [get status] = "New version is available") do={
    install
    :delay 180s
    /system reboot
}