/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : nemesis

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 19/03/2024 19:34:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `purok` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `barangay` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `municipality` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zipcode` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for enrollment
-- ----------------------------
DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE `enrollment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NULL DEFAULT NULL,
  `enrollee_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_type_id` int NULL DEFAULT NULL,
  `school_year` date NULL DEFAULT NULL,
  `semester` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year_id` int NULL DEFAULT NULL,
  `section_id` int NULL DEFAULT NULL,
  `track_strand_id` int NULL DEFAULT NULL,
  `subject_id` int NULL DEFAULT NULL,
  `date_enrolled` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `enrollment_students`(`enrollee_id` ASC) USING BTREE,
  INDEX `enrollment_student_type`(`student_type_id` ASC) USING BTREE,
  INDEX `enrollment_semester`(`semester` ASC) USING BTREE,
  INDEX `enrollment_year`(`year_id` ASC) USING BTREE,
  INDEX `enrollment_sections`(`section_id` ASC) USING BTREE,
  INDEX `enrollment_track_strand`(`track_strand_id` ASC) USING BTREE,
  INDEX `enrollment_subjects`(`subject_id` ASC) USING BTREE,
  INDEX `enrollment_admin`(`admin_id` ASC) USING BTREE,
  CONSTRAINT `enrollment_admin` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `enrollment_sections` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `enrollment_student_type` FOREIGN KEY (`student_type_id`) REFERENCES `student_type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `enrollment_students` FOREIGN KEY (`enrollee_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `enrollment_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `enrollment_track_strand` FOREIGN KEY (`track_strand_id`) REFERENCES `track_strand` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `enrollment_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enrollment
-- ----------------------------

-- ----------------------------
-- Table structure for parents
-- ----------------------------
DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `father_fullname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `father_phonenumber` bigint NULL DEFAULT NULL,
  `mother_fullname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mother_phonenumber` bigint NULL DEFAULT NULL,
  `guardian_fullname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `guardian_phonenumber` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of parents
-- ----------------------------

-- ----------------------------
-- Table structure for sections
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_id` int NULL DEFAULT NULL,
  `description` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `adviser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `room` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sections_year`(`year_id` ASC) USING BTREE,
  CONSTRAINT `sections_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sections
-- ----------------------------
INSERT INTO `sections` VALUES (1, 1, 'Atlantis', 'Maricris G. Valdez', 'ESF 102');
INSERT INTO `sections` VALUES (2, 1, 'Discoverer', 'Leah Gay C. Valdez', 'PTA 104');
INSERT INTO `sections` VALUES (3, 1, 'Challenger', 'Purification B. Asis', 'PTA 103');
INSERT INTO `sections` VALUES (4, 1, 'Endeavour', 'Julieta P. Taberna', 'ESF 201');
INSERT INTO `sections` VALUES (5, 1, 'Francisco', 'Maria Teresa A. Garingan', 'SPA 202');
INSERT INTO `sections` VALUES (6, 1, 'Manansala', 'Michelle M. Esteban', 'SPA 201');
INSERT INTO `sections` VALUES (7, 1, 'CP Romulo', 'Maximino B. Noveda Jr.', 'IM 206');
INSERT INTO `sections` VALUES (8, 1, 'Confucius (SPFL)', 'Romelee Shayne A. Acoba', 'AB4 401');
INSERT INTO `sections` VALUES (9, 1, 'Bravery', 'Avegael B. Borja', 'AB4 203');
INSERT INTO `sections` VALUES (10, 1, 'Diligence', 'Jessa D. Antonio', 'AB4 301');
INSERT INTO `sections` VALUES (11, 1, 'Faithfulness', 'Evangeline P. Mamugay', 'AB4 302');
INSERT INTO `sections` VALUES (12, 1, 'Generosity', 'Marivic M. Cadiz', 'AB4 403');
INSERT INTO `sections` VALUES (13, 1, 'Honesty', 'Rachel P. Reyes', 'AB4 101');
INSERT INTO `sections` VALUES (14, 1, 'Humility', 'Joy W. Flores', 'AB4 402');
INSERT INTO `sections` VALUES (15, 1, 'Industrious', 'Donalynne A. Sebastian', 'OB 202');
INSERT INTO `sections` VALUES (16, 1, 'Loyalty', 'Ana Liza A. Balido', 'AB4 303');
INSERT INTO `sections` VALUES (17, 1, 'Obedience', 'Glenda P. Mendoza', 'AB4 102');
INSERT INTO `sections` VALUES (18, 1, 'Prudence', 'Mary Grace P. Bautista', 'AB4 201');
INSERT INTO `sections` VALUES (19, 1, 'Purity', 'Emilia B. Matabye', 'AB4 202');
INSERT INTO `sections` VALUES (20, 1, 'Trustworthy', 'Rosemarie P. Sierra', 'AB4 103');
INSERT INTO `sections` VALUES (21, 2, 'Explorer', 'Voltaire S. Jacinto', 'PTA 101');
INSERT INTO `sections` VALUES (22, 2, 'Pioneer', 'Irene M. Walis', 'ESF 202');
INSERT INTO `sections` VALUES (23, 2, 'Vanguard', 'Ariane Vinna D. Gumih-o', 'ESF 203');
INSERT INTO `sections` VALUES (24, 2, 'Amorsolo', 'Rosilyn A. Santos', 'IM 207');
INSERT INTO `sections` VALUES (25, 2, 'Abueva', 'Angelie C. Garcia', 'EL 101');
INSERT INTO `sections` VALUES (26, 2, 'JP Rizal', 'Mikhael Jan Pating', 'IM 204');
INSERT INTO `sections` VALUES (27, 2, 'Carnia', 'Nestor R. Ambatali', 'IM 103');
INSERT INTO `sections` VALUES (28, 2, 'Carnation', 'Elizabeth A. Damaso', 'IM 104');
INSERT INTO `sections` VALUES (29, 2, 'Daffodil', 'Grefalyn U. Rivera', 'IM 108');
INSERT INTO `sections` VALUES (30, 2, 'Gladiola', 'Marina P. Penas', 'IM 203');
INSERT INTO `sections` VALUES (31, 2, 'Hyacinth', 'Lea Marie Cadiz', 'LB 102');
INSERT INTO `sections` VALUES (32, 2, 'Ilang-ilang', 'Jenalyn Bautista', 'OB 101');
INSERT INTO `sections` VALUES (33, 2, 'Lao Tzu', 'Divina L. Butale', 'IM 201');
INSERT INTO `sections` VALUES (34, 2, 'Lily', 'Christian S. Jorge', 'IM 101');
INSERT INTO `sections` VALUES (35, 2, 'Magnolia', 'Lorna D. Roldan', 'IM 208');
INSERT INTO `sections` VALUES (36, 2, 'Orchid', 'Adora Marie Peralta', 'IM 105');
INSERT INTO `sections` VALUES (37, 2, 'Periwinkle', 'Sherwin Bendoy', 'IM 202');
INSERT INTO `sections` VALUES (38, 2, 'Rose', 'Marites C. Claur', 'IM 107');
INSERT INTO `sections` VALUES (39, 2, 'Stargazer', 'Marilou M. Gan', 'IM 102');
INSERT INTO `sections` VALUES (40, 2, 'Sunflower', 'Jonna Jasmin C. Dela Cruz', 'IM 106');
INSERT INTO `sections` VALUES (41, 2, 'Tulip', 'Vinus F. Pidut', 'LB 101');
INSERT INTO `sections` VALUES (42, 3, 'Apollo', 'Aloyda B. Calangan', 'PTA 102');
INSERT INTO `sections` VALUES (43, 3, 'Gemini', 'Mylene T. Guntalilib', 'AB1 202');
INSERT INTO `sections` VALUES (44, 3, 'Soyuz', 'Fe B. Tabago', 'ESF 103');
INSERT INTO `sections` VALUES (45, 3, 'Hidalgo', 'Rose Mary C. Tabangcura', 'SPA 101');
INSERT INTO `sections` VALUES (46, 3, 'Edades', 'Mark Eulogio Santiago', 'SPA 102');
INSERT INTO `sections` VALUES (47, 3, 'Tiempo', 'Racquel Almendra', 'IM 205');
INSERT INTO `sections` VALUES (48, 3, 'Mercury', 'Babylyn P. Ambatali', 'AB5 203');
INSERT INTO `sections` VALUES (49, 3, 'Zinc', 'Katrina Rose R. Catap', 'AB5 205');
INSERT INTO `sections` VALUES (50, 3, 'Manganese', 'Rehina R. Galpito', 'AB1 203');
INSERT INTO `sections` VALUES (51, 3, 'Krypton', 'Melissa D. Inway', 'AB5 106');
INSERT INTO `sections` VALUES (52, 3, 'Nickel', 'Queensie Mae F. Ocampo', 'AB5 201');
INSERT INTO `sections` VALUES (53, 3, 'Argon', 'Jenalyn B. Erasquin', 'AB5 102');
INSERT INTO `sections` VALUES (54, 3, 'Lithium', 'Jimbo M. Taberna', 'AB5 103');
INSERT INTO `sections` VALUES (55, 3, 'Gold', 'Sherwin B. Quevedo', 'AB5 105');
INSERT INTO `sections` VALUES (56, 3, 'Oxygen', 'Ricalyne Mhae S. Castro', 'AB5 101');
INSERT INTO `sections` VALUES (57, 3, 'Silver', 'Emil John S. Elizaga', 'AB5 202');
INSERT INTO `sections` VALUES (58, 3, 'Titanium', 'Erwin S. Ladaga', 'IM 210');
INSERT INTO `sections` VALUES (59, 3, 'Hydrogen', 'Jessie Pasamonte', 'AB5 104');
INSERT INTO `sections` VALUES (60, 3, 'Platinum', 'Romelyn Grace G. Eugenio', 'IM 209');
INSERT INTO `sections` VALUES (61, 3, 'Radium', 'Jeric Trojan O. Lopez', 'AB5 206');
INSERT INTO `sections` VALUES (62, 3, 'Uranium', 'Ivy Nethercott Lopez', 'DOST 101');
INSERT INTO `sections` VALUES (63, 4, 'Mariner', 'Romeo N. Valdez Jr.', 'AB1 204');
INSERT INTO `sections` VALUES (64, 4, 'Voyager', 'Nathaniel R. Almendra', 'ESF 101');
INSERT INTO `sections` VALUES (65, 4, 'Viking', 'Sheila Moana Marie I. Gonzales', 'AB1 201');
INSERT INTO `sections` VALUES (66, 4, 'Juan Luna', 'Erwin Joseph D. Dumelod', 'AB1 201');
INSERT INTO `sections` VALUES (67, 4, 'Jose De Jesus', 'Abigail Vanessa B. Pablo', 'AB5 304');
INSERT INTO `sections` VALUES (68, 4, 'Graciano Lopez Jaena', 'Aumary Lordxander D. Baysa', 'AB1 102');
INSERT INTO `sections` VALUES (69, 4, 'Acacia', 'Benedick G. Madriaga', NULL);
INSERT INTO `sections` VALUES (70, 4, 'Agoho', 'Leonor T. Jacinto', NULL);
INSERT INTO `sections` VALUES (71, 4, 'Almon', 'Edison A. Simon', NULL);
INSERT INTO `sections` VALUES (72, 4, 'Bani', 'Nelia D. Acob', NULL);
INSERT INTO `sections` VALUES (73, 4, 'Ebony', 'Jaime Ace C. Acosta', NULL);
INSERT INTO `sections` VALUES (74, 4, 'Gmelina', 'Gina G. Pasamonte', NULL);
INSERT INTO `sections` VALUES (75, 4, 'Guiho', 'Maylene D. Bactol', NULL);
INSERT INTO `sections` VALUES (76, 4, 'Kamagong', 'Joie M. Mago', NULL);
INSERT INTO `sections` VALUES (77, 4, 'Katmon', 'Lickrish Minia', NULL);
INSERT INTO `sections` VALUES (78, 4, 'Lauan', 'Maria Violeta A. De Ocampo', NULL);
INSERT INTO `sections` VALUES (79, 4, 'Mahogany', 'John Paul D. Purigay', NULL);
INSERT INTO `sections` VALUES (80, 4, 'Molave', 'Ephraim Joy M. Ellaga', NULL);
INSERT INTO `sections` VALUES (81, 4, 'Narra', 'Valerie Valeros Padua', NULL);
INSERT INTO `sections` VALUES (82, 4, 'Yakal', 'Jun-Velt B. Paritang', NULL);

-- ----------------------------
-- Table structure for student_type
-- ----------------------------
DROP TABLE IF EXISTS `student_type`;
CREATE TABLE `student_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_type
-- ----------------------------
INSERT INTO `student_type` VALUES (1, 'JHS', 'Junior High School');
INSERT INTO `student_type` VALUES (2, 'SHS', 'Senior High School');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LRN` int NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address_id` int NULL DEFAULT NULL,
  `gender` enum('Male','Female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birthdate` date NULL DEFAULT NULL,
  `parents_id` int NULL DEFAULT NULL,
  `ip` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `household_benificiary` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `students_address`(`address_id` ASC) USING BTREE,
  INDEX `students_gender`(`gender` ASC) USING BTREE,
  INDEX `students_parents`(`parents_id` ASC) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  CONSTRAINT `students_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `students_parents` FOREIGN KEY (`parents_id`) REFERENCES `parents` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_id` int NULL DEFAULT NULL,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjects_year`(`year_id` ASC) USING BTREE,
  CONSTRAINT `subjects_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES (1, 1, 'IS1', 'Integrated Science 1');
INSERT INTO `subjects` VALUES (2, 1, 'MATH1', 'Mathematics 1');
INSERT INTO `subjects` VALUES (3, 1, 'CS1', 'English 1');
INSERT INTO `subjects` VALUES (4, 1, 'FIL1', 'Filipino 1');
INSERT INTO `subjects` VALUES (5, 1, 'SS1', 'Social Science 1');
INSERT INTO `subjects` VALUES (6, 1, 'PEHM1', 'Physical Education, Health, and Music 1');
INSERT INTO `subjects` VALUES (7, 1, 'VALED1', 'Values Education 1');
INSERT INTO `subjects` VALUES (8, 1, 'ADTECH1', 'Arts, Design, and Technology 1');
INSERT INTO `subjects` VALUES (9, 1, 'CS1', 'Computer Science 1');
INSERT INTO `subjects` VALUES (10, 2, 'IS2', 'Integrated Science 2');
INSERT INTO `subjects` VALUES (11, 2, 'MATH2', 'Mathematics 2');
INSERT INTO `subjects` VALUES (12, 2, 'ENG2', 'English 2');
INSERT INTO `subjects` VALUES (13, 2, 'FIL2', 'Filipino 2');
INSERT INTO `subjects` VALUES (14, 2, 'SS2', 'Social Science 2');
INSERT INTO `subjects` VALUES (15, 2, 'PEHM2', 'Physical Education, Health, and Music 2');
INSERT INTO `subjects` VALUES (16, 2, 'VALED2', 'Values Education 2');
INSERT INTO `subjects` VALUES (17, 2, 'ADTECH2', 'Arts, Design, and Technology 2');
INSERT INTO `subjects` VALUES (18, 2, 'CS2', 'Computer Science 2');
INSERT INTO `subjects` VALUES (19, 3, 'BIO1', 'Biology 1');
INSERT INTO `subjects` VALUES (20, 3, 'CHEM1', 'Chemistry 1');
INSERT INTO `subjects` VALUES (21, 3, 'PHY1', 'Physics 1');
INSERT INTO `subjects` VALUES (22, 3, 'MATH3A', 'Mathematics 3');
INSERT INTO `subjects` VALUES (23, 3, 'ENG3', 'English 3');
INSERT INTO `subjects` VALUES (24, 3, 'FIL3', 'Filipino 3');
INSERT INTO `subjects` VALUES (25, 3, 'SS3', 'Social Science 3');
INSERT INTO `subjects` VALUES (26, 3, 'PEHM3', 'Physical Education, Health, and Music 3');
INSERT INTO `subjects` VALUES (29, 3, 'MATH3B', 'Statistics 1');
INSERT INTO `subjects` VALUES (30, 3, 'CS3', 'Computer Science 3');
INSERT INTO `subjects` VALUES (31, 4, 'ES', 'Earth Science');
INSERT INTO `subjects` VALUES (32, 4, 'BIO2', 'Biology 2');
INSERT INTO `subjects` VALUES (33, 4, 'CHEM2', 'Chemistry 2');
INSERT INTO `subjects` VALUES (34, 4, 'PHY2', 'Physics 2');
INSERT INTO `subjects` VALUES (35, 4, 'MATH4', 'Mathematics 4');
INSERT INTO `subjects` VALUES (36, 4, 'CS4', 'Computer Science 4');
INSERT INTO `subjects` VALUES (37, 4, 'ENG4', 'English 4');
INSERT INTO `subjects` VALUES (38, 4, 'FIL4', 'Filipino 4');
INSERT INTO `subjects` VALUES (39, 4, 'SS4', 'Social Science 4');
INSERT INTO `subjects` VALUES (40, 4, 'RES1', 'Research 1');
INSERT INTO `subjects` VALUES (41, 4, 'PEHM4', 'Physical Education, Health, and Music 4');

-- ----------------------------
-- Table structure for track_strand
-- ----------------------------
DROP TABLE IF EXISTS `track_strand`;
CREATE TABLE `track_strand`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_id` int NULL DEFAULT NULL,
  `description` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `section` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `adviser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `room` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `track_strand_year`(`year_id` ASC) USING BTREE,
  CONSTRAINT `track_strand_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of track_strand
-- ----------------------------
INSERT INTO `track_strand` VALUES (1, 6, 'STEM 1', 'Emilio Aguinaldo', 'Marizza C. Versola', 'PTA 202');
INSERT INTO `track_strand` VALUES (2, 6, 'STEM 2', 'Andres Bonifacio', 'Amherstine C. Quilang', 'AB5 407');
INSERT INTO `track_strand` VALUES (3, 6, 'STEM 3', 'Apolinario Mabini', 'Diana Grace P. Carino', 'AB5 306');
INSERT INTO `track_strand` VALUES (4, 6, 'ABM 1', 'Felipe Agoncilio', 'Rowena V. Aguilar', 'AB5 405');
INSERT INTO `track_strand` VALUES (5, 6, 'ABM 2', 'Teresa Magbanua', 'Arrah Bella L. Tapaoan', 'AB5 403');
INSERT INTO `track_strand` VALUES (6, 6, 'HUMSS 1', 'Julian Felipe', 'Michelle G. Liquiran', 'AB5 402');
INSERT INTO `track_strand` VALUES (7, 6, 'HUMSS 2', 'Rafael Palma', 'Precious C. Dolaypan', 'AB5 401');
INSERT INTO `track_strand` VALUES (8, 6, 'HUMSS 3', 'Epifanio Delos Santos', 'Glory A. Tumayan', 'P2K 102');
INSERT INTO `track_strand` VALUES (9, 6, 'HUMSS 4', 'Trinidad Tecson', 'Eunicezha F. Camonayan', 'AB5 307');
INSERT INTO `track_strand` VALUES (10, 6, 'HUMSS 5', 'Marcelo H. Del Pilar', 'Jenny Ann M. Ventura', 'AB5 406');
INSERT INTO `track_strand` VALUES (11, 6, 'HUMSS 6', 'Melchora Aquino', 'Frances M. Santocildes', 'AB5 305');
INSERT INTO `track_strand` VALUES (12, 6, 'TVL 1 - BC', 'Josefa Escoda', 'Lino Xernan S. Dacayo III', 'AB5 303');
INSERT INTO `track_strand` VALUES (13, 6, 'TVL 2 - EIM', 'Diego Silang', 'Michael Jerimae F. Lazaga', 'AB5 301');
INSERT INTO `track_strand` VALUES (14, 6, 'TVL 3 - ICT', 'Emilio Jacinto', 'Flordeliza Mendoza', 'P2K 103');
INSERT INTO `track_strand` VALUES (15, 6, 'FBS', 'Lapu-Lapu', 'Charizel C. Lucena', 'AB5 302');
INSERT INTO `track_strand` VALUES (16, 6, 'TVL-EIM-ALS', 'NVGCHS', 'Gilbert M. Ramos', 'Gym');
INSERT INTO `track_strand` VALUES (17, 6, 'TVL-EIM-ALS', 'HOPE', 'Jovelyn B. Asuncion', 'PJ');
INSERT INTO `track_strand` VALUES (18, 5, 'STEM 1', 'Hydra', 'Gretchen Mae B. Pascua', 'AB3 101');
INSERT INTO `track_strand` VALUES (19, 5, 'STEM 2', 'Arion', 'Zepharine Grace T. Castillo', 'AB3 201');
INSERT INTO `track_strand` VALUES (20, 5, 'STEM 3', 'Phoenix', 'Zaira Katrina Yango', 'AB3 202');
INSERT INTO `track_strand` VALUES (21, 5, 'ABM 1', 'Andromeda', 'Ervin T. Dejumo', 'AB2 101');
INSERT INTO `track_strand` VALUES (22, 5, 'ABM 2', 'Cassiopeia', 'John Eric B. Ricarde', 'AB2 102');
INSERT INTO `track_strand` VALUES (23, 5, 'HUMSS 1', 'Taurus', 'Gerry A. Gadiano', 'AB2 103');
INSERT INTO `track_strand` VALUES (24, 5, 'HUMSS 2', 'Capricorn', 'Maripple L. Lacaden', 'AB2 201');
INSERT INTO `track_strand` VALUES (25, 5, 'HUMSS 3', 'Delphinus', 'Karen R. Ramos', 'AB2 202');
INSERT INTO `track_strand` VALUES (26, 5, 'HUMSS 4', 'Scorpius', 'Brenda B. Betawang', 'AB3 103');
INSERT INTO `track_strand` VALUES (27, 5, 'HUMSS 5', 'Centaurus', 'Francis A. Di0at', 'AB6 101');
INSERT INTO `track_strand` VALUES (28, 5, 'HUMSS 6', 'Aquila', 'Joana Mae C. Castaneto', 'AB3 203');
INSERT INTO `track_strand` VALUES (29, 5, 'HUMSS 7', 'Pisces', 'Yra Angelique L. Timbreza', 'AB6 201');
INSERT INTO `track_strand` VALUES (30, 5, 'HUMSS 8', 'Saguitarius', 'Marilou L. Perez', 'PTA 203');
INSERT INTO `track_strand` VALUES (31, 5, 'TVL 1 - HE', 'Aquarius', 'Veniscelyn D. Roduta', 'AB5 207');
INSERT INTO `track_strand` VALUES (32, 5, 'TVL 2', 'Aries', 'Christine Joy G. Napone', 'AB2 203');
INSERT INTO `track_strand` VALUES (33, 5, 'TVL 3', 'Orion', 'Patricia Celine R. Tandoc', 'AB6 301');
INSERT INTO `track_strand` VALUES (34, 5, 'TVL 4 - CSS', 'Libra', 'Jules Christenz B. Reguyal', 'AB6 401');
INSERT INTO `track_strand` VALUES (35, 5, 'SPAD', 'Unicorn', 'Darrel B. Trinidad', 'Gym');
INSERT INTO `track_strand` VALUES (36, 5, 'SPORTS', 'Unicorn', 'Darrel B. Trinidad', 'Gym');
INSERT INTO `track_strand` VALUES (37, 5, 'TVL-EIM-ALS', 'LOVE', 'Joanna Mae C. Dimaunahan', 'Gym');
INSERT INTO `track_strand` VALUES (38, 5, 'TVL-EIM-ALS', 'FAITH', 'Jovelyn B. Asuncion', 'PJ');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NULL DEFAULT NULL,
  `fullname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `privilege` enum('ADMIN','SUPER_ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 19, 'Darlito Cabalse Jr.', 'oko', '1c1512b89aaaafdc925587db8205381c', 'SUPER_ADMIN');

-- ----------------------------
-- Table structure for year
-- ----------------------------
DROP TABLE IF EXISTS `year`;
CREATE TABLE `year`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of year
-- ----------------------------
INSERT INTO `year` VALUES (1, '7');
INSERT INTO `year` VALUES (2, '8');
INSERT INTO `year` VALUES (3, '9');
INSERT INTO `year` VALUES (4, '10');
INSERT INTO `year` VALUES (5, '11');
INSERT INTO `year` VALUES (6, '12');

SET FOREIGN_KEY_CHECKS = 1;
