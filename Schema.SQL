CREATE DATABASE asset_traker;

USE asset_traker;

CREATE TABLE DEPARTMENT(
    department_id INT NOT NULL AUTO_INCREMENT,
    manager_name VARCHAR(100) NOT NULL,
    manager_phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (department_id)
);

CREATE TABLE BRANCH(
    branch_id INT NOT NULL AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    location_address VARCHAR(200) NOT NULL,
    county VARCHAR(100) NOT NULL,
    PRIMARY KEY (branch_id)
);

CREATE TABLE STAFF(
    staff_id INT NOT NULL AUTO_INCREMENT,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    branch_id INT NOT NULL,
    PRIMARY KEY(staff_id),
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
);

CREATE TABLE ASSET(
    asset_id INT NOT NULL AUTO_INCREMENT,
    serial_number VARCHAR(100) NOT NULL,
    asset_name VARCHAR(100) NOT NULL,
    asset_type VARCHAR(50),
    status ENUM('IN USE','FAULTY','IN REPAIR','DECOMMISSIONED') NOT NULL,
    staff_id INT NOT NULL,
    branch_id INT NOT NULL,
    PRIMARY KEY(asset_id),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
);

CREATE TABLE ASSET_MAINTENANCE(
    maintenance_id INT NOT NULL AUTO_INCREMENT,
    asset_id INT NOT NULL,
    date_serviced DATE NOT NULL,
    description TEXT NOT NULL,
    maintenance_report TEXT,
    PRIMARY KEY(maintenance_id),
    FOREIGN KEY (asset_id) REFERENCES ASSET(asset_id)
);
