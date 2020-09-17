# default-http-backend

## run

```bash
cd default-http-backend/app

flask run
```

```bash
docker run -p 5000:5000 kdop/default-http-backend:0.0.1
```

## Testing

<http://127.0.0.1:5000/health>

<http://127.0.0.1:5000/>

## Helm

```bash
helm upgrade --install --namespace adsantos --create-namespace default-http-backend default-http-backend
```
