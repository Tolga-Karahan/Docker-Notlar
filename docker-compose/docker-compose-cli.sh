# Docker compose CLI, Docker'dan farklı bir binarydir.
# Bu nedenle Linux için ayrıca indirmek gerekiyor. 
# Lokal geliştirme ve test için kullanılan bir araçtır.
# Production-grade bir araç değildir.

# Volumeları ve ağları kurmak ve tüm containerları koşmak
# için docker-compose up komutunu kullanıyoruz:
docker-compose up

# Tüm containerları durdurup silmek ve volumeları, ağları
# silmek için docker-compose down komutunu kullanıyoruz:
docker-compose down