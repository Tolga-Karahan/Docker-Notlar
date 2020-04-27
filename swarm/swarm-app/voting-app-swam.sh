# Create networks for front-end and back-end
docker network create --driver overlay frontend
docker network create --driver overlay backend

# Create a service with 2 replicas for app
docker service create --name vote --network frontend \
      -p 80:80 --replicas 2 bretfisher/examplevotingapp_vote:latest

# Create a service for redis 
docker service create --name redis --network frontend redis:3.2

# Create a service for worker
docker service create --name worker --network frontend \
       --network backend bretfisher/examplevotingapp_java

# Create a service for db
docker service create --name db --network backend --mount \
       type=volume,source=db-data,target=/var/lib/postgresql/data \

# Create a service for result app
docker service create --nameresult --network backend -p 6789:80 \
       bretfisher/examplevotingapp_result