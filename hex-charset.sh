#! /bin/bash
#
# Generate all hex characters to check for bad chars
#
# Print in string format to copy/paste into ruby script
printf "[+] All hex characters (excluding NULL bytes)\n[+] 255 bytes length"
printf "\n\n"
printf "\""

for i in {1..255}; do
  printf "\\\x%02x" $i

  if [ $(($i % 16)) -eq 0 ]; then
    printf "\" + \n\""
  fi
done

printf "\""
printf "\n\n"
