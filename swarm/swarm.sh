# Docker ile uygulamalarımızı kolayca deploy edebiliriz.
# Docker sayesinde deployment donanım ve platformdan bağımsız
# olur. Fakat yüzlerce ve ya binlerce containerı çok sayıda
# server üzerinde deploy ve maintain etmek zordur. Containerın
# hangi node üzerinde olduğu, diğer nodelardaki containerlar
# ile haberleşmesi, güvenlik, bir hata durumunda tekrar 
# başlatılması, güncelleneceği zaman yeni bir container
# oluşturulması, containerların çalışabilmesi için gerekli
# hassas bilgilerin(şifreler vs...) saklanması vs. gibi
# problemler/işler vardır. Bu gibi durumların üstesinden 
# gelmek için Swarm kullanılıyor. Swarm nodelara dağılmış
# containerları tek bir birim gibi yönetmemizi sağlayan bir
# cluster çözümüdür. Swarm aslında komutları alıp çok sayıda
# server üzerindeki containerlarda koşan bir containerdır.

# Swarm mimarisinde manager ve worker nodelar bulunur. Manager
# nodelarda raft veritabanı vardır. Bu veritabanı konfügürasyon,
# sertifikalar gibi Swarm içerisinde nodeun yönetici olmasını
# sağlayan bazı bilgileri tutar. Tüm manager nodelar raft
# veritabanının bir kopyasına sahiptir.

# Swarm, run komutunu değiştirerek yeni özellikler ekler.
# Örneğin birden fazla task oluşturabiliriz. Taskların her biri
# bir container koşar. Bir servis oluşturup replika sayısını
# verdiğimizde manager nodedaki konfügürasyona göre, replika
# sayısı ile belirtildiği kadar container oluşturur. 