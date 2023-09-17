-- Database: alta_online_shop
-- DROP DATABASE IF EXISTS alta_online_shop;
CREATE DATABASE alta_online_shop
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Indonesia.1252'
    LC_CTYPE = 'English_Indonesia.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
--a.	Create table pelanggan
create table pelanggan (
	id_pelanggan serial,
	nama text,
	alamat text,
	tanggal_lahir timestamp,
	status_user text,
	gender text,
	created_at timestamp,
	updated_at timestamp,
	primary key(id_pelanggan)
);
--b.	Create table product, product_type, product_description, payment_method
--1.	Membuat table produk_type
--membuat table product_type
create table produk_type (
	id serial,
	nama_produk text,
	stok int,
	primary key (id)
);
--2.	Membuat table produk_deskripsi
--membuat table produk deskripsi
create table produk_deskripsi (
	id serial,
	deskripsi text,
	spesifikasi text,
	primary key (id)
);


--3.	Membuat table payment_method
--membuat tabel payment_method
create table payment_method (
	id serial,
	nama text,
	primary key(id)
);
--4.	Membuat table product
--membuat table product
create table produk(
	id_produk serial,
	nama text,
	stok int,
	harga int,
	produk_type_id int,
	produk_desc_id int,
	merk_id int,
	primary key(id_produk),
	foreign key(produk_type_id) references produk_type(id),
	foreign key(produk_desc_id) references produk_deskripsi(id),
	foreign key(merk_id) references merk(id)
);
--c.	create table transaksi, transaksi detail
--1.	membuat table transaksi
create table transaksi(
	id_transaksi serial,
	tanggal timestamp,
	paid_amount int,
	status text,
	id_pelanggan int,
	id_payment_method int,
	primary key(id_transaksi),
	foreign key(id_pelanggan) references pelanggan(id),
	foreign key(id_payment_method) references payment_method(id)
);
--2.	membuat table transaksi detail
--membuat tabel transaksi detail
create table detail_transaksi(
	id serial,
	id_produk int,
	id_transaksi int,
	quantity int,
	harga int,
	subtotal int,
	foreign key(id_produk) references produk(id_produk),
	foreign key(id_transaksi) references transaksi(id_transaksi)
);

--3.	create table kurir dengan kolom field_id, name, created_at, updated_at
--membuat table kurir
create table kurir(
	field_id serial,
	name text,
	created_at timestamp,
	updated_at timestamp
);
--4.	tambahkan ongkos dasar kolom di table kurir
--menambahkan kolom ongkos_dasar ditabel kurir
alter table kurir add column ongkos_dasar int;
--5.	rename table kurir menjadi shipping
--mengubah nama table kurir menjadi shipping
alter table kurir rename to shipping;
--6.	hapus table shipping karna ternyata tidak diperlukan
--menghapus tabel shipping
drop table shipping;
