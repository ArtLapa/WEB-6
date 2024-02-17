SELECT students.name, AVG(grades.grade) as average_grade
FROM students
JOIN grades ON students.id = grades.student_id
GROUP BY students.id
ORDER BY average_grade DESC
LIMIT 5;
SELECT students.name, AVG(grades.grade) as average_grade
FROM students
JOIN grades ON students.id = grades.student_id
JOIN subjects ON grades.subject_id = subjects.id
WHERE subjects.name = 'fine'
GROUP BY students.id
ORDER BY average_grade DESC
LIMIT 1;
SELECT groups.name, AVG(grades.grade) as average_grade
FROM grades
JOIN students ON grades.student_id = students.id
JOIN groups ON students.group_id = groups.id
JOIN subjects ON grades.subject_id = subjects.id
WHERE subjects.name = 'fine'
GROUP BY groups.id
ORDER BY average_grade DESC;
SELECT AVG(grade) as average_grade
FROM grades;
SELECT subjects.name
FROM subjects
JOIN teachers ON subjects.teacher_id = teachers.id
WHERE teachers.name = 'Molly Brown';
SELECT students.name
FROM students
JOIN groups ON students.group_id = groups.id
WHERE groups.name = 'goal';
SELECT students.name, grades.grade
FROM grades
JOIN students ON grades.student_id = students.id
JOIN groups ON students.group_id = groups.id
JOIN subjects ON grades.subject_id = subjects.id
WHERE groups.name = 'peace' AND subjects.name = 'really';