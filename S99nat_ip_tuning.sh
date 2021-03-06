#!/bin/bash

# Apply recommended Joyent SmartOS TCP tunings for IPNAT hosts

send_buffer=128000
receive_buffer=1048576

if [ $(($(ipadm show-prop -c -o current -p send_maxbuf tcp)+0)) -lt ${send_buffer} ]; then
ipadm set-prop -p send_maxbuf=128000 tcp
fi

if [ $(($(ipadm show-prop -c -o current -p recv_maxbuf tcp)+0)) -lt ${receive_buffer} ]; then
ipadm set-prop -p recv_maxbuf=1048576 tcp
fi

ipf -T ipf_nattable_max=60000
exit 0
