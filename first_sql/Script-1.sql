

--DROP table ch_order_product;
--DROP table ch_orders;
--DROP table ch_clients;
--DROP table ch_worker_shedules;
--DROP table ch_workers;
--DROP table ch_worker_positions;
--DROP table ch_products;
--DROP table ch_product_types;

				--DROP table ch_languages;

-- select * from nls_session_parameters where parameter = 'NLS_DATE_LANGUAGE';

-- ���� ���������, ��� �� ���������

CREATE TABLE ch_product_types(
	id NUMBER GENERATED as IDENTITY primary KEY,
	title_en varchar(100) NOT null,
	title_ru varchar(200) NOT null
);


-- �����, ���� ��������
--CREATE TABLE ch_languages(
--	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
--	code varchar(5) NOT NULL,
--	title varchar(20) NOT null
--);
--
--INSERT INTO ch_languages(code, title) VALUES ('en', 'English');
--INSERT INTO ch_languages(code, title) VALUES ('ru', 'Russian');
--INSERT INTO ch_languages(code, title) VALUES ('ua', 'Ukrainian');

--SELECT * FROM ch_languages;


-- �������, �������, �����, � ����� ��������

CREATE TABLE ch_products(
	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
	type_id NUMBER, 
	price NUMBER(6,2) NOT null, 
	-- ������� � ������� ���� ������������ �� �����
	title_en varchar(100) NOT null,
	title_ru varchar(200) NOT null,
	--name
	FOREIGN KEY (type_id) REFERENCES ch_product_types(id)
);


-- ��������� �����������
CREATE TABLE ch_worker_positions (
	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
	title_en varchar(100) NOT null,
	title_ru varchar(200) NOT null
);

-- ����������
CREATE TABLE ch_workers(
	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
	worker_position_id NUMBER NOT NULL,
	first_name varchar(100) NOT null,
	last_name varchar(100) NOT NULL,
	phone varchar(20) NOT NULL,
	email varchar(255) NOT NULL,
	FOREIGN KEY (worker_position_id) REFERENCES ch_worker_positions(id)
);

-- ���������� �����������
CREATE TABLE ch_worker_shedules(
	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
	start_hours NUMBER(2) NOT null,
	start_minutes NUMBER(2) NOT null,
	finish_hours NUMBER(2) NOT null,
	finish_minutes NUMBER(2) NOT null,
	worker_id NUMBER,
	FOREIGN KEY (worker_id) REFERENCES ch_workers(id)
);

-- �������
CREATE TABLE ch_clients(
	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
	first_name varchar(100) NOT null,
	last_name varchar(100) NOT null,
	birthday DATE NOT NULL,
	phone varchar(20) NOT NULL,
	email varchar(255) NOT NULL,
    discount NUMBER(4,2)
);

-- ������
CREATE TABLE ch_orders(
	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
	created_on DATE NOT NULL,
	client_id NUMBER NOT NULL,
	worker_id NUMBER NOT NULL,
	FOREIGN KEY (client_id) REFERENCES ch_clients(id),
	FOREIGN KEY (worker_id) REFERENCES ch_workers(id)
);

-- ����������� ������ ������ �� ������ ������ � ��������
CREATE TABLE ch_order_product(
	id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
	order_id NUMBER NOT NULL,
	product_id NUMBER NOT NULL,
	product_count NUMBER,
	FOREIGN KEY (order_id) REFERENCES ch_orders(id),
	FOREIGN KEY (product_id) REFERENCES ch_products(id)
);




--INSERT INTO ch_product_types(id, title_en, title_ru) VALUES (1, 'Drink', '�������');
INSERT INTO ch_product_types(title_en, title_ru) VALUES ('Drinks', '�������');
INSERT INTO ch_product_types(title_en, title_ru) VALUES ('Desserts', '�������');
INSERT INTO ch_product_types(title_en, title_ru) VALUES ('Starters', '�������');
INSERT INTO ch_product_types(title_en, title_ru) VALUES ('Soups', '�������');

--SELECT * FROM ch_product_types;

INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 3.4, 'Coffee ������', '���� ����');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 4, 'Coffee Americano', '���� ���������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 4.25, 'Coffee Cappuccino', '���� ��������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 3.84, 'Coffee with Milk', '���� � �������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 3.68, 'Cola', '����');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 3.99, 'Lemonade', '�������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 7.0, 'Apple juice', '��� ��������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (1, 7.4, 'Orange juice', '��� ������������');

INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (2, 5, 'Ice cream', '���������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (2, 4.99, 'Fruit trifle', '��������� ������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (2, 5.78, 'Apple pie', '����� ��������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (2, 5.82, 'Pineapple pie', '����� ����������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (2, 4.50, 'Cheesecake', '�������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (2, 4.7, 'Cheesecake chocolate', '������� ����������');

INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (3, 12.0, 'Pizza Chicken Kebab', '����� ����� �����');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (3, 10.8, 'Pizza Pepperoni Blues', '����� ��������� ����');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (3, 13.5, 'Pizza Barbecue', '����� �������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (3, 11.0, 'Pizza Carbonara', '����� ���������');

INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (4, 8.2, 'Broccoli and Cheddar', '�������� � ������');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (4, 8.5, 'Mushroom soup', '������� ���');
INSERT INTO ch_products(type_id, price, title_en, title_ru) VALUES (4, 8.5, 'Soup from the tail of a pterodactyl', '��� �� ������ ������������');

INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Barista', '�������');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Waiter', '��������');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Confectioner', '��������');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Manager', '��������');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Security guard', '��������');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Cleaner', '�������');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Junior Assistant Chief Cleaner', '������� �������� �������� ��������');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Chief', '���-�����');
INSERT INTO ch_worker_positions(title_en, title_ru) VALUES ('Moms friends son', '��� ������� �������');

INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (1, 'Camden', 'Wood', '+1953550650', 'Camden-1444@yopmail.com');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (2, 'Izaak', 'Lee', 	 '+1389932828', 'LeeIzaak@mail.ru');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (2, 'Jeffrey', 'Davis', '+18753608631', 'Jeffrey@gmail.com');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (2, 'Richard', 'Richard', '+12174324933', 'Richardv34@gmail.com');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (3, 'Perseus', 'Price', '+12598680211', 'PerRrseus@gmail.com');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (4, 'Chase', 'Lewis', '+17480322686', 'Chasev54@gmail.com');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (5, 'John', 'Davis', '+1793497074', 'DavisJohn@rambler.ru');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (6, 'Benjamin', 'King', '+1356574628', 'bb-Benjamin@gmail.com');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (7, 'Kinslee', 'Martinez', '+11891381472', 'aKinslee46b@gmail.com');
INSERT INTO ch_workers(worker_position_id, first_name, last_name, phone, email) VALUES (8, 'Jace', 'Rogers', '+14675413940', 'JaceRogers@yandex.ua');

INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (1, 9,30, 17,30);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (2, 9,00, 18,00);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (3, 8,00, 20,00);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (4, 7,30, 19,00);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (5, 8,00, 21,30);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (6, 12,00, 21,30);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (7, 13,00, 22,00);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (8, 14,00, 23,00);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (9, 14,00, 23,00);
INSERT INTO ch_worker_shedules(worker_id, start_hours, start_minutes, finish_hours, finish_minutes) VALUES (10, 15,00, 00,00);

INSERT INTO ch_clients(first_name, last_name, birthday, phone, email) VALUES ('�������', '���������', to_date('11/04/1987', 'DD/MM/YY'), '+380505413940', 'nickKolya@yandex.ru');
INSERT INTO ch_clients(first_name, last_name, birthday, phone, email) VALUES ('�������', '��-PacMan', to_date('06/12/1991', 'DD/MM/YY'), '+380504678335', 'nepacman@gmail.com');

INSERT INTO ch_orders(created_on, client_id, worker_id) VALUES (to_date('06/12/1991', 'DD/MM/YY'), 1, 1);
INSERT INTO ch_orders(created_on, client_id, worker_id) VALUES (to_date('06/12/1991', 'DD/MM/YY'), 2, 2);
INSERT INTO ch_orders(created_on, client_id, worker_id) VALUES (to_date('06/12/1991', 'DD/MM/YY'), 2, 3);

--SELECT * FROM ch_orders WHERE id = 1;
--SELECT * FROM ch_clients WHERE id = 1;
--SELECT * FROM ch_workers WHERE id = 1;

INSERT INTO ch_order_product(order_id, product_id, product_count) VALUES (1, 1, 2);










