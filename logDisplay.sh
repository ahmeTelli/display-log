#!/bin/sh

#-------------------------------
### Created by Ahmet Telli
### email ahmeta.telli@gmail.com
### linkedin linkedin.com/in/ahmet-t-b138a1194
#-------------------------------

#zenity file selection parametresi ile dosya seçilir
FILE=$(zenity --file-selection --title="Lütfen bir log dosyasi seçiniz" --filename="/var/log/")

#kullanıcının okuma izni olup olmadığının kontrolü
file_permission_var="$(stat -c%a $FILE | awk -F '' '{print $2}')"

if [[ $file_permission_var ==  '0' ]] || [[ $file_permission_var == '1' ]] || [[ $file_permission_var == '2' ]]
then
  while : ;do
    password=$(zenity --password --title="parolanızı giriniz")  
    #root şifresini doğru girip girilmediğinin kontrolü
    if ! sudo -kSp '' [ 1 ] <<<"${password}" 2> /dev/null
    then
        zenity --warning --text="şifrenizi yanlış girdiniz!"
        if [[ "$?" == 0 ]];then
          exit 1
        fi
    else
      break
    fi
  done
else
  password="false"
fi

#Seçilen dosyanın sıkıştırılmış dosya olup olmadığının kontrolü
if [[ "$FILE" == *.gz ]];then
  #sıkıştırılmış dosyanın içinden dosyanın yolunun alınması
  if [[ $password == "false" ]];then
    file_of_decompression=$(gunzip -l $FILE | awk '{if (NR!=1) {print $4}}')
    gunzip -k $FILE
  else
    #izni olmayan kullanıcıya root şifresi ile dosya açma izni
    file_of_decompression=$(echo $password | sudo -S gunzip -l $FILE | awk '{if (NR!=1) {print $4}}')
    
    #sıkıştırılmış dosya silinmeden içinden gerekli dosyanın çıkartılması
    echo $password | sudo -S gunzip -k $FILE
  fi
  FILE=$file_of_decompression
else
  file_of_decompression="false"
fi

while : ;do 
  zenity --question --text="Arama yapmak ister misiniz?" --title="pencere" --ok-label="No" --cancel-label="Yes"
  if [ "$?" == 0 ]
  then
    #arama yapmak istenilmiyorsa dosyayı görüntüle
    if [[ $password == "false" ]];then
      cat $FILE | zenity --text-info --height="500" --width="900"
    else
      echo $password | sudo -S cat $FILE | zenity --text-info --height="500" --width="900"
    fi
    if [[ "$?" == 0 ]];then
      break
    fi
  else
      array_of_most_common_word=()
      #seçilen dosyada en çok geçen 10 kelimenin belirlenmesi
    if [[ $password == "false" ]];then
      ARRAY=$(cat $FILE | tr -cs "[:alpha:]" "\n"| sort -s | uniq | sort -nr | head -n 10)
    else
      ARRAY=$(echo $password | sudo -S cat $FILE | tr -cs "[:alpha:]" "\n"| sort -s | uniq | sort -nr | head -n 10)
    fi
      for word in $ARRAY;do
          array_of_most_common_word+=("$word")
      done
      #En çok geçen 10 kelimelin arama kutusunda seçenek olarak sunulması
      value=$(zenity --entry --title "Arama Penceresi" --height="150" --width="400" --entry-text "${array_of_most_common_word[@]}" \
        --text "Aramak yapmak istediğiniz kelimeyi yazınız")
      #seçeneğin geçtiği tüm satırların görüntülenmesi
      if [[ $password == "false" ]];then
        cat  $FILE | grep -a $value | zenity --text-info --height="500" --width="900"
      else
        echo $password | sudo -S cat $FILE | grep -a $value | zenity --text-info --height="500" --width="900"
      fi

      if [[ "$?" == 0 ]];then
        break
      fi
  fi
done

#Sıkıştırılmış dosya seçildi ise, çıkarılan dosyanın klasörden silinmesi
if [[ $file_of_decompression != "false" ]];then
   if [[ $password == "false" ]];then
      rm $file_of_decompression
   else
      echo $password | sudo -S rm $file_of_decompression
   fi
fi



