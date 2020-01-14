#! /bin/bash
# exit script when any command ran here returns with non-zero exit code
set -e

curl --request POST --url https://api.sendgrid.com/v3/mail/send --header "Authorization: Bearer $SENDGRID_API_KEY"" --header 'Content-Type: application/json' --data '{"personalizations": [{"to": [{"email": "enderpiyale@gmail.com"}]}],"from": {"email": "enderpiyale@gmail.com"},"subject": “Stage Deployed,”content": [{"type": "text/plain", "value": “Stage workflow completed successfully!"}]}'
