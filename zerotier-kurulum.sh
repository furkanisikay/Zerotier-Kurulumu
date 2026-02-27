#!/bin/bash
set -euo pipefail

# Gerekli paketler yüklü değilse yükleyin
if ! command -v curl &> /dev/null || ! command -v gpg &> /dev/null || ! command -v lsb_release &> /dev/null; then
  echo "Gerekli paketler yükleniyor (curl, gnupg, lsb-release)..."
  sudo apt-get update
  sudo apt-get install -y curl gnupg lsb-release
fi

# ZeroTier One GPG anahtarını ekleyin
echo "ZeroTier One GPG anahtarı ekleniyor..."
curl -fsSL https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/zerotierone-archive-keyring.gpg >/dev/null

# Debian sürümünü alın
RELEASE=$(lsb_release -cs)

# ZeroTier One kaynak listesini ekleyin
echo "ZeroTier One kaynak listesi ekleniyor..."
echo "deb [signed-by=/usr/share/keyrings/zerotierone-archive-keyring.gpg] https://download.zerotier.com/debian/$RELEASE $RELEASE main" | sudo tee /etc/apt/sources.list.d/zerotier.list

# Paketleri güncelleyin ve ZeroTier One'ı kurun
echo "Paketler güncelleniyor ve ZeroTier One kuruluyor..."
sudo apt update
sudo apt install -y zerotier-one

# Kullanıcıdan ağ kimliği alın
echo -n "Katılmak istediğiniz ZeroTier ağının kimliğini girin: "
read -r network_id

# Ağ kimliği biçimini doğrulayın (16 karakter hex)
if [[ ! "$network_id" =~ ^[0-9a-fA-F]{16}$ ]]; then
  echo "Hata: Ağ kimliği 16 karakter uzunluğunda hexadecimal olmalıdır."
  exit 1
fi

# ZeroTier ağına katılın
echo "ZeroTier ağına katılınıyor..."
sudo zerotier-cli join "$network_id"

echo "ZeroTier One kurulumu ve ağa katılım tamamlandı!"
