if [[ "" == "$2" ]] ; then
	echo "Takes two arguments - username and password, e.g."
	echo "   startdcrdata.sh rpcuser rpcpass"
	exit 1
fi

cd ../dcrdata
./dcrdata --pg --testnet --dcrduser=$1 --dcrdpass=$2 --dcrdserv=localhost:19109
