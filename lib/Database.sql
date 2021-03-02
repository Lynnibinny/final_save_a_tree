import 'package:save_a_tree/main.dart';
CREATE DATABASE Save_A_Tree DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE Save_A_Tree;
CREATE TABLE TProfile (
    ProMail VARCHAR(35) PRIMARY KEY,
    ProUserName VARCHAR(35),
    ProPicture LONGBLOB,
    ProSavedTrees INT,
    ProDonated DECIMAL(7,2),
    ProPassword VARCHAR(100)
);
INSERT INTO TProfile VALUES ('lynn.nuesch@me.com','lynni',NULL,0,0.0,'Uk$12?HB7');

select * from TProfile;
INSERT INTO TProfile Values ('haha@me.com','zaza',NULL,0,0.0,'kaka$uizi');


