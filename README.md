**API_MOBILE**
API : https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd

**Crypto Tracker**
Mempunyai fitur search menginput data ke textfield.**onChanged** dipanggil setiap kali mengetik fungsi ini mengubah nilai variabel **searchQuery** menjadi teks.Teks tersebut akan di saring menggunakan **cryptos.where** dan memcocokan berdasarkan nama yang dicari.
Menggunakan sorting untuk menata koin dengan market tinggi ke market kecil dengan **filteredCryptos.sort()**,**a['current_price'].compareTo(b['current_price'])** digunakan untuk membandingkan harga koin dan mengurutkannya.





Sebelum sorting dan search






![bandicam 2024-12-23 14-13-59-107](https://github.com/user-attachments/assets/be6eda17-25e3-44f9-ab41-90fa7c2acf7c)







Sesudah sorting dan search








![bandicam 2024-12-23 14-14-31-675](https://github.com/user-attachments/assets/7674f3c9-d091-460c-8590-cef049218d62)

