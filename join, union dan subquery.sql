--1. gabungkan data transaksi dari user_id 1 dan user id 2
select * from transaksi where id_pelanggan =1
union
select * from transaksi where id_pelanggan =2 order by id_pelanggan;


--2. tampilkan jumlah harga transaksi user_id 1
select paid_amount from transaksi where id_pelanggan = 1;

--3. tampilkan total transaksi dengan produk_type_id=2
tampilkan total transaksi dengan produk_type_id = 2
SELECT sum(transaksi.paid_amount) total_transaksi_type_id_2
FROM detail_transaksi
join transaksi on detail_transaksi.id_transaksi = transaksi.id_transaksi
join produk on produk.id=detail_transaksi.id_produk
join produk_type on produk_type.id = produk.produk_type_id where produk_type.id = 2;

--4. tampilkan semua field tabel produk dan field nama tabel produk type yang saling berhubungan
select p.id "id_produk", p.nama "nama_produk", p.stok, p.harga, p.produk_type_id, p.produk_desc_id, p.merk_id, pt.nama "nama_type" from produk p 
join 
produk_type pt on pt.id = p.produk_type_id;

--5. tampilkan semua field tabel transaksi, fiel nama tabel produk, dan field nama tabel user
select t.id_transaksi, t.tanggal "tanggal_transaksi", t.paid_amount, t.status, t.id_payment_method, t.id_pelanggan, pl.nama "nama_pelanggan", p.nama "nama_produk" from transaksi t
join pelanggan pl on t.id_pelanggan = pl.id
join  detail_transaksi dt on dt.id_transaksi = t.id_transaksi
join produk p on p.id = dt.id_produk

--6. tampilkan nama produk yang tidak pernah ada di transaksi detail

select p.id, p.nama from transaksi t
join pelanggan pl on t.id_pelanggan = pl.id
join  detail_transaksi dt on dt.id_transaksi = t.id_transaksi
join produk p on p.id = dt.id_produk order by p.id

select id, nama from produk where id >3 and id <>5 order by id
