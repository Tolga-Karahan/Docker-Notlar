# Aslında imagelerin isimleri yoktur. docker image ls komutunu
# kullandığımızda bir isim sütunu gelmez. IDler ise kullanışsızdır
# dolayısıyla repository ve tag bilgisini kullanabiliriz. 

# Tag, bir reponun belirli bir commitine işaret eder.

# Dockerfile kullanarak kendi imagelerimizi etiketleyebildiğimiz
# gibi varolan imageleri de etiketleyebiliriz.

# docker image tag <source-image[:tag]> <target-image[:tag]> komutunu 
# kullanarak tag oluşturabiliriz. Etiket belirtmezsek default olarak 
# latest kullanılır ve sadece repo ismi değişir: 
docker tag httpd my_httpd

# Tagi değiştirelim:
docker tag my_httpd my_httpd:1.0