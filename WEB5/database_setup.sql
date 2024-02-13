-- create_tables.sql
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    group_id INT,
    CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(50) NOT NULL
);

CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    teacher_name VARCHAR(255) NOT NULL
);

CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(255) NOT NULL,
    teacher_id INT,
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT,
    subject_id INT,
    grade INT,
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- insert_data.sql
-- Insert data for students
INSERT INTO students (student_name, group_id) VALUES
    (Faker()::name, 1),
    (Faker()::name, 2);
    -- Add more students...

-- Insert data for groups
INSERT INTO groups (group_name) VALUES
    (Faker()::word),
    (Faker()::word);
    -- Add more groups...

-- Insert data for teachers
INSERT INTO teachers (teacher_name) VALUES
    (Faker()::name),
    (Faker()::name);
    -- Add more teachers...

-- Insert data for subjects
INSERT INTO subjects (subject_name, teacher_id) VALUES
    (Faker()::word, 1),
    (Faker()::word, 2);
    -- Add more subjects...

-- Insert data for grades
INSERT INTO grades (student_id, subject_id, grade) VALUES
    (1, 1, Faker()::number_between(50, 100)),
    (2, 1, Faker()::number_between(50, 100));

-- Вставка даних для студентів
INSERT INTO students (student_name, group_id) VALUES
    ('Student1', 1),
    ('Student2', 2);
    -- Додайте ще студентів...

-- Вставка даних для груп
INSERT INTO groups (group_name) VALUES
    ('GroupA'),
    ('GroupB');
    -- Додайте ще груп...

-- Вставка даних для викладачів
INSERT INTO teachers (teacher_name) VALUES
    ('Teacher1'),
    ('Teacher2');
    -- Додайте ще викладачів...

-- Вставка даних для предметів
INSERT INTO subjects (subject_name, teacher_id) VALUES
    ('Subject1', 1),
    ('Subject2', 2);
    -- Додайте ще предмети...

-- Вставка даних для оцінок
INSERT INTO grades (student_id, subject_id, grade) VALUES
    (1, 1, 90),
    (2, 1, 85);
    -- Додайте ще оцінки...
