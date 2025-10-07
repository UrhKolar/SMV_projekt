GRANT SELECT, UPDATE ON Ucenec TO 'ucitelj1'@'localhost';
GRANT ALL PRIVILEGES ON Ucitelj TO 'admin'@'localhost';
REVOKE UPDATE ON Ucenec FROM 'ucitelj1'@'localhost';
REVOKE ALL PRIVILEGES ON Ucitelj FROM 'admin'@'localhost';