# Get the private key from the environment variable
echo "Setting up DevHub Connection..."
mkdir keys
echo $SFDC_SERVER_KEY | base64 -d > keys/server.key
openssl enc -nosalt -aes-256-cbc -in server.key -out server.key.enc -base64 -K 962892A4BC3427202D133E8B803A8E2420EE6ACA5215E3296612D59C800FEB01 -iv 835C2944F866258C2DCB2D3DCDA9A81A

# Authenticate to salesforce
echo "Authenticating..."
sfdx force:auth:jwt:grant --clientid $SFDC_PROD_CLIENTID --jwtkeyfile keys/server.key --username $SFDC_PROD_USER --setdefaultdevhubusername -a DevHub

#Create a scratch org
echo "Creating the Scratch Org..."
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s