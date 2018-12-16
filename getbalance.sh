if [[ "" == "$2" ]] ; then
	echo "Takes two arguments - username and password"
	exit 1
fi

cd ../dcrd/cmd/dcrctl
./dcrctl --wallet --testnet getbalance --rpcuser=$1 --rpcpass=$2
