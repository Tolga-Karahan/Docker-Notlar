# docker container port <container-ismi> komutu ile belirttiğimiz
# container için ağda hangi portlar arasında trafik olduğunu görürüz.
docker container port test_nginx

# Yeni bir container oluşturduğumuzda arkaplanda Docker ağına bağlanmış
# oluruz. Varsayılan olarak bu ağ bridge/docker0 isimli networktür ve
# sanal bir ağdır. Her bir sanal ağ bir NAT firewall aracılığıyla 
# yönlendirilir. Bu bir Docker deamonıdır ve varsayılan arayüzünde host
# ipsini konfügüre eder. Böylece containerlar nete çıkar.

# Sanal ağımızdaki containerlar, port belirlememize gerek kalmaksızın,
# birbiri ile konuşabilir. Haberleşecek containerlar için ayrı ayrı
# sanal ağlar oluşturabiliriz. 

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