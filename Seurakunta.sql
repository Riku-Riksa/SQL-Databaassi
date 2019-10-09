
-- ************************************** `Alueet`

CREATE TABLE IF NOT EXISTS `Alueet`
(
 `Alue koodi` tinyint NOT NULL ,
 `Alue nimi`  varchar(45) NOT NULL ,

PRIMARY KEY (`Alue koodi`)
);






-- ************************************** `Haudatut`

CREATE TABLE IF NOT EXISTS `Haudatut`
(
 `Hautauspäivä`        date NOT NULL ,
 `H_Seurakunta numero` smallint NOT NULL ,
 `Kuolinpäivä`         date NOT NULL ,
 `Kuolinsyy`           varchar(45) NOT NULL ,
 `K_NainenHID`         varchar(45) NOT NULL ,
 `K_MiesHID`           varchar(45) NOT NULL ,

PRIMARY KEY (`Hautauspäivä`),
KEY `fkIdx_141` (`K_NainenHID`),
CONSTRAINT `FK_141` FOREIGN KEY `fkIdx_141` (`K_NainenHID`) REFERENCES `Nainen` (`NainenHID`),
KEY `fkIdx_144` (`K_MiesHID`),
CONSTRAINT `FK_144` FOREIGN KEY `fkIdx_144` (`K_MiesHID`) REFERENCES `Mies` (`MiesHID`),
KEY `fkIdx_61` (`H_Seurakunta numero`),
CONSTRAINT `FK_1` FOREIGN KEY `fkIdx_61` (`H_Seurakunta numero`) REFERENCES `Seurakunnat` (`Seurakunta numero`)
);

-- ************************************** `Mies`

CREATE TABLE IF NOT EXISTS `Mies`
(
 `MiesHID`             varchar(45) NOT NULL ,
 `M_Seurakunta numero` smallint NOT NULL ,
 `Etunimi`             varchar(45) NOT NULL ,
 `Patronyymi`          varchar(45) NOT NULL ,
 `Sukunimi`            varchar(45) NOT NULL ,
 `Ammatti`             varchar(45) NOT NULL ,
 `Kylä`                varchar(45) NOT NULL ,
 `Talo`                varchar(45) NOT NULL ,
 `Syntymäpäivä`        date NOT NULL ,

PRIMARY KEY (`MiesHID`),
KEY `fkIdx_40` (`M_Seurakunta numero`),
CONSTRAINT `FK_2` FOREIGN KEY `fkIdx_40` (`M_Seurakunta numero`) REFERENCES `Seurakunnat` (`Seurakunta numero`)
);






-- ************************************** `Kastetut`

CREATE TABLE IF NOT EXISTS `Kastetut`
(
 `Kastepäivä`          date NOT NULL ,
 `K_Seurakunta numero` smallint NOT NULL ,
 `ÄitiID`              varchar(45) NOT NULL ,
 `IsäID`               varchar(45) NOT NULL ,

PRIMARY KEY (`Kastepäivä`),
KEY `fkIdx_108` (`K_Seurakunta numero`),
CONSTRAINT `FK_108` FOREIGN KEY `fkIdx_108` (`K_Seurakunta numero`) REFERENCES `Seurakunnat` (`Seurakunta numero`),
KEY `fkIdx_129` (`ÄitiID`),
CONSTRAINT `FK_129` FOREIGN KEY `fkIdx_129` (`ÄitiID`) REFERENCES `Nainen` (`NainenHID`),
KEY `fkIdx_132` (`IsäID`),
CONSTRAINT `FK_3` FOREIGN KEY `fkIdx_132` (`IsäID`) REFERENCES `Mies` (`MiesHID`)
);


-- ************************************** `Nainen`

CREATE TABLE IF NOT EXISTS `Nainen`
(
 `NainenHID`           varchar(45) NOT NULL ,
 `N_Seurakunta numero` smallint NOT NULL ,
 `Etunimi`             varchar(45) NOT NULL ,
 `Patronyymi`          varchar(45) NOT NULL ,
 `Sukunimi`            varchar(45) NOT NULL ,
 `Ammatti`             varchar(45) NOT NULL ,
 `Kylä`                varchar(45) NOT NULL ,
 `Talo`                varchar(45) NOT NULL ,
 `Syntymäpäivä`        date NOT NULL ,

PRIMARY KEY (`NainenHID`),
KEY `fkIdx_40` (`N_Seurakunta numero`),
CONSTRAINT `FK_4` FOREIGN KEY `fkIdx_40` (`N_Seurakunta numero`) REFERENCES `Seurakunnat` (`Seurakunta numero`)
);






-- ************************************** `Naapurit`

CREATE TABLE IF NOT EXISTS `Naapurit`
(
 `Seurakunta naapurit`   smallint NOT NULL ,
 `Naa_Seurakunta numero` smallint NOT NULL ,

PRIMARY KEY (`Seurakunta naapurit`),
KEY `fkIdx_37` (`Naa_Seurakunta numero`),
CONSTRAINT `FK_5` FOREIGN KEY `fkIdx_37` (`Naa_Seurakunta numero`) REFERENCES `Seurakunnat` (`Seurakunta numero`)
);


-- ************************************** `Seurakunnat`

CREATE TABLE IF NOT EXISTS `Seurakunnat`
(
 `Seurakunta numero` smallint NOT NULL ,
 `Seurakunnan nimi`  varchar(45) NOT NULL ,
 `Seurakunnan alue`  tinyint NOT NULL ,

PRIMARY KEY (`Seurakunta numero`),
KEY `fkIdx_105` (`Seurakunnan alue`),
CONSTRAINT `FK_6` FOREIGN KEY `fkIdx_105` (`Seurakunnan alue`) REFERENCES `Alueet` (`Alue koodi`)
);






-- ************************************** `Ulos- ja sisäänmuuttaneet`

CREATE TABLE IF NOT EXISTS `Ulos- ja sisäänmuuttaneet`
(
 `Lähtöpäivä`          date NOT NULL ,
 `Kohde`               varchar(45) NOT NULL ,
 `U_Seurakunta numero` smallint NOT NULL ,
 `Saapumispäivä`       date NOT NULL ,

PRIMARY KEY (`Lähtöpäivä`),
KEY `fkIdx_95` (`U_Seurakunta numero`),
CONSTRAINT `FK_7` FOREIGN KEY `fkIdx_95` (`U_Seurakunta numero`) REFERENCES `Seurakunnat` (`Seurakunta numero`)
);

-- ************************************** `Vihityt`

CREATE TABLE IF NOT EXISTS `Vihityt`
(
 `Vihkimispäivä`       date NOT NULL ,
 `V_Seurakunta numero` smallint NOT NULL ,
 `Valinnaiset kentät`  varchar(45) NOT NULL ,
 `MorsianID`           varchar(45) NOT NULL ,
 `SulhoID`             varchar(45) NOT NULL ,

PRIMARY KEY (`Vihkimispäivä`),
KEY `fkIdx_135` (`MorsianID`),
CONSTRAINT `FK_8` FOREIGN KEY `fkIdx_135` (`MorsianID`) REFERENCES `Nainen` (`NainenHID`),
KEY `fkIdx_138` (`SulhoID`),
CONSTRAINT `FK_9` FOREIGN KEY `fkIdx_138` (`SulhoID`) REFERENCES `Mies` (`MiesHID`),
KEY `fkIdx_53` (`V_Seurakunta numero`),
CONSTRAINT `FK_10` FOREIGN KEY `fkIdx_53` (`V_Seurakunta numero`) REFERENCES `Seurakunnat` (`Seurakunta numero`)
);
