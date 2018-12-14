if [[ "" == `which mkdocs` ]] ; then 
	echo "You need to get 'mkdocs'"
	echo "This is installed using the Python program 'pip', which is installed when you install Python"
        echo "pip install mkdocs"
	echo "It runs under Python version 2" 
	exit 1
fi

cd ../dcrdocs
mkdocs serve &

