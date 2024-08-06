-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 09 2024 г., 21:43
-- Версия сервера: 8.0.29
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jobtrack`
--

-- --------------------------------------------------------

--
-- Структура таблицы `employedbyprofession`
--

CREATE TABLE `employedbyprofession` (
  `idEmployed` int NOT NULL,
  `employmentStudentID` int NOT NULL,
  `employedForMore4months` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `employedbyprofession`
--

INSERT INTO `employedbyprofession` (`idEmployed`, `employmentStudentID`, `employedForMore4months`) VALUES
(1, 30, '2025-05-20'),
(2, 100, '2025-05-29'),
(3, 165, '2024-08-27'),
(4, 83, '2025-05-13'),
(5, 121, '2024-06-14'),
(6, 119, '2024-07-30'),
(7, 1, '2025-03-22'),
(8, 77, '2025-02-21'),
(9, 59, '2025-02-21'),
(10, 85, '2024-10-22'),
(11, 87, '2024-09-21'),
(12, 42, '2024-07-23'),
(13, 143, '2024-11-26'),
(14, 112, '2024-12-05'),
(15, 168, '2024-06-18'),
(16, 170, '2025-05-28'),
(17, 122, '2024-09-30'),
(18, 69, '2024-10-24'),
(19, 7, '2025-05-05'),
(20, 117, '2024-12-08'),
(21, 95, '2024-09-21'),
(22, 23, '2025-05-27'),
(23, 34, '2025-06-01'),
(24, 46, '2025-03-30'),
(25, 16, '2025-05-06'),
(26, 109, '2024-09-07'),
(27, 99, '2025-02-05'),
(28, 21, '2024-11-18'),
(29, 6, '2024-12-02'),
(30, 72, '2024-10-09'),
(31, 106, '2024-12-24'),
(32, 166, '2024-06-14'),
(33, 163, '2025-05-27'),
(34, 147, '2025-02-07'),
(35, 81, '2024-11-25'),
(36, 150, '2024-10-19'),
(37, 128, '2024-06-12'),
(38, 68, '2024-10-05'),
(39, 153, '2025-01-28'),
(40, 138, '2025-02-21'),
(41, 144, '2025-01-16'),
(42, 3, '2024-11-30'),
(43, 96, '2024-08-15'),
(44, 79, '2024-07-04'),
(45, 62, '2024-10-22'),
(46, 28, '2024-11-26'),
(47, 127, '2025-05-27'),
(48, 36, '2024-12-03'),
(49, 155, '2024-12-15'),
(50, 63, '2024-07-07');

-- --------------------------------------------------------

--
-- Структура таблицы `employment`
--

CREATE TABLE `employment` (
  `idEmployment` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `employment`
--

INSERT INTO `employment` (`idEmployment`, `name`) VALUES
(2, 'Трудоустроены'),
(3, 'Индивидуальные предприниматели'),
(4, 'Самозанятые'),
(5, 'Продолжили обучение'),
(6, 'Проходят службу в армии по призыву'),
(7, 'Проходят службу в армии на контрактной основе'),
(8, 'Находятся в отпуске по уходу за ребенком');

-- --------------------------------------------------------

--
-- Структура таблицы `employmentstudent`
--

CREATE TABLE `employmentstudent` (
  `idEmploymentStudent` int NOT NULL,
  `employmentID` int NOT NULL,
  `studentID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `employmentstudent`
--

INSERT INTO `employmentstudent` (`idEmploymentStudent`, `employmentID`, `studentID`) VALUES
(1, 2, 1),
(8, 2, 8),
(15, 2, 15),
(22, 2, 22),
(29, 2, 29),
(36, 2, 36),
(43, 2, 43),
(50, 2, 50),
(57, 2, 57),
(64, 2, 64),
(71, 2, 71),
(78, 2, 78),
(85, 2, 85),
(92, 2, 92),
(99, 2, 99),
(106, 2, 106),
(113, 2, 113),
(120, 2, 120),
(127, 2, 127),
(134, 2, 134),
(141, 2, 141),
(148, 2, 148),
(155, 2, 155),
(162, 2, 162),
(169, 2, 169),
(176, 2, 176),
(2, 3, 2),
(9, 3, 9),
(16, 3, 16),
(23, 3, 23),
(30, 3, 30),
(37, 3, 37),
(44, 3, 44),
(51, 3, 51),
(58, 3, 58),
(65, 3, 65),
(72, 3, 72),
(79, 3, 79),
(86, 3, 86),
(93, 3, 93),
(100, 3, 100),
(107, 3, 107),
(114, 3, 114),
(121, 3, 121),
(128, 3, 128),
(135, 3, 135),
(142, 3, 142),
(149, 3, 149),
(156, 3, 156),
(163, 3, 163),
(170, 3, 170),
(3, 4, 3),
(10, 4, 10),
(17, 4, 17),
(24, 4, 24),
(31, 4, 31),
(38, 4, 38),
(45, 4, 45),
(52, 4, 52),
(59, 4, 59),
(66, 4, 66),
(73, 4, 73),
(80, 4, 80),
(87, 4, 87),
(94, 4, 94),
(101, 4, 101),
(108, 4, 108),
(115, 4, 115),
(122, 4, 122),
(129, 4, 129),
(136, 4, 136),
(143, 4, 143),
(150, 4, 150),
(157, 4, 157),
(164, 4, 164),
(171, 4, 171),
(4, 5, 4),
(11, 5, 11),
(18, 5, 18),
(25, 5, 25),
(32, 5, 32),
(39, 5, 39),
(46, 5, 46),
(53, 5, 53),
(60, 5, 60),
(67, 5, 67),
(74, 5, 74),
(81, 5, 81),
(88, 5, 88),
(95, 5, 95),
(102, 5, 102),
(109, 5, 109),
(116, 5, 116),
(123, 5, 123),
(130, 5, 130),
(137, 5, 137),
(144, 5, 144),
(151, 5, 151),
(158, 5, 158),
(165, 5, 165),
(172, 5, 172),
(5, 6, 5),
(12, 6, 12),
(19, 6, 19),
(26, 6, 26),
(33, 6, 33),
(40, 6, 40),
(47, 6, 47),
(54, 6, 54),
(61, 6, 61),
(68, 6, 68),
(75, 6, 75),
(82, 6, 82),
(89, 6, 89),
(96, 6, 96),
(103, 6, 103),
(110, 6, 110),
(117, 6, 117),
(124, 6, 124),
(131, 6, 131),
(138, 6, 138),
(145, 6, 145),
(152, 6, 152),
(159, 6, 159),
(166, 6, 166),
(173, 6, 173),
(6, 7, 6),
(13, 7, 13),
(20, 7, 20),
(27, 7, 27),
(34, 7, 34),
(41, 7, 41),
(48, 7, 48),
(55, 7, 55),
(62, 7, 62),
(69, 7, 69),
(76, 7, 76),
(83, 7, 83),
(90, 7, 90),
(97, 7, 97),
(104, 7, 104),
(111, 7, 111),
(118, 7, 118),
(125, 7, 125),
(132, 7, 132),
(139, 7, 139),
(146, 7, 146),
(153, 7, 153),
(160, 7, 160),
(167, 7, 167),
(174, 7, 174),
(7, 8, 7),
(14, 8, 14),
(21, 8, 21),
(28, 8, 28),
(35, 8, 35),
(42, 8, 42),
(49, 8, 49),
(56, 8, 56),
(63, 8, 63),
(70, 8, 70),
(77, 8, 77),
(84, 8, 84),
(91, 8, 91),
(98, 8, 98),
(105, 8, 105),
(112, 8, 112),
(119, 8, 119),
(126, 8, 126),
(133, 8, 133),
(140, 8, 140),
(147, 8, 147),
(154, 8, 154),
(161, 8, 161),
(168, 8, 168),
(175, 8, 175);

-- --------------------------------------------------------

--
-- Структура таблицы `graduatesprofessionalintentions`
--

CREATE TABLE `graduatesprofessionalintentions` (
  `idIntentions` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `graduatesprofessionalintentions`
--

INSERT INTO `graduatesprofessionalintentions` (`idIntentions`, `name`) VALUES
(2, 'Будут трудоустроены'),
(3, 'Будут осуществлять предпринимательскую деятельность'),
(4, 'Будут самозанятыми'),
(5, 'Будут призваны в армию'),
(6, 'Будут в армии на контрактной основе'),
(7, 'Будут продолжать обучение');

-- --------------------------------------------------------

--
-- Структура таблицы `groupspec`
--

CREATE TABLE `groupspec` (
  `idGroup` int NOT NULL,
  `nuberGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `specialityID` int NOT NULL,
  `yearRelease` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `groupspec`
--

INSERT INTO `groupspec` (`idGroup`, `nuberGroup`, `specialityID`, `yearRelease`) VALUES
(1, '31Б-21', 14, '2024'),
(2, '32Б-21', 14, '2024'),
(3, '33Б-21', 14, '2024'),
(4, '34Б-22', 14, '2024'),
(5, '31ЗИО-21', 6, '2024'),
(6, '32ЗИО-21', 6, '2024'),
(7, '33ЗИО-21', 6, '2024'),
(8, '34ЗИО-22', 6, '2024'),
(9, '35ЗИО-22', 6, '2024'),
(10, '31У-21', 10, '2024'),
(11, '32У-21', 10, '2024'),
(12, '33У-21', 10, '2024'),
(13, '31Ф-21', 13, '2024'),
(14, '32Ф-21', 13, '2024'),
(15, '33Ф-22', 13, '2024'),
(16, '34Ф-22', 13, '2024'),
(17, '41ИС-20', 3, '2024'),
(18, '41Р-20', 8, '2024'),
(19, '42Р-20', 8, '2024'),
(20, '41КС-20', 1, '2024'),
(21, '41ЭС-20', 4, '2024');

-- --------------------------------------------------------

--
-- Структура таблицы `healthcategory`
--

CREATE TABLE `healthcategory` (
  `idCategory` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `healthcategory`
--

INSERT INTO `healthcategory` (`idCategory`, `name`) VALUES
(2, 'Слуха'),
(3, 'Опорно-двигательного аппарата'),
(4, 'Тяжелыми нарушениями речи'),
(5, 'Задержкой психического развития'),
(6, 'Расстройствами аутистического спектра'),
(7, 'С инвалидностью вследствие других причин');

-- --------------------------------------------------------

--
-- Структура таблицы `healthcategorystudent`
--

CREATE TABLE `healthcategorystudent` (
  `idCategoryStudent` int NOT NULL,
  `studentID` int NOT NULL,
  `categoryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `healthcategorystudent`
--

INSERT INTO `healthcategorystudent` (`idCategoryStudent`, `studentID`, `categoryID`) VALUES
(11, 1, 2),
(1, 1, 3),
(6, 1, 4),
(16, 1, 5),
(17, 2, 2),
(12, 2, 3),
(7, 2, 5),
(2, 2, 6),
(3, 3, 2),
(18, 3, 3),
(13, 3, 4),
(8, 3, 6),
(9, 4, 3),
(19, 4, 4),
(4, 4, 5),
(14, 4, 6),
(10, 5, 2),
(20, 5, 6),
(5, 5, 7),
(15, 5, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `intentionsgraduates`
--

CREATE TABLE `intentionsgraduates` (
  `IdIntentionsGraduates` int NOT NULL,
  `intentionsID` int NOT NULL,
  `studentID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `intentionsgraduates`
--

INSERT INTO `intentionsgraduates` (`IdIntentionsGraduates`, `intentionsID`, `studentID`) VALUES
(28, 2, 4),
(10, 2, 37),
(27, 2, 51),
(48, 2, 53),
(21, 2, 74),
(46, 2, 81),
(24, 3, 5),
(25, 3, 27),
(2, 3, 31),
(39, 3, 34),
(49, 3, 53),
(8, 3, 56),
(45, 3, 59),
(18, 3, 87),
(20, 4, 25),
(7, 4, 36),
(43, 4, 64),
(1, 4, 66),
(22, 4, 77),
(38, 4, 77),
(4, 4, 100),
(15, 5, 13),
(19, 5, 22),
(41, 5, 58),
(26, 5, 74),
(17, 5, 80),
(23, 5, 84),
(34, 6, 5),
(47, 6, 5),
(31, 6, 27),
(9, 6, 29),
(6, 6, 36),
(16, 6, 37),
(11, 6, 42),
(40, 6, 56),
(37, 6, 57),
(35, 6, 59),
(36, 6, 79),
(3, 6, 94),
(13, 6, 98),
(14, 6, 100),
(29, 7, 10),
(32, 7, 20),
(50, 7, 31),
(33, 7, 36),
(5, 7, 50),
(12, 7, 51),
(30, 7, 54),
(44, 7, 60),
(42, 7, 84);

-- --------------------------------------------------------

--
-- Структура таблицы `lastactivity`
--

CREATE TABLE `lastactivity` (
  `idLastactivity` int NOT NULL,
  `userID` int NOT NULL,
  `LastActivity` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `lastactivity`
--

INSERT INTO `lastactivity` (`idLastactivity`, `userID`, `LastActivity`) VALUES
(92, 6, '2024-06-09 21:18:17'),
(93, 7, '2024-06-09 21:18:47'),
(94, 6, '2024-06-09 21:18:57'),
(95, 6, '2024-06-09 21:19:18'),
(96, 6, '2024-06-09 21:21:11'),
(97, 6, '2024-06-09 21:29:00'),
(99, 6, '2024-06-09 21:29:50'),
(101, 6, '2024-06-09 21:30:26'),
(102, 6, '2024-06-09 21:33:38'),
(103, 6, '2024-06-09 21:34:22'),
(104, 6, '2024-06-09 21:35:37'),
(105, 6, '2024-06-09 21:36:58'),
(107, 6, '2024-06-09 21:37:51'),
(108, 7, '2024-06-09 21:38:53'),
(109, 6, '2024-06-09 21:39:20'),
(110, 7, '2024-06-09 21:40:43'),
(111, 6, '2024-06-09 21:42:10');

-- --------------------------------------------------------

--
-- Структура таблицы `riskzone`
--

CREATE TABLE `riskzone` (
  `idRiskZone` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `riskzone`
--

INSERT INTO `riskzone` (`idRiskZone`, `name`) VALUES
(2, 'Неформальная занятость'),
(3, 'Зарегистрированы в центрах занятости в качестве безработных'),
(4, 'Не имеют мотивации к трудоустройству'),
(5, 'Иные причины нахождения под риском не трудоустройства');

-- --------------------------------------------------------

--
-- Структура таблицы `riskzonestudent`
--

CREATE TABLE `riskzonestudent` (
  `idRiskZoneStudent` int NOT NULL,
  `riskZoneID` int NOT NULL,
  `studentID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `riskzonestudent`
--

INSERT INTO `riskzonestudent` (`idRiskZoneStudent`, `riskZoneID`, `studentID`) VALUES
(1, 2, 1),
(6, 2, 6),
(11, 2, 11),
(16, 2, 16),
(2, 3, 2),
(7, 3, 7),
(12, 3, 12),
(17, 3, 17),
(3, 4, 3),
(8, 4, 8),
(13, 4, 13),
(18, 4, 18),
(4, 5, 4),
(9, 5, 9),
(14, 5, 14),
(19, 5, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `speciality`
--

CREATE TABLE `speciality` (
  `idSpeciality` int NOT NULL,
  `codeSpeciality` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `speciality`
--

INSERT INTO `speciality` (`idSpeciality`, `codeSpeciality`, `name`) VALUES
(1, '09.02.02', 'Компьютерные сети'),
(2, '09.02.06', 'Сетевое и системное администрирование'),
(3, '09.02.07', 'Информационные системы и программирование'),
(4, '13.02.03', 'Электрические станции, сети и системы'),
(5, '18.02.12', 'Технология аналитического контроля химических соединений'),
(6, '21.02.05', 'Земельно-имущественные отношения'),
(7, '21.02.19', 'Землеустройство'),
(8, '23.02.03', 'Техническое обслуживание и ремонт автомобильного транспорта'),
(9, '23.02.07', 'Техническое обслуживание и ремонт двигателей, систем и агрегатов автомобилей'),
(10, '38.02.01', 'Экономика и бухгалтерский учет'),
(11, '38.02.02', 'Страховое дело (по отраслям)'),
(12, '38.02.03', 'Операционная деятельность в логистике'),
(13, '38.02.06', 'Финансы'),
(14, '38.02.07', 'Банковское дело'),
(15, '40.02.01', 'Право и организация социального обеспечения'),
(16, '43.02.14', 'Гостиничное дело'),
(17, '43.02.10', 'Туризм'),
(18, '43.02.16', 'Туризм и гостеприимство'),
(19, '46.02.01', 'Документационное обеспечение управления и архивоведение');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `idStudent` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `groupID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`idStudent`, `name`, `sname`, `lname`, `phone`, `mail`, `groupID`) VALUES
(1, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivanov@example.com', 1),
(2, 'Петр', 'Петров', 'Петрович', '0987654321', 'petrov@example.com', 1),
(3, 'Сергей', 'Сергеев', 'Сергеевич', '9876543210', 'sergeev@example.com', 1),
(4, 'Анна', 'Иванова', 'Андреевна', '1230987654', 'ivanova@example.com', 1),
(5, 'Елена', 'Петрова', 'Александровна', '5678901234', 'petrova@example.com', 1),
(6, 'Мария', 'Сидорова', 'Игоревна', '8901234567', 'sidorova@example.com', 1),
(7, 'Алексей', 'Алексеев', 'Алексеевич', '4321098765', 'alekseev@example.com', 1),
(8, 'Дмитрий', 'Дмитриев', 'Дмитриевич', '6543210987', 'dmitriev@example.com', 1),
(9, 'Ольга', 'Олегова', 'Олеговна', '3210987654', 'olegova@example.com', 1),
(10, 'Наталья', 'Николаева', 'Николаевна', '7890123456', 'nikolaeva@example.com', 1),
(11, 'Иван', 'Иванов', 'Иванович', '+79123456789', 'ivanov@example.com', 2),
(12, 'Петр', 'Петров', 'Петрович', '+79234567890', 'petrov@example.com', 2),
(13, 'Алексей', 'Сидоров', 'Алексеевич', '+79345678901', 'sidorov@example.com', 2),
(14, 'Елена', 'Смирнова', 'Евгеньевна', '+79456789012', 'smirnova@example.com', 2),
(15, 'Мария', 'Кузнецова', 'Михайловна', '+79567890123', 'kuznetsova@example.com', 2),
(16, 'Андрей', 'Николаев', 'Андреевич', '+79678901234', 'nikolaev@example.com', 2),
(17, 'Ольга', 'Иванова', 'Олеговна', '+79789012345', 'ivanova@example.com', 2),
(18, 'Сергей', 'Павлов', 'Сергеевич', '+79890123456', 'pavlov@example.com', 2),
(19, 'Татьяна', 'Федорова', 'Тимуровна', '+79901234567', 'fedorova@example.com', 2),
(20, 'Дмитрий', 'Алексеев', 'Дмитриевич', '+78012345678', 'alekseev@example.com', 2),
(21, 'Иван', 'Иванов', 'Иванович', '+1234567890', 'ivan.ivanov@example.com', 3),
(22, 'Петр', 'Петров', 'Петрович', '+0987654321', 'petr.petrov@example.com', 3),
(23, 'Анна', 'Сидорова', 'Ивановна', '+1112223334', 'anna.sidorova@example.com', 3),
(24, 'Елена', 'Козлова', 'Александровна', '+4445556667', 'elena.kozlova@example.com', 3),
(25, 'Дмитрий', 'Смирнов', 'Петрович', '+7778889990', 'dmitriy.smirnov@example.com', 3),
(26, 'Мария', 'Кузнецова', 'Сергеевна', '+5556667778', 'maria.kuznetsova@example.com', 3),
(27, 'Алексей', 'Васильев', 'Александрович', '+3334445556', 'aleksey.vasiliev@example.com', 3),
(28, 'Наталья', 'Павлова', 'Андреевна', '+2223334445', 'natalya.pavlova@example.com', 3),
(29, 'Сергей', 'Михайлов', 'Владимирович', '+6667778889', 'sergey.mikhailov@example.com', 3),
(30, 'Ольга', 'Новикова', 'Сергеевна', '+8889990001', 'olga.novikova@example.com', 3),
(31, 'Иван', 'Иванов', 'Иванович', '123456789', 'ivan.ivanov@example.com', 4),
(32, 'Петр', 'Петров', 'Петрович', '987654321', 'petr.petrov@example.com', 4),
(33, 'Алексей', 'Сидоров', 'Петрович', '456789123', 'aleksey.sidorov@example.com', 4),
(34, 'Елена', 'Козлова', 'Игоревна', '654321987', 'elena.kozlova@example.com', 4),
(35, 'Ольга', 'Смирнова', 'Алексеевна', '321987654', 'olga.smirnova@example.com', 4),
(36, 'Дмитрий', 'Николаев', 'Павлович', '789123456', 'dmitriy.nikolaev@example.com', 4),
(37, 'Мария', 'Павлова', 'Дмитриевна', '147258369', 'maria.pavlova@example.com', 4),
(38, 'Анна', 'Сергеева', 'Владимировна', '369258147', 'anna.sergeeva@example.com', 4),
(39, 'Андрей', 'Смирнов', 'Александрович', '258369147', 'andrey.smirnov@example.com', 4),
(40, 'Евгений', 'Кузнецов', 'Иванович', '147369258', 'evgeniy.kuznetsov@example.com', 4),
(41, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivan.ivanov@example.com', 5),
(42, 'Петр', 'Петров', 'Петрович', '0987654321', 'petr.petrov@example.com', 5),
(43, 'Анна', 'Сидорова', 'Александровна', '1112223333', 'anna.sidorova@example.com', 5),
(44, 'Елена', 'Козлова', 'Игоревна', '4445556666', 'elena.kozlova@example.com', 5),
(45, 'Дмитрий', 'Смирнов', 'Андреевич', '7778889999', 'dmitriy.smirnov@example.com', 5),
(46, 'Мария', 'Иванова', 'Сергеевна', '0001112222', 'maria.ivanova@example.com', 5),
(47, 'Александр', 'Павлов', 'Николаевич', '3334445555', 'alexandr.pavlov@example.com', 5),
(48, 'Ольга', 'Соловьева', 'Павловна', '6667778888', 'olga.solovyova@example.com', 5),
(49, 'Владимир', 'Федоров', 'Алексеевич', '9990001111', 'vladimir.fedorov@example.com', 5),
(50, 'Наталья', 'Сергеева', 'Владимировна', '2223334444', 'natalya.sergeeva@example.com', 5),
(51, 'Иван', 'Иванов', 'Иванович', '123456789', 'ivanov@example.com', 6),
(52, 'Петр', 'Петров', 'Петрович', '987654321', 'petrov@example.com', 6),
(53, 'Анна', 'Сидорова', 'Петровна', '555555555', 'sidorova@example.com', 6),
(54, 'Елена', 'Козлова', 'Ивановна', '666666666', 'kozlova@example.com', 6),
(55, 'Александр', 'Смирнов', 'Александрович', '777777777', 'smirnov@example.com', 6),
(56, 'Мария', 'Иванова', 'Петровна', '888888888', 'ivanova@example.com', 6),
(57, 'Дмитрий', 'Петров', 'Дмитриевич', '999999999', 'petrov2@example.com', 6),
(58, 'Евгений', 'Сидоров', 'Евгеньевич', '111111111', 'sidorov@example.com', 6),
(59, 'Ольга', 'Козлова', 'Александровна', '222222222', 'kozlova2@example.com', 6),
(60, 'Наталья', 'Смирнова', 'Сергеевна', '333333333', 'smirnova@example.com', 6),
(61, 'Иван', 'Иванов', 'Иванович', '+79123456789', 'ivanov@example.com', 7),
(62, 'Петр', 'Петров', 'Петрович', '+79123456788', 'petrov@example.com', 7),
(63, 'Анна', 'Сидорова', 'Петровна', '+79123456787', 'sidorova@example.com', 7),
(64, 'Елена', 'Смирнова', 'Ивановна', '+79123456786', 'smirnova@example.com', 7),
(65, 'Александр', 'Кузнецов', 'Александрович', '+79123456785', 'kuznetsov@example.com', 7),
(66, 'Мария', 'Новикова', 'Сергеевна', '+79123456784', 'novikova@example.com', 7),
(67, 'Дмитрий', 'Морозов', 'Дмитриевич', '+79123456783', 'morozov@example.com', 7),
(68, 'Евгения', 'Волкова', 'Сергеевна', '+79123456782', 'volkova@example.com', 7),
(69, 'Сергей', 'Андреев', 'Андреевич', '+79123456781', 'andreev@example.com', 7),
(70, 'Ольга', 'Павлова', 'Олеговна', '+79123456780', 'pavlova@example.com', 7),
(71, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivanov@example.com', 8),
(72, 'Петр', 'Петров', 'Петрович', '0987654321', 'petrov@example.com', 8),
(73, 'Анна', 'Сидорова', 'Игоревна', '1112223344', 'sidorova@example.com', 8),
(74, 'Елена', 'Козлова', 'Дмитриевна', '5556667788', 'kozlova@example.com', 8),
(75, 'Алексей', 'Николаев', 'Александрович', '7778889900', 'nikolaev@example.com', 8),
(76, 'Мария', 'Кузнецова', 'Сергеевна', '9990001122', 'kuznetsova@example.com', 8),
(77, 'Дмитрий', 'Смирнов', 'Дмитриевич', '1112223344', 'smirnov@example.com', 8),
(78, 'Ольга', 'Иванова', 'Анатольевна', '3334445566', 'ivanova@example.com', 8),
(79, 'Виктор', 'Федоров', 'Павлович', '7778889900', 'fedorov@example.com', 8),
(80, 'Евгений', 'Александров', 'Николаевич', '9990001122', 'aleksandrov@example.com', 8),
(81, 'Иван', 'Иванов', 'Иванович', '+1234567890', 'ivan.ivanov@example.com', 9),
(82, 'Петр', 'Петров', 'Петрович', '+1234567891', 'petr.petrov@example.com', 9),
(83, 'Анна', 'Сидорова', 'Ивановна', '+1234567892', 'anna.sidorova@example.com', 9),
(84, 'Елена', 'Козлова', 'Александровна', '+1234567893', 'elena.kozlova@example.com', 9),
(85, 'Алексей', 'Смирнов', 'Петрович', '+1234567894', 'alexey.smirnov@example.com', 9),
(86, 'Сергей', 'Михайлов', 'Сергеевич', '+1234567895', 'sergey.mikhailov@example.com', 9),
(87, 'Мария', 'Федорова', 'Алексеевна', '+1234567896', 'maria.fedorova@example.com', 9),
(88, 'Дмитрий', 'Алексеев', 'Дмитриевич', '+1234567897', 'dmitriy.alexeev@example.com', 9),
(89, 'Ольга', 'Андреева', 'Игоревна', '+1234567898', 'olga.andreeva@example.com', 9),
(90, 'Николай', 'Морозов', 'Иванович', '+1234567899', 'nikolay.morozov@example.com', 9),
(91, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivanov@example.com', 10),
(92, 'Петр', 'Петров', 'Петрович', '0987654321', 'petrov@example.com', 10),
(93, 'Алексей', 'Алексеев', 'Алексеевич', '9876543210', 'alexeev@example.com', 10),
(94, 'Мария', 'Сидорова', 'Ивановна', '1230987654', 'sidorova@example.com', 10),
(95, 'Елена', 'Кузнецова', 'Александровна', '4561237890', 'kuznetsova@example.com', 10),
(96, 'Дмитрий', 'Козлов', 'Петрович', '7894561230', 'kozlov@example.com', 10),
(97, 'Анна', 'Новикова', 'Алексеевна', '3216549870', 'novikova@example.com', 10),
(98, 'Сергей', 'Попов', 'Владимирович', '6547893210', 'popov@example.com', 10),
(99, 'Ольга', 'Морозова', 'Васильевна', '6543217890', 'morozova@example.com', 10),
(100, 'Наталья', 'Иванова', 'Андреевна', '9871236540', 'ivanova@example.com', 10),
(101, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivan.ivanov@example.com', 11),
(102, 'Петр', 'Петров', 'Петрович', '0987654321', 'petr.petrov@example.com', 11),
(103, 'Алексей', 'Сидоров', 'Игоревич', '1112223334', 'alex.sidorov@example.com', 11),
(104, 'Екатерина', 'Смирнова', 'Алексеевна', '5556667778', 'katya.smirnova@example.com', 11),
(105, 'Мария', 'Козлова', 'Дмитриевна', '9998887776', 'maria.kozlova@example.com', 11),
(106, 'Дмитрий', 'Николаев', 'Александрович', '3334445557', 'dmitry.nikolaev@example.com', 11),
(107, 'Светлана', 'Морозова', 'Петровна', '7778889990', 'sveta.morozova@example.com', 11),
(108, 'Анна', 'Егорова', 'Ивановна', '2223334445', 'anna.egorova@example.com', 11),
(109, 'Артем', 'Васильев', 'Алексеевич', '8889990001', 'artem.vasiliev@example.com', 11),
(110, 'Ольга', 'Павлова', 'Андреевна', '6667778882', 'olga.pavlova@example.com', 11),
(111, 'Иван', 'Иванов', 'Иванович', '+1234567890', 'ivanov@example.com', 12),
(112, 'Петр', 'Петров', 'Петрович', '+0987654321', 'petrov@example.com', 12),
(113, 'Анна', 'Сидорова', 'Петровна', '+1122334455', 'sidorova@example.com', 12),
(114, 'Мария', 'Иванова', 'Петровна', '+9988776655', 'ivanova@example.com', 12),
(115, 'Алексей', 'Семенов', 'Алексеевич', '+5544332211', 'semenov@example.com', 12),
(116, 'Елена', 'Павлова', 'Александровна', '+6677889900', 'pavlova@example.com', 12),
(117, 'Дмитрий', 'Козлов', 'Игоревич', '+1122334455', 'kozlov@example.com', 12),
(118, 'Светлана', 'Кузнецова', 'Дмитриевна', '+9988776655', 'kuznetsova@example.com', 12),
(119, 'Андрей', 'Смирнов', 'Петрович', '+5544332211', 'smirnov@example.com', 12),
(120, 'Юлия', 'Сорокина', 'Александровна', '+6677889900', 'sorokina@example.com', 12),
(121, 'Иван', 'Иванов', 'Иванович', '123456789', 'ivan.ivanov@example.com', 13),
(122, 'Петр', 'Петров', 'Петрович', '987654321', 'petr.petrov@example.com', 13),
(123, 'Анна', 'Сидорова', 'Алексеевна', '456789123', 'anna.sidorova@example.com', 13),
(124, 'Елена', 'Николаева', 'Петровна', '789123456', 'elena.nikolaeva@example.com', 13),
(125, 'Алексей', 'Кузнецов', 'Алексеевич', '741852963', 'aleksey.kuznetsov@example.com', 13),
(126, 'Мария', 'Иванова', 'Михайловна', '852963147', 'maria.ivanova@example.com', 13),
(127, 'Дмитрий', 'Смирнов', 'Дмитриевич', '369258147', 'dmitriy.smirnov@example.com', 13),
(128, 'Евгения', 'Александрова', 'Андреевна', '159357246', 'evgeniya.aleksandrova@example.com', 13),
(129, 'Сергей', 'Федоров', 'Сергеевич', '258147369', 'sergey.fedorov@example.com', 13),
(130, 'Ольга', 'Козлова', 'Олеговна', '147258369', 'olga.kozlova@example.com', 13),
(131, 'Иван', 'Иванов', 'Иванович', '+79123456789', 'ivanov@example.com', 14),
(132, 'Петр', 'Петров', 'Петрович', '+79234567890', 'petrov@example.com', 14),
(133, 'Алексей', 'Алексеев', 'Алексеевич', '+79345678901', 'alekseev@example.com', 14),
(134, 'Елена', 'Сидорова', 'Ивановна', '+79456789012', 'sidorova@example.com', 14),
(135, 'Мария', 'Смирнова', 'Сергеевна', '+79567890123', 'smirnova@example.com', 14),
(136, 'Анна', 'Кузнецова', 'Александровна', '+79678901234', 'kuznetsova@example.com', 14),
(137, 'Дмитрий', 'Федоров', 'Дмитриевич', '+79789012345', 'fedorov@example.com', 14),
(138, 'Ольга', 'Морозова', 'Игоревна', '+79890123456', 'morozova@example.com', 14),
(139, 'Сергей', 'Волков', 'Сергеевич', '+79901234567', 'volkov@example.com', 14),
(140, 'Татьяна', 'Александрова', 'Петровна', '+79912345678', 'aleksandrova@example.com', 14),
(141, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivan.ivanov@example.com', 15),
(142, 'Петр', 'Петров', 'Петрович', '0987654321', 'petr.petrov@example.com', 15),
(143, 'Анна', 'Сидорова', 'Ивановна', '1112223334', 'anna.sidorova@example.com', 15),
(144, 'Елена', 'Козлова', 'Владимировна', '5556667778', 'elena.kozlova@example.com', 15),
(145, 'Сергей', 'Сергеев', 'Сергеевич', '9998887776', 'sergey.sergeev@example.com', 15),
(146, 'Мария', 'Мариева', 'Мариевна', '4443332221', 'maria.marieva@example.com', 15),
(147, 'Дмитрий', 'Дмитриев', 'Дмитриевич', '1231231230', 'dmitry.dmitriev@example.com', 15),
(148, 'Ольга', 'Ольгова', 'Ольговна', '7778889990', 'olga.olgova@example.com', 15),
(149, 'Николай', 'Николаев', 'Николаевич', '6665554443', 'nikolay.nikolaev@example.com', 15),
(150, 'Татьяна', 'Татьянова', 'Татьяновна', '3332221114', 'tatiana.tatyana@example.com', 15),
(151, 'Иван', 'Иванович', 'Иванов', '+1234567890', 'ivan.ivanov@example.com', 16),
(152, 'Петр', 'Петрович', 'Петров', '+0987654321', 'petr.petrov@example.com', 16),
(153, 'Анна', 'Ивановна', 'Сидорова', '+1122334455', 'anna.sidorova@example.com', 16),
(154, 'Мария', 'Петровна', 'Иванова', '+5566778899', 'maria.ivanova@example.com', 16),
(155, 'Алексей', 'Алексеевич', 'Алексеев', '+9988776655', 'alex.alexeev@example.com', 16),
(156, 'Елена', 'Петровна', 'Петрова', '+1122334455', 'elena.petrova@example.com', 16),
(157, 'Сергей', 'Сергеевич', 'Сергеев', '+5566778899', 'sergei.sergeev@example.com', 16),
(158, 'Ольга', 'Александровна', 'Сидорова', '+9988776655', 'olga.sidorova@example.com', 16),
(159, 'Дмитрий', 'Дмитриевич', 'Дмитриев', '+1122334455', 'dmitri.dmitriev@example.com', 16),
(160, 'Наталья', 'Сергеевна', 'Сергеева', '+5566778899', 'natalia.sergeeva@example.com', 16),
(161, 'Иван', 'Иванов', 'Иванович', '+1234567890', 'ivan.ivanov@example.com', 17),
(162, 'Петр', 'Петров', 'Петрович', '+0987654321', 'petr.petrov@example.com', 17),
(163, 'Алексей', 'Сидоров', 'Алексеевич', '+1112223344', 'alex.sid@example.com', 17),
(164, 'Елена', 'Смирнова', 'Александровна', '+9876543210', 'elena.smirnova@example.com', 17),
(165, 'Мария', 'Кузнецова', 'Сергеевна', '+9871236547', 'maria.kuznetsova@example.com', 17),
(166, 'Дмитрий', 'Новиков', 'Игоревич', '+9877418523', 'dmitry.novikov@example.com', 17),
(167, 'Светлана', 'Морозова', 'Дмитриевна', '+7418529630', 'svetlana.morozova@example.com', 17),
(168, 'Анна', 'Попова', 'Алексеевна', '+3219876540', 'anna.popova@example.com', 17),
(169, 'Артем', 'Волков', 'Владимирович', '+1593578520', 'artem.volkov@example.com', 17),
(170, 'Наталья', 'Зайцева', 'Алексеевна', '+7531592648', 'natalia.zaitseva@example.com', 17),
(171, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivanov@example.com', 18),
(172, 'Петр', 'Петров', 'Петрович', '0987654321', 'petrov@example.com', 18),
(173, 'Анна', 'Иванова', 'Петровна', '1112223334', 'anna@example.com', 18),
(174, 'Елена', 'Сидорова', 'Алексеевна', '5556667778', 'elena@example.com', 18),
(175, 'Александр', 'Смирнов', 'Александрович', '9998887776', 'smirnov@example.com', 18),
(176, 'Мария', 'Кузнецова', 'Игоревна', '4443332221', 'kuznetsova@example.com', 18),
(177, 'Дмитрий', 'Козлов', 'Дмитриевич', '7778889990', 'kozlov@example.com', 18),
(178, 'София', 'Новикова', 'Сергеевна', '8889990001', 'novikova@example.com', 18),
(179, 'Артем', 'Морозов', 'Павлович', '2223334445', 'morozov@example.com', 18),
(180, 'Виктория', 'Волкова', 'Артемовна', '3334445556', 'volkova@example.com', 18),
(181, 'Иван', 'Иванов', 'Иванович', '1234567890', 'ivan.ivanov@example.com', 19),
(182, 'Петр', 'Петров', 'Петрович', '0987654321', 'petr.petrov@example.com', 19),
(183, 'Анна', 'Сидорова', 'Петровна', '9876543210', 'anna.sidorova@example.com', 19),
(184, 'Елена', 'Козлова', 'Ивановна', '5678901234', 'elena.kozlova@example.com', 19),
(185, 'Сергей', 'Иванов', 'Петрович', '4321098765', 'sergei.ivanov@example.com', 19),
(186, 'Мария', 'Петрова', 'Сергеевна', '7890123456', 'maria.petrova@example.com', 19),
(187, 'Алексей', 'Сидоров', 'Иванович', '2109876543', 'aleksei.sidorov@example.com', 19),
(188, 'Ольга', 'Иванова', 'Сергеевна', '6543210987', 'olga.ivanova@example.com', 19),
(189, 'Ирина', 'Сидорова', 'Алексеевна', '3456789012', 'irina.sidorova@example.com', 19),
(190, 'Дмитрий', 'Петров', 'Алексеевич', '9012345678', 'dmitriy.petrov@example.com', 19),
(191, 'Иван', 'Иванович', 'Иванов', '+79123456789', 'ivanov@example.com', 20),
(192, 'Петр', 'Петрович', 'Петров', '+79234567890', 'petrov@example.com', 20),
(193, 'Александр', 'Александрович', 'Александров', '+79345678901', 'aleksandrov@example.com', 20),
(194, 'Елена', 'Петровна', 'Сидорова', '+79456789012', 'sidorova@example.com', 20),
(195, 'Ольга', 'Викторовна', 'Иванова', '+79567890123', 'ivanova@example.com', 20),
(196, 'Сергей', 'Сергеевич', 'Сергеев', '+79678901234', 'sergeev@example.com', 20),
(197, 'Марина', 'Александровна', 'Петрова', '+79789012345', 'petrova@example.com', 20),
(198, 'Николай', 'Николаевич', 'Николаев', '+79890123456', 'nikolaev@example.com', 20),
(199, 'Татьяна', 'Павловна', 'Козлова', '+79901234567', 'kozlova@example.com', 20),
(200, 'Андрей', 'Андреевич', 'Андреев', '+78012345678', 'andreev@example.com', 20),
(201, 'Иван', 'Иванов', 'Иванович', '+1234567890', 'ivanov@example.com', 21),
(202, 'Петр', 'Петров', 'Петрович', '+0987654321', 'petrov@example.com', 21),
(203, 'Алексей', 'Сидоров', 'Александрович', '+1122334455', 'sidorov@example.com', 21),
(204, 'Мария', 'Кузнецова', 'Андреевна', '+9988776655', 'kuznetsova@example.com', 21),
(205, 'Елена', 'Смирнова', 'Владимировна', '+6655443322', 'smirnova@example.com', 21),
(206, 'Дмитрий', 'Зайцев', 'Дмитриевич', '+7711223344', 'zaytsev@example.com', 21),
(207, 'Ольга', 'Попова', 'Олеговна', '+5544332211', 'popova@example.com', 21),
(208, 'Сергей', 'Васильев', 'Сергеевич', '+4433221100', 'vasilyev@example.com', 21),
(209, 'Анна', 'Морозова', 'Анатольевна', '+6699887755', 'morozova@example.com', 21),
(210, 'Виктор', 'Новиков', 'Викторович', '+1122336677', 'novikov@example.com', 21);

-- --------------------------------------------------------

--
-- Структура таблицы `studentadd`
--

CREATE TABLE `studentadd` (
  `idAdd` int NOT NULL,
  `studentID` int NOT NULL,
  `userID` int NOT NULL,
  `dataAdd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` char(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `root` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `name`, `sname`, `lname`, `login`, `password`, `root`) VALUES
(6, 'Иван', 'Иванов', 'Иванович', 'ivanov', 'D5BF581F5D2B80104B95181C1DB35020', 1),
(7, 'Петр', 'Петров', 'Петрович', 'petrov', '344B33D058A3D9479D351BB85DE14CD6', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `employedbyprofession`
--
ALTER TABLE `employedbyprofession`
  ADD PRIMARY KEY (`idEmployed`),
  ADD KEY `employmentStudentID` (`employmentStudentID`);

--
-- Индексы таблицы `employment`
--
ALTER TABLE `employment`
  ADD PRIMARY KEY (`idEmployment`);

--
-- Индексы таблицы `employmentstudent`
--
ALTER TABLE `employmentstudent`
  ADD PRIMARY KEY (`idEmploymentStudent`),
  ADD KEY `employmentID` (`employmentID`,`studentID`),
  ADD KEY `studentID` (`studentID`);

--
-- Индексы таблицы `graduatesprofessionalintentions`
--
ALTER TABLE `graduatesprofessionalintentions`
  ADD PRIMARY KEY (`idIntentions`);

--
-- Индексы таблицы `groupspec`
--
ALTER TABLE `groupspec`
  ADD PRIMARY KEY (`idGroup`),
  ADD KEY `specialityID` (`specialityID`);

--
-- Индексы таблицы `healthcategory`
--
ALTER TABLE `healthcategory`
  ADD PRIMARY KEY (`idCategory`);

--
-- Индексы таблицы `healthcategorystudent`
--
ALTER TABLE `healthcategorystudent`
  ADD PRIMARY KEY (`idCategoryStudent`),
  ADD KEY `studentID` (`studentID`,`categoryID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Индексы таблицы `intentionsgraduates`
--
ALTER TABLE `intentionsgraduates`
  ADD PRIMARY KEY (`IdIntentionsGraduates`),
  ADD KEY `intentionsID` (`intentionsID`,`studentID`),
  ADD KEY `studentID` (`studentID`);

--
-- Индексы таблицы `lastactivity`
--
ALTER TABLE `lastactivity`
  ADD PRIMARY KEY (`idLastactivity`),
  ADD KEY `userID` (`userID`);

--
-- Индексы таблицы `riskzone`
--
ALTER TABLE `riskzone`
  ADD PRIMARY KEY (`idRiskZone`);

--
-- Индексы таблицы `riskzonestudent`
--
ALTER TABLE `riskzonestudent`
  ADD PRIMARY KEY (`idRiskZoneStudent`),
  ADD KEY `riskZoneID` (`riskZoneID`,`studentID`),
  ADD KEY `studentID` (`studentID`);

--
-- Индексы таблицы `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`idSpeciality`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`idStudent`),
  ADD KEY `groupID` (`groupID`);

--
-- Индексы таблицы `studentadd`
--
ALTER TABLE `studentadd`
  ADD PRIMARY KEY (`idAdd`),
  ADD KEY `employeeID` (`userID`),
  ADD KEY `studentID` (`studentID`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `employedbyprofession`
--
ALTER TABLE `employedbyprofession`
  MODIFY `idEmployed` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `employment`
--
ALTER TABLE `employment`
  MODIFY `idEmployment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `employmentstudent`
--
ALTER TABLE `employmentstudent`
  MODIFY `idEmploymentStudent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT для таблицы `graduatesprofessionalintentions`
--
ALTER TABLE `graduatesprofessionalintentions`
  MODIFY `idIntentions` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `groupspec`
--
ALTER TABLE `groupspec`
  MODIFY `idGroup` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `healthcategory`
--
ALTER TABLE `healthcategory`
  MODIFY `idCategory` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `healthcategorystudent`
--
ALTER TABLE `healthcategorystudent`
  MODIFY `idCategoryStudent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `intentionsgraduates`
--
ALTER TABLE `intentionsgraduates`
  MODIFY `IdIntentionsGraduates` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT для таблицы `lastactivity`
--
ALTER TABLE `lastactivity`
  MODIFY `idLastactivity` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT для таблицы `riskzone`
--
ALTER TABLE `riskzone`
  MODIFY `idRiskZone` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `riskzonestudent`
--
ALTER TABLE `riskzonestudent`
  MODIFY `idRiskZoneStudent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `speciality`
--
ALTER TABLE `speciality`
  MODIFY `idSpeciality` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `idStudent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT для таблицы `studentadd`
--
ALTER TABLE `studentadd`
  MODIFY `idAdd` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employedbyprofession`
--
ALTER TABLE `employedbyprofession`
  ADD CONSTRAINT `employedbyprofession_ibfk_2` FOREIGN KEY (`employmentStudentID`) REFERENCES `employmentstudent` (`idEmploymentStudent`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `employmentstudent`
--
ALTER TABLE `employmentstudent`
  ADD CONSTRAINT `employmentstudent_ibfk_1` FOREIGN KEY (`employmentID`) REFERENCES `employment` (`idEmployment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `employmentstudent_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`idStudent`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `groupspec`
--
ALTER TABLE `groupspec`
  ADD CONSTRAINT `groupspec_ibfk_1` FOREIGN KEY (`specialityID`) REFERENCES `speciality` (`idSpeciality`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `healthcategorystudent`
--
ALTER TABLE `healthcategorystudent`
  ADD CONSTRAINT `healthcategorystudent_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `healthcategory` (`idCategory`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `healthcategorystudent_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`idStudent`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `intentionsgraduates`
--
ALTER TABLE `intentionsgraduates`
  ADD CONSTRAINT `intentionsgraduates_ibfk_1` FOREIGN KEY (`intentionsID`) REFERENCES `graduatesprofessionalintentions` (`idIntentions`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `intentionsgraduates_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`idStudent`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `lastactivity`
--
ALTER TABLE `lastactivity`
  ADD CONSTRAINT `lastactivity_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `riskzonestudent`
--
ALTER TABLE `riskzonestudent`
  ADD CONSTRAINT `riskzonestudent_ibfk_1` FOREIGN KEY (`riskZoneID`) REFERENCES `riskzone` (`idRiskZone`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `riskzonestudent_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`idStudent`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `groupspec` (`idGroup`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `studentadd`
--
ALTER TABLE `studentadd`
  ADD CONSTRAINT `studentadd_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`idStudent`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `studentadd_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
