# Bono Metronic
Bono Metronic adalah sebuah kerangka kerja untuk bahasa pemrograman PHP yang hadir dengan terintergrasi  Premium Bootstrap Template Admin, yakni Metronic versi 7. Dikembangkan oleh Xinix Technology dengan tujuan mempercepat proses pembuatan maupun pengembangan aplikasi berbasis web.

## # Mengapa Harus Bono ?
---
Beberapa alasan mengapa anda harus menggunakan bono:
- Tampilan yang dinamis dan fungsi bantuan untuk menggunakan API.
- Menggunakan standar template untuk kebutuhan SCRUD (Search, Create, Read, Update, dan Delete).
- Membangun aplikasi web jauh lebih cepat dengan built-in schema.

## # System Requirement
---
Adapun kebutuhan-kebutuhan yang harus dipenuhi untuk dapat menggunakan Bono Metronic  dengan optimal antara lain:
- PHP versi 7.3
- MySQL
- Composer

## # Instalasi
---
Untuk instalasi **Bono Metronic**, buka terminal dan jalankan perintah berikut ini pada terminal:
```shell
$ git clone git@gitlab.com:sagara-xinix/projects/bono-metronic-v7.git bono-metronic
$ cd my-app
$ rm -rf .git
$ composer install
```

## # Konfigurasi Awal untuk Database
---
Adapun konfigurasi yang harus dilakukan setelah mengikuti langkah instalasi:
1. Buat sebuah database di phpMyAdmin
2. import file ```bono.sql``` yang ada di folder ```docs/db```
3. buka file ```config.php``` yang berada pada direktori ```config```
4. Sesuaikan bagian berikut dengan kredensial phpMyAdmin anda
```php
<?php
//some codes
'bono.providers' => array(
        'Norm\\Provider\\NormProvider' => array(
            'datasources' => array(
                'mysql' => array(
                    'driver'   => '\\Norm\\Connection\\PDOConnection',
                    'dialect'  => '\\Norm\\Dialect\\MySQLDialect',
                    'prefix'   => 'mysql',
                    'dbname'   => 'nama_database',
                    'host'     => 'localhost',
                    'username' => 'root',
                    'password' => 'password'
                )
            ),
// some codes
?>
```
## # Menjalankan Bono Metronic
---
Untuk menjalankan aplikasi Bono Metronic, cukup akses ```localhost/bono-metronic/www``` pada browser anda. Jika berhasil, maka anda akan menjumpai halaman login. Bono Metronic sudah memiliki user yang terdaftar dan bisa digunakan untuk kebutuhan development. Untuk kredensial login, bisa menggunakan
```
username : admin
password : password
```
## # Aturan Pembuatan Table Bono Metronic
---
Dalam pembuatan table dalam database, ada beberapa field yang wajib dibuat yang nantinya akan diisi secara otomatis oleh Bono Metronic, adapun field yang wajib dibuat pada setiap table antara lain sebagai berikut:

| Nama Field    | Tipe Data  | Deskripsi                                               |
| :---          |   :----:   |:---                                                     |
| status        | INT        | menampung status dari data                              |
| _created_by   | VARCHAR    | Menyimpan ID user yang membuat data                     |
| _updated_by   | VARCHAR    | Menyimpan ID user yang merubah/mengupdate data          |
| _created_time | DATETIME   | Menyimpan informasi tanggal & waktu saat data dibuat    |
| _updated_time | DATETIME   | Menyimpan informasi tanggal & waktu saat data dirubah   |

## # Collections
---
Collections merepresentasikan ***table (entity)*** pada database, sementara di dalam collections mengembalikan array yang berisi schema. File Collections terletak pada direktori ```config/collections```. 

### **# Membuat Collections** 
Seperti yang dijelaskan sebelumnya. Collections merupakan representasi dari table. Misal pada database, anda memiliki table "product" dan anda ingin membuat collections untuk itu, caranya adalah sebagai berikut:
1. Buka direktori ```config/collections```
2. Buat file baru dengan nama ```Product.php```
3. Isi file tersebut seperti dibawah ini:

```php
<?php

return array(
    'schema' => array(
        // input schema here
    ),
);

?>
```

### **# Mendaftarkan Collections Pada Config**
Semua collections yang sudah dibuat harus didaftarkan terlebih dahulu pada file ```config.php``` yang berada pada direktori ```/config``` agar dapat diakses alamat URI nya. Caranya adalah dengan menambahkan pada bagian berikut:

```php
<?php
// some codes
'Bono\\Middleware\\ControllerMiddleware' => array(
            'default' => 'App\\Controller\\AppController',
            'mapping' => array(
                '/test' => null,
                '/user' => null,
                '/previleges' => null,
                '/role' => '\\App\Controller\\RoleController',
                '/sysparam' => null,
                '/collection' => null,    
            ),
        ),
//some codes
?>
```
secara default, collections akan menggunakan AppController sebagai Controller default nya. Setelah mendaftarkan Collections nya, kita bisa mengakses alamat `localhost/bono-metronic/www/index.php/collection`

## # Schema
---
Schema erat kaitannya dengan Collections. Schema merepresentasikan field / data yang ada di dalam table pada database (terkecuali status, _created_by, _updated_by, _created_time, dan _updated_time). Bono Metronic V7 sudah menyediakan berbagai macam schema yang siap pakai guna mempercepat proses pengembangan. Schema meng-*generate* field HTML yang digunakan untuk kebutuhan SCRUD (Search, Create, Read, Update, dan Delete) pada collections yang bersangkutan. File komponen schema sendiri terletak pada direktori `src\App\Schema`

Adapun schema yang tersedia pada Bono Metronic V7 Antara lain sebagai berikut:

### **# Thumbnail**
Schema Thumbnail digunakan untuk meng-*handling* input data yang bertipe gambar. Thumbnail menggunakan namespace `App\Schema\Thumbnail`
```php
<?php

use App\Schema\Thumbnail;

return array(
    'schema' => array (
        'photo' => Thumbnail::create('photo','Gambar')->set('list-column', true)->set('bucket','storage'),
    )
)

?>
```
> **Penjelasan** : *'photo' merupakan nama field yang ada di dalam database. sementara 'Gambar' merupakan alias yang digunakan sebagai label yang nantinya akan ditampilkan ke user. 'list-column' di set bernilai true, berarti field tersebut ditampilkan di dalam tabel. Sementara itu 'bucket' dan 'storage' artinya data gambar tersebut akan disimpan di direktori ```www/storage```*

---

### **# NormString**
Schema NormString digunakan untuk meng-*handling* input data yang bertipe string. NormString menggunakan namespace `App\Schema\NormString`
```php
<?php

use App\Schema\NormString;

return array(
    'schema' => array (
        'name'   => NormString::create('name')->set('list-column', true),
    )
)

?>
```
> **Penjelasan** : *'name' merupakan nama field yang ada di dalam database.'list-column' di set bernilai true, berarti field tersebut ditampilkan di dalam tabel*

---

### **# InputMask**
Schema InputMask digunakan untuk meng-*handling* input data yang bertipe integer dan memiliki pola tertentu, seperti nomor NIK ataupun nomor NPWP. InputMask menggunakan namespace `App\Schema\InputMask`
```php
<?php

use App\Schema\InputMask;

return array(
    'schema' => array (
        'ktp' => InputMask::create('ktp')->set('list-column', true)->set_mask('99-9999-99_99.999'),
    )
)

?>
```
> **Penjelasan** : *'ktp' merupakan nama field yang ada di dalam database.'list-column' di set bernilai true, berarti field tersebut ditampilkan di dalam tabel. set_mask dan '99-9999-99_99.999' artinya kita set input integer menjadi pola tersebut*

---

### **# FileUpload**
Schema FileUpload digunakan untuk meng-*handling* input data yang bertipe file (berkas), seperti format .pdf, .docx, .txt dan masih yang lainnya. FileUpload menggunakan namespace `App\Schema\FileUpload`
```php
<?php

use App\Schema\FileUpload;

return array(
    'schema' => array (
        'file' => FileUpload::create('file')->set('list-column', true)->set('bucket','storage1'),
    )
)

?>
```
> **Penjelasan** : *'file' merupakan nama field yang ada di dalam database. 'list-column' di set bernilai true, berarti field tersebut ditampilkan di dalam tabel. Sementara itu 'bucket' dan 'storage1' artinya data gambar tersebut akan disimpan di direktori ```www/storage1```*

---

### **# Reference**
Schema Reference digunakan untuk meng-*handling* input data yang bertipe select dan hanya single option. Reference menggunakan namespace `App\Schema\Reference`
```php
<?php

use App\Schema\Reference;

return array(
    'schema' => array (
        'dropdown' => Reference::create('dropdown')->to(array('a' => 'testing1', 'b' => 'test2')),
    )
)

?>
```
> **Penjelasan** : *'dropdown' merupakan nama field yang ada di dalam database. `to(array('a' => 'testing1','b' => 'test2'))` berarti mengisikan opsi apa saja yang akan tampil ketika tombol dropdown di click. 'a' merupakan key nya dan 'testing1' merupakan value nya*

---

### **# SelectTwoReference**
Schema SelectTwoReference digunakan untuk meng-*handling* input data yang bertipe select dan hanya single option. Perbedaanya dengan Reference adalah schema SelectTwoReference memiliki "inline-search" yang membuat pencarian data dropdown lebih mudah. SelectTwoReference menggunakan namespace `App\Schema\SelectTwoReference`
```php
<?php

use App\Schema\SelectTwoReference;

return array(
    'schema' => array (
        'select' => SelectTwoReference::create('select')->to(array('a' => 'testing1', 'b' => 'test2')),
    )
)

?>
```
> **Penjelasan** : *'select' merupakan nama field yang ada di dalam database. `to(array('a' => 'testing1','b' => 'test2'))` berarti mengisikan opsi apa saja yang akan tampil ketika tombol dropdown di click. 'a' merupakan key nya dan 'testing1' merupakan value nya*

---

### **# MultiReference**
Schema MultiReference digunakan untuk meng-*handling* input data yang bertipe select dan dapat menampung multi option. MultiReference menggunakan namespace `App\Schema\MultiReference`
```php
<?php

use App\Schema\MultiReference;

return array(
    'schema' => array (
        'role' => MultiReference::create('role')->to('Role'),
    )
)

?>
```
> **Penjelasan** : *'role' merupakan nama field yang ada di dalam database. `to('Role')` berarti data select tersebut diambil dari collections / table Role*

---

### **# SearchReference**
Schema SearchReference digunakan untuk meng-*handling* input data yang bertipe select. Kelebihan dari SearchReference adalah Schema SearchReference dapat menampilkan data lebih lengkap dan memiliki "inline search". SearchReference menggunakan namespace `App\Schema\SearchReference`
```php
<?php

use App\Schema\SearchReference;

return array(
    'schema' => array (
        'user' => SearchReference::create('user')->to('User','first_name')->set('field',array('email','first_name')),
    )
)

?>
```
> **Penjelasan** : *'user' merupakan nama field yang ada di dalam database. `to('User','first_name)` berarti data select tersebut diambil dari collections / table User dan yang ditampilkan pada field input adalah data 'first_name' nya. Sementara untuk `set('field',array('email','first_name')` adalah informasi yang nantinya ditampilkan secara detail pada saat tombol search di click, yakni data "email" dan "first_name" dari User*

---

### **# DatePicker**
Schema DatePicker digunakan untuk meng-*handling* input data berupa tanggal. DatePicker menggunakan namespace `App\Schema\DatePicker`
```php
<?php

use App\Schema\DatePicker;

return array(
    'schema' => array (
        'testdate' => DatePicker::create('testdate')->setformatdate('dd-mm-yyyy'),
    )
)

?>
```
> **Penjelasan** : *'testdate' merupakan nama field yang ada di dalam database. `setformatdate('dd-mm-yyyy')` digunakan untuk membuat format tanggal yang akan ditampilkan di simpan. Untuk format data tanggal, bisa menggunakan format `dd-mm-yyyy` atau `dd/mm/yyyy` sesuai kebutuhan*

---

### **# SysparamReference**
Schema SysparamReference digunakan untuk meng-*handling* input data berupa select. SysparamReference digunakan untuk membuat pilihan yang opsinya hanya sedikit tanpa membuat modul baru dan memiliki fitur grouping. Salah satu contoh datanya adalah data Gender. SysparamReference menggunakan namespace `App\Schema\SysparamReference`. Untuk membuat data opsi Sysparam tersendiri, dapat mengunjungi URL ```localhost/bono-metronic/www/index.php/sysparam```
```php
<?php

use App\Schema\DatePicker;

return array(
    'schema' => array (
        'sysparam' => SysparamReference::create('sysparam')->setGroups('gender'),
    )
)

?>
```
> **Penjelasan** : *'sysparam' merupakan nama field yang ada di dalam database. `setGroups('gender')` yakni data Sysparam diambil dan di group berdasarkan data sysParams Gender*

<br>

## # Controller
---
Bono Metronic V7 memiliki sebuah default controller yakni `AppController.php` yang terletak pada direktori `src\App\Controller`. Pengaturan tersebut dapat dilihat pada file `config.php` pada direktori `/config`. Berkas `AppController.php` berisi fungsi-fungsi yang diantaranya sudah mencakup berbagai kebutuhan yang menyangkut operasi SCRUD (Search, Create, Read, Update, dan Delete). Sebenarnya, `AppController.php` sendiri merupakan turunan dari `NormController.php` yang letaknya ada di `vendor/xinix-technology` namun `AppController.php` sudah di modifikasi sesuai kebutuhan.

## # Custom Controller
---
Bono Metronic V7 memberikan keleluasaan untuk membuat custom controller kepada pengguna. Misalkan ingin membuat sebuah controller untuk entity Category, caranya dengan membuat file `CategoryController.php` pada direktori `src/App/Controller`. File `CategoryController.php` ini harus `extends` ke `AppController.` dan untuk menggunakan `CategoryController` alih alih menggunakan controller default, kita bisa mengubahnya pada `config.php` pada bagian berikut ini:

```php
<?php
// some codes
'Bono\\Middleware\\ControllerMiddleware' => array(
    'default' => 'App\\Controller\\AppController',
    'mapping' => array(
        '/test' => null,
        '/user' => null,
        '/previleges' => null,
        '/role' => '\\App\Controller\\RoleController',
        '/sysparam' => null,
        '/category' => '\\App\Controller\\CategoryController',    
    ),
),
//some codes
?>
```

## # NORM
---
Bono Metronic menggunakan NORM yakni sebuah mekanisme untuk merubah data di dalam table database menjadi sebuah object. NORM sendiri memiliki beberapa criteria antara lain find dan findOne yang akan dijelaskan lebih jelas dibawah ini

### **# find()**
find() merupakan criteria dalam Norm Bono Metronic yang dimana berfungsi untuk mengambil semua data yang ada di dalam table. Sintaks dari find() sendiri antara lain sebagai berikut
```php
 $items = \Norm::factory('table_name')->find();
``` 
---
### **# find($id)**
find($id) merupakan criteria dalam Norm Bono Metronic yang dimana berfungsi untuk mengambil satu data berdasarkan ID yang dikirimkan dari parameter. Sintaks dari find($id) sendiri antara lain sebagai berikut
```php
 $items = \Norm::factory('table_name')->find(id);
``` 
---
### **# find(array('field' => criteria))**
find(array('field' => criteria)) merupakan criteria dalam Norm Bono Metronic yang dimana berfungsi untuk mengambil banyak data berdasarkan kriteria field yang dikirimkan dari parameter. Sintaks dari find(array('field' => criteria)) sendiri antara lain sebagai berikut
```php
 $items = \Norm::factory('table_name')->find(array('field' => criteria));
``` 
contoh sederhananya adalah ketika kita ingin mengambil data dalam table employee yang memiliki company_id sama dengan 3, maka sintaks nya akan seperti ini
```php
$employees = \Norm::factory('employee')->find(array('company_id' => 3));
```
---
### **# findOne(array('field' => criteria))**
findOne(array('field' => criteria)) merupakan criteria dalam Norm Bono Metronic yang dimana berfungsi untuk mengambil data pertama yang ditemukan berdasarkan kriteria field yang dikirimkan dari parameter dan hanya mengembalikan satu data yang paling pertama ditemukan. Sintaks dari findOne(array('field' => criteria)) sendiri antara lain sebagai berikut
```php
 $items = \Norm::factory('table_name')->findOne(array('field' => criteria));
``` 
contoh sederhananya adalah ketika kita ingin mengambil data dalam table employee yang memiliki company_id sama dengan 3, maka sintaks nya akan seperti ini
```php
$employees = \Norm::factory('employee')->findOne(array('company_id' => 3));
```
---
untuk melihatnya dalam bentuk array saat men-debug bisa memanfaatkan fungsi built-in PHP yakni `toArray()`
<br><br>
## # Provider
---
Provider merupakan sebuah bagian di Bono Metronic V7 yang berfungsi untuk mengembalikan sebuah data (response) dari database dalam bentuk JSON sehingga nantinya data berformat JSON tersebut dapat dikelola untuk kebutuhan tertentu, salah satunya untuk API.

Provider sendiri berada pada direktori `src\App\Observer` dan secara default, Bono Metronic V7 memiliki 3 (tiga) provider bawaan antara lain:
- AppProvider.php
- LoginProvider.php
- MetronicProvider.php

secara umum, isi dari Provider adalah sebagai berikut:

```php
<?php 
namespace App\Provider;

class AppProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;
    }
}
?>
```
> **Penjelasan :**
>
> - Provider sendiri memiliki namespace yakni App\Provider
> - Provider memiliki satu method wajib, yakni `initialize()` yang isinya merupakan inisialisasi dari app

Method `initialize()` nantinya akan diisi dengan routing untuk mengembalikan data berupa JSON.

### **# Mengisi Method Initialize**
Kita bisa mengisi method initialize dengan routing yang mengembalikan response dalam bentuk JSON. Misalkan ingin **mengambil data dari table product** untuk ditampilkan dalam bentuk JSON, maka kita bisa membuat routing seperti berikut ini:
```php
<?php
    // inside initialize function
    $app->get('/product_api', function () use ($app) {
      $data = Norm::factory('product')->find();
      $app->response->data('product', $data);
  });
?>
```
> **Penjelasan:**
> - Pertama kita definisikan terlebih dahulu HTTP Method nya, kita menggunakan GET dan URI nya adalah `/product_api`
> - Kemudian untuk parameter kedua, kita membuat sebuah anonymous function yang isinya mengambil semua data di table product dengan Norm
> - Lalu kembalikan respon nya

Untuk mengakses URL dari routing yang sudah dibuat, cukup dengan mengakses URL berikut `localhost/bono-metronic/www/index.php/product_api.json`

## #Custom Provider
---
Bono Metronic V7 memberikan keleluasaan kepada pengguna untuk membuat custom provider sendiri. Misal ingin membuat Provider khusus untuk Product, maka caranya adalah dengan membuat `ProductProvider.php` pada direktori `src/App/Provider` kemudian `ProductProvider.php` tersebut di "daftarkan" pada file `config.php`
```php
<?php 
// some code
'Bono\\Provider\\LanguageProvider' => null,
'App\\Provider\\AppProvider'=> null,
'App\\Provider\\ProductProvider'=> null, // register new provider

?>
```
Kemudian `ProductProvider.php` tersebut kita `extends` dengan `AppProvider`. Contoh dari `ProductProvider.php` adalah sebagai berikut:
```php
<?php

namespace App\Provider;

use Norm\Norm;

class ProductProvider extends AppProvider {
    public function initialize()
    {
        $app = $this->app;

        $app->get('/product_api', function () use ($app) {
            $data = Norm::factory('product')->find(); // mengambil seluruh data product
            $app->response->data('product', $data); // kembalikan response JSON dengan nama product dan kirimkan $data
        });
    }
}
?>
```

## # Observer
---
Observer merupakan sebuah fitur dalam Bono Metronic yang akan dijalankan ketika sebuah data akan dimasukkan atau telah dimasukkan ke dalam database. File Observer sendiri terletak di direktori `src/App/Observer`. Ada beberapa method yang umumnya dipakai dalam sebuah observer, yakni:
- Saving    = Dijalankan sebelum data dimasukkan ke dalam database untuk Create dan Update
- Saved     = Dijalankan ketika data tersebut telah berhasil masuk ke dalam database baik Create dan Update
- Searching = Dijalankan untuk memodifikasi filter ($criteria)
- Searched = Dijalankan untuk memodifikasi data yang telah di dapatkan

## # Custom Observer
---
Untuk membuat Custom Observer, cukup dengan membuat file observer baru di direktori `src/App/Observer`. Misal ingin membuat sebuah Observer untuk collections Product, maka nama file nya adalah `ProductObserver.php` dengan namespace `App\Observer`. Untuk menggunakannya di dalam collections yang bersangkutan, bisa dengan dideklarasikan seperti ini
```php
<?php
return array(
    'observers' => array(
        'App\\Observer\\ProductObserver' => null, // declare observer here
    ),
    'schema' => array(
        // some schema
    ),
);
```

## # Middleware
---
Middleware merupakan sebuah fitur pada Bono Metronic yang memiliki mekanisme untuk mem-filter atau mengawasi berbagai macam aktivitas atau request ke dalam aplikasi. Direktori Middleware pada Bono Metronic terletak di `src\App\Middleware`. Middleware akan memerika semua proses setelah baris `$this->next->call()` dari bawah hingga atas. Secara default, Bono Metronic membawa dua Middleware bawaan yang terdapat pada direktori tersebut yakni `AuditTrailMiddleware` dan `MetronicNotification`. Berikut Merupakan penjelasan singkat mengenai dua Middleware tersebut:

### **# AudiTrailMiddleware**
```php
<?php

namespace App\Middleware;

use \Norm\Norm;

class AuditTrailMiddleware extends \Slim\Middleware {

    public function call(){
        $request = $this->app->request;
        $user = array();
        if(!empty($_SESSION['user'])){
            $user = $_SESSION['user'];
        }
        
        
        $data = $this->app->request->getBody();

        $this->next->call();
        
        if (!empty($_REQUEST['password'])) {
            unset($data['password']);
        }

        $trail = array(
            'user' => !empty($user['$id']) ? $user['$id']:'',
            'uri' => $request->getPath(),
            'method' => $request->getMethod(),
            'data' => (!empty($data)) ? json_encode($data) : '',
            'ip_address' => $request->getIp(),
            'user_agent' => $request->getUserAgent(),
        );

        $model = Norm::factory('AuditTrail')->newInstance();
        $model->set($trail);
        $model->save();
        
    }
?>
```
> **Penjelasan** : *Secara garis besar, AuditTrailMiddleware berfungsi sebagai logging atau mengaudit semua aktivitas user pada saat masuk (mengirim request) ke dalam suatu halaman. Data tersebut diambil mulai dari ID User, URI dari halaman yang diakses, Method yang digunakan, data, IP Address bahkan User Agen (Browser) yang digunakan. Kemudian data tersebut di masukkan ke dalam tabel audit_trail di dalam database. Middleware ini meng `extends` Middleware milik Slim yang dimana kita harus meng-override function call*

### **# MetronicNotification**
```php
class MetronicNotificationMiddleware extends NotificationMiddleware
{
    public function show($options = null)
    {

        unset($_SESSION['notification']);

        if (is_null($options)) {
            return $this->show(array('level' => 'error')) . "\n" . $this->show(array('level' => 'info'));
        }

        $messages = $this->query($options);

        if (!empty($messages)) {
            $result = '<div class="alert '.$options['level'].'" role="alert">';

            foreach ($messages as $message) {
                $result .= '<span>'.$message['message'].'</span> ';
            }

            $result .= '</div>';

            return $result;
        }

    }
  
}
```
> **Penjelasan** : *Secara garis besar, NotificationMiddleware bertanggung jawab atas notifikasi yang muncul ketika pengguna memasukkan data baik yang sukses maupun yang tidak. . Middleware ini meng `extends` NotificationMiddleware dan dimana NotificationMiddleware juga meng `extends` milik Slim. Disini kita meng-override function show miliki NotificationMiddleware*

## # Custom Middleware
---
Untuk membuat Custom Middleware, kita cukup membuat file baru pada direktori `src/App/Middleware` dengan nama misalkan `TestMiddleware.php` yang memiliki namespace `App\Middleware` untuk kemudian membuat sebuah class yang meng-`extends` ke `\Slim\Middleware` dan wajib meng-override function `call()`.
```php
<?php

namespace App\Middleware;

class TestMiddleware extends \Slim\Middleware {

    public function call() {
        // code here
    }

}
```
Setelah membuat file Custom Middleware, file tersebut harus didaftar pada file `config.php` sepert ini:
```php
'App\\Middleware\\MetronicNotificationMiddleware' => null,
'App\\Middleware\\AuditTrailMiddleware' => null,
'App\\Middleware\\TestMiddleware' => null, // register new middleware
```

## # Filter
---
Filter merupakan mekanisme di Bono Metronic dimana berfungsi untuk memfilter atau memvalidasi sebuah HTTP Request yang masuk atau lebih sederhananya sebuah data yang nantinya akan dimasukkan ke dalam database. 

### **# Macam-Macam Filter**
Adapun filter yang sering digunakan dalam Bono Metronic antara lain sebagai berikut

| Nama Filter        | Deskripsi                                               |
| :---               | :---                                                     |
| required           | membuat sebuah data wajib untuk diisi dan tidak boleh kosong |
| trim               | menghilangkan karakter berupa whitespace |
| unique:Table,field | Membuat sebuah data menjadi unik pada tabel dan field tertentu |
| confirmed          | Biasa digunakan untuk password, memastikan bahwa data yang diinput match |
| salt               | Mengubah sebuah data menjadi bentuk terenkripsi |

### **# Tata Cara Penggunaan Filter**
Filter erat kaitannya dengan Collections yang dimana pada collections berisi deklarasi schema data apa saja yang akan masuk ke dalam database. Untuk penggunaan filter sendiri adalah dengan cara di "chaining" dan setiap filter dipisahkan dengan character pipe "|" seperti berikut ini:
```php
'username' => NormString::create('username')->filter('trim|required|unique:User,username')->set('list-column', true),
```

## # Register Custom Filter
---
Selain filter yang disebutkan di atas, Bono Metronic juga dapat membuat Filter secara Custom. Untuk membuat dan Me-Register Custom Filter baru cukup dengan mendaftarkannya pada `AppProvider.php` tepatnya di dalam function `initialize()` . Contoh sederhana dalam Register Custom Filter adalah sebagai berikut:
```php
<?php

namespace App\Provider;

use \Norm\Filter\Filter;
use Norm\Filter\FilterException;

class AppProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;

        Filter::register('custom_filter', function ($key, $value, $model) {
            $search = array('name' => $model['name'], 'slug' => $model['slug']);

            $check = \Norm::factory($model->getClass())->findOne($search);

            if ($check) {
                throw new FilterException("data'" . $key . "'sudah ada");
            }
            return $value;
        });
    }
```
Untuk menggunakan `custom_filter` yang baru saja kita buat, cukup perlakukan seperti filter lain pada umumnya di collections seperti ini:
```php
'username' => NormString::create('username')->filter('trim|required|custom_filter|unique:User,username')->set('list-column', true),
```