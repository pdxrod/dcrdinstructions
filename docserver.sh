if [[ "" == `which mkdocs` ]] ; then 
	echo "You need to get 'mkdocs'"
	echo "This is installed using the Python program 'pip'"
        echo "pip install mkdocs"
	echo "It should be Python version 2.x" 
	exit 1
fi

cd ../dcrdocs
mkdocs serve &

