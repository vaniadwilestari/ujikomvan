-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 11 Mar 2023 pada 03.42
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mylaundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `total_harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_paket`, `qty`, `total_harga`, `keterangan`, `total_bayar`) VALUES
(16, 36, 20, 20, 44000, '', 500000),
(17, 37, 20, 50, 110000, '', 200000),
(18, 39, 21, 15, 21000, '', 25000),
(19, 40, 20, 10, 22000, '', 300000),
(20, 41, 20, 10, 22000, '', 50000),
(21, 42, 23, 3, 7500, '', 10000),
(22, 43, 20, 4, 8800, '', 10000),
(23, 44, 21, 5, 7000, '', 10000),
(24, 45, 21, 5, 7000, '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `alamat_outlet` text CHARACTER SET utf8mb4,
  `telp_outlet` varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telp_outlet`) VALUES
(9, 'Outlet Merah', 'Yogyakarta, Indonesia', '08555555555'),
(10, 'Outlet Putih', 'Bantul, Yogyakarta, Indonesia', '081222222222'),
(11, 'Outlet Biru', 'Bantul, Daerah Istimewa Yogyakarta', '081223446312'),
(12, 'Outlet Abu-abu', 'Bantul, Yogyakarta', '0826377453886');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_cuci`
--

CREATE TABLE `paket_cuci` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bedcover','kaos','lain') NOT NULL,
  `nama_paket` varchar(228) NOT NULL,
  `harga` int(11) NOT NULL,
  `outlet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `paket_cuci`
--

INSERT INTO `paket_cuci` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`, `outlet_id`) VALUES
(20, 'kiloan', 'Paket Wangi Tahan Lama', 2200, 9),
(21, 'kaos', 'Paket Cepat Kering', 1400, 10),
(22, 'selimut', 'Paket Harum', 1500, 11),
(23, 'kiloan', 'Paket Kering Wangi', 2500, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(228) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp_pelanggan` varchar(15) NOT NULL,
  `no_ktp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `jenis_kelamin`, `telp_pelanggan`, `no_ktp`) VALUES
(23, 'Dzikri', 'Padalarang', 'L', '08743698643', '847589175897654'),
(24, 'Lestari', ' Yogyakarta', 'P', '083874823792', '745879751659812'),
(25, 'Zikkkk', 'Bandung', 'L', '081767478587', '75487515789454'),
(26, 'Vania', 'Kotabaru', 'P', '08987856752', '643659126521554');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `kode_invoice` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') CHARACTER SET utf8mb4 DEFAULT NULL,
  `status_bayar` enum('dibayar','belum') CHARACTER SET utf8mb4 DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `outlet_id`, `kode_invoice`, `id_pelanggan`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `status_bayar`, `id_user`) VALUES
(36, 9, 'CLN202009033737', 23, '2020-09-03 04:37:43', '2020-09-10 12:00:00', '2020-09-03 04:40:03', 0, 0, 0, 'selesai', 'dibayar', NULL),
(37, 9, 'CLN202009035702', 23, '2020-09-03 05:03:37', '2020-09-10 12:00:00', '2020-09-03 05:08:28', 0, 0, 0, 'diambil', 'dibayar', NULL),
(39, 10, 'CLN202009034317', 24, '2020-09-03 05:19:12', '2020-09-10 12:00:00', '2020-09-03 05:21:41', 0, 0, 0, 'baru', 'dibayar', NULL),
(40, 9, 'CLN202009040521', 24, '2020-09-04 03:21:09', '2020-09-11 12:00:00', '2023-03-11 12:38:24', 0, 0, 0, 'selesai', 'dibayar', NULL),
(41, 9, 'CLN202009040528', 25, '2020-09-04 03:28:21', '2020-09-11 12:00:00', '2020-09-04 03:29:00', 0, 0, 0, 'proses', 'dibayar', NULL),
(42, 9, 'CLN202303111139', 26, '2023-03-11 12:39:24', '2023-03-18 12:00:00', '2023-03-11 12:40:17', 4000, 23, 0, 'diambil', 'dibayar', NULL),
(43, 9, 'CLN202303115313', 23, '2023-03-11 01:14:06', '2023-03-18 12:00:00', '2023-03-11 01:14:56', 5000, 12, 0, 'baru', 'dibayar', NULL),
(44, 10, 'CLN202303115609', 26, '2023-03-11 03:10:01', '2023-03-18 12:00:00', '2023-03-11 03:15:12', 0, 0, 0, 'baru', 'dibayar', 8),
(45, 10, 'CLN202303110617', 26, '2023-03-11 03:17:13', '2023-03-18 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `username` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `role` enum('admin','kasir','owner') CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `outlet_id`, `role`) VALUES
(3, 'owner', 'owner', 'd41d8cd98f00b204e9800998ecf8427e', 10, 'owner'),
(6, 'Kasir Merah', 'kasirmerah', 'cdd9b843e296b9ff6745d122f19809d4', 9, 'kasir'),
(8, 'vania', 'vania', '081c2ce8528c443cc4be69d4096c9778', 10, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `paket_cuci`
--
ALTER TABLE `paket_cuci`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `paket_cuci`
--
ALTER TABLE `paket_cuci`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_4` FOREIGN KEY (`id_paket`) REFERENCES `paket_cuci` (`id_paket`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `paket_cuci`
--
ALTER TABLE `paket_cuci`
  ADD CONSTRAINT `paket_cuci_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paket_cuci_ibfk_2` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_5` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_6` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
