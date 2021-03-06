create table Order_Detail(
                             id int identity(1, 1) primary key,
                             product_id int not null,
                             username nvarchar(255),
                             price float not null,
                             quantity int,
                             order_date datetime
)

create table comment(
                        username nvarchar(255),
                        image_url text,
                        content text,
                        product_id int,
                        created_at datetime
)

create table Role (
                      id int primary key not null IDENTITY(1, 1),
                      name nvarchar(50) not null
)

create table Ranking (
                         id int primary key not null IDENTITY(1, 1),
                         name nvarchar(50) not null,
                         discount_percent float null,
                         total_spent float
)

create table User_Account (
                              id int primary key not null IDENTITY(1, 1),
                              full_name nvarchar(50) not null,
                              username varchar(50) not null,
                              password varchar(50) not null,
                              address nvarchar(255) null,
                              phone nvarchar(20) null,
                              role_id int not null,
                              rank_id int not null,
                              constraint FK_Role foreign key(role_id) references Role(id),
                              constraint FK_Ranking foreign key(rank_id) references Ranking(id)
)

create table Category (
                          id int primary key not null IDENTITY(1, 1),
                          name nvarchar(50) not null
)

create table Product (
                         id int primary key not null IDENTITY(1, 1),
                         name nvarchar(50) not null,
                         category_id int not null,
                         price float not null,
                         quantity int not null,
                         seller_id int null,
                         description text,
                         image_url text,
                         create_date datetime,
                         modify_date datetime,
                         constraint FK_Category foreign key(category_id) references Category(id),
                         constraint FK_User_Account foreign key(seller_id) references User_Account(id)
)

create table Orders (
                        id int primary key not null IDENTITY(1, 1),
                        customer_id int not null,
                        order_date datetime,
                        constraint FK_User_Account2 foreign key(customer_id) references User_Account(id),
)

create table Order_Details (
                               product_id int not null,
                               order_id int not null,
                               quantity int not null,
                               price float null,
                               constraint PK_Order_Details primary key(product_id, order_id),
                               constraint FK_Product foreign key(product_id) references Product(id),
                               constraint FK_Order foreign key(order_id) references Orders(id)
)

    --create table History (
--	id int primary key not null,
--	customer_id int not null,
--	order_detail_id int not null,
--	total float not null,
--	constraint FK_User_Account3 foreign key(customer_id) references User_Account(id),
--	--constraint FK_Order_Details foreign key(order_detail_id) references Order_Details(id)
--)


    insert into Role(name)
values ('Admin'),
	   ('Customer'),
	   ('Seller')

insert into Ranking (name, discount_percent, total_spent)
values ('Bronze', 0.01, 0),
	   ('Silver', 0.05, 500),
	   ('Gold', 0.1, 1000)

insert into User_Account (full_name, username, password, address, phone, role_id, rank_id)
values ('Le Phuoc Cuong', 'cuongle', '123', '202 FPTU Dom', '123456789', 1, 1),
	   ('Doanh Thuc', 'doanhthuc', '123', '123 NHS Street', '123456789', 2, 2),
	   ('Nguyen Huu Phuoc', 'phuocnguyen', '123', '123 Hoa Hai Street', '123456789', 3, 3)

insert into Category(name)
values ('Food'),
	   ('Technology'),
	   ('Cosmetic')

insert into Product (name, category_id, price, quantity, seller_id, description, create_date, modify_date, image_url)
values ('Laptop Dell', 2, 700, 2, 3, 'Laptop for Dell', '20210619', '20210619', 'https://image-link.png')

insert into Orders (customer_id, order_date)
values (2, '20210619')

insert into Order_Details (product_id, order_id, quantity, price)
values (1, 1, 2, 700)

select * from Role
select * from Ranking
select * from User_Account
select * from Product
select * from Orders
select * from Order_Details