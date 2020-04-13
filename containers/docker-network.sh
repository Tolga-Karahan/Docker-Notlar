# docker container port <container-ismi> komutu ile belirttiğimiz
# container için ağda hangi portlar arasında trafik olduğunu görürüz.
docker container port test_nginx

# Yeni bir container oluşturduğumuzda container varsayılan olarak 
# bridge/docker0 isimli sanal bir ağa bağlanır. Bu ağlar otomatik
# olarak hostın ethernet arayüzüne bağlıdır. Her bir sanal ağ bir
# NAT firewall aracılığıyla, host ip üzerinden yönlendirilir. Böylece 
# containerlar nete çıkar.

# Sanal ağımızdaki containerlar, port belirlememize gerek kalmaksızın,
# birbiri ile konuşabilir. Bunun için port expose etmemize gerek yoktur.
# Haberleşecek containerlar için ayrı ayrı sanal ağlar oluşturabiliriz. 

# Bir container, tıpkı gerçek bilgisayarların birden fazla NIC aracılığıyla 
# yaptığı gibi, birden fazla ağa bağlanabilir.

# Sanal ağ konfügürasyonlarını kullanmak istemiyorsak --net=host
# opsiyonunu kullanabiliriz. 

# Host portunu herhangi bir containerdaki bir uygulamanın portuna 
# yönlendirmek için aşağıdaki komutu kullanıyoruz:
docker container run -p 80:80 --name webhost -d nginx

# Inspect komutunun çıktısını filtreleyerek container ipsini görmek için
# aşağıdaki komutu kullanabiliriz:
docker container inspect --format '{{ .NetworkSettings.IPAddress }}' test_nginx

# Komut çıktısından da görebildiğimiz gibi containerlar host ipsini kullanmıyor.
# -p opsiyonunu kullanarak portları belirlediğimiz zaman host portuna gelen trafik,
# bridge/docker0 sanal ağı üzerinden containerın belirtilen portuna ulaşır. Yeni
# bir container eklediğimizde bu container da varsayılan olarak bridge/docker0
# sanal ağına eklenir. Bu containerlar aynı ağda oldukları için birbirleri ile
# konuşabilir fakat portları publish etmediğimiz sürece bizim makinemizin portları
# ile konuşamaz. Birbiri ile konuşması gerekmeyen containerları yeni sanal ağlar
# oluşurarak farklı sanal ağlarda tutabiliriz. Farklı sanal ağlardaki containerlar
# birbirleri ile konuşmaları gerekirse host üzerinden publish ettikleri portlar
# üzerinden konuşabilirler.

# Docker ağlarını görmek için docker network ls komutunu kullanabiliriz:
docker network ls

# Yukarıdaki komutu çalıştırdığımızda host isimli bir ağ görüyoruz. Bu ağı
# kullandığımızda Docker'ın sanal ağ mekanizmaları devre dışı kalır ve doğrudan
# host arayüzüne bağlanılır.

# docker network inspect <ağ-ismi> komutu ile spesifik bir ağın konfügürasyonuna
# bakabiliriz:
docker network inspect bridge

# docker network create --driver <driver-ismi> komutu ile built-in ve ya 3. party
# driverları kullanarak yeni sanal ağlar oluşturabiliriz. Driver belirlemezsek
# varsayılan bridge driverı kullanılır.
docker network create my_test_net

# docker network connect [options] <network> <container> komutu ile bir
# containerı başka bir ağa bağlayabiliriz. Aynı şekilde disconnect ile de
# bir containerı bağlı oluğu ağdan çıkartabiliriz.
docker network connect my_test_net test_nginx

# Docker containerları dinamik olarak değiştiği için haberleşme yapılırken
# ip adreslerini kullanmaktan kaçınmalıyız. Çünkü değişmediğinden emin olamayız.
# Bu nedenle DNS isimlendirmesi kullanmak iyi bir pratiktir. Basitçe container
# isimlerini kullanabiliriz, arkada bir DNS çözümlemesi yapılır. 

# Ping atarak bunu deneyebiliriz:
docker container exec -it test_nginx2 ping test_nginx