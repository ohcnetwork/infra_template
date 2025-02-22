# Install or upgrade the ingress-nginx controller
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set controller.service.loadBalancerIP=34.100.159.155

# Add the Jetstack repository for cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Install or upgrade cert-manager with the specified version
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.12.0 \
  --set installCRDs=true
