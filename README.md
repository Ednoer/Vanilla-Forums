<h1 align="center"><img src="https://vanillaforums.com/images/logos/logo.png"></h1>

[Sekilas Tentang](#sekilas-tentang) | [Instalasi](#instalasi) | [Konfigurasi](#konfigurasi) | [Otomatisasi](#otomatisasi) | [Cara Pemakaian](#cara-pemakaian) | [Pembahasan](#pembahasan) | [Referensi](#referensi)
:---:|:---:|:---:|:---:|:---:|:---:|:---:



# Sekilas Tentang
[`^ kembali ke atas ^`](#)

**Vanilla forum** adalah solusi forum komunitas *open source*, fleksibel, dan dapat digunakan untuk mendukung diskusi di ribuan situs. perangkat lunak yang memberi kemampuan untuk membuat forum online yang menarik dan interaktif untuk pelanggan dan klien potensial. Setiap orang dapat menggunakan Vanilla Forum untuk membuat komunitas dalam hitungan menit agar tetap terhubung dengan sekelompok orang.

 

## Instalasi
[`^ kembali ke atas ^`](#)

### Prasyarat
Ubuntu Server with Apache2, MariaDB and PHP 7.2 support.

### Langkah instalasi dalam CLI.
1. Install Apache2 HTTP Server on Ubuntu
    - install Apache2 HTTP pada Ubuntu server
    ```
    $ sudo apt update
    $ sudo apt install apache2
    ```

    - Command untuk menjalankan dan menghentikan Apache2 service
    ```
    $ sudo systemctl stop apache2.service
    $ sudo systemctl start apache2.service
    $ sudo systemctl enable apache2.service
    ```

    - Jalankan http://localhost

2. Install MariaDB Database Server
    - install MariaDB pada Ubuntu Server
    ```
    $ sudo apt-get install mariadb-server mariadb-client
    ```

    - Jalankan perintah ini pada Ubuntu 18
    ```
    $ sudo systemctl stop mysql.service
    $ sudo systemctl start mysql.service
    $ sudo systemctl enable mysql.service
    ```

    - Jalankan perintah ini pada Ubuntu 18
    ```
    $ sudo systemctl stop mariadb.service
    $ sudo systemctl start mariadb.service
    $ sudo systemctl enable mariadb.service
    ```

    - Install mysql
    ```
    $ sudo mysql_secure_installation
    ```

    - isi daftar berikut
    ```
    $ Enter current password for root (enter for none): Just press the Enter
    $ Set root password? [Y/n]: Y
    $ New password: Enter password
    $ Re-enter new password: Repeat password
    $ Remove anonymous users? [Y/n]: Y
    $ Disallow root login remotely? [Y/n]: Y
    $ Remove test database and access to it? [Y/n]:  Y
    $ Reload privilege tables now? [Y/n]:  Y
    ```

    - lakukan tes untuk cek MariaDB telah terinstall
    ```
    $ sudo mysql -u root -p
    ```

3. Install PHP 7.2 and Related Modules
    - add third party repository to upgrade to PHP 7.2
    ```
    $ sudo apt-get install software-properties-common
    $ sudo add-apt-repository ppa:ondrej/php
    ```

    - update and upgrade to PHP 7.2
    ```
    $ sudo apt update
    ```

    - install PHP 7.2
    ```
    $ sudo apt install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-gmp php7.2-curl php7.2-intl php7.2-mbstring php7.2-xmlrpc php7.2-mysql php7.2-gd php7.2-xml php7.2-cli php7.2-zip
    ```

    - buka file config dari php
    ```
    $ sudo nano /etc/php/7.2/apache2/php.ini
    ```

    - lakukan perubahan agar sesuai dengan teks berikut
    ```
    $ file_uploads = On
    $ allow_url_fopen = On
    $ short_open_tag = On
    $ memory_limit = 256M
    $ upload_max_filesize = 100M
    $ max_execution_time = 360
    $ date.timezone = America/Chicago
    ```

4. Restart Apache2
    ```
    $ sudo systemctl restart apache2.service
    ```

5. Create Vanilla Forums Database
    - logon to MariaDB database server
    ```
    $ sudo mysql -u root -p
    ```

    - buat database
    ```
    $ CREATE DATABASE vanilla;
    ```

    - buat database user
    ```
    $ CREATE USER 'vanillauser'@'localhost' IDENTIFIED BY 'new_password_here';
    ```

    - buat grant user access
    ```
    $ GRANT ALL ON vanilla.* TO 'vanillauser'@'localhost' IDENTIFIED BY 'user_password_here' WITH GRANT OPTION;
    ```

    - simpan dan keluar
    ```
    $ FLUSH PRIVILEGES;
    $ EXIT;
    ```

6. Download Vanilla Forums Latest Release
    - Install git and Composer packages
    ```
    $ sudo apt install curl git
    $ curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
    ```

    - Download Vanilla Forums packages from Github
    ```
    $ cd /var/www/html
    $ sudo git clone --branch release/2.7 https://github.com/vanilla/vanilla.git
    $ cd /var/www/html/vanilla
    $ sudo composer install
    ```

    - Edit permission untuk Vanilla Forums
    ```
    $ sudo chown -R www-data:www-data /var/www/html/vanilla/
    $ sudo chmod -R 755 /var/www/html/vanilla/
    ```

7. Configure Apache2
    - buat file config untuk vanilla forums
    ```
    $ sudo nano /etc/apache2/sites-available/vanilla.conf
    ```

    - isikan dengan teks berikut
    ```
    $ <VirtualHost *:80>
        ServerAdmin admin@example.com
        DocumentRoot /var/www/html/vanilla
        ServerName example.com
        ServerAlias www.example.com

        <Directory /var/www/html/vanilla/>
            Options +FollowSymlinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

    </VirtualHost>
    ```

8. Enable the Vanilla Forums and Rewrite Module
    ```
    $ sudo a2ensite vanilla.conf
    $ sudo a2enmod rewrite
    ```

9. Restart Apache2
    ```
    $ sudo systemctl restart apache2.service
    ```

10. Buka http://locahost:8888/vanilla


## Konfigurasi
[`^ kembali ke atas ^`](#)


![Install](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/install.png)

Sesuaikan dengan saat instalasi database host adalah localhost, database name adalah vanilla, database user adalah vanilla user, dan use .htaccess.

## Otomatisasi
[`^ kembali ke atas ^`](#)

Untuk melakukan otomatisasi dalam melakukan install Vanilla Forums di Ubuntu Server, maka silahkan download script yang telah disediakan dalam github ini.


## Cara Pemakaian
[`^ kembali ke atas ^`](#)

### Tampilan aplikasi web

- Fungsi-fungsi utama

1. Dashboard

![Dashboard](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/dashboard.png)


2. New Discussion

![New Discussion](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/new_discussion.png)

3. Recent Activity

![Recent Activity](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/recent_activity.png)

4. Recent discussion

![Recent Discussion](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/recent_discussion.png)

5. Moderation Queue

![Moderation Queue](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/moderation_queue.png)

6. Branding

![Branding](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/branding.png)

7. Help

![Help](https://github.com/rezaerbe/KomdatVanillaForums/blob/master/screenshoot/help.png)


## Pembahasan
[`^ kembali ke atas ^`](#)

### Pendapat anda tentang aplikasi web ini
   - kelebihan
        - Anda dapat memperoleh barang-barang yang unik, yang mungkin tidak ada di pasaran.
        - Harga barang di forum jual beli biasanya sesuai dengan harga pasar dan bahkan lebih murah. Ini dikarenakan sang penjual bebas dari biaya sewa toko.
        - Anda bisa tawar-menawar tanpa harus bertatap muka dengan pihak penjual. Anda bisa mengirimkan emoticon yang membentuk keakraban diantara Anda dan penjual.
        - Anda bisa menimbang atau membandingkan antara satu barang dengan barang yang lainnya tanpa harus membuat si pemilik toko kesal. Tidak seperti di pasar tradisional karena anda harus masuk dan bertemu penjaga toko terlebih dahulu.
        - Memberikan Anda kemudahan dalam menemukannya walaupun banyak pilihan karena jangkauannya yang luas.
   - kekurangan
        - Ada kemungkinan HOAX, atau penipuan karena Anda tentunya tidak bisa memeriksa langsung apakah barang benar adanya.
        - Tidak ada jaminan garansi dari perusahaan apabila barang tersebut adalah barang second.
        - Pihak penjual ataupun perusahaan bisa saja ternyata adalah fiktif di Internet.
        - Forum jual beli masih bersifat coba-coba karena hukuman e-commerce belum menyentuh wilayah ekonomi sejati.
        - Biasanya forum jual beli masih dipandang sebagai pasar barang-barang second.

### Bandingkan dengan aplikasi web lain yang sejenis

#### Vanilla Forums
Untuk perusahaan yang ingin menyesuaikan forumnya agar terlihat seperti situs Anda, Vanilla Forum adalah pilihan yang tepat untuk Anda. Kustomisasi dan otomatisasi data melalui API dengan sistem lain sangat mungkin dan mereka berfungsi dengan baik sebagai penyedia hosting, mengurusi semua upgrade, perilisan dan pemeliharaan serta threat management dengan baik. aplikasi ini memerlukan proses setup yang cukup lama walaupun merupakan aplikasi kecil tetapi kenyataannya mereka memiliki komunitas open source, kemampuan untuk mencari bantuan dan informasi dapat mempermudah bagi kebanyakan orang.

#### Slack
Slack bagus digunakan dalam tim, di mana komunikasi cepat dan kasual. Aplikasi ini cocok digunakan dalam startup maupun tim kecil pada seluruh lapisan dalam organisasi tetapi pada organisasi yang lebih besar dengan struktur yang formal, aplikasi ini mungkin hanya akan digunakan pada lapisan-lapisan bawah dalam organisasi tersebut.


## Referensi
[`^ kembali ke atas ^`](#)

1.  [Instalation](https://websiteforstudents.com/install-vanilla-forums-on-ubuntu-18-04-16-04-18-10-with-apache2-mariadb-and-php-7-2-support/) - WebSiteForStudent
2.  [About Vanilla Forums](https://vanillaforums.com/en/software/) - Vanilla Forums
3.  [Compare Products](https://www.trustradius.com/compare-products/slack-vs-vanilla-forums) - Trust Radius