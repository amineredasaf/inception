--Make DB or Make Build Would Create The Database Structure.
--.env variables should be exported, if  not run Make env.
CREATE DATABASE IF NOT EXISTS CriminalRecords;
CREATE USER IF NOT EXISTS mysql IDENTIFIED BY 'mysql';
GRANT ALL PRIVILEGES ON CriminalRecords.* TO 'mysql';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
