######################################### 
#                                       # 
# POST /v1/command/default-import.xml   #
#                                       #
#########################################

#!/bin/sh

# put your api key string inside the double quotes:
APIKEY="" 

sendPostRequest() {
    ARGS=" -d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2"
    ARGS="$ARGS -d since=`date +%Y-%m-%d`" # current date in YYYY-MM-DD format
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/default-import.xml -s" 
    curl $ARGS
}


if [ $# -lt 2 ]
then
    echo "usage: default-import [sessionId] [sessionIdSignature]"

elif [ "$APIKEY" == "" ]
then 
    echo "Test api key not set. Please edit this script."
else 
    sendPostRequest $1 $2 $APIKEY
fi
