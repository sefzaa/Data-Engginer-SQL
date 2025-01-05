/* Membuat Tabel :
    -Cabang
    -Penlanggan
    -Produk
    -Penjualan
    -Detail Penjualan
*/

--Tabel Cabang
CREATE TABLE CABANG (
	kode_cabang varchar (11) PRIMARY KEY,
	nama_cabang varchar (33),
	alamat varchar (55)	
	);

--Tabel Pelanggan
CREATE TABLE PELANGGAN (
	kode_pelanggan varchar (11) PRIMARY KEY,
	nama_pelanggan varchar (33),
	alamat varchar (55),
	kode_cabang varchar (11),
	FOREIGN KEY (kode_cabang) REFERENCES CABANG(kode_cabang)
	);

--Tabel Produk
CREATE TABLE PRODUK (
	kode_produk varchar (11) PRIMARY KEY,
	nama_produk varchar (33),
	harga int	
	);

--Tabel Penjualan Detail
CREATE TABLE PENJUALAN_DETAIL (
	kode_transaksi varchar (11) PRIMARY KEY,
	qyt int,
	harga_satuan int,
	kode_produk varchar (11),
	FOREIGN KEY (kode_produk) REFERENCES PRODUK(kode_produk)
	);

--Tabel Penjualan
CREATE TABLE PENJUALAN (
	kode_transaksi varchar (11),
	kode_pelanggan varchar (11),
	tanngal_transaksi date,
	kode_cabang varchar (11),
	kode_produk varchar (11),
	harga int,
	FOREIGN KEY (kode_transaksi) REFERENCES PENJUALAN_DETAIL(kode_transaksi),
	FOREIGN KEY (kode_pelanggan) REFERENCES PELANGGAN(kode_pelanggan)
	);

--Insert Tabel Cabang
insert into cabang values
('jkt-001', 'Jakarta Utara','Jl. Sumpah Pemuda, No 45'),
('jkt-002', 'Jakarta Pusat','Jl. Ahmad Yani, No 5'),
('bdg-001', 'Bandung Timur','Jl. Proklamasi, No 9'),
('bdg-002', 'Bandung Barat','Jl. Soedirman, No 78')
;

--Insert Tabel Pelanggan
insert into pelanggan values
('cust0001', 'Eva Novianti, S.H.', 'Vila Sempilan, No. 67', 'jkt-001'),
('cust0002', 'Heidi Goh', 'Ruko Sawit Permai 72 No. 1', 'jkt-002'),
('cust0003', 'Unang Handoko', 'Vila Sempilan No. 1', 'jkt-001'),
('cust0004', 'Jokolono Sukarman', 'Permata Intan Berkilau Residence, Blok C5-7', 'jkt-001'),
('cust0005', 'Tommy Sinaga', 'Avatar Village, Blok C8 No. 888', 'bdg-001'),
('cust0006', 'Irwan Setianto ', 'Rukan Gunung Seribu, Blok O1 - No. 1', 'bdg-001'),
('cust0007', 'Agus Cahyono', ' Jalan Motivasi Tinggi, Blok F4 - No. 8 ', 'jkt-001'),
('cust0008', 'Maria Sirait', 'Cluster Akasia Residence, Blok AA No. 3 ', 'jkt-001'),
('cust0009', 'Ir. Ita Nugraha', 'Perumahan Sagitarius, Gang Kelapa No. 6', 'jkt-002'),
('cust0010', 'Djoko Wardoyo, Drs.', 'Bukit Pintar Data, Blok A1 No. 1 ', 'bdg-001')
;

--Insert Tabel Produk
insert into produk values
('prod-001', 'Kotak Pensil DQLab', '60500'),
('prod-002', 'Flashdisk DQLab 64 GB', '55000'),
('prod-003', 'Gift Voucher DQLab 100rb', '100000'),
('prod-004', 'Flashdisk DQLab 32 GB', '40000'),
('prod-005', 'Gift Voucher DQLab 250rb', '250000'),
('prod-006', 'Pulpen Multifunction + Laser DQLab', '92500'),
('prod-007', 'Tas Travel Organizer DQLab', '48000'),
('prod-008', 'Gantungan Kunci DQLab', '15800'),
('prod-009', 'Buku Planner Agenda DQLab', '92000'),
('prod-010', 'Sticky Notes DQLab 500 sheets', '55000')
;

--Insert Tabel Penjualan Detail
insert into penjualan_detail values
('tr-0001', '3', '40000', 'prod-004'),
('tr-0002', '2', '15800', 'prod-008'),
('tr-0003', '1', '55000', 'prod-010'),
('tr-0004', '1', '92000', 'prod-009'),
('tr-0005', '1', '92500', 'prod-006'),
('tr-0006', '2', '15800', 'prod-008'),
('tr-0007', '2', '15800', 'prod-008'),
('tr-0008', '1', '50000', 'prod-007'),
('tr-0009', '2', '62500', 'prod-001'),
('tr-0010', '3', '48000', 'prod-004')
;

--Insert Tabel Penjualan
insert into penjualan values
('tr-0001', 'cust0007', '2019-06-07', 'jkt-001', 'prod-001', '62000'), 
('tr-0001', 'cust0007', '2019-06-07', 'jkt-001', 'prod-003', '95000'),
('tr-0001', 'cust0007', '2019-06-07', 'jkt-001', 'prod-009', '93800'),
('tr-0001', 'cust0007', '2019-06-07', 'jkt-001', 'prod-004', '40000'),
('tr-0002', 'cust0001', '2019-06-07', 'jkt-001', 'prod-003', '95000'),
('tr-0002', 'cust0001', '2019-06-07', 'jkt-001', 'prod-010', '55000'),
('tr-0002', 'cust0001', '2019-06-07', 'jkt-001', 'prod-007', '48000'),
('tr-0003', 'cust0004', '2019-06-08', 'jkt-001', 'prod-002', '55000'),
('tr-0004', 'cust0004', '2019-06-08', 'jkt-001', 'prod-010', '55000'),
('tr-0002', 'cust0004', '2019-06-08', 'jkt-001', 'prod-004', '40000'),
('tr-0005', 'cust0003', '2019-06-09', 'jkt-001', 'prod-009', '92000'),
('tr-0005', 'cust0003', '2019-06-09', 'jkt-001', 'prod-001', '62500'),
('tr-0005', 'cust0003', '2019-06-09', 'jkt-001', 'prod-004', '41000'),
('tr-0006', 'cust0008', '2019-06-09', 'jkt-001', 'prod-005', '250000'),
('tr-0006', 'cust0008', '2019-06-09', 'jkt-001', 'prod-008', '15800')
;

--tampilkan daftar produk yang memiliki harga antara 50.000 and 150.000
SELECT 
    * 
FROM 
    produk 
WHERE 
    harga >= 50000 and harga <= 150000
    ;

--Tampilkan semua produk yang mengandung kata Flashdisk.
SELECT 
    * 
FROM 
    produk
WHERE 
    nama_produk LIKE '%Flashdisk%'
    ;

--Tampilkan hanya nama pelanggan yang memiliki gelar S.H, Ir. dan Drs.
SELECT 
    kode_pelanggan, nama_pelanggan, alamat
from 
    pelanggan
WHERE 
    nama_pelanggan LIKE '%S.H%'
    OR nama_pelanggan LIKE '%Ir.%'
    OR nama_pelanggan LIKE '%Drs.%'
    ;

--Tampilkan urutan nama pelanggan dari yang terkecil ke yang terbesar (A ke Z).
SELECT 
    nama_pelanggan 
FROM 
    pelanggan 
ORDER BY 
    nama_pelanggan ASC
    ;

/*Tampilkan urutan nama pelanggan dari yang terkecil ke yang terbesar (A ke Z).
Namun gelar tidak boleh menjadi bagian dari urutan*/
SELECT 
    nama_pelanggan
FROM 
    pelanggan
ORDER BY 
    TRIM(REGEXP_REPLACE(nama_pelanggan, '^(Drs\.|Ir\.|S\.H\.,?\s*)', '')) ASC;

--Tampilkan nama pelanggan yang memiliki nama paling panjang
SELECT
    nama_pelanggan
FROM
    pelanggan
WHERE
    LENGTH(nama_pelanggan) = (
        SELECT
            MAX(LENGTH(nama_pelanggan))
        FROM
            pelanggan
    );

/*Tampilkan nama yang memiliki nama paling panjang (pada row atas), 
dan nama orang paling pendek (pada row setelahnya).
Gelar menjadi bagian dari nama. */
SELECT
    nama_pelanggan
FROM
    pelanggan
WHERE
    LENGTH(nama_pelanggan) IN (
        (
            SELECT
                MAX(LENGTH(nama_pelanggan))
            FROM
                pelanggan
        ),
        (
            SELECT
                MIN(LENGTH(nama_pelanggan))
            FROM
                pelanggan
        )
    )
ORDER BY
    LENGTH(nama_pelanggan) DESC
    ;

--Tampilkan produk yang paling banyak terjual dari segi kuantitas
SELECT
    produk.kode_produk,
    produk.nama_produk,
    SUM(penjualan_detail.qyt) AS total_qty
FROM
    produk
    INNER JOIN penjualan_detail ON produk.kode_produk = penjualan_detail.kode_produk
GROUP BY
    produk.kode_produk,
    produk.nama_produk
HAVING
    SUM(penjualan_detail.qyt) > 2
    ;

--Pelanggan yang paling banyak menghabiskan uangnya untuk belanja
SELECT
    penjualan.kode_pelanggan,
    pelanggan.nama_pelanggan,
    SUM(
        penjualan_detail.qyt * penjualan_detail.harga_satuan
    ) AS total_harga
FROM
    pelanggan
    INNER JOIN penjualan USING (kode_pelanggan)
    INNER JOIN penjualan_detail USING (kode_transaksi)
GROUP BY
    penjualan.kode_pelanggan,
    pelanggan.nama_pelanggan
ORDER BY
    total_harga DESC
LIMIT
    1
    ;

--Tampilkan daftar pelanggan yang belum pernah melakukan transaksi.
SELECT
    kode_pelanggan,
    nama_pelanggan,
    alamat
FROM
    pelanggan
WHERE
    kode_pelanggan NOT IN (
        SELECT
            kode_pelanggan
        FROM
            penjualan
    )
    ;

--Tampilkan transaksi yang memiliki jumlah item produk lebih dari 1 jenis produk
SELECT
    pj.kode_transaksi,
    pj.kode_pelanggan,
    pl.nama_pelanggan,
    pj.tanngal_transaksi,
    COUNT(pd.qyt) AS jumlah_detail
FROM
    penjualan pj
    INNER JOIN pelanggan pl ON pj.kode_pelanggan  = pl.kode_pelanggan
    INNER JOIN penjualan_detail pd ON pj.kode_transaksi = pd.kode_transaksi
GROUP BY
    pj.kode_transaksi,
    pj.kode_pelanggan,
    pl.nama_pelanggan,
    pj.tanngal_transaksi
HAVING
    COUNT(pd.qyt) > 1
    ;









