USE Курсова;
GO

CREATE TABLE РОЗРОБНИК(
	Код_розробника INT PRIMARY KEY,
	Назва_студії NVARCHAR(100),
	Країна_розробника NVARCHAR(50)
);

CREATE TABLE КОРИСТУВАЧ(
	Код_користувача INT PRIMARY KEY,
	Нікнейм NVARCHAR(50),
	Електронна_пошта NVARCHAR(100),
	Дата_народження DATE
);

CREATE TABLE ЖАНР(
	Код_жанру INT PRIMARY KEY,
	Назва_жанру NVARCHAR(50),
	Опис_жанру NVARCHAR(MAX)
);

CREATE TABLE ПЛАТФОРМА(
	Код_платформи INT PRIMARY KEY,
	Назва_платформи NVARCHAR(50),
	Технічні_характеристики NVARCHAR(MAX)
);

CREATE TABLE ГРА(
	Код_гри INT PRIMARY KEY,
	Назва_гри NVARCHAR(50),
	Дата_виходу DATE,
	Опис_гри NVARCHAR(MAX),
	Віковий_рейтинг NVARCHAR(10),
	Середня_оцінка DECIMAL(3,2),
	Ціна DECIMAL (10,2),
	Код_розробника INT FOREIGN KEY REFERENCES РОЗРОБНИК(Код_розробника)
);

CREATE TABLE ВІДГУК(
	Код_відгуку INT PRIMARY KEY,
	Текст_відгуку NVARCHAR(MAX),
	Оцінка INT,
	Дата_написання DATE,
	Код_гри INT FOREIGN KEY REFERENCES ГРА(Код_гри),
	Код_користувача INT FOREIGN KEY REFERENCES КОРИСТУВАЧ(Код_користувача)
);

CREATE TABLE ЖАНРИ_ГРИ(
	Код_гри INT FOREIGN KEY REFERENCES ГРА(Код_гри),
	Код_жанру INT FOREIGN KEY REFERENCES ЖАНР(Код_жанру)
);

CREATE TABLE ПЛАТФОРМИ_ГРИ(
	Код_гри INT FOREIGN KEY REFERENCES ГРА(Код_гри),
	Код_платформи INT FOREIGN KEY REFERENCES ПЛАТФОРМА(Код_платформи)
);
