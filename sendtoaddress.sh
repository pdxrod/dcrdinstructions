if [[ "" == "$2" ]] ; then
	echo "Takes two arguments - address to send to, and amount"
	echo "E.g. DcuVqH4jWBZR68H9HXUUNYWjVfdnEymVHot  and  10"
	exit 1
fi

dcrctl --wallet --testnet --rpcuser=rpcuser --rpcpass=rpcpass sendtoaddress $1 $2

