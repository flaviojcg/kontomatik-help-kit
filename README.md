Kontomatik help kit 
=====================

This kit is designed to quickly demonstrate the functionality of Kontomatik Service. 

It contains an Html page embedding the <strong>Kontomatik SignIn Widget</strong> and a few shell scripts 
which build and submit Http POST and GET requests. 
 
The aim is to skip the laborious task of correctly passing the required parameters and options to the curl program. 
 
Requirements
------------

- A valid client id and API key. If you don't have them, you can request your access [here](http://kontomatik.com/contact-us). 
- A text editor, such as Vim. 
- A computer running OSX or Linux. (OSX is the better choice, 'cos frankly I haven't tested the scripts on Linux). 

_You should also read the [Kontomatik API tutorial](http://developer.kontomatik.com/api-doc/#basic-api) to understand
  what is going on here._ 


Usage example
--------

Let's say we want to call the <strong>default-import</strong> command. 

First, edit the index.html page and set the client parameter to the value of your **test** client id. 
Also edit the default-import.sh script and set the APIKEY variable to the value of your **test** API key. 

_Since all of the shell scripts require a valid APIKEY, you might as well save some time and edit all of them in one fell swoop. To do this, open a terminal window,  navigate to the directory where the scripts are located and enter the command:_

        perl -pi -e "s/APIKEY=\"\"/APIKEY=\"***********\"/" *.sh

_Of course, you need to replace the asterisks with your actual APIKEY string but be careful to preserve everything else._

Next, load the index.html page in your browser and login to a bank, using mock or real credentials.
If the login is successful, the page will display the sessionId and sessionIdSignature parameters in a single line.
It will look something like this: 

        4328763 1195dd958bbeb3c207b36db5ab2be6f33576028c861c518fd6b615565ae63401
Copy paste the values shown in your browser, open a terminal window and navigate to the directory containing the shell scripts.
 
Now you can execute the default-import script. 

The script expects the sessionId and sessionIdSignature 
values, which hopefully you have copied to the clipboard, in the previous step. 

Type in the command to execute the script and pass in you own session values. For example:     
    
        sh default-import.sh 4328763 1195dd958bbeb3c207b36db5ab2be6f33576028c861c518fd6b615565ae63401

The script will build the Http POST request and start the import flow. 

You should now receive the Xml response from the service, which includes the commandId attribute. 

The response will look like this: 

```xml
<?xml version="1.0" encoding="utf-8"?>
<reply status="202 Accepted">
    <command id="4328291" state="in_progress" name="DefaultImportCommand">
        <progress><value>0</value></progress>
    </command>
</reply>
```
Finally, poll for the status command with poll.sh. The script expects the sessionId, sessionIdSignature and commandId parameters. 

Please type in the following, but make sure to substitute your own values: 

        sh poll.sh 4328763 1195dd958bbeb3c207b36db5ab2be6f33576028c861c518fd6b615565ae63401 4328291
        
Now, that was pretty easy, right? The scripts for the other commands work similarly. 
I'm sure you got the idea so I'll leave you to experiment. 

Have fun with Kontomatik! 
