-- Таблица "Студенты"
CREATE TABLE Students (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  GroupID INT,
  Fullname VARCHAR(255),
  FOREIGN KEY (GroupID) REFERENCES Groupstud(ID)
);
 
-- Таблица "Группы"
CREATE TABLE Groupstud (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  GroupName VARCHAR(255)
);
 
-- Таблица "Дисциплины"
CREATE TABLE Disciplines (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  DisciplineName VARCHAR(255)
);
 
-- Таблица "Аудитории"
CREATE TABLE Classrooms (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  ClassroomNumber VARCHAR(255),
  Building VARCHAR(255)
);
 
-- Таблица "Преподаватели"
CREATE TABLE Teachers (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Fullname VARCHAR(255)
);
 
-- Таблица "Пары"
CREATE TABLE Lessons (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  DayOfWeek VARCHAR(255),
  StartTime TIME,
  EndTime TIME,
  ClassroomID INT,
  GroupID INT,
  DisciplineID INT,
  TeacherID INT,
  FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ID),
  FOREIGN KEY (GroupID) REFERENCES Groupstud(ID),
  FOREIGN KEY (DisciplineID) REFERENCES Disciplines(ID),
  FOREIGN KEY (TeacherID) REFERENCES Teachers(ID)
);
INSERT INTO teachers (Fullname) VALUES
('Иванов В.В.'),
('Петров А.И.'),
('Сидорова Е.А.'),
('Козлов И.Н.'),
('Новикова О.П.'),
('Лебедев Д.В.'),
('Калинина Н.Н.'),
('Смирнова Е.А.'),
('Тимофеев Д.А.'),
('Антонова Е.А.');
INSERT INTO groupstud (GroupName) values
('Ежики'),
('Тигры'),
('Кролики'),
('Носороги'),
('Зебры');
INSERT INTO disciplines (DisciplineName) VALUES
('Математика'),
('Физика'),
('Компьютерные науки'),
('Инженерная механика'),
('Электротехника'),
('Материаловедение'),
('Технология производства'),
('Химия'),
('Геодезия и картография'disciplines),
('Архитектура и дизайн');
INSERT INTO classrooms (ClassroomNumber, Building) VALUES
('A10','A'),
('A11','A'),
('A12','A'),
('A13','A'),
('A14','A'),
('B10','B'),
('B11','B'),
('B12','B'),
('B13','B'),
('B14','B'),
('C10','C'),
('C11','C'),
('C12','C'),
('C13','C'),
('C14','C');
INSERT INTO students (GroupID, Fullname) VALUES
(1, 'Студент 1'),
(1, 'Студент 2'),
(1, 'Студент 3'),
(1, 'Студент 4'),
(1, 'Студент 5'),
(2, 'Студент 1'),
(2, 'Студент 2'),
(2, 'Студент 3'),
(2, 'Студент 4'),
(2, 'Студент 5'),
(3, 'Студент 1'),
(3, 'Студент 2'),
(3, 'Студент 3'),
(3, 'Студент 4'),
(3, 'Студент 5'),
(4, 'Студент 1'),
(4, 'Студент 2'),
(4, 'Студент 3'),
(5, 'Студент 1'),
(5, 'Студент 2'),
(5, 'Студент 3'),
(5, 'Студент 4');
INSERT INTO lessons (DayOfWeek, StartTime, EndTime, ClassroomID, GroupID, DisciplineID, TeacherID) VALUES
('Понидельник', '08:00:00', '09:30:00', 1, 1, 1, 1),
('Понидельник', '10:00:00', '11:30:00', 1, 2, 1, 1),
('Понидельник', '08:00:00', '09:30:00', 2, 3, 1, 2),
('Понидельник', '11:30:00', '13:00:00', 3, 1, 2, 2),
('Понидельник', '08:00:00', '09:30:00', 4, 4, 6, 5),
 
('Вторник', '08:00:00', '09:30:00', 1, 1, 1, 2),
('Вторник', '10:00:00', '11:30:00', 1, 2, 1, 3),
('Вторник', '08:00:00', '09:30:00', 2, 3, 1, 4),
('Вторник', '11:30:00', '13:00:00', 3, 1, 2, 5),
('Вторник', '08:00:00', '09:30:00', 4, 4, 6, 6),
 
('Среда', '08:00:00', '09:30:00', 1, 1, 2, 1),
('Среда', '10:00:00', '11:30:00', 1, 2, 2, 1),
('Среда', '08:00:00', '09:30:00', 2, 3, 2, 2),
('Среда', '11:30:00', '13:00:00', 3, 1, 3, 2),
('Среда', '08:00:00', '09:30:00', 4, 4, 7, 5),
 
('Четверг', '08:00:00', '09:30:00', 2, 1, 2, 1),
('Четверг', '10:00:00', '11:30:00', 2, 2, 2, 1),
('Четверг', '08:00:00', '09:30:00', 3, 3, 2, 2),
('Четверг', '11:30:00', '13:00:00', 4, 1, 3, 2),
('Четверг', '08:00:00', '09:30:00', 5, 4, 7, 5),
 
('Пятница', '08:00:00', '09:30:00', 2, 2, 2, 1),
('Пятница', '10:00:00', '11:30:00', 2, 3, 2, 1),
('Пятница', '08:00:00', '09:30:00', 3, 4, 2, 2),
('Пятница', '11:30:00', '13:00:00', 4, 2, 3, 2),
('Пятница', '08:00:00', '09:30:00', 5, 1, 7, 5);

CREATE DEFINER=`root`@`localhost` FUNCTION `count_lessons_by_teacher`(teacher_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE lesson_count INT;
    SELECT COUNT(*) INTO lesson_count FROM lessons WHERE TeacherID = teacher_id;
    RETURN lesson_count;
END

CREATE DEFINER=`root`@`localhost` FUNCTION `max_lessons_day_by_group`(group_name VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE busiest_day VARCHAR(50);
    SELECT DayOfWeek
    INTO busiest_day
    FROM (
        SELECT DayOfWeek, COUNT(*) AS count
        FROM lessons
        JOIN groupstud ON lessons.GroupId = groupstud.ID
        WHERE groupstud.GroupName = group_name
        GROUP BY DayOfWeek
        ORDER BY count DESC
        LIMIT 1
    ) AS t;
    RETURN busiest_day;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_disciplines_by_group`(IN groupName VARCHAR(50))
BEGIN
    SELECT DISTINCT d.DisciplineName
    FROM lessons l
    JOIN disciplines d ON l.DisciplineID = d.ID
    JOIN groupstud g ON l.GroupID = g.ID
    WHERE g.GroupName = groupName;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_disciplines_by_group`(IN groupName VARCHAR(50))
BEGIN
    SELECT DISTINCT d.DisciplineName
    FROM lessons l
    JOIN disciplines d ON l.DisciplineID = d.ID
    JOIN groupstud g ON l.GroupID = g.ID
    WHERE g.GroupName = groupName;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_disciplines_by_group`(IN groupName VARCHAR(50))
BEGIN
    SELECT DISTINCT d.DisciplineName
    FROM lessons l
    JOIN disciplines d ON l.DisciplineID = d.ID
    JOIN groupstud g ON l.GroupID = g.ID
    WHERE g.GroupName = groupName;
END
