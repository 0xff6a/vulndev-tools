#! /bin/bash
# Add escape chars "\x" to a hex string
instring=$(< /dev/stdin)
echo $instring |sed -r 's/(.{2})/\\x\1/g'

