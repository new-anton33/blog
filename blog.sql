-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 12 2017 г., 19:10
-- Версия сервера: 5.5.48
-- Версия PHP: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id_com` int(10) NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `author_com` varchar(50) NOT NULL,
  `date_add_com` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id_com`, `post_id`, `comment`, `author_com`, `date_add_com`) VALUES
(9, 11, '<p>Great film!<br></p>', 'President', '2017-05-12 16:43:49'),
(10, 11, '<p>Very good picture!<br></p>', 'IronMan', '2017-05-12 16:44:34'),
(11, 11, '<p>Say with me somebody please :)<br></p>', 'Piter', '2017-05-12 16:45:59'),
(12, 6, '<p> Very comfortable <br></p>', 'Lara', '2017-05-12 16:46:53'),
(13, 6, '<p> My granddaughter.<br></p>', 'Boy', '2017-05-12 16:47:32'),
(14, 9, '<p> Bought these for my 14 year old son and he LOVES them <br></p>', 'Mam', '2017-05-12 16:48:40'),
(15, 9, '<p> Love them <br></p>', 'Joe', '2017-05-12 16:49:02'),
(16, 11, '<p>Nice picture<br></p>', 'Gogi', '2017-05-12 18:59:11'),
(17, 10, '<p>First comment<br></p>', 'Anton', '2017-05-12 19:03:23');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `content`, `author`, `date_add`) VALUES
(5, '<p><img alt="" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BZTJiNGM2NjItNDRiYy00ZjY0LTgwNTItZDBmZGRlODQ4YThkL2ltYWdlXkEyXkFqcGdeQXVyMjY5ODI4NDk@._V1_UX182_CR0,0,182,268_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BZTJiNGM2NjItNDRiYy00ZjY0LTgwNTItZDBmZGRlODQ4YThkL2ltYWdlXkEyXkFqcGdeQXVyMjY5ODI4NDk@._V1_UX182_CR0,0,182,268_AL_.jpg" style="border-width: 0px; border-style: solid; float: left; width: 102px; height: 150px; margin: 5px;"> Three girls are kidnapped by a man with a diagnosed 23 distinct personalities. They must try to escape before the apparent emergence of a frightful new 24th. <br></p>', 'Split', '2017-05-12 16:27:59'),
(6, '<p><img alt="" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BMTk4MjU3MDIzOF5BMl5BanBnXkFtZTgwMjM2MzY2MDI@._V1_UY190_CR0,0,128,190_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BMTk4MjU3MDIzOF5BMl5BanBnXkFtZTgwMjM2MzY2MDI@._V1_UY190_CR0,0,128,190_AL_.jpg" style="margin: 5px; float: left; width: 101px; height: 150px;"> A spacecraft traveling to a distant colony planet and transporting thousands of people has a malfunction in its sleep chambers. As a result, two passengers are awakened 90 years early. <br></p>', 'Passengers', '2017-05-12 16:31:54'),
(7, '<p><img alt="" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwMzI5ODEwNF5BMl5BanBnXkFtZTgwNjAzNjI2MDI@._V1_UY190_CR0,0,128,190_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwMzI5ODEwNF5BMl5BanBnXkFtZTgwNjAzNjI2MDI@._V1_UY190_CR0,0,128,190_AL_.jpg" style="margin: 5px; float: left; width: 101px; height: 150px;"> A team of scientists explore an uncharted island in the Pacific, venturing into the domain of the mighty Kong, and must fight to escape a primal Eden. <br></p>', 'Kong', '2017-05-12 16:33:33'),
(8, '<p><img alt="" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BMjM1OTMxNzUyM15BMl5BanBnXkFtZTgwNjYzMTIzOTE@._V1_UY190_CR0,0,128,190_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BMjM1OTMxNzUyM15BMl5BanBnXkFtZTgwNjYzMTIzOTE@._V1_UY190_CR0,0,128,190_AL_.jpg" style="margin: 5px; float: right; width: 101px; height: 150px;"> A secret government agency recruits some of the most dangerous incarcerated super-villains to form a defensive task force. Their first mission: save the world from the apocalypse. <br></p>', 'Suicide Squad', '2017-05-12 16:34:46'),
(9, '<p><img alt="" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BMjQyODg5Njc4N15BMl5BanBnXkFtZTgwMzExMjE3NzE@._V1_UY190_CR1,0,128,190_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BMjQyODg5Njc4N15BMl5BanBnXkFtZTgwMzExMjE3NzE@._V1_UY190_CR1,0,128,190_AL_.jpg" style="margin: 5px; width: 101px; height: 150px; float: left;"> A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge. <br></p>', 'Deadpool', '2017-05-12 16:35:33'),
(10, '<p><img height="150" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_UY190_CR0,0,128,190_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_UY190_CR0,0,128,190_AL_.jpg" style="margin: 5px; float: left;"> When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it''s up to Earth''s Mightiest Heroes to stop the villainous Ultron from enacting his terrible plans. <br></p>', 'Avengers', '2017-05-12 16:36:51'),
(11, '<p><img alt="" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_UX182_CR0,0,182,268_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_UX182_CR0,0,182,268_AL_.jpg" style="margin: 5px; float: left; width: 110px; height: 150px;"> While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts. <br></p>', 'Doctor', '2017-05-12 16:43:07'),
(12, '<p><img alt="" data-cke-saved-src="https://images-na.ssl-images-amazon.com/images/M/MV5BMjM2NTQ5Mzc2M15BMl5BanBnXkFtZTgwNTcxMDI2NTE@._V1_UX182_CR0,0,182,268_AL_.jpg" src="https://images-na.ssl-images-amazon.com/images/M/MV5BMjM2NTQ5Mzc2M15BMl5BanBnXkFtZTgwNTcxMDI2NTE@._V1_UX182_CR0,0,182,268_AL_.jpg" style="margin: 5px; float: left; width: 102px; height: 150px;"> Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, plan and pull off a heist that will save the world. <br></p>', 'Ant-Man', '2017-05-12 19:09:26');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_com`),
  ADD KEY `i_post` (`post_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id_com` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `key_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
