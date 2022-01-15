# Linux sistemlerinde arayüz üzerinden log dosyalarını görüntüleme

## Log dosyaları nedir?
Sistem ile alakalı hatalar, değişiklikler veya kullanıcı işlemleri gibi bilgileri saklayan dosyalardır. Bütün linux sistemleri ön yükleme işlemleri, kernel ile alakalı problemler, uygulamalar ve diğer olaylar için log dosyaları oluşturur ve belirli bir süre saklar. 
` var/log ` klasörü içinde bulunan log dosyaları ASCII metin formatında kaydedilir.
 


## Gereklilikler

Uygulamayı kullanmak için zenity programına sahip olmanız gerekmektedir

debian ve ubuntu için <br>
```
apt install zenity 
```
komutunu kullanarak programı kurabilirsiniz.

## Kurulum
1.Zip olarak kurulum <br>
  İndirdiğiniz zip dosyasından klasörü çıkartın ve klasör içinde bir terminal açın.
  
<br>
2. Bir terminal açın ve alttaki komutu kopyalayarak terminalize yapıştırın ve çalıştırın. 
<br>

```
git clone https://github.com/ahmeTelli/display-log.git
```
<br> bulunduğunuz dizinde terminale şu komutu yazın ` cd display-log ` 


## Kullanım
indirdiğiniz dizinde ` . logDisplay.sh ` dosyasını çalıştırarak programı kullanabilirsiniz.

Herhangi bir log dosyası seçtikten sonra size arama yapmak isteyip istemediğinizi soran bir seçenek ekranı çıkacaktır.

[![image](https://www.linkpicture.com/q/sorgu.png)](https://www.linkpicture.com/view.php?img=LPic61e2683a160ce30739305)


Seçilen herhangi bir log dosyayının admin yetkisinde okuma izni yoksa sizden root şifresi istenilecektir <br>

[![image](https://www.linkpicture.com/q/sifre.png)](https://www.linkpicture.com/view.php?img=LPic61e042e5376ee92885307)

Dosya içinde kelimeye göre aramaya yapılıp seçtiğiniz kelimenin geçtiği tüm satırlar görüntülenir


[![image](https://www.linkpicture.com/q/first_14.png)](https://www.linkpicture.com/view.php?img=LPic61e03bfa408bc983218585)

Aynı zamanda seçilen log dosyasında en çok geçen kelimeler seçenek olarak sunulur <br>

Görüntülemek için sıkıştırılmış bir dosya seçebilirsiniz. Program kapandığında sıkıştırılmış dosya korunur.

<br>
Daha ayrıntılı bilgi almak için tanıtımı izleyebilirsiniz > https://youtu.be/O3ncClFwfG4
<br>


## İletişim
Bana ulaşmak için 
- [Mail](mailto:ahmeta.telli@gmail.com)
- [Linkedn](https://www.linkedin.com/in/ahmet-t-b138a1194/)
- [Youtube](https://youtu.be/O3ncClFwfG4) 


