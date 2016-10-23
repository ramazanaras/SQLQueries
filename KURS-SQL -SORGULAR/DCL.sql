--	DCL(Data Credential LAnguage)

--GRANT 
--DENY

--Sql servera login için kullanýcý oluþturulmasý
CREATE LOGIN ramazan WITH PASSWORD='123Ab/' 

--login user için Northwinde DB'de kullanýcý oluþturulmasý
CREATE USER ramazan for LOGIN ramazan

GRANT SELECT ON Categories TO ramazan
GRANT INSERT ON Categories TO ramazan
GRANT UPDATE ON Categories TO ramazan
GRANT DELETE ON Categories TO ramazan

GRANT SELECT,INSERT,UPDATE,DELETE ON Categories TO ramazan
 
GRANT CREATE TABLE  TO ramazan
GRANT CREATE VIEW  TO ramazan
GRANT CREATE PROCEDURE  TO ramazan
--GRANT CREATE TRIGGER  TO ramazan
GRANT CREATE FUNCTION  TO ramazan

 --SP çalýþtýrma yetkisi
 GRANT EXEC TO ramazan

 --ALTER yapýlabilen tüm nesneleri düzenleme yetkisi
 GRANT ALTER TO ramazan

 --deny
 DENY SELECT ON Categories TO ramazan
DENY INSERT ON Categories TO ramazan
DENY UPDATE ON Categories TO ramazan
DENY DELETE ON Categories TO ramazan

DENY SELECT,INSERT,UPDATE,DELETE ON Categories TO ramazan
 
 DENY CREATE TABLE  TO ramazan
DENY CREATE VIEW  TO ramazan
DENY CREATE PROCEDURE  TO ramazan
--DENY CREATE TRIGGER  TO ramazan
DENY CREATE FUNCTION  TO ramazan