



CREATE TABLE DEPARTMENT(
			id INT NOT NULL,
			name NVARCHAR(100) NOT NULL
			PRIMARY KEY(id))

INSERT INTO DEPARTMENT (id, name) VALUES
(1, N'Отдел продаж'),
(2, N'Отдел маркетинга'),
(3, N'Отдел IT'),
(4, N'Отдел кадров'),
(5, N'Бухгалтерия');

CREATE TABLE EMPLOYEE (
    id INT NOT NULL PRIMARY KEY,
    department_Id INT NOT NULL,
    chief_id INT,
    name NVARCHAR(100) NOT NULL,
    Ssalary INT NOT NULL,
    FOREIGN KEY (department_Id) REFERENCES DEPARTMENT(id),
    FOREIGN KEY (chief_id) REFERENCES EMPLOYEE(id)
);

INSERT INTO EMPLOYEE (id, department_Id, chief_id, name, Ssalary) VALUES
(1, 1, NULL, N'Андрей', 100000),
(2, 2, 1, N'Мария', 80000),
(3, 3, 1, N'Иван', 90000),
(4, 4, 2, N'Анна', 70000),
(5, 5, 2, N'Сергей', 60000),
(6, 1, 3, N'Олег', 85000),
(7, 2, 3, N'Ренат', 75000),
(8, 3, 4, N'Дмитрий', 95000),
(9, 4, 4, N'Екатерина', 85000),
(10, 5, 5, N'Роман', 70000);
