/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : aes

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 22/03/2024 22:49:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `purok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `barangay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `municipality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zipcode` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_137` longblob NULL,
  `good_moral` longblob NULL,
  `student_img` longblob NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of documents
-- ----------------------------

-- ----------------------------
-- Table structure for enrollment
-- ----------------------------
DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE `enrollment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL,
  `student_type` enum('jhs','shs') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year_id` int NULL DEFAULT NULL,
  `section_id` int NULL DEFAULT NULL,
  `track_strand_id` int NULL DEFAULT NULL,
  `semester` enum('first','second') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'first',
  `school_year` timestamp NOT NULL DEFAULT current_timestamp,
  `date_enrolled` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_enrollment_admin_id`(`admin_id` ASC) USING BTREE,
  INDEX `fk_enrollment_student_id`(`student_id` ASC) USING BTREE,
  INDEX `fk_enrollment_year_id`(`year_id` ASC) USING BTREE,
  INDEX `fk_enrollment_section_id`(`section_id` ASC) USING BTREE,
  INDEX `fk_enrollment_track_strand_id`(`track_strand_id` ASC) USING BTREE,
  CONSTRAINT `fk_enrollment_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_enrollment_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_enrollment_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_enrollment_track_strand_id` FOREIGN KEY (`track_strand_id`) REFERENCES `track_strand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_enrollment_year_id` FOREIGN KEY (`year_id`) REFERENCES `year_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  `father_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `father_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mother_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mother_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `guardian_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `guardian_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
  `year_level_id` int NULL DEFAULT NULL,
  `section_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `adviser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_sections_year_level_id`(`year_level_id` ASC) USING BTREE,
  CONSTRAINT `fk_sections_year_level_id` FOREIGN KEY (`year_level_id`) REFERENCES `year_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sections
-- ----------------------------

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NULL DEFAULT NULL,
  `lrn` int NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birthdate` date NULL DEFAULT NULL,
  `parents_id` int NULL DEFAULT NULL,
  `address_id` int NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `household_beneficiary` int NULL DEFAULT 0,
  `documents_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_students_address_id`(`address_id` ASC) USING BTREE,
  INDEX `fk_students_parents_id`(`parents_id` ASC) USING BTREE,
  INDEX `fk_students_documents_id`(`documents_id` ASC) USING BTREE,
  CONSTRAINT `fk_students_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_students_documents_id` FOREIGN KEY (`documents_id`) REFERENCES `documents` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_students_parents_id` FOREIGN KEY (`parents_id`) REFERENCES `parents` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  `year_level_id` int NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_subjects_year_level_id`(`year_level_id` ASC) USING BTREE,
  CONSTRAINT `fk_subjects_year_level_id` FOREIGN KEY (`year_level_id`) REFERENCES `year_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subjects
-- ----------------------------

-- ----------------------------
-- Table structure for track_strand
-- ----------------------------
DROP TABLE IF EXISTS `track_strand`;
CREATE TABLE `track_strand`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_level_id` int NULL DEFAULT NULL,
  `track_strand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `adviser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_track_strand_year_level_id`(`year_level_id` ASC) USING BTREE,
  CONSTRAINT `fk_track_strand_year_level_id` FOREIGN KEY (`year_level_id`) REFERENCES `year_level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  `admin_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `privilege` enum('admin','super_admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '19-10532', 'Darlito Dela Cruz Cabalse Jr', '0955', 'super_admin');

-- ----------------------------
-- Table structure for year_level
-- ----------------------------
DROP TABLE IF EXISTS `year_level`;
CREATE TABLE `year_level`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of year_level
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
