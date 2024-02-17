-- create_tables.sql
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

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    group_id INT,
    CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT,
    subject_id INT,
    grade INT CHECK (grade BETWEEN 0 AND 100),
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- insert_data.sql
-- Вставка данных для групп
INSERT INTO groups (group_name) VALUES
    ('GroupA'),
    ('GroupB');

-- Вставка данных для преподавателей
INSERT INTO teachers (teacher_name) VALUES
    ('Teacher1'),
    ('Teacher2');

-- Вставка данных для предметов
INSERT INTO subjects (subject_name, teacher_id) VALUES
    ('Subject1', 1),
    ('Subject2', 2);

-- Вставка данных для студентов
INSERT INTO students (student_name, group_id) VALUES
    ('Student1', 1),
    ('Student2', 2);

-- Вставка данных для оценок
INSERT INTO grades (student_id, subject_id, grade) VALUES
    (1, 1, 90),
    (2, 1, 85);
