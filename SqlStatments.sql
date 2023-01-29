create table users
(
    userId int primary key,
    full_name varchar(20),
    email varchar(20) unique ,
    gender char(1) check ( gender='m'or gender='f'),
    date_of_birth varchar(15),
    created_at datetime
);

create table orders
(
    orderId int primary key,
    status varchar(6) check ( status='start' or status='finish'),
    created_at datetime

);

create table order_products (
    quantity int(10) default 0
);

create table products
(
    productId int primary key,
    name varchar(10) not null ,
    price int default 0,
    status varchar(10) check ( status='valid' or status='expired'),
    created_at datetime
);

create table countries
(
    countriesCode int primary key,
    name varchar(20) unique ,
    continent_name varchar(20) not null
);


## add foreign key

Alter table users
ADD code int

Alter table users
ADD FOREIGN KEY (code) references countries(countriesCode);


Alter table orders
    add user_id int


Alter table orders
    ADD FOREIGN KEY (user_id) references users(userId);

Alter table order_products
    add order_id int

Alter table order_products
    ADD FOREIGN KEY (order_id) references orders(orderId);


Alter table order_products
    add product_id int

Alter table order_products
    ADD FOREIGN KEY (product_id) references products(productId);

## bouns
Alter table users
modify created_at datetime DEFAULT CURRENT_TIMESTAMP;

Alter table orders
modify created_at datetime DEFAULT CURRENT_TIMESTAMP;

## inser
INSERT INTO users (userId, full_name, email, gender,date_of_birth,code)
VALUES (1, 'shahad', 'shahad@yahoo.com','f','2000-09',123);


INSERT INTO countries (countriesCode,name, continent_name)
VALUES (123, 'United Stated', 'USA');

INSERT INTO products (productId, name, price, status)
VALUES (1,'pepsi',10,'valid');

INSERT INTO orders(orderId, status, user_id)
values(1,'start',1)

## update
UPDATE countries
set  continent_name='Saudi Arabia', name='KSA'
where countriesCode=123

## delete
DELETE FROM products WHERE productId=1;
















