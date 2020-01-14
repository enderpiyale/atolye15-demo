#! /bin/bash
# exit script when any command ran here returns with non-zero exit code
set -e

echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > stageCert.crt

./kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=stageCert.crt \
  --token=$KUBERNETES_TOKEN \
  apply -f ./kube-stage