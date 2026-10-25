-- Create database
CREATE DATABASE IF NOT EXISTS girls_hostel;
USE girls_hostel;

-- Users table for authentication
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('admin', 'staff', 'student') NOT NULL,
    status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    last_login DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Students table
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    student_id VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    guardian_name VARCHAR(100),
    guardian_phone VARCHAR(15),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    pincode VARCHAR(10),
    date_of_birth DATE,
    date_of_joining DATE,
    course VARCHAR(100),
    department VARCHAR(100),
    semester INT,
    blood_group VARCHAR(5),
    aadhar_number VARCHAR(20) UNIQUE,
    status ENUM('active', 'inactive', 'graduated', 'suspended') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Rooms table
CREATE TABLE IF NOT EXISTS rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type ENUM('single', 'double', 'triple', 'dormitory') NOT NULL,
    capacity INT NOT NULL,
    current_occupancy INT DEFAULT 0,
    floor INT NOT NULL,
    building_name VARCHAR(50),
    amenities TEXT,
    rent_amount DECIMAL(10,2) NOT NULL,
    security_deposit DECIMAL(10,2) DEFAULT 0,
    status ENUM('available', 'occupied', 'maintenance', 'reserved') DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Room Allocation table
CREATE TABLE IF NOT EXISTS room_allocations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    room_id INT NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE,
    status ENUM('active', 'completed', 'cancelled') DEFAULT 'active',
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Staff table
CREATE TABLE IF NOT EXISTS staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    staff_id VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    date_of_birth DATE,
    date_of_joining DATE,
    designation VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    salary DECIMAL(10,2),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(15),
    aadhar_number VARCHAR(20) UNIQUE,
    status ENUM('active', 'inactive', 'on_leave', 'resigned') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Attendance table
CREATE TABLE IF NOT EXISTS attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('present', 'absent', 'on_leave') NOT NULL,
    remarks TEXT,
    marked_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (marked_by) REFERENCES staff(id) ON DELETE SET NULL,
    UNIQUE KEY unique_attendance (student_id, date)
);

-- Fees Structure table
CREATE TABLE IF NOT EXISTS fee_structures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    amount DECIMAL(10,2) NOT NULL,
    frequency ENUM('one_time', 'monthly', 'quarterly', 'yearly') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Payments table
CREATE TABLE IF NOT EXISTS payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    payment_number VARCHAR(20) UNIQUE NOT NULL,
    student_id INT NOT NULL,
    fee_structure_id INT,
    amount DECIMAL(10,2) NOT NULL,
    paid_amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    due_date DATE NOT NULL,
    payment_method ENUM('cash', 'card', 'bank_transfer', 'upi', 'cheque') NOT NULL,
    transaction_id VARCHAR(100),
    payment_type ENUM('admission', 'rent', 'security', 'mess', 'maintenance', 'fine', 'other') NOT NULL,
    status ENUM('paid', 'pending', 'overdue', 'partially_paid', 'cancelled', 'refunded') DEFAULT 'pending',
    remarks TEXT,
    received_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (fee_structure_id) REFERENCES fee_structures(id) ON DELETE SET NULL,
    FOREIGN KEY (received_by) REFERENCES staff(id) ON DELETE SET NULL
);

-- Payment Installments table
CREATE TABLE IF NOT EXISTS payment_installments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    payment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    due_date DATE NOT NULL,
    paid_amount DECIMAL(10,2) DEFAULT 0,
    payment_date DATE,
    status ENUM('pending', 'paid', 'overdue', 'partially_paid') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE
);

-- Complaints table
CREATE TABLE IF NOT EXISTS complaints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_number VARCHAR(20) UNIQUE NOT NULL,
    student_id INT,
    staff_id INT,
    title VARCHAR(255) NOT NULL,
    complaint_type ENUM('electrical', 'plumbing', 'cleaning', 'furniture', 'internet', 'other') NOT NULL,
    description TEXT,
    priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
    status ENUM('pending', 'in_progress', 'resolved', 'rejected') DEFAULT 'pending',
    assigned_to INT,
    resolution_notes TEXT,
    date_resolved DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES staff(id) ON DELETE SET NULL
);

-- Maintenance Requests table
CREATE TABLE IF NOT EXISTS maintenance_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    request_number VARCHAR(20) UNIQUE NOT NULL,
    room_id INT,
    reported_by INT,
    title VARCHAR(255) NOT NULL,
    request_type ENUM('repair', 'replacement', 'cleaning', 'pest_control', 'other') NOT NULL,
    description TEXT,
    priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
    status ENUM('pending', 'in_progress', 'completed', 'cancelled') DEFAULT 'pending',
    assigned_to INT,
    completion_notes TEXT,
    completion_date DATETIME,
    cost_estimate DECIMAL(10,2),
    actual_cost DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE SET NULL,
    FOREIGN KEY (reported_by) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES staff(id) ON DELETE SET NULL
);

-- Mess menu table
CREATE TABLE IF NOT EXISTS mess_menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') UNIQUE NOT NULL,
    breakfast TEXT,
    lunch TEXT,
    dinner TEXT,
    special_note TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Mess Attendance table
CREATE TABLE IF NOT EXISTS mess_attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    date DATE NOT NULL,
    breakfast BOOLEAN DEFAULT FALSE,
    lunch BOOLEAN DEFAULT FALSE,
    dinner BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    UNIQUE KEY unique_mess_attendance (student_id, date)
);

-- Visitors table
CREATE TABLE IF NOT EXISTS visitors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    visitor_name VARCHAR(100) NOT NULL,
    visitor_phone VARCHAR(15),
    visitor_email VARCHAR(100),
    visitor_address TEXT,
    id_proof_type VARCHAR(50),
    id_proof_number VARCHAR(50),
    student_id INT,
    purpose TEXT NOT NULL,
    check_in DATETIME NOT NULL,
    check_out DATETIME,
    status ENUM('checked_in', 'checked_out') DEFAULT 'checked_in',
    notes TEXT,
    checked_in_by INT,
    checked_out_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE SET NULL,
    FOREIGN KEY (checked_in_by) REFERENCES staff(id) ON DELETE SET NULL,
    FOREIGN KEY (checked_out_by) REFERENCES staff(id) ON DELETE SET NULL
);

-- Inventory table
CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    unit VARCHAR(20),
    minimum_quantity INT DEFAULT 0,
    location VARCHAR(100),
    description TEXT,
    status ENUM('in_stock', 'low_stock', 'out_of_stock', 'disposed') DEFAULT 'in_stock',
    last_restocked_date DATE,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Inventory Transactions table
CREATE TABLE IF NOT EXISTS inventory_transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    inventory_id INT NOT NULL,
    transaction_type ENUM('purchase', 'issue', 'return', 'adjustment', 'disposal') NOT NULL,
    quantity INT NOT NULL,
    reference_number VARCHAR(50),
    notes TEXT,
    transaction_date DATE NOT NULL,
    processed_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (inventory_id) REFERENCES inventory(id) ON DELETE CASCADE,
    FOREIGN KEY (processed_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Notifications table
CREATE TABLE IF NOT EXISTS notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    notification_type ENUM('info', 'warning', 'alert', 'announcement') DEFAULT 'info',
    target_audience ENUM('all', 'students', 'staff', 'specific') DEFAULT 'all',
    target_id INT,
    is_read BOOLEAN DEFAULT FALSE,
    created_by INT,
    expires_at DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- User Notifications junction table
CREATE TABLE IF NOT EXISTS user_notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    notification_id INT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    read_at DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (notification_id) REFERENCES notifications(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_notification (user_id, notification_id)
);

-- Audit Logs table
CREATE TABLE IF NOT EXISTS audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(50) NOT NULL,
    table_name VARCHAR(50),
    record_id INT,
    old_values TEXT,
    new_values TEXT,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Insert sample data for users (password is hashed 'password123')
INSERT INTO users (username, password, email, role) VALUES 
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@hostel.com', 'admin'),
('staff1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff1@hostel.com', 'staff'),
('student1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student1@college.edu', 'student');

-- Insert sample data for rooms
INSERT INTO rooms (room_number, room_type, capacity, floor, building_name, amenities, rent_amount, security_deposit) VALUES 
('101', 'double', 2, 1, 'A Block', 'AC, Attached Bathroom, Wi-Fi', 8000.00, 10000.00),
('102', 'double', 2, 1, 'A Block', 'Non-AC, Attached Bathroom, Wi-Fi', 6000.00, 10000.00),
('201', 'triple', 3, 2, 'A Block', 'AC, Attached Bathroom, Balcony, Wi-Fi', 10000.00, 15000.00),
('202', 'triple', 3, 2, 'A Block', 'Non-AC, Attached Bathroom, Wi-Fi', 8000.00, 15000.00),
('G01', 'dormitory', 8, 0, 'Ground Floor', 'Common Bathroom, Study Tables, Lockers', 4000.00, 8000.00);

-- Insert sample data for staff
INSERT INTO staff (user_id, staff_id, name, email, phone, designation, department, salary) VALUES 
(2, 'STF001', 'Priya Sharma', 'priya.sharma@hostel.com', '9876543210', 'Warden', 'Administration', 50000.00),
(NULL, 'STF002', 'Rahul Verma', 'rahul.verma@hostel.com', '9876543211', 'Caretaker', 'Maintenance', 35000.00);

-- Insert sample data for students
INSERT INTO students (user_id, student_id, name, email, phone, address, city, state, country, pincode, date_of_birth, date_of_joining, course, department, semester, blood_group, aadhar_number) VALUES 
(3, 'STU2023001', 'Ananya Patel', 'ananya.patel@college.edu', '9876543201', '123 MG Road', 'Mumbai', 'Maharashtra', 'India', '400001', '2000-05-15', '2023-06-01', 'B.Tech', 'Computer Science', 3, 'B+', '123456789012'),
(NULL, 'STU2023002', 'Priya Singh', 'priya.singh@college.edu', '9876543202', '456 Park Avenue', 'Mumbai', 'Maharashtra', 'India', '400002', '2001-02-20', '2023-06-01', 'B.Tech', 'Electronics', 3, 'A+', '123456789013');

-- Insert sample data for room allocations
INSERT INTO room_allocations (student_id, room_id, date_from, status, created_by) VALUES 
(1, 1, '2023-06-01', 'active', 1),
(2, 2, '2023-06-01', 'active', 1);

-- Insert sample data for fee structures
INSERT INTO fee_structures (name, description, amount, frequency, is_active) VALUES 
('Admission Fee', 'One-time admission fee', 5000.00, 'one_time', TRUE),
('Security Deposit', 'Refundable security deposit', 10000.00, 'one_time', TRUE),
('Room Rent - AC Double', 'Monthly room rent for AC double sharing', 8000.00, 'monthly', TRUE),
('Room Rent - Non-AC Double', 'Monthly room rent for Non-AC double sharing', 6000.00, 'monthly', TRUE),
('Mess Charges', 'Monthly mess charges', 3500.00, 'monthly', TRUE);

-- Insert sample data for payments
INSERT INTO payments (payment_number, student_id, fee_structure_id, amount, paid_amount, payment_date, due_date, payment_method, payment_type, status, received_by) VALUES 
('PAY2023001', 1, 1, 5000.00, 5000.00, '2023-06-01', '2023-06-01', 'bank_transfer', 'admission', 'paid', 1),
('PAY2023002', 1, 2, 10000.00, 10000.00, '2023-06-01', '2023-06-01', 'bank_transfer', 'security', 'paid', 1),
('PAY2023003', 1, 3, 8000.00, 8000.00, '2023-07-01', '2023-07-05', 'upi', 'rent', 'paid', 1);

-- Insert sample data for mess menu
INSERT INTO mess_menu (day_of_week, breakfast, lunch, dinner, is_active, created_by) VALUES 
('Monday', 'Bread, Butter, Jam, Boiled Eggs, Milk, Tea, Coffee', 'Jeera Rice, Dal Tadka, Roti, Mix Veg, Curd, Salad, Pickle', 'Roti, Paneer Butter Masala, Jeera Rice, Dal Fry, Salad', TRUE, 1),
('Tuesday', 'Poha, Jalebi, Tea, Coffee, Banana', 'Steamed Rice, Rajma Masala, Roti, Aloo Gobi, Curd, Salad', 'Roti, Chole, Rice, Dal, Salad', TRUE, 1),
('Wednesday', 'Idli, Sambar, Chutney, Coffee', 'Veg Biryani, Raita, Papad, Salad', 'Phulka, Dal Makhani, Jeera Rice, Mix Veg, Salad', TRUE, 1),
('Thursday', 'Aloo Paratha, Curd, Pickle, Tea', 'Jeera Rice, Dal Fry, Roti, Bhindi Masala, Curd', 'Roti, Chana Masala, Rice, Dal, Salad', TRUE, 1),
('Friday', 'Bread Pakora, Ketchup, Tea', 'Steamed Rice, Sambar, Rasam, Appalam, Buttermilk', 'Roti, Paneer Do Pyaza, Jeera Rice, Dal, Salad', TRUE, 1),
('Saturday', 'Dosa, Chutney, Sambar, Coffee', 'Veg Pulao, Raita, Papad, Gulab Jamun', 'Roti, Dal Makhani, Jeera Rice, Mix Veg, Salad', TRUE, 1),
('Sunday', 'Puri, Chana Masala, Halwa', 'Special Thali: Jeera Rice, Dal Makhani, Naan, Paneer Butter Masala, Gulab Jamun', 'Sandwich, Soup, Pasta, Salad', TRUE, 1);

-- Insert sample data for complaints
INSERT INTO complaints (complaint_number, student_id, title, complaint_type, description, priority, status, created_at) VALUES 
('CMP2023001', 1, 'AC not working', 'electrical', 'AC in room 101 is not cooling properly', 'high', 'pending', '2023-07-15 10:30:00'),
('CMP2023002', 2, 'Leaking tap', 'plumbing', 'Tap in bathroom is leaking continuously', 'medium', 'in_progress', '2023-07-16 11:45:00');

-- Insert sample data for visitors
INSERT INTO visitors (visitor_name, visitor_phone, visitor_email, id_proof_type, id_proof_number, student_id, purpose, check_in, status, checked_in_by) VALUES 
('Rahul Patel', '9876543232', 'rahul@example.com', 'Aadhar', '123456789014', 1, 'Meeting sister', '2023-07-20 16:30:00', 'checked_in', 1),
('Meera Shah', '9876543233', 'meera@example.com', 'PAN', 'ABCDE1234F', 2, 'Parent visit', '2023-07-20 17:00:00', 'checked_out', 1);

-- Update check out for one visitor
UPDATE visitors SET check_out = '2023-07-20 18:30:00', status = 'checked_out', checked_out_by = 1 WHERE id = 2;

-- Insert sample data for inventory
INSERT INTO inventory (item_name, category, quantity, unit, minimum_quantity, location, status, created_by) VALUES 
('Bedsheets', 'Linen', 50, 'pieces', 20, 'Linen Room', 'in_stock', 1),
('Pillows', 'Linen', 30, 'pieces', 15, 'Linen Room', 'in_stock', 1),
('Buckets', 'Bathroom', 25, 'pieces', 10, 'Store Room', 'in_stock', 1),
('Mops', 'Cleaning', 10, 'pieces', 5, 'Janitor Closet', 'in_stock', 1);

-- Insert sample notification
INSERT INTO notifications (title, message, notification_type, target_audience, is_read, created_by, expires_at) VALUES 
('Hostel Maintenance', 'There will be a water supply shutdown on 25th July from 10 AM to 4 PM for maintenance work.', 'info', 'all', FALSE, 1, '2023-07-25 23:59:59');