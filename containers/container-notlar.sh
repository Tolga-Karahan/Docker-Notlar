# Image; uygulamayı oluşturan binaryleri, kütüphaneleri, kaynak kodu
# ve tüm diğer şeyleri içerir. Container ise herhangi bir imagein
# çalışan bir örneğidir. Aynı imagei temel alan çok sayıda container
# oluşturabiliriz. 

# Docker Hub'da çeşitli imageler bulabiliriz. Örnek olarak nginx 
# imageini kullanabiliriz. Aşağıdaki komutu koştuğumuzda Docker engine
# nginx isimli imagei Docker Hub'da arar. Bulduktan sonra indirir ve
# yeni container içerisinde yeni bir process olarak çalıştırır. 
docker container run --publish 80:80 nginx

# Yukarıdaki komutun publish kısmı ile hostun 80 numaralı portundaki
# trafik, containerda çalışan nginx serverının 80 numaralı portuna
# yönlendirilir. Benim bu portum halihazırda başka bir uygulama
# tarafından zaten dinlenildiği için bind hatası verdi. Host tarafında
# herhangi bir portu kullanabiliriz. Fakat bu sefer servera ulaşmak 
# için de aynı portu kullanmalıyız.
docker container run --publish 70:80 nginx

# Arkaplanda çalıştırmak için -- detach argümanını kullanıyoruz.
docker container run --publish 70:80 --detach nginx

# docker container ls komutu ile çalışan containerları görebiliriz.
docker container ls

# docker container stop <container-id> komutu ile çalışan bir containerı
# durdurabiliriz. Tüm idyi vermemize gerek yok. Dockerın idyi çıkartabileceği
# kadar hane girmemiz yeterli.
docker container stop 647

# docker container ls -a komutunu kullanarak tüm containerları görebiliriz.
# docker container run <image> komutunu birden fazla kez koşmuşsak birden
# fazla container listelendiğini görürüz.

# containerları listelediğimiz zaman garip isimleri olduğunu görebiliriz
# Eğer biz isim sağlamazsak bir listeden rastgele unique bir isim atanır.
docker container run --publish 70:80 --detach --name thost nginx

# containerı arkaplanda çalıştırdığımız zaman loglar terminale kendiliğinden
# akmaz. Bunun için docker container logs <container-ismi> komutunu koşmalıyız.
docker container logs thost 

# docker container top <container-ismi> komutu ile çalışan containerda koşan
# processleri görebiliriz.
docker container top thost

# docker container rm <id1> <id2> ... <idn> komutu ile id ile belirttiğimiz
# containerları silebiliriz.
docker container rm b1e bab c3a e50 513 e1a

# Containerlar Linux'ta sadece bir processten ibaret.

# docker inspect <container-id/container-isim> komutu ile container konfügürasyonunu
# görebiliriz.
docker container inspect thost

# docker container stats komutu ile tüm containerlara ait istatistikleri görebiliriz
# ve ya belirli bir container ismi ve ya idsi vererek sadece belirttiğimiz container
# ile ilgili istatistikleri görebiliriz.
docker container stats
docker container stats thost