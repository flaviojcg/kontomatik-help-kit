######################################################## 
#                                                      # 
# POST /v1/command/import-credit-card-transactions.xml # 
#                                                      #
######################################################i#

#!/bin/sh

# put your api key string inside the double quotes:
APIKEY=""

sendPostRequest() {
    ARGS=" -d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -d cardNumber=$3"
    ARGS="$ARGS -d since=`date +%Y-%m-%d`" # current date in YYYY-MM-DD format
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/import-credit-card-transactions.xml -s" 
    curl $ARGS
}


if [ $# -lt 3 ]
then
    echo "usage: import-credit-card-transactions [sessionId] [sessionIdSignature] [cardNumber]"
elif [ "$APIKEY" == "" ]
then 
    echo "Test api key not set. Please edit this script."
else 
    sendPostRequest $1 $2 $3 
fi
