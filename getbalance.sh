if [[ "" == "$2" ]] ; then
	echo "Takes two arguments - username and password"
	exit 1
fi

dcrctl --wallet --testnet getbalance --rpcuser=$1 --rpcpass=$2
