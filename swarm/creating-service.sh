# Swarm varsayılan olarak aktif değildir. 
docker swarm init

# Swarm başlatılırken bir root sertifikası oluşturulur. 
# Bu sertifika tüm nodeların(manager/worker) güvenilir olduğunun
# anlaşılmasında ve sertifikaların kayıt edilmesinde kullanılır.
# Varsayılan olarak bir manager oluşturulur ve bu manager için
# özel bir sertifika oluşturulur. Ayrıca bir token üretilir. Bu
# token diğer nodeları bu Swarm'a dahil etmek için kullanılır. 
# Swarm API aktif edilir ve RAFT Consensus veritabanı oluşturulur.
# Raft nodelar arasında tutarlılığı sağlamak için kullanılan bir
# protokoldür. Örneğin bulut ortamlarında kullanılması gerekir.
# Çünkü herhangi bir anda istenilen şeyin aktif olması garanti
# edilemez.

# Swarm'da service komutu run komutunun yerini alır. Teker teker
# containerları başlatmak, isimlendirmek gibi işlerle uğraşmıyoruz.
# Swarma servisler aracılığıyla gereksinimleri, konfügürasyonları
# iletiyoruz ve orkestrasyonu Swarm yapıyor. 

# service komutu ile Swarm'a emirleri iletiyoruz. Swarm bu task
# için yeni bir servis oluşturup IDsini dönüyor.

# Yeni bir servis oluşturalım:
docker service create alpine ping 8.8.8.8

# Servisleri kontrol edelim:
docker service ls

# Servisin ismini kullanarak servis içerisinde koşan taskları yani
# containerları görelim:
docker service ps admiring_kalam

# Yukarıdaki komutu koştuğumuzda NODE sütununda containerın koştuğu
# serverı görebiliriz.

# Oluşturduğumuz servisi kullanarak taskı replike edelim:
docker service update admiring_kalam --replicas 3

# Swarm belirtilen servislerin ayakta olması için gerekli optimizasyonlara
# sahiptir. Docker container rm komutu ile bir containerı silersek yeni
# bir tanesini oluşturur ve containerların birinin fail vermesi durumunda
# recover eder. Dolayısıyla doğrudan container seviyesinde müdahaleler
# yapmayız. Taskları belirleriz ve Swarm bu taskları kuyruğa koyarak
# gerekli orkestrasyonu yapar.