-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT  distinct ship_name as customer, concat(employees.first_name,' ',employees.last_name) as employee from orders
inner join employees using (employee_id)
WHERE EXISTS (SELECT * FROM employees WHERE orders.employee_id=employees.employee_id AND orders.ship_country=employees.country and orders.ship_via = 2 and city = 'London')

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
select product_name, units_in_stock, suppliers.contact_name, suppliers.phone from products
inner join suppliers using(supplier_id)
where exists(select 1 from categories where products.category_id=4 or products.category_id=2) and discontinued <> 1 and units_in_stock < 25
order by units_in_stock

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
select company_name from customers
left join orders using(customer_id)
where orders.order_date is null

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
select distinct product_name from products
where EXISTS(select 1 from order_details where products.product_id=order_details.product_id and order_details.quantity=10)
