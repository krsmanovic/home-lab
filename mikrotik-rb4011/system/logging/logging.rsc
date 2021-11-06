/system logging
set 0 topics=info,!firewall
set 3 action=memory
add action=remote topics=error
add action=remote topics=info
add action=remote topics=critical
add action=remote topics=warning