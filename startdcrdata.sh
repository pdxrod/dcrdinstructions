cd ../dcrdata

if [[ "" == "$3" ]] ; then
	echo "Takes three arguments - username, password, and dcrd hostname:port e.g."
	echo "startdcrdata.sh rpcuser rpcpass localhost:19108"
	exit 1
fi

if [[ 

./dcrdata --pg --testnet --dcrduser=$1 --dcrdpass=$2 --dcrdserv=$3

