# Docker to Kubernetes Migration
Clone this repo: https://github.com/304442/infra.git and go into root dir `infra`

## Setup DSN record for Server Public IP
- Get the `pubilc ip` of the server

```bash
curl ifconfig.me
```

- Insert the `DSN record` of type `A` with server public IP address.  

## Setup Contabo using Terraform

Replace the contabo credentials in the `main.tf` inside `terraform` and run the following commands,

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## Run all the below commands from `root(infra)` dir,

## Setup Kubernetes k3s Single Node Cluster

To setup k3s cluster, run the below command,
```bash
chmod u+x /scripts/deploy_k3s_cluster.sh
./scripts/deploy_k3s_cluster.sh
```

## Deploy and Setup Full Application on k3s Cluster

To setup full application including `all services, helm, traefik ingress and argocd`, run the below command,
```bash
chmod u+x /scripts/deploy_full_app.sh
./deploy_full_app.sh <domain-name>
```

For example, if you want to deploy your application with domain name `happycloudcomputing.com`, run the following command,
```bash
chmod u+x /scripts/deploy_full_app.sh
./scripts/deploy_k3s_cluster.sh happycloudcomputing.com
```

## Setup Helm and Helmfile

To setup helm and helmfile, run the below command,
```bash
chmod u+x /scripts/setup_helm.sh
./scripts/setup_helm.sh
```

## Setup ArgoCD and Access UI

To setup argocd, run the below commands,
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

We need to disable TLS in `argocd deployment` so it can work ingress as described here: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#traefik-v22. Run the following commands to disable TLS,


```bash
kubectl edit deploy argocd-server -n argocd

```

- Edit the deployment file as per official Official Docs `The API server should be run with TLS disabled. Edit the argocd-server deployment to add the --insecure flag to the argocd-server command or set server.insecure: "true" in the argocd-cmd-params-cm`

```bash
kubectl scale deployment argocd-server --replicas=0 -n argocd
kubectl scale deployment argocd-server --replicas=1 -n argocd
```

- Argocd default username: `admin`
- To access the password, run the below command,

```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --d; echo
```

- Access argocd UI at: `https://argocd.<domain-name>/`

## Setup Certificate Issuers

- To setup the `lets ecrypt` staging and production cert issuers, run the following commands as required,

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
kubectl apply -f cert-issuers/staging_issuer.yaml
kubectl apply -f cert-issuers/prod_issuer.yaml
```

## Setup PV and PVC

- To setup the required pv and pvc, run the following commands as required,

```bash
chmod u+x /scripts/deploy-pvc.sh
./scripts/deploy-pvc.sh
```

## Deploy All Services on k3s Cluster

- Run the following command to deploy all services `without argocd`,

```bash
helmfile sync
```

- Run the following command to deploy all services `with argocd`,

```bash
kubectl apply -f argocd-deployment.yaml
```


## Deploy Traefik Ingress and Acess Services
- Run the following command to deploy all services `without argocd`,

```bash
kubectl apply -f traefik-ingress/argocd-ui-ingress.yaml
kubectl apply -f traefik-ingress/happy-compute-ingress.yaml
```

Access the services at the following URLs, Replace the `<domain-name>` with the actual domain that you are using,

- `wireguard.<domain-name>`
- `liveide.<domain-name>`
- `syncthing.<domain-name>`
- `umami.<domain-name>`
- `rapidbay.<domain-name>`
- `jackett.<domain-name>`
- `qbit.<domain-name>`
- `browser.<domain-name>`
- `nodered.<domain-name>`
- `pinnwand.<domain-name>`
- `pihole.<domain-name>`
- `vaultwarden.<domain-name>`
- `neko.<domain-name>`
- `ibga.<domain-name>`
- `glances.<domain-name>`
- `photoprism.<domain-name>`
- `activepc.<domain-name>`
- `flame.<domain-name>`
- `llama.<domain-name>`
- `gitea.<domain-name>`
- `codeserver.<domain-name>`
- `etherpad.<domain-name>`
