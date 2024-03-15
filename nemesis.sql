/*
 Navicat Premium Data Transfer

 Source Server         : franco
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : nemesis

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 15/03/2024 09:59:17
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parents
-- ----------------------------

-- ----------------------------
-- Table structure for sections
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sections
-- ----------------------------

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES (1, '1', 'First Semester');
INSERT INTO `semester` VALUES (2, '2', 'Second Semester');

-- ----------------------------
-- Table structure for student_type
-- ----------------------------
DROP TABLE IF EXISTS `student_type`;
CREATE TABLE `student_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `description` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of track_strand
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of year
-- ----------------------------
INSERT INTO `year` VALUES (1, 'Grade 7');
INSERT INTO `year` VALUES (2, 'Grade 8');
INSERT INTO `year` VALUES (3, 'Grade 9');
INSERT INTO `year` VALUES (4, 'Grade 10');
INSERT INTO `year` VALUES (5, 'Grade 11');
INSERT INTO `year` VALUES (6, 'Grade 12');

SET FOREIGN_KEY_CHECKS = 1;
