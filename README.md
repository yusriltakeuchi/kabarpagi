# Kabar Pagi

[![Fork](https://img.shields.io/github/forks/yusriltakeuchi/kabarpagi?style=social)](https://github.com/yusriltakeuchi/kabarpagi/fork)&nbsp; [![Star](https://img.shields.io/github/stars/yusriltakeuchi/kabarpagi?style=social)](https://github.com/yusriltakeuchi/kabarpagi/star)&nbsp; [![Watches](https://img.shields.io/github/watchers/yusriltakeuchi/kabarpagi?style=social)](https://github.com/yusriltakeuchi/kabarpagi/)&nbsp;


Kabar Pagi adalah sebuah aplikasi media penyiaran berita sederhana yang bersumber pada newsapi.org, bertujuan untuk menampilkan kumpulan berita dari berbagai macam media yang ada di dunia, fokusnya terutama Indonesia. Dibuat menggunakan Framework Flutter dan state management Riverpod.

### Apps Feature:

- List Berita Terbaru
- Headline Berita
- Pencarian Berita
- Berita Berdasarkan Sumber
- Fitur Dark & Light Mode
 

### SDK Version
1. Flutter SDK v3.3.7 with null safety support
 
### How to install 
1. git clone https://github.com/yusriltakeuchi/kabarpagi.git
2. flutter packages get
3. flutter run

### Place Your APIKEY
Pergi ke https://newsapi.org, daftarkan akunmu dan generate APIKEY di sana.
Pasang APIKEY kamu pada file **lib/core/config/config.dart**
```dart
/// Insert your api key here
const String apiKey = "APIKEY HERE";
```

### How to add new assets?
Install flutter_gen jika belum memilikinya:
```dart
- dart pub global activate flutter_gen
- chmod +x asset.sh
```

Kemudian jalankan perintah ini setiap kali menambah asset baru ke folder assets: (MacOS / Linux Only)
```dart
- ./asset.sh
```

### How to generate new freezed class?
Jalankan perintah berikut: (MacOS / Linux Only)
```dart
- ./buildrunner.sh
```