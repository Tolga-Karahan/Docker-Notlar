# Bind mounting; hosttaki bir dosya ve ya dizinin containerda
# bulunan bir dosya ve ya dizine map edilmesidir. Containerın
# silinmesi veri kaybına sebep olmaz. Host spesifik konfügürasyon
# olduğu için Dockerfile dosyasında bind mounting yapamayız. Bu
# nedenle containerı çalıştırırken bunu belirtmemiz gerekir.

# Bind mounting yaparken, volumelara isim verdiğimizde kullandığımız
# gibi -v opsiyonunu kullanıyoruz fakat bu sefer isim yerine hostta
# bulunan bir dosya ve ya dizinin pathini / ile başlayarak veriyoruz:
# docker container run -v /host-path:/container-path

# Bind mounting yaptıktan sonra host dizinindeki değişiklikleri
# container içerisinde de realtime olarak görebiliriz Çünkü aslında
# her ikisi de aynı fiziksel disk bölümüne işaret eder.
docker container run --name bind_mnt_test -p 30:80 -v $(pwd)/html:/usr/share/nginx/html nginx

# Dizinler aynı yere işaret ettiği için container içerisinde bir
# dosyayı silmemiz durumunda dosya hosttada silinir. 