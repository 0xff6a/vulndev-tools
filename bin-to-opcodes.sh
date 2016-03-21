#! /bin/bash
ndisasm -b 32 $1 | grep -Po ".{26}\K.*" 
