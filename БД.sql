



CREATE TABLE DEPARTMENT(
			id INT NOT NULL,
			name NVARCHAR(100) NOT NULL
			PRIMARY KEY(id))

INSERT INTO DEPARTMENT (id, name) VALUES
(1, N'����� ������'),
(2, N'����� ����������'),
(3, N'����� IT'),
(4, N'����� ������'),
(5, N'�����������');

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
(1, 1, NULL, N'������', 100000),
(2, 2, 1, N'�����', 80000),
(3, 3, 1, N'����', 90000),
(4, 4, 2, N'����', 70000),
(5, 5, 2, N'������', 60000),
(6, 1, 3, N'����', 85000),
(7, 2, 3, N'�����', 75000),
(8, 3, 4, N'�������', 95000),
(9, 4, 4, N'���������', 85000),
(10, 5, 5, N'�����', 70000);
