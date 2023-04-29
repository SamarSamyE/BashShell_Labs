#!/bin/bash
a=1.5
b=2.5
c=$(echo "scale=2;$a+ $b"| bc)
echo $c

num="3.14"
if echo "$num" | grep -qE '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'; then
    echo "$num is a valid floating point"
else
   echo "$num is not a valid floating point"  
fi



load=$(uptime | awk '{print $10}')
datetime=$(date '+%Y-%m-%d %H:%M:%S')

echo "$datetime $load" >> /var/log/system-load
