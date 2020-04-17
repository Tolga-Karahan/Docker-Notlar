# Uygulamanın ürettiği ve ya containerdaki bir veritabanına
# yazılan verilerin container yaşam döngüsünden bağımsız olmasını
# isteriz. Örneğin bir veritabanı containerı oluşturacaksak ilgili
# containerı silsek dahi verilerin korunacağı bir konfügürasyon
# oluşturmamız gerekir. Çünkü containerların değişmeleri, yeniden
# oluşturulmaları yaygındır ve kalıcı verilerin korunmasını isteriz.

# Verileri containerdan bağımsız olarak saklamak için kullanabileceğimiz
# yöntemlerden biri Dockerfile içerisinde VOLUME komutu ile diskte bir
# yer belirtmektir. Böylece biz manul olarak silmedikçe veriler containerdan
# bağımsız olarak saklanır:
VOLUME /var/lib/mysql

# Container konfügürasyonunda, "Volumes" altında, saklanacak veriler için
# oluşturulan volumeları görebiliriz. Volumelar için oluşturulan kayıtların
# aynıları "Mounts" altında da görülebilir. Çünkü aslında hostun dosya 
# sisteminde belirtilen pathe karşılık düşen ve container için unique bir
# alan vardır ve veriler buraya yazılır.

# Containerlar için oluşturulan volumeları şu şekilde görebiliriz:
docker volume ls

# Spesifik bir volumea ait konfügürasyonu görmek için docker volume inspect
# <volume-id> komutunu kullanabiliriz.

# Volume idleri ile çalışmak kullanışlı olmadığı için container oluştururken
# volumelara isim verebiliriz. Bunun için -v opsiyonunu ve volume-name:path
# argümanını kullanıyoruz.
docker container run -v mysql-db:/var/lib/mysql mysql