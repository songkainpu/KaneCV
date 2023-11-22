DROP TABLE IF EXISTS robot;
CREATE TABLE robot (
    id INT AUTO_INCREMENT PRIMARY KEY,
    panel_name VARCHAR(255) NOT NULL,
    current_value TINYINT,
    unit_of_measurement VARCHAR(50),
    max_speed INT,
    unit_of_speed VARCHAR(50),
    avail_mode INT, -- Assuming there is a 'mode' table to reference
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS mode;
CREATE TABLE mode {
    id INT AUTO_INCREMENT PRIMARY KEY,
    mode_name VARCHAR(255) NOT NULL,
    urgent_avail TINYINT DEFAULT 0 -- 0 reprents urgent stop is not available,
}

DROP TABLE IF EXISTS operation_history;
CREATE TABLE operation_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    operation_name VARCHAR(255) NOT NULL,
    operation_status ENUM('completed', 'in_progress', 'failed') NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    robot_id INT, -- Assuming there is a 'robot' table to reference
    notes TEXT,
    FOREIGN KEY (operator_id) REFERENCES users(id)
);
