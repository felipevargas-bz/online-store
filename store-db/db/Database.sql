-- create schema
CREATE SCHEMA mulatos_store DEFAULT CHARACTER SET utf8;

-- create tables

CREATE TABLE mulatos_store.shipings(
id_ship INT NOT NULL,
ship_date DATETIME,
Numero_guia INT NOT NULL,
id_buy INT NOT NULL,
id_address INT NOT NULL,
PRIMARY KEY (id_ship));
	

CREATE TABLE mulatos_store.address(
id_address INT NOT NULL,
Addres_1 VARCHAR (250),
Addres_2 VARCHAR (250),
City VARCHAR (50),
Country VARCHAR (50),
id_customer VARCHAR (50),
zip_code INT,
PRIMARY KEY (id_address));

CREATE TABLE mulatos_store.buys(
id_buy INT NOT NULL,
buy_date TIMESTAMP,
id_product INT NOT NULL,
id_customer INT NOT NULL,
PRIMARY KEY (id_buy));

CREATE TABLE mulatos_store.customers(
id_customer INT NOT NULL,
first_name VARCHAR (100) NOT NULL,
last_name VARCHAR (100) NOT NULL,
email VARCHAR (100) UNIQUE NOT NULL,
dni INT NOT NULL UNIQUE,
PRIMARY KEY (id_customer));
ALTER TABLE mulatos_store.customers
ADD COLUMN permisos BOOLEAN

CREATE TABLE mulatos_store.products(
id_product INT NOT NULL,
Color VARCHAR (100),
Category VARCHAR (100),
Size INT,
id_marca INT,
PRIMARY KEY (id_product));

CREATE TABLE mulatos_store.category(
id_Category INT NOT NULL,
category_name VARCHAR (100),
PRIMARY KEY (id_category));

CREATE TABLE mulatos_store.marcas(
id_marca INT NOT NULL,
marca_name VARCHAR (100),
PRIMARY KEY (id_marca));


-- add foreign keys

ALTER TABLE mulatos_store.shipings
ADD FOREIGN KEY (id_address) REFERENCES Address (id_address);

ALTER TABLE mulatos_store.products
CHANGE COLUMN category category INT NOT NULL;

ALTER TABLE mulatos_store.products
ADD FOREIGN KEY (Category) REFERENCES Category (id_category),
ADD FOREIGN KEY (id_marca) REFERENCES marcas (id_marca);

ALTER TABLE mulatos_store.buys
ADD FOREIGN KEY (id_product) REFERENCES products (id_product);

ALTER TABLE mulatos_store.buys
ADD FOREIGN KEY (id_customer) REFERENCES customers (id_customer);

ALTER TABLE mulatos_store.customers
ADD FOREIGN KEY (permisos) REFERENCES permisos (id_permiso);

ALTER TABLE mulatos_store.address
CHANGE COLUMN id_customer id_costumer INT NOT NULL;

ALTER TABLE mulatos_store.address
ADD FOREIGN KEY (id_costumer) REFERENCES customers (id_customer);

ALTER TABLE mulatos_store.shipings
ADD FOREIGN KEY (id_buy) REFERENCES Buys (id_buy);
