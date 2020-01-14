#! /bin/bash
# exit script when any command ran here returns with non-zero exit code
set -e

#echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > prodCert.crt
#LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURKekNDQWcrZ0F3SUJBZ0lDQm5Vd0RRWUpLb1pJaHZjTkFRRUxCUUF3TXpFVk1CTUdBMVVFQ2hNTVJHbG4KYVhSaGJFOWpaV0Z1TVJvd$

./kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=prodCert.crt \
  --token=$CICD_PROD_TOKEN \
  apply -f ./kube-prod