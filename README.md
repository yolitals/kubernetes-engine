# Hello world nginx in kubernetes engine

## Prerrequisites
- Innstall and config gcloud cli and credentials (http://macappstore.org/google-cloud-sdk/)

- Install terraform

- Install kubectl 

## Build kubernetes cluster

- ```$ cd infrastructure```
- ```$ terraform apply ```

## Config local tools
- Install kubctl
- Install Helm
- Configure kubectl to connect our kubernetes clustes.
```sh
$ gcloud container clusters get-credentials devfest --zone us-west1-a --project kubernetes-229703 
# devfest is a cluster name created previously 
# kubernetes-229703 is the gcp project ussing to create cluster in gcp 
```
- Test cluster conexion 
```
$ kubectl cluster-info
```
- Install Helm
- Initialize helm
```$ helm init```
## Deployments
 - Hack
``` kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'```

- Helm Deploy
```
$ cd app
$ helm package helloworld --debug
$ helm install helloworld-0.1.0.tgz --name helloworld
``



### Referencias
https://github.com/fnproject/fn-helm/issues/21
https://docs.helm.sh/using_helm/#quickstart-guide
https://medium.com/@pablorsk/kubernetes-helm-node-hello-world-c97d20437abd
https://dzone.com/articles/build-a-kubernetes-cluster-on-gcp-with-terraform
