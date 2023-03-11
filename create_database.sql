USE olist_data;

CREATE TABLE customers (
    id char(32) NOT NULL, 
    unique_id char(32) NOT NULL,
    zip_code_prefix char(5),
    city varchar(32),
    state char(2),
    PRIMARY KEY(id)
);

CREATE TABLE orders (
    id char(32) NOT NULL, 
    customer_id char(32),
    order_state varchar(32),
    purchase_timestamp datetime,
    approved_at datetime,
    delivered_carrier_date datetime,
    delivered_customer_date datetime,
    estimated_delivery_date datetime,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE products(
    product_id char(32),
    product_category_name varchar(50),
    product_name_length smallint,
    product_desc_length smallint,
    product_photos_qty smallint,
    product_weight_grams float,
    product_length_cm float,
    product_height_cm float,
    product_width_cm float,
    PRIMARY KEY (product_id)
);

CREATE TABLE sellers(
    seller_id char(32),
    seller_zipcode char(5),
    seller_city varchar(50),
    seller_state char(2),
    PRIMARY KEY (seller_id)
);

CREATE TABLE order_items(
    order_id char(32), 
    order_item_id smallint,
    product_id char(32),
    seller_id char(32),
    shipping_limit_date datetime,
    price float,
    freight_value float,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

CREATE TABLE order_reviews(
    review_id char(32) NOT NULL, 
    order_id char(32),
    score smallint,
    comment_title text,
    comment_message text,
    creation_date datetime,
    answer_timestamp datetime,
    PRIMARY KEY (review_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_payments(
    order_id char(32),
    payment_sequential smallint,
    payment_type text,
    payment_installment smallint,
    payment_value float,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE category_name_translation(
    category varchar(50),
    category_translation varchar(50)
);

CREATE TABLE geo_location(
    zipcode char(5),
    latitude double precision,
    longitude double precision,
    city varchar(50),
    geostate char(2) 
    );