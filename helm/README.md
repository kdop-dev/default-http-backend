# default-http-backend

## Criar helm

```bash
helm create default-http-backend
```

## Instalar

Teste

```bash
cd helm
helm template --namespace ingress-nginx default-http-backend ./default-http-backend
```

Pra valer

```bash
cd helm
helm install --namespace ingress-nginx --create-namespace default-http-backend ./default-http-backend

Release "default-http-backend" has been upgraded. Happy Helming!
NAME: default-http-backend
LAST DEPLOYED: Mon Sep  7 00:14:22 2020
NAMESPACE: adsantos
STATUS: deployed
REVISION: 2
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace adsantos svc -w default-http-backend'
  export SERVICE_IP=$(kubectl get svc --namespace adsantos default-http-backend --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")     
  echo http://$SERVICE_IP:80
```

### Atualizar

```bash
helm upgrade --namespace ingress-nginx default-http-backend ./default-http-backend
```

### Excluir

```bash
helm delete --namespace ingress-nginx default-http-backend
```

Verificando

```bash
kubectl get all -n ingress-nginx

NAME                            READY   STATUS    RESTARTS   AGE
pod/default-http-backend-64d4d4b788-kkc98   1/1     Running   0          13m

NAME               TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)        AGE
service/default-http-backend   LoadBalancer   10.0.161.44   13.89.140.64   80:32282/TCP   17m

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/default-http-backend   1/1     1            1           17m

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/default-http-backend-64d4d4b788   1         1         1       13m
```

```bash
kubectl logs -f pod/default-http-backend-64d4d4b788-kkc98 -n ingress-nginx # funciona até reiniciar o pod

kubectl logs -f -l app.kubernetes.io/name=default-http-backend -n ingress-nginx # funciona sempre
```

### Executando o serviço

```bash
export SERVICE_IP=$(kubectl get svc --namespace adsantos default-http-backend --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")

echo http://$SERVICE_IP:80
```
