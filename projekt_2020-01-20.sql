-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Sty 2020, 20:13
-- Wersja serwera: 10.1.38-MariaDB
-- Wersja PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projekt`
--
DROP DATABASE IF EXISTS `projekt`;
CREATE DATABASE IF NOT EXISTS `projekt` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `projekt`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID` int(11) NOT NULL,
  `Imie` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Adres_email` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Numer_telefonu` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `Adres` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Kod_pocztowy` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `Miasto` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Login` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Haslo` varchar(60) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`ID`, `Imie`, `Nazwisko`, `Adres_email`, `Numer_telefonu`, `Adres`, `Kod_pocztowy`, `Miasto`, `Login`, `Haslo`) VALUES
(56, 'Majkel', 'Ochniowski', 'majkel@ochniow.pl', '123456789', 'ul. Kimiego Raikkonena 44/88', '44-880', 'Nowy Koszalin', NULL, NULL),
(72, 'Projekt', 'Projektowy', 'projekt@projektowy.pl', '123456766', 'ul. Projektowa 1', '11-342', 'Projektowo', 'projekt', '$2a$10$hLcMSD71gZ8DwiyhuzYHxepip83sTUpKeRRg9j0UHzi.XDsVHI3VC');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarze`
--

CREATE TABLE `komentarze` (
  `ID` int(11) NOT NULL,
  `Produkt_ID` int(11) NOT NULL,
  `Login` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Tresc` varchar(300) COLLATE utf8_polish_ci NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `komentarze`
--

INSERT INTO `komentarze` (`ID`, `Produkt_ID`, `Login`, `Tresc`, `Data`) VALUES
(1, 4, 'Kask', 'Super bidon!', '2020-01-14 18:35:27'),
(2, 32, 'projekt', 'XD', '2020-01-14 18:36:19'),
(3, 32, 'projekt', 'XDD', '2020-01-14 18:48:53'),
(4, 32, 'Kask', 'Siema', '2020-01-14 19:32:09'),
(5, 32, 'projekt', ':O', '2020-01-14 19:32:42');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontakt`
--

CREATE TABLE `kontakt` (
  `ID` int(11) NOT NULL,
  `Imie` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Nazwisko` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Adres_email` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Login` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Opis` varchar(500) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kontakt`
--

INSERT INTO `kontakt` (`ID`, `Imie`, `Nazwisko`, `Adres_email`, `Login`, `Opis`) VALUES
(1, 'Mikhaił', 'Oghonoiwski', 'mikhail.o@minimajk.com', 'null', 'Oddajcie piniondze!');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lista`
--

CREATE TABLE `lista` (
  `ID` int(11) NOT NULL,
  `Klient` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Produkt_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `lista`
--

INSERT INTO `lista` (`ID`, `Klient`, `Produkt_ID`) VALUES
(25, 'projekt', 28),
(29, 'projekt', 32),
(30, 'projekt', 34);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `ID` int(11) NOT NULL,
  `Produkt_ID` int(11) NOT NULL,
  `Klient_ID` int(11) NOT NULL,
  `Ocena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`ID`, `Produkt_ID`, `Klient_ID`, `Ocena`) VALUES
(3, 34, 56, 1),
(5, 3, 56, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `Opis` varchar(400) COLLATE utf8_polish_ci NOT NULL,
  `Kategoria` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Cena` decimal(7,2) NOT NULL,
  `Ilosc_sztuk` int(11) NOT NULL,
  `Zdjęcie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Kolor` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`ID`, `Nazwa`, `Opis`, `Kategoria`, `Cena`, `Ilosc_sztuk`, `Zdjęcie`, `Kolor`) VALUES
(3, 'Długopis ZGSPORT.PL', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci.', 'Biurowe', '6.00', 43, 'img/products/dlugopis.jpg', 'zielony'),
(4, 'Brelok z miarką ZGSPORT.PL', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci.', 'Ozdoby', '75.00', 50, 'img/products/brelok.jpg', 'bialy'),
(5, 'Koszulka czerwona', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '39.99', 35, 'img/products/koszulka_czerwona.jpg', 'czerwony'),
(6, 'Bidon szary', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dignissim risus eget odio iaculis, in accumsan magna fermentum. Suspendisse nec dignissim risus. Etiam eget tempor ante. Proin egestas non ex vitae eleifend. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam porta odio velit, ut ultricies nisi mattis vitae. Praesent cursus commodo elit. ', 'Akcesoria', '24.99', 31, 'img/products/bidon_szary.jpg', 'szary'),
(7, 'Plecak', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex nisi, iaculis a aliquam eget, lobortis vitae lorem. Aenean aliquam diam eget leo pharetra, at scelerisque sapien aliquam. Praesent vel sapien mauris. Curabitur eu augue eu dui varius malesuada eget sed ipsum. Sed venenatis lorem libero, vitae rhoncus eros varius quis. Aenean ut ullamcorper nulla. Nulla nec ipsum ex. Fusce eu massa.', 'Akcesoria', '69.95', 10, 'img/products/plecak.jpg', 'czarny'),
(8, 'Kubek niebieski', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend fringilla augue rhoncus laoreet. Donec feugiat risus id rhoncus porta. Suspendisse potenti. Fusce sem risus, eleifend vel egestas eu, aliquet ac nibh. Morbi euismod purus et vehicula pulvinar. Fusce elit tellus, dictum in dapibus.', 'Akcesoria', '17.99', 0, 'img/products/kubek_niebieski.jpg', 'niebieski'),
(9, 'Koszulka zielona', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '39.99', 4, 'img/products/koszulka_zielona.jpg', 'zielony'),
(10, 'Worek gimnastyczny szary', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet accumsan justo, nec posuere tortor. Ut id libero eu augue consectetur viverra. Sed at sem ac sapien aliquet tincidunt. Aenean sed fermentum justo. Aliquam id sem ut quam euismod pellentesque. Morbi eu accumsan nulla. Quisque sagittis suscipit nulla eget facilisis. Integer sollicitudin lobortis imperdiet. Nunc malesuada.', 'Akcesoria', '29.99', 19, 'img/products/worek_gimnastyczny_szary.jpg', 'szary'),
(11, 'Torba materiałowa czarna', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis iaculis nisl. Vivamus pharetra augue vel erat aliquet, nec elementum nunc ornare. Suspendisse velit nisi, laoreet in magna ut, consequat semper libero. Duis egestas aliquam molestie. Phasellus efficitur ex.', 'Akcesoria', '6.99', 59, 'img/products/torba_materiałowa_czarna.jpg', 'czarny'),
(12, 'Koszulka granatowa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '39.99', 0, 'img/products/koszulka_granatowa.jpg', 'niebieski'),
(13, 'Etui Samsung Galaxy S9', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum felis at massa condimentum, ut pellentesque metus elementum. Curabitur venenatis lacus et elit dignissim, eget dapibus magna consectetur. Vivamus id augue faucibus, placerat metus eget, iaculis leo. Sed sem nunc, tristique id bibendum non, rhoncus sed erat. In purus nunc, aliquam a sapien sit amet, accumsan maximus lorem. ', 'Akcesoria', '19.99', 9, 'img/products/etui_samsung_galaxy_s9.jpg', 'bialy'),
(14, 'Koszulka szara', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '34.99', 45, 'img/products/koszulka_szara.jpg', 'szary'),
(15, 'Torba na ramię czarna', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempor dui nec tortor auctor tincidunt. Suspendisse fermentum blandit diam, eu fermentum lorem. Ut finibus mollis facilisis. Quisque at finibus augue. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc suscipit velit metus, id dapibus dui eleifend in. Vivamus ultricies volutpat.', 'Akcesoria', '119.99', 12, 'img/products/torba_na_ramię_czarna.jpg', 'czarny'),
(16, 'Torba materiałowa bordowa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis iaculis nisl. Vivamus pharetra augue vel erat aliquet, nec elementum nunc ornare. Suspendisse velit nisi, laoreet in magna ut, consequat semper libero. Duis egestas aliquam molestie. Phasellus efficitur ex.', 'Akcesoria', '6.99', 27, 'img/products/torba_materiałowa_bordowa.jpg', 'czerwony'),
(17, 'Kufel do piwa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis id blandit lacus. Sed quis nibh aliquam, luctus ligula fringilla, vulputate enim. In eleifend nulla nunc, sit amet aliquam tortor.', 'Akcesoria', '22.99', 2, 'img/products/kufel_do_piwa.jpg', 'bialy'),
(18, 'Worek gimnastyczny niebieski', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet accumsan justo, nec posuere tortor. Ut id libero eu augue consectetur viverra. Sed at sem ac sapien aliquet tincidunt. Aenean sed fermentum justo. Aliquam id sem ut quam euismod pellentesque. Morbi eu accumsan nulla. Quisque sagittis suscipit nulla eget facilisis. Integer sollicitudin lobortis imperdiet. Nunc malesuada.', 'Akcesoria', '29.99', 26, 'img/products/worek_gimnastyczny_niebieski.jpg', 'niebieski'),
(19, 'Czapka czarna', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tempus nisl sit amet dui faucibus, congue ornare mauris efficitur. Pellentesque nec hendrerit sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet lorem venenatis, porttitor nibh eu, ultrices risus. Nam sollicitudin.', 'Ubior', '24.99', 15, 'img/products/czapka_czarna.jpg', 'czarny'),
(20, 'Koszulka żółta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '44.99', 7, 'img/products/koszulka_żółta.jpg', 'zolty'),
(21, 'Etui iPhone 4/4S', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum felis at massa condimentum, ut pellentesque metus elementum. Curabitur venenatis lacus et elit dignissim, eget dapibus magna consectetur. Vivamus id augue faucibus, placerat metus eget, iaculis leo. Sed sem nunc, tristique id bibendum non, rhoncus sed erat. In purus nunc, aliquam a sapien sit amet, accumsan maximus lorem. ', 'Akcesoria', '19.99', 40, 'img/products/etui_iphone_4_4s.jpg', 'bialy'),
(22, 'Torba sportowa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vel fermentum nisl. Fusce pulvinar urna sit amet sem egestas, sed viverra augue ornare. Praesent ipsum lectus, blandit a dui ac, facilisis ultricies mi. Sed ultricies in libero vel mollis. Donec vitae lectus vel ante mollis convallis vel ut purus. Curabitur molestie efficitur lorem, eu luctus ligula aliquam at. Aenean auctor nunc.', 'Akcesoria', '99.99', 11, 'img/products/torba_sportowa.jpg', 'czarny'),
(23, 'Torba materiałowa beżowa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis iaculis nisl. Vivamus pharetra augue vel erat aliquet, nec elementum nunc ornare. Suspendisse velit nisi, laoreet in magna ut, consequat semper libero. Duis egestas aliquam molestie. Phasellus efficitur ex.', 'Akcesoria', '6.99', 22, 'img/products/torba_materiałowa_beżowa.jpg', 'bialy'),
(24, 'Kubek czarny', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend fringilla augue rhoncus laoreet. Donec feugiat risus id rhoncus porta. Suspendisse potenti. Fusce sem risus, eleifend vel egestas eu, aliquet ac nibh. Morbi euismod purus et vehicula pulvinar. Fusce elit tellus, dictum in dapibus.', 'Akcesoria', '17.99', 62, 'img/products/kubek_czarny.jpg', 'czarny'),
(25, 'Koszulka indygo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '39.99', 13, 'img/products/koszulka_indygo.jpg', 'niebieski'),
(26, 'Czapka biała', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tempus nisl sit amet dui faucibus, congue ornare mauris efficitur. Pellentesque nec hendrerit sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet lorem venenatis, porttitor nibh eu, ultrices risus. Nam sollicitudin.', 'Ubior', '24.99', 0, 'img/products/czapka_biała.jpg', 'bialy'),
(27, 'Torba na ramię szara', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempor dui nec tortor auctor tincidunt. Suspendisse fermentum blandit diam, eu fermentum lorem. Ut finibus mollis facilisis. Quisque at finibus augue. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc suscipit velit metus, id dapibus dui eleifend in. Vivamus ultricies volutpat.', 'Akcesoria', '119.99', 7, 'img/products/torba_na_ramię_szara.jpg', 'szary'),
(28, 'Miś', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dapibus, nisl at fringilla dapibus, augue elit porta urna, in facilisis ante purus sed mi. Nam mollis diam tortor, convallis condimentum nisi elementum eget. Donec elementum aliquet metus, non semper tortor mollis a. Fusce hendrerit orci facilisis fringilla aliquam. Donec et orci eget libero consectetur posuere vel ac enim. Vivamus.', 'Akcesoria', '999.99', 2, 'img/products/miś.jpg', 'bialy'),
(29, 'Worek gimnastyczny błękitny', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet accumsan justo, nec posuere tortor. Ut id libero eu augue consectetur viverra. Sed at sem ac sapien aliquet tincidunt. Aenean sed fermentum justo. Aliquam id sem ut quam euismod pellentesque. Morbi eu accumsan nulla. Quisque sagittis suscipit nulla eget facilisis. Integer sollicitudin lobortis imperdiet. Nunc malesuada.', 'Akcesoria', '29.99', 14, 'img/products/worek_gimnastyczny_błękitny.jpg', 'niebieski'),
(30, 'Koszulka czarna', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '39.99', 48, 'img/products/koszulka_czarna.jpg', 'czarny'),
(31, 'Torba materiałowa niebieska', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis iaculis nisl. Vivamus pharetra augue vel erat aliquet, nec elementum nunc ornare. Suspendisse velit nisi, laoreet in magna ut, consequat semper libero. Duis egestas aliquam molestie. Phasellus efficitur ex.', 'Akcesoria', '6.99', 0, 'img/products/torba_materiałowa_niebieska.jpg', 'niebieski'),
(32, 'Czapka niebieska', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tempus nisl sit amet dui faucibus, congue ornare mauris efficitur. Pellentesque nec hendrerit sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet lorem venenatis, porttitor nibh eu, ultrices risus. Nam sollicitudin.', 'Ubior', '24.99', 35, 'img/products/czapka_niebieska.jpg', 'niebieski'),
(33, 'Kubek czerwony', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eleifend fringilla augue rhoncus laoreet. Donec feugiat risus id rhoncus porta. Suspendisse potenti. Fusce sem risus, eleifend vel egestas eu, aliquet ac nibh. Morbi euismod purus et vehicula pulvinar. Fusce elit tellus, dictum in dapibus.', 'Akcesoria', '17.99', 29, 'img/products/kubek_czerwony.jpg', 'czerwony'),
(34, 'Bidon biały', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dignissim risus eget odio iaculis, in accumsan magna fermentum. Suspendisse nec dignissim risus. Etiam eget tempor ante. Proin egestas non ex vitae eleifend. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam porta odio velit, ut ultricies nisi mattis vitae. Praesent cursus commodo elit.', 'Akcesoria', '24.99', 0, 'img/products/bidon_biały.jpg', 'bialy'),
(35, 'Koszulka pomarańczowa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at pretium sem. Nunc id velit nec lorem blandit porta non molestie eros. Quisque non felis vel magna pharetra ultricies vel vel sapien. Ut ligula nisl, vestibulum sed eros auctor, blandit blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec.', 'Ubior', '44.99', 13, 'img/products/koszulka_pomarańczowa.jpg', 'pomaranczowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty_has_zamowienia`
--

CREATE TABLE `produkty_has_zamowienia` (
  `Zamowienia_ID_zamowienia` int(11) NOT NULL,
  `Produkty_ID_produktu` int(11) NOT NULL,
  `Ilosc_sztuk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reklamacje`
--

CREATE TABLE `reklamacje` (
  `ID` int(11) NOT NULL,
  `Imie` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Nazwisko` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Adres_email` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Numer_telefonu` varchar(9) COLLATE utf8_polish_ci DEFAULT NULL,
  `Login` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `Numer_zamowienia` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `Opis` varchar(500) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `reklamacje`
--

INSERT INTO `reklamacje` (`ID`, `Imie`, `Nazwisko`, `Adres_email`, `Numer_telefonu`, `Login`, `Numer_zamowienia`, `Opis`) VALUES
(1, 'Majekl', 'Ohnio', 'maohnio@ohoh.ru', '123456789', NULL, '00001', 'Test Test');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `ID` int(11) NOT NULL,
  `Data` date NOT NULL,
  `ID_klienta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Login_UNIQUE` (`Login`);

--
-- Indeksy dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Produkt_ID` (`Produkt_ID`);

--
-- Indeksy dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `lista`
--
ALTER TABLE `lista`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Klient` (`Klient`),
  ADD KEY `Produkt_ID` (`Produkt_ID`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Klient_ID` (`Klient_ID`),
  ADD KEY `Produkt_ID` (`Produkt_ID`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `produkty_has_zamowienia`
--
ALTER TABLE `produkty_has_zamowienia`
  ADD PRIMARY KEY (`Produkty_ID_produktu`,`Zamowienia_ID_zamowienia`),
  ADD KEY `fk_Produkty_has_Zamówienia_Zamówienia1_idx` (`Zamowienia_ID_zamowienia`),
  ADD KEY `fk_Produkty_has_Zamówienia_Produkty1_idx` (`Produkty_ID_produktu`);

--
-- Indeksy dla tabeli `reklamacje`
--
ALTER TABLE `reklamacje`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Zamówienia_Klienci_idx` (`ID_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `lista`
--
ALTER TABLE `lista`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `reklamacje`
--
ALTER TABLE `reklamacje`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD CONSTRAINT `komentarze_ibfk_1` FOREIGN KEY (`Produkt_ID`) REFERENCES `produkty` (`ID`);

--
-- Ograniczenia dla tabeli `lista`
--
ALTER TABLE `lista`
  ADD CONSTRAINT `lista_ibfk_1` FOREIGN KEY (`Klient`) REFERENCES `klienci` (`Login`),
  ADD CONSTRAINT `lista_ibfk_2` FOREIGN KEY (`Produkt_ID`) REFERENCES `produkty` (`ID`);

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`Klient_ID`) REFERENCES `klienci` (`ID`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`Produkt_ID`) REFERENCES `produkty` (`ID`);

--
-- Ograniczenia dla tabeli `produkty_has_zamowienia`
--
ALTER TABLE `produkty_has_zamowienia`
  ADD CONSTRAINT `fk_Produkty_has_Zamówienia_Produkty1` FOREIGN KEY (`Produkty_ID_produktu`) REFERENCES `produkty` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `produkty_has_zamowienia_ibfk_1` FOREIGN KEY (`Zamowienia_ID_zamowienia`) REFERENCES `zamowienia` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
