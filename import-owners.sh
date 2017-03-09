######################################### 
#                                       # 
# POST /v1/command/import-owners.xml    #
#                                       #
#########################################

#!/bin/sh

# put your api key string inside the double quotes:
APIKEY="54689db20f69a84961672d65b1e76a24894d070daaee618078eef7c30d6e9d73" 

sendPostRequest() {
    ARGS=" -d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/import-owners.xml -s" 
    curl $ARGS
}


if [ $# -lt 2 ]
then
    echo "usage: import-owners [sessionId] [sessionIdSignature]"

elif [ $APIKEY == "" ]
then 
    echo "Test api key not set. Please edit this script."
else 
    sendPostRequest $1 $2 $APIKEY
fi
