# Prediksi Status Pembayaran Nasabah Kartu Kredit Menggunakan Regresi Logistik

## ✅Data:
Data terdiri dari 18.000 nasabah dengan informasi status pembayaran lengkap dan 2.000 nasabah yang ingin diprediksi status pembayarannya.

Data terdiri dari beberapa variabel, diantaranya:
🔸Id = No Urut Nasabah
🔸X1= Batas Penggunaan Nominal Kartu kredit
🔸X2= Jenis Kelamin
🔸X3= Pendidikan
🔸X4= Status Pernikahan
🔸X5= Usia
🔸X6 – X11= Jumlah Tagihan Bulan ke 1-6
🔸X12 – X17= Pembayaran Tagihan ke 1-6
🔸Y= Status Nasabah (1= Menunggak, 0= Tidak)

## ✅Melakukan Prediksi

1.	Packages yang wajib di Install
-	Library (caTools)
-	Library (caret)
-	Library (readr)
-	Library (tidyverse)
  
2.	Mengimpor data
3.	Menampilkan Data dan Informasi
4.	Memisahkan data dan Mencari model terbaik
5.	Prediksi Data Latih
   # Tampilan Sebagian Data prediksi, data latih:
  	
   ![Data Prediksi Sebagian](/Data%20Pred1.png)


7.	Prediksi Data Uji
   # Tampilan Sebagian Data Prediksi, data uji:
   ![Data Prediksi Sebagian](/Data%20Pred%20Datauji.png)

   # Hasil confusion matrix menggunakan caret untuk data uji
   ![Data Prediksi Sebagian](/Conf%20Matrix.png)

  ## ❗Berdasarkan hasil analisis regresi logistik:

1. Model memiliki akurasi sebesar 70,59%, menunjukkan performa yang cukup baik secara keseluruhan.
2. Model sangat sensitif dalam mengidentifikasi nasabah yang tidak menunggak (kelas 0), dengan sensitivitas 0,9433.
3. Namun, spesifisitas rendah (0,2379) menunjukkan model kesulitan mengidentifikasi nasabah yang menunggak (kelas 1), menghasilkan banyak false negative.
4. F1 Score sekitar 0,35 (menggunakan rumus F1 = 2 × (precision × recall) / (precision + recall)), mengindikasikan bahwa keseimbangan antara presisi dan recall dalam mendeteksi nasabah menunggak masih rendah. Ini menunjukkan bahwa model mengalami kesulitan dalam mengklasifikasikan kedua kelas dengan baik, terutama pada kelas yang minoritas (menunggak).






   
   
    

