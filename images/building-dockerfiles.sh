# Dockerfile dosyalarını build etmek için docker image
# build <options> <Dockerfile> komutunu kullanıyoruz.
# Tag vermek için -t opsiyonunu kullanabiliriz:
docker image build -t new_nginx:test .

# Dosyayı koştuğumuzda her bir komut adım adım koşulur.
# Her komut tamamlandıktan sonra bir hash çıktısı verilir.
# Bu hashler build önbelleğinde tutulur ve  Dockerfile
# tekrar build edildiğinde değişmeyen satırlar için
# komut tekrar koşulmaz. İlk değişen komuttan sonraki
# diğer komutlar ise koşulur.
