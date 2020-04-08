# Container içerisinden shell çalıştırmak isteyebiliriz. Bunun için
# containerı çalıştırırken -it opsiyonunu sağlayarak container içinde
# bir shell elde ederiz. Komut aşağıdaki gibidir. Image argümanından
# sonra container içerisinde çalışacak programı belirliyoruz. Bizim
# durumumuzda bu bash oluyor.
docker container run -it --name proxy nginx bash

# Herhangi bir Docker containerı çalıştırırken genel komut formatı şu
# şekildedir: docker container run <OPTIONS> IMAGE <COMMAND> <ARGS...>
# <OPTIONS> ile container opsiyonlarını sağlıyoruz, <COMMAND> <ARGS...>
# kısmı ile container içerisinde koşulacak komutları ve ilgili argümanları
# göndeririz. -it opsiyonunu sağladıktan sonra komut olarak bash komutunu
# gönderdiğimiz için varsayılan komut yerine bir bash shelli verilir. Bu
# shellden çıktığımız zaman container da durur çünkü container başladığı
# zaman kendisine verilen komut çalıştığı sürece çalışmaya devam eder.
# docker container ls -a komutunu kullandığımızda containerların varsayılan
# komutlarını görürüz. 

# Bir Linux dağıtımını image olarak kullanıp container çalıştırabiliriz ve
# bu container içerisinde interaktif bir shell kullanabiliriz. Varsayılan
# komutu zaten bash olduğu için -it opsiyonunu ve bash komutunu kullanmamıza
# gerek kalmaz.
docker container run ubuntu

# Hali hazırda başka bir program çalıştıran bir container içerisinden de bir
# shell çalıştırabiliriz: docker container exec -it <container-name> <command>
docker container exec -it test_nginx bash