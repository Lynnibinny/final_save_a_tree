CREATE DATABASE Save_A_Tree;
USE Save_A_Tree;
CREATE TABLE TProfile (
Mail VARCHAR(35) PRIMARY KEY,
UserName VARCHAR(35),
ProfilePicture LONGBLOB,
SavedTrees INT,
Donated DECIMAL(7.2),
Password VARCHAR(100),
);