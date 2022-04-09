-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 04 Nov 2021 pada 09.31
-- Versi server: 10.5.12-MariaDB
-- Versi PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id17880731__2021projectquiz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal`
--

CREATE TABLE `soal` (
  `sid` int(20) NOT NULL,
  `isi` text COLLATE utf8_unicode_ci NOT NULL,
  `pil` text COLLATE utf8_unicode_ci NOT NULL,
  `jb` int(11) NOT NULL,
  `kt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wk` int(11) NOT NULL,
  `ss` double NOT NULL,
  `lv` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `st` enum('0','process','resolved','') COLLATE utf8_unicode_ci NOT NULL,
  `ket` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `soal`
--

INSERT INTO `soal` (`sid`, `isi`, `pil`, `jb`, `kt`, `wk`, `ss`, `lv`, `ts`, `st`, `ket`) VALUES
(1, 'isi', 'pilihan-pilihan', 1, 'science', 20, 5, 5, '2021-11-04 06:48:54', '', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `tid` int(11) NOT NULL,
  `uid_user` int(11) NOT NULL,
  `sid_soal` int(11) NOT NULL,
  `js` text COLLATE utf8_unicode_ci NOT NULL,
  `wj` time NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `st` enum('0','process','resolved','') COLLATE utf8_unicode_ci NOT NULL,
  `ket` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `uid` int(20) NOT NULL,
  `uname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tuser` enum('0','1','2','') COLLATE utf8_unicode_ci NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `st` enum('0','process','resolved','') COLLATE utf8_unicode_ci NOT NULL,
  `ket` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`uid`, `uname`, `email`, `tuser`, `ts`, `st`, `ket`) VALUES
(1, 'reinald', 'reinald@email.com', '0', '2021-11-04 05:41:00', '', ''),
(8, 'someone', 'someone@email.com', '0', '2021-11-04 06:42:04', '0', '-');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`sid`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`tid`) USING BTREE,
  ADD KEY `fk_transaksi_user` (`uid_user`),
  ADD KEY `fk_transaksi_soal` (`sid_soal`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `UNIQUE` (`uname`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `soal`
--
ALTER TABLE `soal`
  MODIFY `sid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_soal` FOREIGN KEY (`sid_soal`) REFERENCES `soal` (`sid`),
  ADD CONSTRAINT `fk_transaksi_user` FOREIGN KEY (`uid_user`) REFERENCES `user` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
