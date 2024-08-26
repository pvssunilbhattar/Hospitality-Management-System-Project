Dataset Source:
----------------

The dataset used in this project was generated using Faker, a Python library that generates fake data for various purposes. The data has been crafted to simulate realistic scenarios for a retail business. The dataset includes information about customers, products, employees, payments, promotions, stores, and sales.

File Descriptions:
------------------

1. create.sql: This SQL script contains the commands to create tables in the database schema. It defines the structure of tables such as customers, products, employees, payments, promotions, stores, and sales.

2. load.sql: This SQL script contains the commands to load data into the created tables. It uses COPY and INSERT statements to import data from CSV files into the respective tables.

Instructions:
--------------

1. Ensure that you have a PostgreSQL database set up and running.
2. Create a database and load the dataset (.csv file) into that database.
3. After loading the dataset, execute the commands in create.sql to create the necessary tables in your database.
4. Run the queries in load.sql to insert the data into the respective tables
5. After loading the data into different tables run the select query to see the results.