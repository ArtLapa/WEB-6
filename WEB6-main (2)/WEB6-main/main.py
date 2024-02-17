from faker import Faker
import random
import sqlite3
from datetime import datetime


fake = Faker()

conn = sqlite3.connect("D:\my storage\SQL.bd")
c = conn.cursor()


for _ in range(3):
    c.execute("INSERT INTO groups (name) VALUES (?)", (fake.word(),))


for _ in range(50):
    c.execute("INSERT INTO students (name, group_id) VALUES (?, ?)", (fake.name(), fake.random_int(min=1, max=10)))


for _ in range(10):
    c.execute("INSERT INTO teachers (name, subject) VALUES (?, ?)", (fake.name(), fake.word()))


for _ in range(20):
    c.execute("INSERT INTO subjects (name, teacher_id) VALUES (?, ?)", (fake.word(), fake.random_int(min=1, max=10)))


for _ in range(200):
    c.execute("INSERT INTO grades (student_id, subject_id, grade, date_received) VALUES (?, ?, ?, ?)", (fake.random_int(min=1, max=50), fake.random_int(min=1, max=20), fake.random_int(min=1, max=100), fake.date()))


conn.commit()
conn.close()