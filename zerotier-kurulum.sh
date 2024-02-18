#!/bin/bash

# Yüklü değilse curl'ü yükleyin
if ! command -v curl &> /dev/null; then
  echo "curl yüklenecek..."
  sudo apt-get install curl
fi

# ZeroTier One GPG anahtarını ekleyin
echo "ZeroTier One GPG anahtarı ekleniyor..."
curl https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/zerotierone-archive-keyring.gpg >/dev/null

# Debian sürümünü alın
RELEASE=$(lsb_release -cs)

# ZeroTier One kaynak listesini ekleyin
echo "ZeroTier One kaynak listesi ekleniyor..."
echo "deb [signed-by=/usr/share/keyrings/zerotierone-archive-keyring.gpg] http://download.zerotier.com/debian/$RELEASE $RELEASE main" | sudo tee /etc/apt/sources.list.d/zerotier.list

# Paketleri güncelleyin ve ZeroTier One'ı kurun
echo "Paketler güncelleniyor ve ZeroTier One kuruluyor..."
sudo apt update
sudo apt install -y zerotier-one

# Kullanıcıdan ağ kimliği alın
echo -n "Katılmak istediğiniz ZeroTier ağının kimliğini girin: "
read network_id

# ZeroTier ağına katılın
echo "ZeroTier ağına katılınıyor..."
sudo zerotier-cli join "$network_id"

echo "ZeroTier One kurulumu ve ağa katılım tamamlandı!"
