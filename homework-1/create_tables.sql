-- SQL-команды для создания таблиц
create table employees
(
	employee_id int primary key,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	title varchar(100) not null,
	birth_date date not null,
	notes text
);


create table customers
(
	customers_id char(5) primary key,
	company_name varchar (50) not null,
	contact_name varchar (50) not null
);

select * from orders;

create table orders
(
	order_id int primary key,
	customers_id char (5) references customers(customers_id)  not null,
	employee_id int references employees(employee_id) not null,
	order_date date not null,
	ship_city varchar (100) not null


);