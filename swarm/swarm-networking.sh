# Swarmda ki containerları konuşturmak için overlay
# driverını kullanırız. IPSec kullanarak tüm ağ trafiğini
# şifreleyebiliriz. Bu opsiyon varsayılan olarak kapalıdır.

# Örnek olarak farklı makinelerde bulunacak olan bir Drupal
# ve veritabanı serverı düşünebiliriz. Bir overlay network
# oluşturduktan sonra her biri için bir servis oluşturabiliriz
# konuşabilmeleri için ise aynı overlay ağında olacak şekilde
# bir konfügürasyon yaparız.
docker network create --driver overlay drupal-net

docker service create --name psql --network drupal-net \
       -e POSTGRES_PASSWORD=$POSTGRES_PASS postgres

docker service create --name drupal --network drupal-net \
       -p 80:80 drupal

 # Swarm'da routing mesh kullanılır. Yani bir servise erişmek
 # için herhangi bir nodeun ip adresini kullanabiliriz. Arkada
 # bir load-balancer çalışır ve ilgili taskın bulunduğu node a
 # trafiği ilerletir. Yani tüm nodelar servisin ilgili portunu
 # dinler. Bu esneklik sayesinde nodelardan birinde problem
 # olması nedeniyle container başka bir nodea deploy edildiğinde
 # konfügürasyon ile uğraşmayız.