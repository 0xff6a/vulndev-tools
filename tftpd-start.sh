#! /bin/bash
#
# Start TFTP server on Kali
#

# Start up
echo "[+] Starting TFTP server on UDP 69"
echo "[+] Serving from /home/atftpd directory"
atftpd --daemon --port 69 /home/atftpd

# Check everthing running
check=$(netstat -anup | grep 0.0.0.0:69 | grep atftpd)

if [ -z "$check" ]; then
  echo "[-] Error starting server..."
  exit 1
fi

echo "[+] Done"
