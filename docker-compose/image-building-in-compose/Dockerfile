FROM drupal:8.8.2

RUN apt-get update && apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/themes

# Sadece son versiyonu indirmemiz yeterli o yüzden
# belirttiğimiz branchteki son commiti almak için
# --depth 1 argümanını kullandık. Docker komutları
# root olarak koşuyor. Apache server ise bu dosyaların
# www-data userına ait olmasını bekliyor. O yüzden
# dosyaların sahipliğini değiştirmemiz gerek.
RUN git clone --branch 8.x-3.x --single-branch \
    --depth 1 https://git.drupal.org/project/bootstrap.git && \
    chown -R www-data:www-data bootstrap

WORKDIR /var/www/html