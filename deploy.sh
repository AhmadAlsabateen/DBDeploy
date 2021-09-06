#!/bin/bash

DOCKER_HUB_USERNAME=ahmad2sabateen


# Services 
DB_SERVICE=db-server


docker tag $DB_SERVICE $DOCKER_HUB_USERNAME/$DB_SERVICE

docker push $DOCKER_HUB_USERNAME/$DB_SERVICE



#Digest
DB_SERVICE_DIGEST=`docker inspect --format='{{index .RepoDigests 0}}' $DOCKER_HUB_USERNAME/$DB_SERVICE`


#Fill Values
sed 's/{image-value}/$DB_SERVICE_DIGEST/' db-service-template.yaml > db-service.yaml

#Deploy
kubectl apply -f db-service.yaml



kubectl get deployments
kubectl get services







