if [[ "" == "$2" ]] ; then
	echo "Takes two arguments - address to send to, and amount"
	exit 1
fi

dcrctl --wallet --testnet --rpcuser=rpcuser --rpcpass=rpcpass sendtoaddress $1 $2

