# Bono Metronic V7

Bono Archetype dengan tampilan **Metronic** versi 7

## Instalasi

Jalankan perintah berikut:
```
$ git@gitlab.com:sagara-xinix/projects/bono-metronic-v7.git my-app
$ cd my-app
$ rm -rf .git
$ composer install
```

## Konfigurasi
### Light Theme
Untuk menggunakan light theme, ganti konfigurasi pada ```config.php```
```
'bono.theme' => array(
    ...
    'dark' => true
),
```
Menjadi
```
'bono.theme' => array(
    ...
    'dark' => false
),
```
