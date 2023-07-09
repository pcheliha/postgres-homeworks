"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv

import psycopg2

# connect to db
conn = psycopg2.connect(host='localhost', database='north', user='postgres', password='K.,fyflzdbnz')

try:
    with conn:
        with conn.cursor() as cur:
            with open('north_data/employees_data.csv', 'r', encoding='UTF-8') as file:
                file_emp = csv.DictReader(file)
                for i in file_emp:
                    cur.execute("insert into employees values(%s, %s, %s, %s, %s, %s)",
                                (i['employee_id'], i['first_name'], i['last_name'], i['title'], i['birth_date'],
                                 i['notes']))

            with open('north_data/customers_data.csv', 'r', encoding='UTF-8') as file:
                file_cus = csv.DictReader(file)
                for i in file_cus:
                    cur.execute("insert into customers values(%s, %s, %s)",
                                (i['customer_id'], i['company_name'], i['contact_name']))

            with open('north_data/orders_data.csv', 'r', encoding='UTF-8') as file:
                file_ord = csv.DictReader(file)
                for i in file_ord:
                    cur.execute("insert into orders values(%s, %s, %s, %s, %s)",
                                (i['order_id'], i['customer_id'], i['employee_id'], i['order_date'], i['ship_city']))



finally:
    conn.close()
