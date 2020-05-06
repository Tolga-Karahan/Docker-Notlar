# Docker 1.12 sürümü ile birlikte healthcheck desteği geldi.
# Dockerfile ve compose YAML içerisinde kullanabileceğimiz
# gibi run ve swarm service komutları ile de kullanabiliriz.
# Healtcheck için argüman olarak verdiğimiz komut belirli
# aralıklar ile koşulur ve geri dönüş değerine bakılır.
# Örneğin Swarm içerisinde 0 haricinde bir değer gekirse
# container tekrar deploy edilebilir. update komutu ise
# 0 haricinde bir geri dönüş değeri gelen containerda süreci
# durdurur ve sonraki containerlara geçmez. Containerın o
# anki durumunu docker container ls çıktısında görebiliriz
# ve ya inspect komutu çıktısında son 5 healthcheck durumunu
# görebiliriz.

# Dockerfile içerisinde healthcheck eklemek için HEALTHCHECK
# komutunu kullanıyoruz:
HEALTHCHECK --interval=5s --timeout=3s \
    CMD pg_isready -U postgres || exit 1

# Dockerfile dosyasında healtcheck belirlenmemiş bir containera
# çalışma zamanında healthcheck ekleyebiliriz:
docker run \
    --health-cmd="curl -f localhost:9200/_cluster/health || false" \
    --health-interval=5s \
    --health-retries=3 \
    --health-timeout=2s \
    --health-start-period=15s \
    elasticsearch:2

# Compose/Stack dosyalarında aşağıdaki formatı kullanıyoruz:
version: "2.1"

services:
    web:
        image: nginx
        healtcheck:
            test: ["CMD", "curl", "-f", "http://localhost"]
            interval: 1m30s
            timeout: 10s
            retries: 3
            start_period: 1m # minimum version 3.4 gerektiriyor

