# Swarm'da secret komutu ile şifreler, tokenlar, keyler gibi
# secretları saklayabilir ve servislere atayabiliriz. Atama
# işlemi için de stackları kullanabiliriz. secret komutuna
# secretın ismini ve, secretın bulunduğu dosya ve ya değeri
# sağlıyoruz. Dosya yerine pipe kullanarak external secret
# oluşturabiliriz:
docker secret create psql_pass psql_pass.txt
echo "my external secret" | docker secret create external_psql_pass -

docker secret inspect psql_pass

# Manul olarak servis oluşturacaksak --secret opsiyonu ile 
# secretı servise sağlayabiliriz, servise sağladığımızda
# servise ait taskların çalıştırdığı tüm containerlar bu
# secretları görür:
docker service --name db --secret psql_pass \
      -e POSTGRES_PASSWORD_FILE=/run/secrets/psql_pass

# Servisi update ederek secretları silebiliriz. Docker'ın
# immutable yapısı nedeniyle bu yeni container oluşturulup
# deploy edilmesi anlamına gelir. Bu sefer gerekli ortam
# değişkenleri bulunamayacağından container sürekli kendini
# başlatmaya çalışır ve fail verir:
docker service update --secret-rm