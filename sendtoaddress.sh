if [[ "" == "$4" ]] ; then
	echo "Takes four arguments - username, password, address to send to, and amount, e.g."
	echo "  sendtoaddress.sh rpcuser rpcpass cuV4XWjH6UBH8HDR9Zq 10"
	echo "'cuV4XWjH6UBH8HDR9Zq' is not a real address"
	exit 1
fi

cd ../dcrd/cmd/dcrctl
./dcrctl --wallet --testnet --rpcuser=$1 --rpcpass=$2 sendtoaddress $3 $4
