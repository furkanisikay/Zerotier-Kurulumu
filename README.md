# ZeroTier Kurulumu (Debian/Ubuntu)

![Bash](https://img.shields.io/badge/Shell-Bash-121011?logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Platform-Debian%2FUbuntu-E95420?logo=ubuntu&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## Neden Bu Proje?
Bu proje, Debian tabanlı sistemlerde ZeroTier One kurulumunu ve belirli bir ağa katılım adımlarını tek bir güvenli bash betiğiyle otomatikleştirir; böylece elle yapılan kurulumlarda görülen zaman kaybını, yapılandırma hatalarını ve tekrarlı komut girişlerini azaltarak özellikle hızlı ortam hazırlığı gereken ekipler için güvenilir bir başlangıç sağlar.

## Mimari / Özellikler
- ZeroTier resmi GPG anahtarını sisteme ekler.
- Dağıtım kod adını (`lsb_release -cs`) algılayarak doğru depo kaynağını tanımlar.
- `apt` ile ZeroTier One paketini otomatik kurar.
- Kullanıcıdan ağ kimliği alır ve `zerotier-cli join` ile ağa bağlanır.
- Ağ kimliği için temel biçim doğrulaması yapar (16 karakter hexadecimal).
- Betik başında `set -euo pipefail` ile hataya dayanıklılığı artırır.

## Hızlı Başlangıç
Aşağıdaki komutları kopyala-yapıştır yaparak kurulumu başlatabilirsiniz:

```bash
git clone https://github.com/furkanisikay/Zerotier-Kurulumu.git
cd Zerotier-Kurulumu
chmod +x zerotier-kurulum.sh
./zerotier-kurulum.sh
```

## Ortam Kurulumu
- Desteklenen sistem: Debian/Ubuntu tabanlı Linux dağıtımları.
- Gerekli yetki: `sudo` erişimi.
- Gerekli ağ: İnternet bağlantısı.
- Betik, eksikse şu paketleri otomatik yükler: `curl`, `gnupg`, `lsb-release`.

## Katkıda Bulunma
Katkı süreci için [CONTRIBUTING.md](CONTRIBUTING.md) dosyasına bakın.

## Lisans
Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.
