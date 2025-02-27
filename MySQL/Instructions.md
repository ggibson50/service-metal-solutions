This database was assembled and tested using MySQL version 8.0.41

Order of Script Execution:
    - ProductsDB.sql
        - Includes CREATE TABLE steps to setup database design

    - QueriesForTesting.sql
        - Inserts data into tables and queries the data to return rows - Run the SELECT query alongside the INSERT query above it

    - Additional/Optional: Products_StoredProcs.sql - RUN AFTER "QueriesForTesting.sql" file
        - Includes stored procedures created alongside the database design. In the comments of the file contains CALL statements to execute the procedures
        - Run the CALLs in separate queries after the executing stored procedure creation

