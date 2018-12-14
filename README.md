# Instructions for setting up a Decred development node

This means cloning, from Github, the following components, building and running them:

    atomicswap		
    dcrandroid		
    dcrdocs			
    dcrwebapi		
    politeia
    base58			
    dcrd			
    dcrseeder		
    decrediton		
    politeiagui
    bitcore			
    dcrdata			
    dcrstakepool		
    gominer			
    contractor-mgmt		
    dcrdesign		
    dcrtime			
    hardforkdemo		
    testnetfaucet
    dcps			
    dcrwallet		
    insight
    dcraddrgen		
    dcrdocker		
    dcrweb			

These can all be found at [github.com/decred](https://github.com/decred).

E.g. `git clone https://github.com/decred/dcrd`

If you don't have the Git version control system, you need to download it from [https://git-scm.com/](https://git-scm.com/) and install it on your system.

Most of the information here can also be found in the README.md files in each of the folders listed above (except in dcps, the file is called README.mediawiki).

All the instructions below assume a Unix-like environment. If you are using Windows, in order to follow these instructions, you need to obtain Cygwin from [http://cygwin.com/](http://cygwin.com/). Cygwin is a Unix-like shell, like the Windows Command Prompt, but with a more extensive set of commands.


## atomicswap		

## dcrandroid		

## dcrdocs		

You need to get 'mkdocs'

This is installed using the Python program 'pip', which is installed when you install Python
pip install mkdocs
It runs under Python version 2

`cd dcrdocs`

`mkdocs serve`

Point your browser at http://localhost:8000

What you see are the files under dcrdocs/docs which end in ".md" (Markdown). See https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet.

## dcrwebapi		

## politeia

## base58			

## dcrd			

This is the Decred daemon - the program which runs in the background, connects to other Decred daemons all over the
world, reads new transactions, and attempts to incorporate them into a new block in the Decred blockchain.

In development, you will probably use the daemon in 'testnet' mode, where there is no risk of losing any real money.

`dcrd --testnet -u rpcuser -P rpcpass`

'rpcuser' and 'rpcpass' can be replaced with a more secure username and password - these you will use to communicate
with the daemon, for example, through dcrwallet.

## dcrseeder		

## decrediton		

## politeiagui

## bitcore			

## dcrdata			

## dcrstakepool		

## gominer			

## contractor-mgmt		

## dcrdesign		

## dcrtime

## hardforkdemo		

## testnetfaucet

## dcps			

## dcrwallet		

The Decred 'wallet' is run with the following command

`dcrwallet --testnet -u rpcuser -P rpcpass`

(or whatever username and password you started dcrd with - see above)

Once the wallet is running, you can find out how many Decred tokens are in it by running

`dcrctl --wallet --testnet getbalance --rpcuser=rpcuser --rpcpass=rpcpass`

You can send tokens to an address with

`dcrctl --wallet --testnet --rpcuser=rpcuser --rpcpass=rpcpass sendtoaddress DcuVqH4jWBZR68H9HXUUNYWjVfdnEymVHot 10`

The last two arguments are an address, and a number of tokens.

## insight

## dcraddrgen		

## dcrdocker		

## dcrweb
