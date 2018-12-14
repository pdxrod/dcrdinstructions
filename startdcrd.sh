if [[ "" == "$2" ]] ; then
	echo "Takes two arguments - username and password"
	exit 1
fi

dcrd --testnet -u $1 -P $2
