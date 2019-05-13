kubectl apply -f product/v1/app.yaml
kubectl apply -f customer/v1/app.yaml
kubectl apply -f order/v1/app.yaml
kubectl get svc,deploy,pod