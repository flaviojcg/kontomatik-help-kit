################################ 
#                              # 
# GET  /v1/data.xml            #
#                              #
################################

#!/bin/sh

# put your api key string inside the double quotes:
APIKEY="54689db20f69a84961672d65b1e76a24894d070daaee618078eef7c30d6e9d73" 

sendGetRequest() {
    ARGS="-G -d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -d ownerExternalId=$3" 
    ARGS="$ARGS https://test.api.kontomatik.com/v1/data.xml" 
    curl $ARGS
}

if [ $# -lt 3 ]
then
    echo 'usage: sh data.sh [sessionId] [sessionIdSignature] [ownerExternalId]'
elif [ "$APIKEY" == "" ] 
then 
    echo 'Test api key not set. Please edit this script'
else
    sendGetRequest $1 $2 $3 
fi
