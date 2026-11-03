drop database if exists shopping_management;
create database shopping_management;
use shopping_management;

create table customers(
	ID int primary key auto_increment,
    customer_name varchar(100) not null,
    email varchar(100) unique,
    phone_number char(10) unique not null,
    age tinyint unsigned check(age>0),
    gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    country varchar(10) default "India",
    city varchar(50) not null,
    pincode char(6) default "201301",
    registeration_date date default (current_date),
    created_at time default (current_time),
    address varchar(250),
    customer_status enum('active', 'Inactive', 'blocked') default 'active',
    customer_notes tinytext);
    
select * from customers;
    
create table orders(
	order_id int unique auto_increment,
    customer_id int,
    order_date date default(current_date),
    order_amount decimal(10,2) not null,
    order_status enum( 'Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') default 'pending',
    payment_method VARCHAR(20) CHECK (payment_method IN ('cash', 'UPI', 'card', 'net banking')),
    payment_status enum('pending' , 'paid', 'failed') default 'pending',
    shipping_address varchar(250) not null,
    deliver_pincode char(6),
    quantity INT CHECK (quantity>0),
    discount_amount decimal(10,2) default "0",
    delivery_date date,
    created_at timestamp default(current_timestamp),
    tracking_number varchar(30) unique,
    delivery_status enum( 'Not Dispatched', 'In Transit', 'Delivered', 'Returned') default  'Not Dispatched',
    order_notes tinytext,
    foreign key(customer_id) references customers(ID) on delete cascade,
    foreign key(customer_id) references customers(ID) on update cascade);
    
select * from orders;
    