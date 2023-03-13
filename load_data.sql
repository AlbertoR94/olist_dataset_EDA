USE olist_data;

LOAD DATA INFILE '/var/lib/mysql-files/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

LOAD DATA INFILE '/var/lib/mysql-files/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, @vpurchase_timestamp, @vapproved_at, @vdelivered_carrier_date, @vdelivered_customer_date, estimated_delivery_date)
SET
purchase_timestamp = NULLIF(@vpurchase_timestamp, ''),
approved_at = NULLIF(@vapproved_at, ''),
delivered_carrier_date = NULLIF(@vdelivered_carrier_date, ''),
delivered_customer_date = NULLIF(@vdelivered_customer_date, '');

LOAD DATA INFILE '/var/lib/mysql-files/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, @vproduct_category_name, @vproduct_name_length, 
@vproduct_desc_length, @vproduct_photos_qty, @vproduct_weight_grams, 
@vproduct_length_cm, @vproduct_height_cm, @vproduct_width_cm)
SET
product_category_name =  NULLIF(@vproduct_category_name, ''),
product_name_length = NULLIF(@vproduct_name_length, ''),
product_desc_length = NULLIF(@vproduct_desc_length, ''),
product_photos_qty = NULLIF(@vproduct_photos_qty, ''),
product_weight_grams = NULLIF(@vproduct_weight_grams, ''),
product_length_cm =  NULLIF(@vproduct_length_cm, ''),
product_height_cm = NULLIF(@vproduct_height_cm, ''),
product_width_cm = NULLIF(@vproduct_width_cm, '');

LOAD DATA INFILE '/var/lib/mysql-files/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/olist_order_reviews_dataset_2.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(review_id, order_id, score, @vcomment_title, 
@vcommment_message, creation_date, answer_timestamp)
SET
comment_title =  NULLIF(@vcomment_title, ''),
comment_message = NULLIF(@vcommment_message, '');

LOAD DATA INFILE '/var/lib/mysql-files/olist_order_payments_dataset.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/product_category_name_translation.csv'
INTO TABLE category_name_translation
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/olist_geolocation_dataset.csv'
INTO TABLE geo_location
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;