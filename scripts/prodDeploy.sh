#! /bin/bash
# exit script when any command ran here returns with non-zero exit code
set -e

echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > prodCert.crt

./kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=prodCert.crt \
  --token=$CICD_PROD_TOKEN \
  apply -f ./kube-prod

./kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=prodCert.crt \
  --token=$CICD_PROD_TOKEN \
  patch deployment do-kubernetes-sample-app -p "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}" --namespace=production