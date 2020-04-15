# Imageler uygulamanın binarylerinden, dependencylerinden ve image i
# çalıştırmak için gerekli metadatadan oluşur.

# Imageler ilk oluştuğunda scratch olarak isimlendirilen bir katman
# ile başlarlar. Image üzerinde her yapılan değişiklik yeni bir katman
# olarak bir önceki katmanın üzerine eklenir. Bu değişiklikleri yapmak
# için Dockerfile ı kullanabiliriz. Örneğin  bir Ubuntu imagei oluşturmuş
# olabiliriz. Bu imagede dosya sisteminde değişiklikler yaptığımızda yeni
# bir katman oluşturmuş oluruz. Ardından ortam değişkenlerini değiştirmiş
# olabiriz, yine bu değişiklikler de yeni bir katman olarak eklenir. 
# Katmanların her biri unique SHA idsine sahiptir. Böylece katmanlar
# Docker Hub'daki ve ya lokaldeki diğer katmanlar ile karşılaştırılabilir.
# Bu katmanları görmek için docker image history komutunu kullanabiliriz:
docker image history nginx

# Farklı imageler aynı katmanlara sahip olabilir. İlk oluşturulduklarında
# aynı taban katmanı paylaşabilirler, ardından gelen değişiklikler ilgili
# image içinde yeni katmanlar oluşturur. Böylece her katmanın tek bir örneği
# bulunur. Bu şekilde bir imagei diğer imagelerin taban imagei olarakta
# kullanabiliriz. Yeni bir container oluşturduğumuzda ise image katmanlarına
# basitçe yeni bir okuma/yazma katmanı eklenir. Eğer bu container taban image
# katmanlarında değişiklikler yaparsa bu değişiklikler containerda oluşturulur.
# Örneğin bir dosya değişmiş olabilir. Dosyanın değişmiş hali containera dahil
# edilir.

# Imagelerin metadatasını görmek için inspect komutunu kullanabiliriz:
docker image inspect nginx