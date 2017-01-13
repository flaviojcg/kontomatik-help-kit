################################ 
#                              # 
# GET  /v1/command/0000.xml    #
#                              #
################################

#!/bin/sh

# put your api key string inside the double quotes:
APIKEY="" 

sendGetRequest() {
    ARGS="-G -d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2" 
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/$3.xml" 
    curl $ARGS
}

if [ $# -lt 3 ]
then
    echo 'usage: poll [sessionId] [sessionIdSignature] [commandId]'
elif [ "$APIKEY" == "" ] 
then 
    echo 'Test api key not set. Please edit this script'
else
    sendGetRequest $1 $2 $3 $APIKEY
fi
