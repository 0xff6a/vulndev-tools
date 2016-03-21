#! /bin/bash
# Strip "\x" from an opcode string
echo $(tr -d "\\\x" <&0)
