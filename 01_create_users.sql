-- Beim verwendeten MySQL Image gibt es keine Passwortrichtlinien. 
-- Daher müssen diese anders als bei OraDB nicht angepasst werden.

-- Benutzer scott erstellen und Rechte vergeben
CREATE USER 'scott'@'%' IDENTIFIED BY 'tiger';
GRANT ALL PRIVILEGES ON *.* TO 'scott'@'%';

-- Benutzer vereinuser erstellen und Rechte vergeben
CREATE USER 'vereinuser'@'%' IDENTIFIED BY 'vereinuser';
GRANT ALL PRIVILEGES ON *.* TO 'vereinuser'@'%';