CREATE DATABASE IF NOT EXISTS college_events CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE college_events;
CREATE TABLE IF NOT EXISTS users (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 full_name VARCHAR(100) NOT NULL,
 email VARCHAR(190) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL,
 role ENUM('student','admin') NOT NULL DEFAULT 'student',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS events (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(160) NOT NULL,
 description TEXT NOT NULL,
 category VARCHAR(80) NOT NULL DEFAULT 'General',
 venue VARCHAR(160) NOT NULL,
 event_date DATETIME NOT NULL,
 capacity INT UNSIGNED NOT NULL DEFAULT 50,
 status ENUM('published','draft','cancelled') NOT NULL DEFAULT 'published',
 created_by INT UNSIGNED NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
 INDEX idx_events_date_status (event_date,status)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS registrations (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id INT UNSIGNED NOT NULL,
 event_id INT UNSIGNED NOT NULL,
 registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 status ENUM('registered','cancelled') NOT NULL DEFAULT 'registered',
 UNIQUE KEY uq_user_event (user_id,event_id),
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
 FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
 INDEX idx_registration_event_status (event_id,status)
) ENGINE=InnoDB;
