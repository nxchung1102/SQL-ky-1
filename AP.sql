CREATE DATABASE AP 
CREATE TABLE teacher
(
    teacherID VARCHAR(10)PRIMARY KEY,
	fullName NVARCHAR(50),
	gender NVARCHAR(10),
	classID VARCHAR(10),
)
CREATE TABLE Class
(
    classID VARCHAR(10)PRIMARY KEY,
	NumberOfStudent INT,
	ClassName VARCHAR(50),
	TeacherID VARCHAR(10),
	Slot INT,
	Room VARCHAR(50),
	FOREIGN KEY(TeacherID) REFERENCES dbo.teacher (teacherID)

)
CREATE TABLE student
(
    StudenID VARCHAR(10) PRIMARY KEY,
	FullName NVARCHAR(50),
	Gmail NVARCHAR(50),
	Address NVARCHAR(50),
	gender NVARCHAR(10),
	classID VARCHAR(10),
	FOREIGN KEY(classID) REFERENCES dbo.Class (classID)
)
CREATE TABLE TimeTable
(
    ClassID VARCHAR(10),
	ClassName NVARCHAR(50),
	Date DATE,
	Amphitheater VARCHAR(10),
	Subject NVARCHAR(50),
	SubjectID VARCHAR(10),
	TeacherName NVARCHAR(50),
	link NVARCHAR(50),
	FOREIGN KEY(ClassID) REFERENCES dbo.Class(classID),
)
CREATE TABLE Mark
(
     StudenID VARCHAR(10),
	 ClassID VARCHAR(10),
	 PointName NVARCHAR(50),
	 Mark NUMERIC(10,2),
	 PRIMARY KEY(StudenID,ClassID),
	 FOREIGN KEY (StudenID) REFERENCES dbo.student(StudenID),
	 FOREIGN KEY (ClassID) REFERENCES dbo.Class(classID)
)
CREATE TABLE Attendance
(
    StudenID VARCHAR(10)PRIMARY KEY,
	Date DATE,
	Shift INT,
	RollCaller NVARCHAR(50),
	Status NVARCHAR(50),
	note NVARCHAR(50),
	FOREIGN KEY (StudenID) REFERENCES dbo.student(StudenID)
)
CREATE TABLE Support
(
    SupportID VARCHAR(10)PRIMARY KEY,
	StudentID VARCHAR(10),
	attendance NVARCHAR(50),
	mark NUMERIC(10,2),
	curriculum NVARCHAR(50),
	changeIndustry NVARCHAR(50),
	FOREIGN KEY(StudentID) REFERENCES dbo.student(StudenID)
)
INSERT INTO dbo.teacher
(
    teacherID,
    fullName,
    gender,
    classID
)
VALUES
('ph10',  N'nguyễn xuân hoàng', N'nam',  'IT101'),
('ph11',  N'nguyễn thị nở', N'nữ',  'IT103'),
('ph12',  N'nguyễn xuân khá', N'nam',  'IT105')
INSERT INTO dbo.Class
(
    classID,
    NumberOfStudent,
    ClassName,
    TeacherID,
    Slot,
    Room
)
VALUES
(   'IT101',   30,   'SQL',    'ph10',  40,  'L201'  ),
(   'IT103',   35,   'WEB',    'ph12',  40,  'L303'  ),
(   'IT104',   30,   'SQL',    'ph10',  40,  'L201'  ),
(   'IT105',   32,   'jv1',    'ph12',  40,  'L205'  ),
(   'IT106',   30,   'TH',    'ph11',  40,  'L206'  )

INSERT INTO dbo.student
(
    StudenID,
    FullName,
    Gmail,
    Address,
    gender,
    classID
)
VALUES
(   'ph01', N'nuyễn xuân chung', N'nxchung1102@gmail.com',  N'hà nội', N'nam', 'IT101'    ),
(   'ph02', N'nuyễn xuân tới', N'toidbrr1102@gmail.com',  N'hà nội', N'gay', 'IT101'    ),
(   'ph03', N'lò thị rỗng', N'ronglon1102@gmail.com',  N'nam định', N'nữ', 'IT106'    ),
(   'ph04', N'bùi xuân huấn', N'huanbx1102@gmail.com',  N'tp.HCM', N'nam', 'IT103'    ),
(   'ph05', N'nuyễn xuân thắm', N'nxtham1102@gmail.com',  N'bắc ninh', N'nữ', 'IT105'    )

INSERT INTO dbo.TimeTable
(
    ClassID,
    ClassName,
    Date,
    Amphitheater,
    Subject,
    SubjectID,
    TeacherName,
    link
)
VALUES
('IT101',N'SQL','2022-07-10', 'TVB',N'cơ sở dữ liệu','111',N'nguyễn xuân hoàng',N'aaaaaaa.com'),
('IT103',N'WEB','2022-08-01', 'TVB',N'xây dựng web','113',N'nguyễn thị nở',N'aaaaaaa.com'),
('IT105',N'JV1','2022-03-22', 'TVB',N'java1','112',N'nguyễn xuân khá',N'aaaaaaa.com'),
('IT106',N'TH','2022-09-03', 'TVB',N'tin học','114',N'nguyễn xuân hoàng',N'aaaaaaa.com')

INSERT INTO dbo.Mark
(
    StudenID,
    ClassID,
    PointName,
    Mark
)
VALUES
('ph01', 'IT101',  N'ASM', 10),
('ph02', 'IT101',  N'ASM', 1),
('ph03', 'IT106',  N'ASM', 7),
('ph04', 'IT103',  N'ASM', 8),
('ph05', 'IT105',  N'ASM', 4)

INSERT INTO dbo.Attendance
(
    StudenID,
    Date,
    Shift,
    RollCaller,
    Status,
    note
)
VALUES
('ph01','2022-07-10' , 03,N'nguyễn xuân hoàng',N'LT+TH',NULL),
('ph02','2022-07-10' , 03,N'nguyễn xuân hoàng',N'LT+TH',NULL),
('ph03','2022-09-03' , 05,N'nguyễn xuân hoàng',N'LT+TH',NULL),
('ph04','2022-08-01' , 01,N'nguyễn thị nở',N'LT+TH',NULL),
('ph05','2022-03-22' , 01,N'nguyễn xuân khá',N'LT+TH',NULL)

INSERT INTO dbo.Support
(
    SupportID,
    StudentID,
    attendance,
    mark,
    curriculum,
    changeIndustry
)
VALUES
(   '221',   'ph01',  N'hỗ trợ lỗi điểm danh', NULL, NULL,  N'thay đổi lịch học' ),
(   '222',   'ph02',  N'hỗ trợ lỗi điểm danh', NULL, N'chương trình giảng dạy',  N'thay đổi lịch học' ),
(   '223',   'ph01',  NULL, NULL, N'chương trình giảng dạy',  N'thay đổi lịch học' )

-- xuất ra điểm của sv có điểm > 5 nếu có nhiều hơn 2 sv thì xuất họ tên của sv đó sau đó sắp xếp theo thứ tự giảm dần
SELECT t01.FullName,(SELECT COUNT(t4.Mark)FROM dbo.Mark t4 WHERE t4.Mark>5) 
FROM	dbo.student t01 
JOIN dbo.Mark t02 ON t01.StudenID = t02.StudenID
WHERE (SELECT COUNT(t03.Mark) FROM dbo.Mark t03  
WHERE t03.Mark>5) >2 AND t02.Mark>5
GROUP BY t01.FullName 
HAVING (SELECT COUNT(t4.Mark)FROM dbo.Mark t4) >2  ORDER BY t01.FullName DESC

--select *,(SELECT COUNT(t1.mark) FROM dbo.Mark t1) FROM dbo.Mark t0           (lỗi hay gặp và đây là ví dụ đúng)

SELECT * FROM dbo.TimeTable JOIN dbo.Class ON Class.classID = TimeTable.ClassID
JOIN dbo.student ON student.classID = Class.classID 
WHERE dbo.student.FullName = N'nuyễn xuân chung'



