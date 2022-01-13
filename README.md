# Linux sistemlerinde arayüz üzerinden log dosyalarını görüntüleme

## Log dosyaları nedir?
Sistem ile alakalı hatalar,değişiklikler veya kullanıcı işlemleri gibi bilgileri saklayan dosyalardır. Karşılaşılan olumsuz 
durumlarda ilk bakılacak yerlerden birisidir. 


## Gereklilikler
Kullanmak için zenity kütüphanesine sahip olmanız gerekmektedir

for debian <br>
```
apt install zenity 
```

## Kurulum
Terminalinize kopyalayınız
```
git clone https://github.com/ahmeTelli/display-log.git
```

## Kullanım
indirdiğiniz dizinde `logDisplay.sh ` dosyasını çalıştırarak programı kullanabilirsiniz.

Seçilen herhangi bir log dosyayının admin yetkisinde okuma izni yoksa sizden root şifresi istenilecektir <br>

[![image](https://www.linkpicture.com/q/sifre.png)](https://www.linkpicture.com/view.php?img=LPic61e042e5376ee92885307)

Dosya içinde kelimeye göre aramaya yapılıp seçtiğiniz kelimenin geçtiği tüm satırlar görüntülenir


[![image](https://www.linkpicture.com/q/first_14.png)](https://www.linkpicture.com/view.php?img=LPic61e03bfa408bc983218585)

Aynı zamanda seçilen log dosyasında en çok geçen kelimeler seçenek olarak sunulur <br>

<br>
Daha ayrıntılı bilgi almak için tanıtımı izleyebilirsiniz >>> https://youtu.be/O3ncClFwfG4 
<br>


## İletişim
mail --> ahmeta.telli@gmail.com

