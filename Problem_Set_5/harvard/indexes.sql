CREATE INDEX enrollments_student_index
ON enrollments (student_id);

CREATE INDEX enrollments_course_index
ON enrollments (course_id);

CREATE INDEX satisfies_index
ON satisfies (course_id);

CREATE INDEX courses_index
ON courses (semester);