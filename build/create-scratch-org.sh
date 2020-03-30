# Get the private key from the environment variable
echo "Setting up DevHub Connection..."

# Authenticate to salesforce
echo "Authenticating..."


#Create a scratch org
echo "Creating the Scratch Org..."
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s