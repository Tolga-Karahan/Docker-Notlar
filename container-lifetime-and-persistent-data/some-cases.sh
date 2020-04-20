# Veritabanı serverını yeni patch sürümüne update etmemiz
# gerektiğini düşünelim. Containerlarda uygulamaları update
# etmek iyi bir pratik olmadığı için eski sürümün bulunduğu
# containerı silmemiz ve yeni sürümü içeren yeni bir container
# oluşturmamız gerekir. Aynı zamanda veritabanındaki verileri
# de kaybetmemek için bir isimli volume oluşturarak verileri
# saklamalıyız.

# postgres-9.6.1 imagei içeren bir container oluşturalım
# Verilerin saklanacağı volume ismini postgres-data olarak belirledik
docker container run --name postgres-db -v postgres-data:/var/lib/postgresql/data postgres:9.6.1

# Containerı kaldıralım
docker container rm postgres-db

# Yeni sürümü kurarken de aynı volume ismini belirlersek
# aynı volume kullanılmaya devam eder
docker container run --name new-postgres-db -v postgres-data:/var/lib/postgresql/data postgres:9.6.2


# Developerlar için hazır geliştirme ortamları sunan imageler
# var. Basitçe bu imageleri kullanarak bir container oluşturabiliriz.
# Geliştirmeyi hostta yaparak dosyaları containera mount edebiliriz 
# ve bu sayede değişiklikleri hostta yaparken sonuçları containerda görürüz.