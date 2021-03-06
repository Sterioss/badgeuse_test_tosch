use badgeuse;



-- -----------------------------------------------------
-- Table reason
-- -----------------------------------------------------

INSERT INTO `reason` (`id_reason`, `nom_reason`) VALUES
(1,	'malade'),
(2,	'stage'),
(3,	'alternance'),
(4,	'autre raison'),
(5,	'formation à distance');




-- -----------------------------------------------------
-- Table roles
-- -----------------------------------------------------

INSERT INTO `roles` (`id_role`, `nom_role`, `permission_role`) VALUES
(1,	'Etudiant',	10384),
(2,	'Intervenant',	10384),
(3,	'Administrateur',	16369);



-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------

INSERT INTO `users` (`id_user`, `prenom_user`, `nom_user`, `pseudo_user`, `mail_user`, `mdp_user`, `mdp_temp_user`, `id_role`) VALUES
(1,	'florent',	'bourgeois',	'pseudo de l\'utilisateur',	'florent.bourgeois@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	3),
(2,	'user',	'admin',	'pseudo de l\'utilisateur',	'admin@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	3),
(3,	'user',	'master',	'pseudo de l\'utilisateur',	'master@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	1),
(4,	'user',	'alternance',	'pseudo de l\'utilisateur',	'alternant@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	1),
(7,	'user',	'present',	'pseudo de l\'utilisateur',	'present@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	1),
(12,'user',	'commun',	'pseudo de l\'utilisateur',	'u@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	1),
(20,'user',	'absent',	'pseudo de l\'utilisateur',	'absent@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	1),
(24,'user',	'justification',	'pseudo de l\'utilisateur',	'just@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	1),
(55,'user',	'stage',	'pseudo de l\'utilisateur',	'stage@uha.fr',	NULL,	'914ad87dce80aa7c9858f26619746013da575f97',	1);



-- -----------------------------------------------------
-- Table groups
-- -----------------------------------------------------

INSERT INTO `user_groups` (`id_group`, `nom_group`) VALUES
(1,	'1ere année'),
(2,	'2e année'),
(3,	'3e année'),
(4,	'4e année'),
(5,	'5e année'),
(6,	'administrateur');


-- -----------------------------------------------------
-- Table user_extend
-- -----------------------------------------------------

INSERT INTO `users_extend` (`id_user`, `id_group`, `card`) VALUES
(1,	6,	'4E911A9D'),
(2,	6,	NULL),
(3,	4,	'9E877397'),
(4,	3,	'CDC8112A'),
(7,	3,	'DDCE8D4C'),
(12,	3,	'2DCEABB7'),
(20,	2,	NULL),
(24,	3,	'ED01ABB7'),


(55,	3,	NULL);







-- -----------------------------------------------------
-- Table absences
-- -----------------------------------------------------


INSERT IGNORE INTO `absences` (`id_absences`, `id_user`, `ref_absence`, `id_status`, `absence_date`, `half_day`, `id_reason`, `comment_absences`, `certificate`, `raison_refus`) VALUES
(1605,	55,	40,	1,	'2019-09-09',	0,	2,	NULL,	NULL,	NULL),
(1606,	55,	40,	1,	'2019-09-18',	0,	2,	NULL,	NULL,	NULL),
(1607,	55,	40,	1,	'2019-09-14',	0,	2,	NULL,	NULL,	NULL),
(1608,	55,	40,	1,	'2019-09-11',	0,	2,	NULL,	NULL,	NULL),
(1609,	55,	40,	1,	'2019-09-12',	0,	2,	NULL,	NULL,	NULL),
(1610,	55,	40,	1,	'2019-09-13',	0,	2,	NULL,	NULL,	NULL),
(1611,	55,	40,	1,	'2019-09-19',	0,	2,	NULL,	NULL,	NULL),
(1612,	55,	40,	1,	'2019-09-10',	0,	2,	NULL,	NULL,	NULL),
(1613,	55,	40,	1,	'2019-09-17',	0,	2,	NULL,	NULL,	NULL),
(1614,	55,	40,	1,	'2019-09-16',	0,	2,	NULL,	NULL,	NULL),
(1615,	55,	40,	1,	'2019-09-15',	0,	2,	NULL,	NULL,	NULL),
(1616,	55,	40,	1,	'2019-09-20',	0,	2,	NULL,	NULL,	NULL),
(1617,	55,	40,	1,	'2019-09-22',	0,	2,	NULL,	NULL,	NULL),
(1618,	55,	40,	1,	'2019-09-21',	0,	2,	NULL,	NULL,	NULL),
(1619,	55,	40,	1,	'2019-09-26',	0,	2,	NULL,	NULL,	NULL),
(1620,	55,	40,	1,	'2019-09-27',	0,	2,	NULL,	NULL,	NULL),
(1621,	55,	40,	1,	'2019-09-25',	0,	2,	NULL,	NULL,	NULL),
(1622,	55,	40,	1,	'2019-09-28',	0,	2,	NULL,	NULL,	NULL),
(1623,	55,	40,	1,	'2019-09-23',	0,	2,	NULL,	NULL,	NULL),
(1624,	55,	40,	1,	'2019-10-01',	0,	2,	NULL,	NULL,	NULL),
(1625,	55,	40,	1,	'2019-09-24',	0,	2,	NULL,	NULL,	NULL),
(1626,	55,	40,	1,	'2019-09-30',	0,	2,	NULL,	NULL,	NULL),
(1627,	55,	40,	1,	'2019-09-29',	0,	2,	NULL,	NULL,	NULL),
(1628,	55,	40,	1,	'2019-10-02',	0,	2,	NULL,	NULL,	NULL),
(1629,	55,	40,	1,	'2019-10-03',	0,	2,	NULL,	NULL,	NULL),
(1630,	55,	40,	1,	'2019-10-04',	0,	2,	NULL,	NULL,	NULL),
(1631,	55,	40,	1,	'2019-10-05',	0,	2,	NULL,	NULL,	NULL),
(1632,	55,	40,	1,	'2019-10-07',	0,	2,	NULL,	NULL,	NULL),
(1633,	55,	40,	1,	'2019-10-08',	0,	2,	NULL,	NULL,	NULL),
(1634,	55,	40,	1,	'2019-10-09',	0,	2,	NULL,	NULL,	NULL),
(1635,	55,	40,	1,	'2019-10-10',	0,	2,	NULL,	NULL,	NULL),
(1636,	55,	40,	1,	'2019-10-11',	0,	2,	NULL,	NULL,	NULL),
(1637,	55,	40,	1,	'2019-10-13',	0,	2,	NULL,	NULL,	NULL),
(1638,	55,	40,	1,	'2019-10-06',	0,	2,	NULL,	NULL,	NULL),
(1639,	55,	40,	1,	'2019-10-14',	0,	2,	NULL,	NULL,	NULL),
(1640,	55,	40,	1,	'2019-10-15',	0,	2,	NULL,	NULL,	NULL),
(1641,	55,	40,	1,	'2019-10-16',	0,	2,	NULL,	NULL,	NULL),
(1642,	55,	40,	1,	'2019-10-17',	0,	2,	NULL,	NULL,	NULL),
(1643,	55,	40,	1,	'2019-10-18',	0,	2,	NULL,	NULL,	NULL),
(1644,	55,	40,	1,	'2019-10-19',	0,	2,	NULL,	NULL,	NULL),
(1645,	55,	40,	1,	'2019-10-20',	0,	2,	NULL,	NULL,	NULL),
(1646,	55,	40,	1,	'2019-10-21',	0,	2,	NULL,	NULL,	NULL),
(1647,	55,	40,	1,	'2019-10-22',	0,	2,	NULL,	NULL,	NULL),
(1648,	55,	40,	1,	'2019-10-23',	0,	2,	NULL,	NULL,	NULL),
(1649,	55,	40,	1,	'2019-10-24',	0,	2,	NULL,	NULL,	NULL),
(1650,	55,	40,	1,	'2019-10-25',	0,	2,	NULL,	NULL,	NULL),
(1651,	55,	40,	1,	'2019-10-26',	0,	2,	NULL,	NULL,	NULL),
(1652,	55,	40,	1,	'2019-10-27',	0,	2,	NULL,	NULL,	NULL),
(1653,	55,	40,	1,	'2019-10-28',	0,	2,	NULL,	NULL,	NULL),
(1654,	55,	40,	1,	'2019-10-12',	0,	2,	NULL,	NULL,	NULL),
(1655,	55,	40,	1,	'2019-10-30',	0,	2,	NULL,	NULL,	NULL),
(1656,	55,	40,	1,	'2019-10-29',	0,	2,	NULL,	NULL,	NULL),
(1657,	55,	40,	1,	'2019-10-31',	0,	2,	NULL,	NULL,	NULL),
(1658,	55,	40,	1,	'2019-11-01',	0,	2,	NULL,	NULL,	NULL),
(1659,	55,	40,	1,	'2019-11-02',	0,	2,	NULL,	NULL,	NULL),
(1660,	55,	40,	1,	'2019-11-04',	0,	2,	NULL,	NULL,	NULL),
(1661,	55,	40,	1,	'2019-11-05',	0,	2,	NULL,	NULL,	NULL),
(1662,	55,	40,	1,	'2019-11-06',	0,	2,	NULL,	NULL,	NULL),
(1663,	55,	40,	1,	'2019-11-07',	0,	2,	NULL,	NULL,	NULL),
(1664,	55,	40,	1,	'2019-11-08',	0,	2,	NULL,	NULL,	NULL),
(1665,	55,	40,	1,	'2019-11-03',	0,	2,	NULL,	NULL,	NULL),
(1666,	55,	40,	1,	'2019-11-10',	0,	2,	NULL,	NULL,	NULL),
(1667,	55,	40,	1,	'2019-11-13',	0,	2,	NULL,	NULL,	NULL),
(1668,	55,	40,	1,	'2019-11-11',	0,	2,	NULL,	NULL,	NULL),
(1669,	55,	40,	1,	'2019-11-12',	0,	2,	NULL,	NULL,	NULL),
(1670,	55,	40,	1,	'2019-11-09',	0,	2,	NULL,	NULL,	NULL),
(1671,	55,	40,	1,	'2019-11-14',	0,	2,	NULL,	NULL,	NULL),
(1672,	55,	40,	1,	'2019-11-15',	0,	2,	NULL,	NULL,	NULL),
(1673,	55,	40,	1,	'2019-11-16',	0,	2,	NULL,	NULL,	NULL),
(1674,	55,	40,	1,	'2019-11-18',	0,	2,	NULL,	NULL,	NULL),
(1675,	55,	40,	1,	'2019-11-19',	0,	2,	NULL,	NULL,	NULL),
(1676,	55,	40,	1,	'2019-11-17',	0,	2,	NULL,	NULL,	NULL),
(1677,	55,	40,	1,	'2019-11-20',	0,	2,	NULL,	NULL,	NULL),
(1678,	55,	40,	1,	'2019-11-21',	0,	2,	NULL,	NULL,	NULL),
(1679,	55,	40,	1,	'2019-11-22',	0,	2,	NULL,	NULL,	NULL),
(1680,	55,	40,	1,	'2019-11-24',	0,	2,	NULL,	NULL,	NULL),
(1681,	55,	40,	1,	'2019-11-25',	0,	2,	NULL,	NULL,	NULL),
(1682,	55,	40,	1,	'2019-11-23',	0,	2,	NULL,	NULL,	NULL),
(1683,	55,	40,	1,	'2019-11-27',	0,	2,	NULL,	NULL,	NULL),
(1684,	55,	40,	1,	'2019-11-28',	0,	2,	NULL,	NULL,	NULL),
(1685,	55,	40,	1,	'2019-11-26',	0,	2,	NULL,	NULL,	NULL),
(1686,	55,	40,	1,	'2019-11-30',	0,	2,	NULL,	NULL,	NULL),
(1687,	55,	40,	1,	'2019-11-29',	0,	2,	NULL,	NULL,	NULL),
(1688,	55,	40,	1,	'2019-12-01',	0,	2,	NULL,	NULL,	NULL),
(1689,	55,	40,	1,	'2019-12-04',	0,	2,	NULL,	NULL,	NULL),
(1690,	55,	40,	1,	'2019-12-03',	0,	2,	NULL,	NULL,	NULL),
(1691,	55,	40,	1,	'2019-12-02',	0,	2,	NULL,	NULL,	NULL),
(1692,	55,	40,	1,	'2019-12-06',	0,	2,	NULL,	NULL,	NULL),
(1693,	55,	40,	1,	'2019-12-07',	0,	2,	NULL,	NULL,	NULL),
(1694,	55,	40,	1,	'2019-12-08',	0,	2,	NULL,	NULL,	NULL),
(1695,	55,	40,	1,	'2019-12-05',	0,	2,	NULL,	NULL,	NULL),
(1696,	55,	40,	1,	'2019-12-09',	0,	2,	NULL,	NULL,	NULL),
(1697,	55,	40,	1,	'2019-12-10',	0,	2,	NULL,	NULL,	NULL),
(1698,	55,	40,	1,	'2019-12-12',	0,	2,	NULL,	NULL,	NULL),
(1699,	55,	40,	1,	'2019-12-11',	0,	2,	NULL,	NULL,	NULL),
(1700,	55,	40,	1,	'2019-12-13',	0,	2,	NULL,	NULL,	NULL),
(1701,	55,	40,	1,	'2019-12-14',	0,	2,	NULL,	NULL,	NULL),
(1702,	55,	40,	1,	'2019-12-15',	0,	2,	NULL,	NULL,	NULL),
(1703,	55,	40,	1,	'2019-12-16',	0,	2,	NULL,	NULL,	NULL),
(1704,	55,	40,	1,	'2019-12-17',	0,	2,	NULL,	NULL,	NULL),
(1705,	55,	40,	1,	'2019-12-18',	0,	2,	NULL,	NULL,	NULL),
(1706,	55,	40,	1,	'2019-12-20',	0,	2,	NULL,	NULL,	NULL),
(1707,	55,	40,	1,	'2019-12-19',	0,	2,	NULL,	NULL,	NULL),
(1708,	55,	40,	1,	'2019-12-22',	0,	2,	NULL,	NULL,	NULL),
(1709,	55,	40,	1,	'2019-12-23',	0,	2,	NULL,	NULL,	NULL),
(1710,	55,	40,	1,	'2019-12-24',	0,	2,	NULL,	NULL,	NULL),
(1711,	55,	40,	1,	'2019-12-25',	0,	2,	NULL,	NULL,	NULL),
(1712,	55,	40,	1,	'2019-12-21',	0,	2,	NULL,	NULL,	NULL),
(1713,	55,	40,	1,	'2019-12-26',	0,	2,	NULL,	NULL,	NULL),
(1714,	55,	40,	1,	'2019-12-27',	0,	2,	NULL,	NULL,	NULL),
(1715,	55,	40,	1,	'2019-12-28',	0,	2,	NULL,	NULL,	NULL),
(1716,	55,	40,	1,	'2019-12-29',	0,	2,	NULL,	NULL,	NULL),
(1717,	55,	40,	1,	'2019-12-30',	0,	2,	NULL,	NULL,	NULL),
(1718,	55,	40,	1,	'2019-12-31',	0,	2,	NULL,	NULL,	NULL),
(1719,	55,	40,	1,	'2020-01-01',	0,	2,	NULL,	NULL,	NULL),
(1720,	55,	40,	1,	'2020-01-03',	0,	2,	NULL,	NULL,	NULL),
(1721,	55,	40,	1,	'2020-01-04',	0,	2,	NULL,	NULL,	NULL),
(1722,	55,	40,	1,	'2020-01-02',	0,	2,	NULL,	NULL,	NULL),
(1723,	55,	40,	1,	'2020-01-06',	0,	2,	NULL,	NULL,	NULL),
(1724,	55,	40,	1,	'2020-01-07',	0,	2,	NULL,	NULL,	NULL),
(1725,	55,	40,	1,	'2020-01-05',	0,	2,	NULL,	NULL,	NULL),
(1726,	55,	40,	1,	'2020-01-08',	0,	2,	NULL,	NULL,	NULL),
(1727,	55,	40,	1,	'2020-01-09',	0,	2,	NULL,	NULL,	NULL),
(1728,	55,	40,	1,	'2020-01-10',	0,	2,	NULL,	NULL,	NULL),
(1729,	55,	40,	1,	'2020-01-11',	0,	2,	NULL,	NULL,	NULL),
(1730,	55,	40,	1,	'2020-01-12',	0,	2,	NULL,	NULL,	NULL),
(1731,	55,	40,	1,	'2020-01-13',	0,	2,	NULL,	NULL,	NULL),
(1732,	55,	40,	1,	'2020-01-14',	0,	2,	NULL,	NULL,	NULL),
(1733,	55,	40,	1,	'2020-01-16',	0,	2,	NULL,	NULL,	NULL),
(1734,	55,	40,	1,	'2020-01-15',	0,	2,	NULL,	NULL,	NULL),
(1735,	55,	40,	1,	'2020-01-18',	0,	2,	NULL,	NULL,	NULL),
(1736,	55,	40,	1,	'2020-01-19',	0,	2,	NULL,	NULL,	NULL),
(1737,	55,	40,	1,	'2020-01-20',	0,	2,	NULL,	NULL,	NULL),
(1738,	55,	40,	1,	'2020-01-21',	0,	2,	NULL,	NULL,	NULL),
(1739,	55,	40,	1,	'2020-01-17',	0,	2,	NULL,	NULL,	NULL),
(1740,	55,	40,	1,	'2020-01-22',	0,	2,	NULL,	NULL,	NULL),
(1741,	55,	40,	1,	'2020-01-23',	0,	2,	NULL,	NULL,	NULL),
(1742,	55,	40,	1,	'2020-01-24',	0,	2,	NULL,	NULL,	NULL),
(1743,	55,	40,	1,	'2020-01-26',	0,	2,	NULL,	NULL,	NULL),
(1744,	55,	40,	1,	'2020-01-27',	0,	2,	NULL,	NULL,	NULL),
(1745,	55,	40,	1,	'2020-01-25',	0,	2,	NULL,	NULL,	NULL),
(1746,	55,	40,	1,	'2020-01-29',	0,	2,	NULL,	NULL,	NULL),
(1747,	55,	40,	1,	'2020-01-30',	0,	2,	NULL,	NULL,	NULL),
(1748,	55,	40,	1,	'2020-01-31',	0,	2,	NULL,	NULL,	NULL),
(1749,	55,	40,	1,	'2020-01-28',	0,	2,	NULL,	NULL,	NULL),
(1750,	55,	40,	1,	'2020-02-01',	0,	2,	NULL,	NULL,	NULL),
(1751,	55,	40,	1,	'2020-02-02',	0,	2,	NULL,	NULL,	NULL),
(1752,	55,	40,	1,	'2020-02-03',	0,	2,	NULL,	NULL,	NULL),
(1753,	55,	40,	1,	'2020-02-04',	0,	2,	NULL,	NULL,	NULL),
(1754,	55,	40,	1,	'2020-02-05',	0,	2,	NULL,	NULL,	NULL),
(1755,	55,	40,	1,	'2020-02-06',	0,	2,	NULL,	NULL,	NULL),
(1756,	55,	40,	1,	'2020-02-08',	0,	2,	NULL,	NULL,	NULL),
(1757,	55,	40,	1,	'2020-02-09',	0,	2,	NULL,	NULL,	NULL),
(1758,	55,	40,	1,	'2020-02-12',	0,	2,	NULL,	NULL,	NULL),
(1759,	55,	40,	1,	'2020-02-07',	0,	2,	NULL,	NULL,	NULL),
(1760,	55,	40,	1,	'2020-02-10',	0,	2,	NULL,	NULL,	NULL),
(1761,	55,	40,	1,	'2020-02-11',	0,	2,	NULL,	NULL,	NULL),
(1762,	55,	40,	1,	'2020-02-13',	0,	2,	NULL,	NULL,	NULL),
(1763,	55,	40,	1,	'2020-02-14',	0,	2,	NULL,	NULL,	NULL),
(1768,	1,	44,	1,	'2019-09-20',	0,	4,	NULL,	NULL,	NULL),
(1771,	1,	47,	1,	'2019-09-24',	2,	4,	NULL,	NULL,	NULL),
(1777,	3,	53,	1,	'2019-09-23',	0,	5,	NULL,	NULL,	NULL),
(1778,	3,	53,	1,	'2019-09-24',	0,	5,	NULL,	NULL,	NULL),
(1798,	4,	71,	0,	'2019-09-26',	1,	4,	'J\'ai oublié de badger en arrivant le matin. :\'(',	NULL,	NULL),
(1806,	3,	79,	1,	'2019-09-30',	0,	5,	NULL,	NULL,	NULL),
(1807,	7,	80,	1,	'2019-09-30',	1,	4,	'Présentation du projet Alsace à l\'écomusé.',	NULL,	NULL),
(1813,	4,	86,	1,	'2019-10-02',	0,	3,	NULL,	NULL,	NULL),
(1814,	4,	86,	1,	'2019-10-01',	0,	3,	NULL,	NULL,	NULL),
(1815,	4,	86,	1,	'2019-10-10',	0,	3,	NULL,	NULL,	NULL),
(1816,	4,	86,	1,	'2019-10-11',	0,	3,	NULL,	NULL,	NULL),
(1817,	4,	86,	1,	'2019-10-05',	0,	3,	NULL,	NULL,	NULL),
(1818,	4,	86,	1,	'2019-10-04',	0,	3,	NULL,	NULL,	NULL),
(1819,	4,	86,	1,	'2019-10-03',	0,	3,	NULL,	NULL,	NULL),
(1820,	4,	86,	1,	'2019-10-06',	0,	3,	NULL,	NULL,	NULL),
(1821,	4,	86,	1,	'2019-10-12',	0,	3,	NULL,	NULL,	NULL),
(1822,	4,	86,	1,	'2019-10-09',	0,	3,	NULL,	NULL,	NULL),
(1823,	4,	86,	1,	'2019-10-07',	0,	3,	NULL,	NULL,	NULL),
(1824,	4,	86,	1,	'2019-10-08',	0,	3,	NULL,	NULL,	NULL),
(1825,	4,	86,	1,	'2019-10-13',	0,	3,	NULL,	NULL,	NULL),
(1826,	4,	86,	1,	'2019-10-14',	0,	3,	NULL,	NULL,	NULL),
(1827,	4,	86,	1,	'2019-10-16',	0,	3,	NULL,	NULL,	NULL),
(1828,	4,	86,	1,	'2019-10-18',	0,	3,	NULL,	NULL,	NULL),
(1829,	4,	86,	1,	'2019-10-22',	0,	3,	NULL,	NULL,	NULL),
(1830,	4,	86,	1,	'2019-10-21',	0,	3,	NULL,	NULL,	NULL),
(1831,	4,	86,	1,	'2019-10-20',	0,	3,	NULL,	NULL,	NULL),
(1832,	4,	86,	1,	'2019-10-17',	0,	3,	NULL,	NULL,	NULL),
(1833,	4,	86,	1,	'2019-10-15',	0,	3,	NULL,	NULL,	NULL),
(1834,	4,	86,	1,	'2019-10-19',	0,	3,	NULL,	NULL,	NULL),
(1835,	4,	86,	1,	'2019-10-23',	0,	3,	NULL,	NULL,	NULL),
(1836,	4,	86,	1,	'2019-10-24',	0,	3,	NULL,	NULL,	NULL),
(1837,	4,	86,	1,	'2019-10-25',	0,	3,	NULL,	NULL,	NULL),
(1838,	4,	86,	1,	'2019-10-26',	0,	3,	NULL,	NULL,	NULL),
(1839,	4,	86,	1,	'2019-10-27',	0,	3,	NULL,	NULL,	NULL),
(1840,	4,	86,	1,	'2019-10-28',	0,	3,	NULL,	NULL,	NULL),
(1841,	4,	86,	1,	'2019-10-29',	0,	3,	NULL,	NULL,	NULL),
(1842,	4,	86,	1,	'2019-10-30',	0,	3,	NULL,	NULL,	NULL),
(1843,	4,	86,	1,	'2019-10-31',	0,	3,	NULL,	NULL,	NULL),
(1862,	24,	101,	1,	'2019-10-02',	2,	4,	'Rendez-vous au parc expo, pour finalisé le projet hector',	NULL,	NULL),
(1863,	24,	102,	1,	'2019-10-01',	2,	4,	'Rendez-vous au parc expo, pour finalisé le projet hector',	NULL,	NULL),
(1864,	24,	103,	1,	'2019-09-25',	0,	1,	'Arrêt maladie pour la période du 25/09 au 27/09 inclus',	NULL,	NULL),
(1865,	24,	103,	1,	'2019-09-26',	0,	1,	'Arrêt maladie pour la période du 25/09 au 27/09 inclus',	NULL,	NULL),
(1866,	24,	103,	1,	'2019-09-27',	0,	1,	'Arrêt maladie pour la période du 25/09 au 27/09 inclus',	NULL,	NULL),
(1867,	24,	104,	0,	'2019-09-19',	0,	4,	'Rendez-vous médical en fin de matinée + installation du pc',	NULL,	NULL),
(1871,	24,	106,	1,	'2019-10-03',	0,	4,	'J\'étais présent tout la journée et j\'ai pointé ce matin sauf erreur de ma part, mais cela n\'a pas été pris en compte, ou peut-être que j\'ai cliqué à côté.',	NULL,	NULL),
(1897,	12,	128,	1,	'2019-10-11',	0,	4,	'Entretien pour la recherche de stage',	NULL,	NULL),
(1898,	3,	129,	1,	'2019-10-10',	0,	2,	NULL,	NULL,	NULL),
(1899,	3,	129,	1,	'2019-10-02',	0,	2,	NULL,	NULL,	NULL),
(1900,	3,	129,	1,	'2019-10-03',	0,	2,	NULL,	NULL,	NULL),
(1901,	3,	129,	1,	'2019-10-01',	0,	2,	NULL,	NULL,	NULL),
(1902,	3,	129,	1,	'2019-10-12',	0,	2,	NULL,	NULL,	NULL),
(1903,	3,	129,	1,	'2019-10-13',	0,	2,	NULL,	NULL,	NULL),
(1904,	3,	129,	1,	'2019-10-14',	0,	2,	NULL,	NULL,	NULL),
(1905,	3,	129,	1,	'2019-10-06',	0,	2,	NULL,	NULL,	NULL),
(1906,	3,	129,	1,	'2019-10-11',	0,	2,	NULL,	NULL,	NULL),
(1907,	3,	129,	1,	'2019-10-05',	0,	2,	NULL,	NULL,	NULL),
(1908,	3,	129,	1,	'2019-10-04',	0,	2,	NULL,	NULL,	NULL),
(1909,	3,	129,	1,	'2019-10-09',	0,	2,	NULL,	NULL,	NULL),
(1910,	3,	129,	1,	'2019-10-07',	0,	2,	NULL,	NULL,	NULL),
(1911,	3,	129,	1,	'2019-10-15',	0,	2,	NULL,	NULL,	NULL),
(1912,	3,	129,	1,	'2019-10-16',	0,	2,	NULL,	NULL,	NULL),
(1913,	3,	129,	1,	'2019-10-08',	0,	2,	NULL,	NULL,	NULL),
(1914,	3,	129,	1,	'2019-10-19',	0,	2,	NULL,	NULL,	NULL),
(1915,	3,	129,	1,	'2019-10-20',	0,	2,	NULL,	NULL,	NULL),
(1916,	3,	129,	1,	'2019-10-18',	0,	2,	NULL,	NULL,	NULL),
(1917,	3,	129,	1,	'2019-10-21',	0,	2,	NULL,	NULL,	NULL),
(1918,	3,	129,	1,	'2019-10-23',	0,	2,	NULL,	NULL,	NULL),
(1919,	3,	129,	1,	'2019-10-24',	0,	2,	NULL,	NULL,	NULL),
(1920,	3,	129,	1,	'2019-10-26',	0,	2,	NULL,	NULL,	NULL),
(1921,	3,	129,	1,	'2019-10-28',	0,	2,	NULL,	NULL,	NULL),
(1922,	3,	129,	1,	'2019-10-17',	0,	2,	NULL,	NULL,	NULL),
(1923,	3,	129,	1,	'2019-10-27',	0,	2,	NULL,	NULL,	NULL),
(1924,	3,	129,	1,	'2019-10-22',	0,	2,	NULL,	NULL,	NULL),
(1925,	3,	129,	1,	'2019-10-25',	0,	2,	NULL,	NULL,	NULL),
(1926,	3,	129,	1,	'2019-10-31',	0,	2,	NULL,	NULL,	NULL),
(1927,	3,	129,	1,	'2019-10-29',	0,	2,	NULL,	NULL,	NULL),
(1928,	3,	129,	1,	'2019-10-30',	0,	2,	NULL,	NULL,	NULL),
(2012,	24,	205,	1,	'2019-10-17',	0,	4,	'Forum Emploi',	NULL,	NULL),
(2013,	24,	206,	1,	'2019-10-09',	0,	4,	'casser',	NULL,	NULL),
(2014,	24,	207,	1,	'2019-10-10',	0,	4,	'casser',	NULL,	NULL),
(2015,	24,	208,	1,	'2019-10-11',	0,	4,	'casser',	NULL,	NULL),
(2016,	24,	209,	1,	'2019-10-04',	0,	4,	'casser',	NULL,	NULL),
(2245,	1,	256,	0,	'2019-10-25',	0,	2,	'pouet',	NULL,	NULL),
(2278,	1,	287,	1,	'2019-11-01',	0,	4,	'UHA 4.0 Fermée',	NULL,	NULL),
(2279,	3,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2281,	7,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2283,	12,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2289,	20,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2292,	24,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2310,	55,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2340,	1,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2342,	4,	288,	1,	'2019-11-01',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2406,	3,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2408,	7,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2410,	12,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2416,	20,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2419,	24,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2437,	55,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2467,	1,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2469,	4,	288,	1,	'2019-10-29',	0,	4,	'UHA 4.0 fermée',	NULL,	NULL),
(2667,	3,	296,	1,	'2019-11-04',	0,	5,	NULL,	NULL,	NULL),
(2679,	7,	308,	2,	'2019-11-06',	2,	4,	'J\'ai un rdv à la banque à 15h',	NULL,	NULL);



-- -----------------------------------------------------
-- Table badger
-- -----------------------------------------------------


INSERT INTO `badger` (`id_point`, `id_user`, `start_point`, `end_point`, `duration`) VALUES
(1216,	1,	'2019-09-09 15:00:33',	NULL,	NULL),
(1217,	4,	'2019-09-10 06:24:42',	NULL,	NULL),
(1224,	1,	'2019-09-10 11:17:05',	NULL,	NULL),
(1231,	1,	'2019-09-11 07:46:06',	'2019-09-11 08:58:51',	'01:12:45'),
(1232,	1,	'2019-09-11 08:58:51',	'2019-09-11 09:00:19',	'00:01:28'),
(1233,	1,	'2019-09-11 09:00:19',	'2019-09-11 09:18:35',	'00:18:16'),
(1234,	1,	'2019-09-11 09:18:35',	'2019-09-11 09:18:55',	'00:00:20'),
(1235,	1,	'2019-09-11 09:18:55',	'2019-09-11 09:32:34',	'00:13:39'),
(1236,	1,	'2019-09-11 09:32:34',	'2019-09-11 10:17:05',	'00:44:31'),
(1237,	4,	'2019-09-11 09:34:29',	'2019-09-11 14:22:02',	'04:47:33'),
(1238,	1,	'2019-09-11 10:17:23',	'2019-09-11 10:17:57',	'00:00:34'),
(1239,	1,	'2019-09-11 10:20:27',	'2019-09-11 10:20:59',	'00:00:32'),
(1240,	1,	'2019-09-11 10:21:02',	'2019-09-11 10:29:51',	'00:08:49'),
(1241,	1,	'2019-09-11 10:29:51',	'2019-09-11 14:05:34',	'03:35:43'),
(1242,	1,	'2019-09-11 14:21:04',	'2019-09-11 14:21:13',	'00:00:09'),
(1243,	1,	'2019-09-11 14:21:45',	'2019-09-11 14:21:45',	'00:00:00'),
(1244,	1,	'2019-09-11 14:23:23',	'2019-09-11 14:23:23',	'00:00:00'),
(1245,	4,	'2019-09-11 14:23:59',	NULL,	NULL),
(1246,	1,	'2019-09-11 14:24:05',	'2019-09-11 14:24:05',	'00:00:00'),
(1247,	1,	'2019-09-11 14:24:53',	'2019-09-11 14:24:54',	'00:00:01'),
(1248,	1,	'2019-09-11 16:29:50',	'2019-09-11 16:29:56',	'00:00:06'),
(1249,	1,	'2019-09-11 16:33:07',	'2019-09-11 16:33:11',	'00:00:04'),
(1250,	1,	'2019-09-11 16:33:55',	'2019-09-11 16:34:16',	'00:00:21'),
(1251,	1,	'2019-09-11 16:34:28',	'2019-09-11 16:34:28',	'00:00:00'),
(1252,	1,	'2019-09-11 16:35:43',	'2019-09-11 16:35:48',	'00:00:05'),
(1253,	1,	'2019-09-11 16:35:49',	'2019-09-11 16:36:44',	'00:00:55'),
(1254,	1,	'2019-09-11 16:38:30',	'2019-09-11 16:38:35',	'00:00:05'),
(1255,	1,	'2019-09-11 16:38:35',	NULL,	NULL),
(1259,	4,	'2019-09-12 08:39:04',	NULL,	NULL),
(1266,	1,	'2019-09-12 13:18:02',	'2019-09-12 13:33:03',	'00:15:01'),
(1267,	1,	'2019-09-12 13:33:18',	'2019-09-12 13:54:47',	'00:21:29'),
(1268,	1,	'2019-09-12 13:55:10',	'2019-09-12 13:55:27',	'00:00:17'),
(1269,	1,	'2019-09-12 15:27:42',	'2019-09-12 15:48:03',	'00:20:21'),
(1270,	1,	'2019-09-12 15:48:19',	'2019-09-12 15:49:34',	'00:01:15'),
(1271,	1,	'2019-09-12 15:49:45',	'2019-09-12 16:36:05',	'00:46:20'),
(1272,	1,	'2019-09-12 16:36:30',	'2019-09-12 16:42:28',	'00:05:58'),
(1275,	1,	'2019-09-12 17:04:45',	NULL,	NULL),
(1277,	4,	'2019-09-13 08:31:12',	'2019-09-13 13:35:44',	'05:04:32'),
(1282,	1,	'2019-09-13 08:52:51',	'2019-09-13 08:53:05',	'00:00:14'),
(1283,	1,	'2019-09-13 08:53:11',	'2019-09-13 12:16:53',	'03:23:42'),
(1286,	3,	'2019-09-13 08:56:57',	NULL,	NULL),
(1305,	1,	'2019-09-13 12:18:00',	'2019-09-13 12:18:30',	'00:00:30'),
(1307,	4,	'2019-09-13 13:36:08',	'2019-09-13 17:00:07',	'03:23:59'),
(1308,	1,	'2019-09-13 13:43:34',	'2019-09-13 15:12:25',	'01:28:51'),
(1309,	1,	'2019-09-13 15:12:48',	'2019-09-13 16:01:15',	'00:48:27'),
(1310,	1,	'2019-09-13 16:01:34',	'2019-09-13 16:41:21',	'00:39:47'),
(1316,	4,	'2019-09-16 09:13:19',	'2019-09-16 17:11:16',	'06:57:57'),
(1318,	1,	'2019-09-16 13:19:12',	'2019-09-16 17:11:22',	'03:52:10'),
(1319,	4,	'2019-09-17 08:29:45',	'2019-09-17 16:56:07',	'07:26:22'),
(1327,	1,	'2019-09-17 08:49:55',	'2019-09-17 17:09:01',	'07:19:06'),
(1343,	3,	'2019-09-17 09:21:34',	'2019-09-17 17:22:49',	'07:01:15'),
(1348,	4,	'2019-09-18 08:22:11',	'2019-09-18 17:01:51',	'07:39:40'),
(1358,	1,	'2019-09-18 08:48:17',	'2019-09-18 16:41:00',	'06:52:43'),
(1369,	3,	'2019-09-18 09:01:39',	'2019-09-18 17:44:10',	'07:42:31'),
(1391,	1,	'2019-09-19 08:55:20',	'2019-09-19 09:00:22',	'00:05:02'),
(1393,	4,	'2019-09-19 08:59:24',	'2019-09-19 16:47:52',	'06:48:28'),
(1394,	1,	'2019-09-19 09:00:30',	'2019-09-19 16:23:55',	'06:23:25'),
(1396,	7,	'2019-09-19 09:01:34',	'2019-09-19 17:01:10',	'06:59:36'),
(1405,	3,	'2019-09-19 09:09:49',	'2019-09-19 17:03:04',	'06:53:15'),
(1422,	12,	'2019-09-19 11:25:27',	'2019-09-19 16:45:43',	'04:20:16'),
(1430,	24,	'2019-09-19 14:16:25',	'2019-09-19 17:12:42',	'02:56:17'),
(1445,	4,	'2019-09-20 08:57:38',	'2019-09-20 16:39:44',	'06:42:06'),
(1446,	24,	'2019-09-20 08:59:52',	'2019-09-20 17:18:45',	'07:18:53'),
(1449,	12,	'2019-09-20 09:03:17',	NULL,	NULL),
(1459,	7,	'2019-09-20 09:10:58',	NULL,	NULL),
(1468,	3,	'2019-09-20 11:50:09',	'2019-09-20 16:13:15',	'03:23:06'),
(1475,	1,	'2019-09-20 15:58:55',	'2019-09-20 17:09:48',	'01:10:53'),
(1479,	4,	'2019-09-23 08:06:13',	'2019-09-23 16:51:34',	'08:45:21'),
(1481,	7,	'2019-09-23 08:28:16',	'2019-09-23 17:55:27',	'08:27:11'),
(1484,	24,	'2019-09-23 08:39:56',	'2019-09-23 16:48:07',	'08:08:11'),
(1486,	12,	'2019-09-23 08:42:00',	'2019-09-23 08:50:07',	'00:08:07'),
(1489,	12,	'2019-09-23 08:50:12',	'2019-09-23 16:15:41',	'07:25:29'),
(1495,	1,	'2019-09-23 09:27:26',	NULL,	NULL),
(1500,	3,	'2019-09-23 11:47:15',	'2019-09-23 11:51:48',	'00:04:33'),
(1505,	7,	'2019-09-24 08:06:29',	'2019-09-24 18:00:56',	'08:54:27'),
(1509,	4,	'2019-09-24 08:28:03',	'2019-09-24 16:51:16',	'07:23:13'),
(1528,	3,	'2019-09-24 09:04:27',	'2019-09-24 16:59:46',	'06:55:19'),
(1532,	24,	'2019-09-24 09:07:56',	'2019-09-24 17:25:39',	'07:17:43'),
(1533,	12,	'2019-09-24 09:08:29',	'2019-09-24 16:18:06',	'06:09:37'),
(1542,	1,	'2019-09-24 09:57:02',	NULL,	NULL),
(1549,	7,	'2019-09-25 08:07:15',	'2019-09-25 17:57:57',	'08:50:42'),
(1550,	4,	'2019-09-25 08:07:49',	'2019-09-25 16:40:47',	'07:32:58'),
(1568,	3,	'2019-09-25 08:59:40',	'2019-09-25 19:04:01',	'09:04:21'),
(1586,	12,	'2019-09-25 09:57:56',	'2019-09-25 10:02:26',	'00:04:30'),
(1587,	12,	'2019-09-25 10:02:53',	'2019-09-25 16:15:28',	'05:12:35'),
(1591,	1,	'2019-09-25 12:06:06',	'2019-09-25 12:06:34',	'00:00:28'),
(1592,	1,	'2019-09-25 12:06:47',	NULL,	NULL),
(1597,	7,	'2019-09-26 08:04:57',	'2019-09-26 18:08:06',	'09:03:09'),
(1614,	3,	'2019-09-26 08:55:58',	NULL,	NULL),
(1617,	1,	'2019-09-26 09:01:42',	NULL,	NULL),
(1632,	12,	'2019-09-26 10:44:32',	'2019-09-26 16:18:37',	'04:34:05'),
(1636,	4,	'2019-09-26 14:07:47',	'2019-09-26 16:54:57',	'02:47:10'),
(1643,	7,	'2019-09-27 08:06:16',	'2019-09-27 16:35:20',	'07:29:04'),
(1655,	12,	'2019-09-27 08:49:18',	'2019-09-27 16:20:53',	'06:31:35'),
(1665,	3,	'2019-09-27 08:59:52',	NULL,	NULL),
(1674,	4,	'2019-09-27 09:19:14',	'2019-09-27 16:37:25',	'06:18:11'),
(1690,	4,	'2019-09-30 08:31:29',	'2019-09-30 16:59:42',	'07:28:13'),
(1698,	24,	'2019-09-30 09:16:28',	'2019-09-30 18:11:26',	'07:54:58'),
(1702,	7,	'2019-09-30 11:52:10',	'2019-09-30 17:36:22',	'04:44:12'),
(1708,	7,	'2019-10-01 08:15:50',	'2019-10-01 18:04:47',	'08:48:57'),
(1734,	24,	'2019-10-01 09:27:27',	NULL,	NULL),
(1738,	12,	'2019-10-01 10:06:06',	'2019-10-01 16:20:22',	'05:14:16'),
(1742,	1,	'2019-10-01 16:11:08',	NULL,	NULL),
(1745,	7,	'2019-10-02 08:11:44',	'2019-10-02 17:24:05',	'08:12:21'),
(1759,	12,	'2019-10-02 08:53:24',	'2019-10-02 16:19:44',	'06:26:20'),
(1776,	24,	'2019-10-02 10:00:19',	NULL,	NULL),
(1814,	12,	'2019-10-03 10:06:23',	'2019-10-03 16:18:13',	'05:11:50'),
(1815,	24,	'2019-10-03 16:46:21',	'2019-10-03 17:32:38',	'00:46:17'),
(1849,	12,	'2019-10-04 09:59:00',	NULL,	NULL),
(1855,	24,	'2019-10-04 11:53:18',	'2019-10-04 16:07:17',	'03:13:59'),
(1865,	7,	'2019-10-07 09:02:13',	'2019-10-07 17:27:23',	'07:25:10'),
(1867,	24,	'2019-10-07 09:24:57',	'2019-10-07 17:49:09',	'07:24:12'),
(1874,	12,	'2019-10-07 11:40:15',	'2019-10-07 16:17:21',	'03:37:06'),
(1875,	1,	'2019-10-07 15:10:51',	'2019-10-07 15:11:03',	'00:00:12'),
(1891,	7,	'2019-10-08 08:47:09',	'2019-10-08 17:54:11',	'08:07:02'),
(1919,	12,	'2019-10-08 09:48:15',	'2019-10-08 16:16:39',	'05:28:24'),
(1920,	1,	'2019-10-08 09:52:42',	'2019-10-08 09:52:52',	'00:00:10'),
(1922,	24,	'2019-10-08 10:04:15',	'2019-10-08 17:58:50',	'06:54:35'),
(1924,	1,	'2019-10-08 10:06:29',	NULL,	NULL),
(1946,	7,	'2019-10-09 08:45:16',	'2019-10-09 17:50:44',	'08:05:28'),
(1970,	1,	'2019-10-09 09:19:17',	NULL,	NULL),
(1974,	12,	'2019-10-09 09:48:39',	'2019-10-09 16:19:16',	'05:30:37'),
(1976,	24,	'2019-10-09 10:26:43',	NULL,	NULL),
(1981,	7,	'2019-10-10 08:06:41',	'2019-10-10 18:20:47',	'09:14:06'),
(2020,	1,	'2019-10-10 09:27:02',	'2019-10-10 17:16:30',	'06:49:28'),
(2024,	12,	'2019-10-10 09:53:32',	NULL,	NULL),
(2034,	24,	'2019-10-10 18:26:41',	NULL,	NULL),
(2035,	7,	'2019-10-11 08:10:29',	'2019-10-11 16:55:56',	'07:45:27'),
(2054,	1,	'2019-10-11 08:52:37',	NULL,	NULL),
(2075,	24,	'2019-10-11 09:51:56',	NULL,	NULL),
(2086,	7,	'2019-10-14 08:47:53',	'2019-10-14 18:23:35',	'08:35:42'),
(2093,	24,	'2019-10-14 09:30:42',	'2019-10-14 18:02:04',	'07:31:22'),
(2096,	12,	'2019-10-14 09:55:16',	'2019-10-14 16:18:56',	'05:23:40'),
(2108,	7,	'2019-10-15 08:36:21',	'2019-10-15 18:07:51',	'08:31:30'),
(2120,	24,	'2019-10-15 08:55:40',	'2019-10-15 17:22:58',	'07:27:18'),
(2139,	12,	'2019-10-15 09:47:28',	NULL,	NULL),
(2147,	24,	'2019-10-16 08:00:02',	'2019-10-16 18:05:13',	'09:05:11'),
(2155,	7,	'2019-10-16 08:36:51',	'2019-10-16 18:12:50',	'08:35:59'),
(2190,	1,	'2019-10-16 15:26:47',	NULL,	NULL),
(2191,	12,	'2019-10-16 16:19:05',	NULL,	NULL),
(2196,	7,	'2019-10-17 08:37:08',	'2019-10-17 17:51:00',	'08:13:52'),
(2231,	12,	'2019-10-17 16:15:01',	NULL,	NULL),
(2240,	7,	'2019-10-18 08:38:28',	NULL,	NULL),
(2254,	1,	'2019-10-18 08:58:39',	NULL,	NULL),
(2257,	24,	'2019-10-18 09:01:04',	'2019-10-18 17:32:07',	'07:31:03'),
(2270,	12,	'2019-10-18 09:51:51',	'2019-10-18 16:18:10',	'05:26:19'),
(2280,	7,	'2019-10-21 08:35:26',	'2019-10-21 17:00:13',	'07:24:47'),
(2289,	24,	'2019-10-21 09:33:00',	'2019-10-21 17:28:52',	'06:55:52'),
(2295,	7,	'2019-10-22 08:04:41',	'2019-10-22 17:51:29',	'08:46:48'),
(2324,	24,	'2019-10-22 09:11:18',	'2019-10-22 17:12:25',	'07:01:07'),
(2338,	7,	'2019-10-23 08:03:54',	'2019-10-23 18:10:19',	'09:06:25'),
(2377,	12,	'2019-10-23 09:56:28',	'2019-10-23 16:10:52',	'05:14:24'),
(2382,	24,	'2019-10-23 11:06:56',	'2019-10-23 18:32:01',	'06:25:05'),
(2383,	1,	'2019-10-23 13:22:57',	NULL,	NULL),
(2398,	7,	'2019-10-24 08:39:39',	NULL,	NULL),
(2423,	24,	'2019-10-24 09:55:21',	'2019-10-24 17:18:24',	'06:23:03'),
(2425,	12,	'2019-10-24 10:03:32',	'2019-10-24 17:18:16',	'06:14:44'),
(2432,	1,	'2019-10-24 15:48:43',	NULL,	NULL),
(2441,	7,	'2019-10-25 08:36:52',	'2019-10-25 17:19:18',	'07:42:26'),
(2477,	12,	'2019-10-25 11:00:54',	'2019-10-25 16:16:27',	'04:15:33'),
(2478,	24,	'2019-10-25 11:04:13',	'2019-10-25 18:04:54',	'06:00:41'),
(2486,	7,	'2019-10-28 08:44:03',	'2019-10-28 17:57:25',	'08:13:22'),
(2491,	24,	'2019-10-28 09:22:53',	'2019-10-28 18:06:57',	'07:44:04'),
(2505,	7,	'2019-10-30 08:19:39',	'2019-10-30 18:11:48',	'08:52:09'),
(2534,	24,	'2019-10-30 09:12:49',	NULL,	NULL),
(2552,	7,	'2019-10-31 08:01:08',	NULL,	NULL),
(2558,	24,	'2019-10-31 08:33:11',	'2019-10-31 17:19:34',	'07:46:23'),
(2586,	12,	'2019-10-31 10:05:49',	NULL,	NULL),
(2593,	1,	'2019-11-01 22:43:19',	'2019-11-01 17:00:00',	'07:00:00'),
(2594,	4,	'2019-11-04 08:03:51',	'2019-11-04 16:40:32',	'07:36:41'),
(2597,	7,	'2019-11-04 08:28:28',	'2019-11-04 17:08:19',	'07:39:51'),
(2616,	24,	'2019-11-04 09:50:40',	'2019-11-04 17:55:04',	'07:04:24'),
(2620,	12,	'2019-11-04 16:18:47',	NULL,	NULL),
(2621,	7,	'2019-11-05 08:05:54',	NULL,	NULL),
(2627,	4,	'2019-11-05 08:29:32',	NULL,	NULL),
(2664,	3,	'2019-11-05 09:34:52',	NULL,	NULL);





