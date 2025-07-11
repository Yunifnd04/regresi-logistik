# Memuat Packages
library(caTools)
library(caret)
library(readr)
library(tidyverse)

Daming <- read.csv("D:/Kuliah/Semester 5/Data Mining/Book1.csv", header = TRUE, sep = ";", stringsAsFactors = FALSE)
head(Daming)

# Menampilkan Data dan Informasi
print(Daming)       # Menampilkan seluruh dataset
dim(Daming)         # Menampilkan dimensi dataset (jumlah baris dan kolom)
colnames(Daming)    # Menampilkan nama kolom
str(Daming)         # Menampilkan struktur dataset
glimpse(Daming)     # Menampilkan ringkasan struktur dataset dengan tibble format

# Menggunakan data Datatrain dan Datatest
Datatrain <- Daming[1:18000, ]
Datatest <- Daming[18001:20000, ]

# Membuat model glm dengan menggunakan Datatrain
modelreglog1 <- glm(Y ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 + X9 + X10 + X11 + X12 + X13 + X14 + X15 + X16 + X17, data = Datatrain, family = "binomial")
summary(modelreglog1)

modelreglog2 <- glm(Y ~ X1 + X2 + X3 + X4 + X6 + X7 + X8 + X10 + X11 + X12 + X13 + X14 + X15 + X16, data = Datatrain, family = "binomial")
summary(modelreglog2)

# Membuat vektor dengan yang berisi nilai-nilai AIC dari kedua model
Model <- c("Model 1", "Model 2")
AIC <- c(modelreglog1$aic, modelreglog2$aic)
kriteria <- data.frame(Model, AIC) # Menggabungkan kedua vektor ke dalam sebuah data frame
kriteria

# Membuat prediksi dan tabel confusion matrix untuk data latih
pred1 <- ifelse(modelreglog2$fitted.values > 0.5, "1", "0")
pred1 <- c(pred1, "0")  # Menambahkan satu nilai prediksi lagi ke vektor pred1

# Menampilkan prediksi dan tabel dari data latih
pred1
table(pred1)
table(Datatrain$Y)

# Membuat tabel confusion matrix untuk data latih
tab1 <- table(Predicted = pred1, Actual = Datatrain$Y)
tab1

# Menghitung akurasi dari tabel confusion matrix data latih
akurasi <- sum(diag(tab1)) / sum(tab1)
akurasi

# Membuat data frame dari hasil prediksi dan data aktual untuk data latih
HasilprediksiTraining <- data.frame(Predicted = pred1, Actual = Datatrain$Y)
HasilprediksiTraining

# Membuat confusion matrix menggunakan caret untuk data uji
prob.predik <- predict(modelreglog2, newdata = Datatest, type = "response")
pred2 <- ifelse(prob.predik > 0.5, "1", "0")

# Menampilkan prediksi dan tabel dari data uji
pred2
table(pred2)
table(Datatest$Y)

# Membuat tabel confusion matrix untuk data uji
tab2 <- table(Predicted = pred2, Actual = Datatest$Y)
tab2

# Membuat data frame dari hasil prediksi dan data aktual untuk data uji
HasilprediksiTesting <- data.frame(Predicted = pred2, Actual = Datatest$Y)
HasilprediksiTesting

# Membuat confusion matrix menggunakan caret untuk data uji
confusionMatrix(factor(pred1), factor(Datatrain$Y))


