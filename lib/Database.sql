CREATE DATABASE Save_A_Tree DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;;
USE Save_A_Tree;
CREATE TABLE TProfile (
Mail VARCHAR(35) PRIMARY KEY,
UserName VARCHAR(35),
ProfilePicture LONGBLOB,
SavedTrees INT,
Donated DECIMAL(7.2),
Password VARCHAR(100),
);