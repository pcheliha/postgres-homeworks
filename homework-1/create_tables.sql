-- SQL-команды для создания таблиц
create table employees
(
	employees_id int primary key,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	title varchar(100) not null,
	birth_date int,
	notes varchar(100) not null
);


create table customers
(
	customers_id int primary key,
	company_name varchar (50) not null,
	contact_name varchar (50) not null
);

select * from orders;

create table orders
(
	order_id int primary key,
	customers_id varchar (50) references customers(custumer_id)  not null,
	employee_id int references employees(employee_id) not null,
	order_date date not null,
	ship_city varchar (100) not null


);