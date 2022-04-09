-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Nov 2021 pada 17.07
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssip_project`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `complaint`
--

CREATE TABLE `complaint` (
  `id_complaint` int(5) NOT NULL,
  `date_complaint` date NOT NULL,
  `nim` varchar(12) NOT NULL,
  `contents` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` enum('0','process','resolved','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `complaint`
--

INSERT INTO `complaint` (`id_complaint`, `date_complaint`, `nim`, `contents`, `photo`, `status`) VALUES
(1, '2021-09-19', '001202000061', 'Test test lorem ipsum dolor sit amet', '130220204341itiak.png', 'resolved'),
(2, '2021-09-19', '001202000015', 'tes test ...', '190920212909UI Login.jpg', 'resolved');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(12) NOT NULL,
  `name` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `name`, `username`, `password`, `telp`) VALUES
('001202000069', 'Celine Tam', 'celinetam', '1714810dc6be7f550778d7c9b91a230d', '081255668787'),
('001202000115', 'Xander Graham', 'grahamxan', 'd9a8c6c010a37fdc9850fe6d8c064880', '085364287180'),
('001202000789', 'Celine Aleena', 'celaleena', 'e31e5efc335056c3ab2fe9c630614ac2', '089614669587'),
('002202100872', 'Jane Doe', 'doejane', 'a8c0d2a9d332574951a8e4a0af7d516f', '089645786321'),
('137601231001', 'John Doe', 'mahasiswa', '5787be38ee03a9ae5360f54d9026465f', '081264287180');

-- --------------------------------------------------------

--
-- Struktur dari tabel `officer`
--

CREATE TABLE `officer` (
  `id_officer` int(5) NOT NULL,
  `name_officer` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('admin','officer','mahasiswa','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `officer`
--

INSERT INTO `officer` (`id_officer`, `name_officer`, `username`, `password`, `telp`, `level`) VALUES
(1, 'Annisa Nurdiana', 'admin_', 'a1debe4d85ce0ffd022b9f4066c8d8ec', '081215951492', 'admin'),
(2, 'Jane Lee', 'petugas_', '4b1afe707570f18f621054895e2bb605', '081215951492', 'officer'),
(5, 'Rara Takamura', 'takamurara', '06532f2e8578f1a2e98006815926abea', '081298984545', 'mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `response`
--

CREATE TABLE `response` (
  `id_response` int(5) NOT NULL,
  `id_complaint` int(11) NOT NULL,
  `date_response` date NOT NULL,
  `response` text NOT NULL,
  `id_officer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `response`
--

INSERT INTO `response` (`id_response`, `id_complaint`, `date_response`, `response`, `id_officer`) VALUES
(1, 1, '2021-09-19', 'Answer it lorem ipsum dolor sit amet', 2),
(2, 2, '2021-09-19', 'good', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id_complaint`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`id_officer`);

--
-- Indeks untuk tabel `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id_response`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id_complaint` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `officer`
--
ALTER TABLE `officer`
  MODIFY `id_officer` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `response`
--
ALTER TABLE `response`
  MODIFY `id_response` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
