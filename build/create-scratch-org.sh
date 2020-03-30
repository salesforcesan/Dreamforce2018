# Get the private key from the environment variable
echo "Setting up DevHub Connection..."

# Authenticate to salesforce
echo "Authenticating..."

sfdx force:auth:jwt:grant --clientid 3MVG9szVa2RxsqBbjmqiI4rBid8cleaSO4u1nK9fCWcAXic8CVGrb8A.nNPgUtQwfoyRQTTEZc18ZJGGHZyoX --jwtkeyfile server.key --username salesforce.san@gmail.com --setdefaultdevhubusername -a DevHub

#Create a scratch org
echo "Creating the Scratch Org..."
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s