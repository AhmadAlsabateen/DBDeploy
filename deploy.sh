#!/bin/bash

DOCKER_HUB_USERNAME=ahmad2sabateen


# Services 
DB_SERVICE=db-server


docker tag $DB_SERVICE $DOCKER_HUB_USERNAME/$DB_SERVICE

docker push $DOCKER_HUB_USERNAME/$DB_SERVICE



#Deploy
kubectl apply -f db-service.yaml


kubectl get deployments
kubectl get services







