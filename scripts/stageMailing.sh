#! /bin/bash
# exit script when any command ran here returns with non-zero exit code
set -e

curl --request POST --url https://api.sendgrid.com/v3/mail/send --header "Authorization: Bearer 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" --header 'Content-Type: application/json' --data '{"personalizations": [{"to": [{"email": "enderpiyale@gmail.com"}]}],"from": {"email": "enderpiyale@gmail.com"},"subject": "Stage Deployed", "content": [{"type": "text/plain", "value": "Stage workflow completed successfully!"}]}'

