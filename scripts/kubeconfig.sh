#!/bin/bash
read -r -d '' KUBECONFIG <<EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: $CERT_DATA
    server: https://74.220.19.194:6443
  name: cluster_tf
contexts:
- context:
    cluster: cluster_tf
    user: cluster_tf
  name: cluster_tf
current-context: cluster_tf
kind: Config
preferences: {}
users:
- name: cluster_tf
  user:
    client-certificate-data: $CLIENT_DATA
    client-key-data: $KEY_DATA
EOF
echo "${KUBECONFIG}" > ~/.kube/config