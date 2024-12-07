-- Password Policy anpassen, damit die kurzen 
SET GLOBAL validate_password.policy = LOW;
SET GLOBAL validate_password.length = 5; -- Tiger Password hat nur 5 char

-- Anlegen User Scott und vereinuser
CREATE USER 'scott'@'%' IDENTIFIED BY 'tiger';
GRANT ALL PRIVILEGES ON *.* TO 'scott'@'%';

CREATE USER 'vereinuser'@'%' IDENTIFIED BY 'vereinuser';
GRANT ALL PRIVILEGES ON *.* TO 'vereinuser'@'%';