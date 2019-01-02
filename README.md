# Instructions for setting up a Decred development node

You can obtain from Github the following components, build and run them:

    atomicswap		
    dcrandroid		
    dcrdocs			
    dcrwebapi		
    politeia
    politeiagui
    base58			
    dcrd			
    dcrseeder		
    decrediton		
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

The only essential components are dcrd and dcrwallet.

E.g. `git clone https://github.com/decred/dcrd`

If you don't have the Git version control system, you need to download it from [https://git-scm.com](https://git-scm.com) and install it on your system.

Most of the information here can also be found in the README.md files in each of the folders listed above (except in dcps, the file is called README.mediawiki).

All the instructions below assume a Unix-like environment. If you are using Windows, in order to follow these instructions, you need to obtain Cygwin from [http://cygwin.com/](http://cygwin.com/). Cygwin is a Unix-like shell, like the Windows Command Prompt, but with a more extensive set of commands.

There are a number of scripts in this project (files ending in .sh). Before using them, you might want to read them to
see if they do exactly what you want.

## atomicswap		

## dcrandroid		

## dcrdocs		

You need to get 'mkdocs'

This is installed using the Python program 'pip', which is installed when you install Python

`pip install mkdocs`

It runs under Python version 2

`cd dcrdocs`

`mkdocs serve`

Point your browser at http://localhost:8000

What you see are the files under dcrdocs/docs which end in ".md" (Markdown), rendered into HTML.
See https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet.

## dcrwebapi		

## politeia (πολιτεία)

See politeia/README.md

## politeiagui

`npm install`

`yarn && yarn start`

Go to `https://localhost:3000/` in a browser

## base58			

An API for encoding and decoding to and from the modified base58 encoding. It also provides an API to do Base58Check encoding, as described
[here](https://en.bitcoin.it/wiki/Base58Check_encoding).

`go get -u github.com/decred/base58`

`GO111MODULE=on go build`

## dcrd			

This is the Decred daemon - the program which runs in the background, connects to other Decred daemons around the
world, reads new transactions, and attempts to incorporate them into a new block in the Decred blockchain.

Decred consists of the files ending in '.go' in this folder and its subfolders.

The Decred daemon's entry point is `func main` in `dcrd.go`.

`GO111MODULE=on go build`

In development, you will want to use the daemon in 'testnet' mode, where there is no risk of losing any real money.

`./dcrd --testnet -u rpcuser -P rpcpass`

'rpcuser' and 'rpcpass' can be replaced with a more secure username and password - these you will use to communicate
with the daemon, for example, through dcrwallet and dcrdata.

You may have to wait a few minutes before connecting to dcrd with other programs, e.g. dcrdata and dcrdwallet.

`cd cmd/dcrctl`

`GO111MODULE=on go build` to create 'dcrctl'

## dcrseeder		

## decrediton		

## dcrdata			

Decred block explorer - see `https://explorer.dcrdata.org`

You need to get Node and NPM from `https://nodejs.org` and run

`npm install`

You should also carefully read the README.md file in dcrdata.

You need Postgresql, and to locate the config file (e.g.
  `/usr/local/var/postgres/postgresql.conf` - see below).

You need to log in to Postgresql using the `psql` tool, then

SHOW config_file; -- to show where the config file is

CREATE ROLE dcrdata;

CREATE DATABASE dcrdata OWNER dcrdata;

ALTER ROLE dcrdata WITH LOGIN;

Then `\q` to exit psql, then

`mkdir ~/.dcrdata`

`cp sample-dcrdata.conf ~/.dcrdata/dcrdata.conf`

OR

`mkdir ~/Library/Application\ Support/Dcrdata/` and

`cp sample-dcrdata.conf ~/Library/Application\ Support/Dcrdata/dcrdata.conf` on Mac.

It's very important that you edit the new file `dcrdata.conf` to the correct settings. For example,
it assumes which mode the Decred daemon is running in - you probably want 'testnet' (see dcrd section above).

Create a data folder - e.g.

Linux: `~/.dcrdata/data`

Mac: `~/Library/Application Support/Dcrdata/data`

These may be soft links pointing to folders on an external 1+Tb disk.

You also need to edit your dcrd.conf file which was created when you installed and ran the Decred daemon,
so that

`txindex=1` and

`addrindex=1`

are set, by deleting the semicolons which comment them out, and restarting dcrd.

`GO111MODULE=on go build`

`npm install`

`npm run build`

`./dcrdata --pg --testnet --dcrduser=rpcuser --dcrdpass=rpcpass`

(The last two flags depend on your RPC username and password for the Decred daemon. See dcrd section above).

(Note - from the dcrdata/README.md - For the v3 dcrdata module, the executable generated by go build may be named "v3" instead of "dcrdata". The situation is analogous for v4. This is a known issue in Go 1.11 that will be resolved in Go 1.12.)

So you may have to enter

`mv v3 dcrdata`

before starting dcrdata.

Then navigate to http://localhost:7777

Documentation for dcrdata's experimental REST API can be found in dcrdata/api/Insight_API_documentation.md

## dcrstakepool		

## gominer			

## contractor-mgmt		

## dcrdesign		

## dcrtime

## hardforkdemo		

## testnetfaucet

A web app that sends coins to the `testnet` Decred network (not real money). It
needs dcrwallet to be running to do this. See below.

`go install`

`GO111MODULE=on go build`

`cp sample-testnetfaucet.conf ~/.testnetfaucet/testnetfaucet.conf` OR

`cp sample-testnetfaucet.conf ~/Library/Application\ Support/Testnetfaucet/testnetfaucet.conf` on Mac

`cp ~/.dcrwallet/rpc.cert .` OR

`cp  ~/Library/Application\ Support/Dcrwallet/rpc.cert .` on Mac

Edit testnetfaucet.conf so it looks like

    ; overridetoken bypasses the rate limiter.  Required.
    overridetoken=developers!developers!developers!

    ; wallet rpc connection stuff.  Required.
    wallethost=127.0.0.1
    walletuser=rpcuser
    walletpassword=rpcpass
    ; [or whatever username or password you chose in dcrwallet - see below]

    ;walletaddress=TsfDLrRkk9ciUuwfp2b8PawwnukYD7yAjGd
    walletcert=rpc.cert
    ;withdrawalamount=2
    ;withdrawaltimelimit=30

--    

`./testnetfaucet -h` for help

`././testnetfaucet --testnet --withdrawalamount 2`

to run it - while dcrwallet is running.
The output from dcrwallet should tell you it has connected.

## dcps			

## dcrwallet		

`cp sample-dcrwallet.conf ~/.dcrwallet/dcrwallet.conf` OR

`cp sample-dcrwallet.conf ~/Library/Application\ Support/Dcrwallet/dcrwallet.conf` on Mac

Edit this new conf file to give it the correct settings

It should contain

    testnet=1
    dcrdusername=rpcuser
    dcrdpassword=rpcpass

or whatever RPC username and password you gave to dcrd.

`GO111MODULE=on go build`

`./dcrwallet --testnet -u rpcuser -P rpcpass`

(or whatever username and password you started dcrd with - see above)

Once the wallet is running, you can find out how many Decred tokens are in it by running

`cd ../dcrd/cmd/dcrctl`

`./dcrctl --wallet --testnet getbalance --rpcuser=rpcuser --rpcpass=rpcpass`

You can send tokens to an address with

`./dcrctl --wallet --testnet --rpcuser=rpcuser --rpcpass=rpcpass sendtoaddress cuV4XWjH6UBH8HDR9Zq 10`

The last two arguments are an address, and a number of tokens.

## insight

## dcraddrgen		

## dcrdocker		

## dcrweb

This is the code for the Decred website, `https://www.decred.org`

This is dependent on Docker

You need to install Docker, which you can get from `https://www.docker.com`, and start the `docker daemon`

You need a program called `yarn`, which you can get from `https://yarnpkg.com`

cd into the dcrweb folder and enter

`yarn dev`

Wait a few minutes, and you should be able to access the site at `http://localhost:8080`
