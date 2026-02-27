# Katkı Rehberi

Projeye katkı vermek istediğiniz için teşekkürler. Lütfen aşağıdaki adımları takip edin.

## Nasıl Katkı Sağlarım?
1. Depoyu fork'layın.
2. Yeni bir branch oluşturun:
   ```bash
   git checkout -b feature/aciklayici-bir-isim
   ```
3. Değişikliklerinizi küçük ve odaklı tutun.
4. Betik doğrulamasını çalıştırın:
   ```bash
   bash -n zerotier-kurulum.sh
   ```
5. Commit mesajınızı açık yazın ve Pull Request açın.

## Kod Standartları
- Değişken/sınıf/fonksiyon isimleri İngilizce kalmalıdır.
- Yorumlar ve açıklamalar Türkçe olmalıdır.
- Güvenlik açısından hardcoded gizli bilgi (şifre, token, API key) eklemeyin.

## Hata Bildirimi
Issue açarken şunları ekleyin:
- İşletim sistemi ve sürümü
- Çalıştırılan komut
- Alınan hata çıktısı
- Beklenen davranış
