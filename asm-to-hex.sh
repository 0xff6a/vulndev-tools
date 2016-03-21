#! /bin/bash
#
# Convert a .asm or .bin file to an opcode string
#
# Usage ./asm-to-hex.sh <file.asm> --raw
# Usage ./asm-tohex.sh <file.bin>
#
if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]; then
  echo "[-] Usage $0 <file.asm> --raw"
  echo "[-] usage $0 <file.bin>"

  exit 1
fi

# Set the target objdump file
objfile=$1

# Assemble the asm if needed
if [ "$2" == "--raw" ]; then
 echo "[+] Assembling..."

 tmpfile="objfile.o"
 objfile="elf"

 nasm -f elf32  $1 -o $tmpfile
 ld -m i386linux $tmpfile  -o $objfile
fi

# Get the opcodes out
echo "[+] Parsing opcodes..."
echo ""

ctr=0
for i in `objdump -d $objfile | tr '\t' ' ' | tr ' ' '\n' | egrep '^[0-9a-f]{2}$' ` ; do 
  echo -n "\x$i" 
  ctr=$(($ctr + 1))
done

echo ""
echo ""
echo "[+] Payload size: $ctr bytes"

# Clean up
if [ "$2" == "--raw" ]; then
  rm $tmpfile
  rm $objfile
fi  
