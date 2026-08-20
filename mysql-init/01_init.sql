-- Initialization script for kh_department database
CREATE DATABASE IF NOT EXISTS kh_department CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE kh_department;

-- 1. Departments Table
CREATE TABLE IF NOT EXISTS departments (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO departments (id, name, description) VALUES
(1, 'แผนกคหกรรมศาสตร์', 'แผนกคหกรรมศาสตร์ — คิดครัว ปักฝัน');

-- 2. Tracks / Courses Table
CREATE TABLE IF NOT EXISTS tracks (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    track_code  VARCHAR(20) NOT NULL UNIQUE,
    title_th    VARCHAR(255) NOT NULL,
    title_en    VARCHAR(255) NOT NULL,
    description TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO tracks (id, track_code, title_th, title_en, description) VALUES
(1, '01', 'อาหารและโภชนาการ', 'Food & Nutrition', 'ฝึกปรุงอาหารไทยและนานาชาติ ถนอมอาหาร และวางแผนโภชนาการเพื่อสุขภาพที่ดี'),
(2, '02', 'ผ้าและเครื่องแต่งกาย', 'Textile & Fashion', 'เรียนตัดเย็บ ออกแบบลาย ปักผ้า และสร้างสรรค์เครื่องแต่งกายตั้งแต่แบบร่างจนถึงตัวจริง'),
(3, '03', 'งานประดิษฐ์และดอกไม้', 'Crafts & Floral Design', 'ฝึกจัดดอกไม้ งานฝีมือ และประดิษฐ์ของใช้จากวัสดุเหลือใช้อย่างสร้างสรรค์'),
(4, '04', 'การจัดการบ้านและครอบครัว', 'Home & Family Management', 'เรียนรู้การดูแลบ้าน จัดการงบประมาณครัวเรือน และความเข้าใจด้านครอบครัว');

-- 3. Activities / Gallery Table
CREATE TABLE IF NOT EXISTS activities (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    category    VARCHAR(100),
    image_url   VARCHAR(255),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO activities (id, title, category, image_url) VALUES
(1, 'ครัวเปิดสอนรายสัปดาห์ & การถ่ายทำสื่อ', 'อาหาร', 'images/123.png'),
(2, 'การแปรรูป & บรรจุภัณฑ์ขนมไทย', 'อาหาร', 'images/213.png'),
(3, 'การฝึกปฏิบัติงานโภชนาการ', 'อาหาร', 'images/111.png'),
(4, 'การจัดเตรียม & คุมคุณภาพอาหาร', 'อาหาร', 'images/222.png'),
(5, 'การสร้างสรรค์เมนู & ทำงานทีม', 'อาหาร', 'images/231.png'),
(6, 'ศิลปะการจัดดอกไม้ & งานประดิษฐ์', 'งานประดิษฐ์', 'images/f321.png');

-- 4. Department Stats Table
CREATE TABLE IF NOT EXISTS department_stats (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    stat_key    VARCHAR(50) NOT NULL UNIQUE,
    stat_name   VARCHAR(100) NOT NULL,
    stat_value  INT NOT NULL,
    unit        VARCHAR(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO department_stats (id, stat_key, stat_name, stat_value, unit) VALUES
(1, 'students', 'นักเรียนปัจจุบัน', 500, '+'),
(2, 'years', 'ปีที่ก่อตั้งแผนก', 25, '+'),
(3, 'awards', 'รางวัลที่ได้รับ', 30, '+'),
(4, 'employment_rate', '% มีงาน/เรียนต่อ', 95, '%');

-- 5. Applications Table
CREATE TABLE IF NOT EXISTS student_applications (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    full_name   VARCHAR(255) NOT NULL,
    email       VARCHAR(255) NOT NULL,
    phone       VARCHAR(50),
    track_id    INT,
    status      VARCHAR(50) DEFAULT 'pending',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (track_id) REFERENCES tracks(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
