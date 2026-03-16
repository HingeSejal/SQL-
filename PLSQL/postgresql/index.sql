-- Create an index on the LastName column of the Employees table
CREATE INDEX idx_lastname
ON Employees (LastName);

-- Create a unique index on the Email column of the Employees table
CREATE UNIQUE INDEX idx_email   
ON Employees (Email);

-- Create a composite index on the LastName and FirstName columns of the Employees table
CREATE INDEX idx_lastname_firstname
ON Employees (LastName, FirstName);

-- Create a partial index on the Salary column of the Employees table for employees with a salary greater than 50000
CREATE INDEX idx_salary_high
ON Employees (Salary)
WHERE Salary > 50000;

-- Create a full-text index on the Bio column of the Employees table
CREATE INDEX idx_bio_fulltext
ON Employees
USING gin(to_tsvector('english', Bio));

-- here gin is used for full-text search 
-- to_tsvector function is used to convert the Bio column into a tsvector data type for indexing.
-- The 'english' parameter specifies the language for text search configuration.


-- Create indexes on the Employees table for performance optimization
CREATE INDEX idx_department
ON Employees (DepartmentID);
CREATE INDEX idx_hiredate
ON Employees (HireDate);
CREATE INDEX idx_salary
ON Employees (Salary);
CREATE INDEX department_salary_idx
ON Employees (DepartmentID, Salary);


--------------------------------------------------------
-- CLUSTERED INDEX

-- data in the table is physically stored in the order of the index.
-- In PostgreSQL, you can create a clustered index using the CLUSTER command, 
-- but it does not maintain the clustered order automatically after the initial clustering. 
-- You need to run the CLUSTER command again to maintain the clustered order after data modifications.
-- A table can have only one clustered index

CREATE INDEX idx_employee_id
ON Employees (EmployeeID); -- table rows are physically sorted by EmployeeID
CLUSTER Employees USING idx_employee_id;

CREATE CLUSTERED INDEX idx_employeeid
ON Employees(EmployeeID);

--Usually created automatically when you define a PRIMARY KEY

------------------------------------------------

-- NON-CLUSTERED INDEX

-- data in the table is not stored in the order of the index.
-- A table can have multiple non-clustered indexes.

CREATE NONCLUSTERED INDEX idx_lastname
ON Employees(LastName);

