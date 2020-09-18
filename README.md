# default-http-backend

## run

```bash
cd default-http-backend/app

flask run
```

```bash
docker run -p 8000:80 kdop/default-http-backend:0.0.1
```

## Testing

<http://127.0.0.1:8000/health>

<http://127.0.0.1:8000/>

## Helm

```bash
helm upgrade --install --namespace ingress-nginx --create-namespace default-http-backend default-http-backend
```

## Change ingress-mginx default backend

```bas
kubectl edit deployment.apps/ingress-nginx-controller -n ingress-nginx
```