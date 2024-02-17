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