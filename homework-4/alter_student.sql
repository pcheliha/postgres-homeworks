-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
      create table student
      (
        student_id serial primary key,
        first_name varchar,
        last_name varchar,
        birthday date,
        phone varchar
      ) 

-- 2. Добавить в таблицу student колонку middle_name varchar
      alter table student add column midlle_name varchar

-- 3. Удалить колонку middle_name
      alter table student drop column midlle_name
 
-- 4. Переименовать колонку birthday в birth_date
      alter table student rename  birthday to birth_date

-- 5. Изменить тип данных колонки phone на varchar(32)
      alter table student alter column phone set data type varchar(32)

-- 6. Вставить три любых записи с автогенерацией идентификатора
      insert into student(first_name) vakues ('илья')
      insert into student(first_name) vakues ('оля')
      insert into student(first_name) vakues ('настя')
-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
      truncate table student restart identity
