-- Geoff Dev Notes: I inspected the page HTML elements to give me a rough idea of what the database schema might look like.
-- Fields like SKU, Product Weight, Product Rating came from this initial observation, then I filled in the rest based on common sense.
-- I also included the Offers table as an optional table for promotional pricing. Although my specific product I selected didn't use it, I noticed it in the HTML and thought it would be a good addition.

-- Product Link used: https://www.pvcfittingsonline.com/8008-015ab-1-1-2-schedule-80-pvc-pipe-5-ft-section.html

-- Products table: Contains core product details.
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique product identifier
    name VARCHAR(255) NOT NULL,                        -- Product name
    description TEXT,                                  -- Product description
    price DECIMAL(10,2) NOT NULL,                      -- Standard product price
    sku VARCHAR(100) UNIQUE,                           -- Stock Keeping Unit identifier
    product_weight DECIMAL(8,2) NULL,                  -- Product weight
    product_rating DECIMAL(2,1) NULL,                  -- Product rating
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    -- Record creation timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  -- Record update timestamp
);

-- Product Images table: Holds URLs and alt text for product images.
CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,             -- Unique identifier for each image
    product_id INT NOT NULL,                             -- References the associated product
    image_url VARCHAR(255) NOT NULL,                     -- URL of the product image
    alt_text VARCHAR(255),                               -- Alt text for accessibility
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Product Specifications table: Stores individual attributes for a product.
CREATE TABLE product_specifications (
    spec_id INT AUTO_INCREMENT PRIMARY KEY,            -- Unique specification identifier
    product_id INT NOT NULL,                           -- Foreign key linking to the product
    pipe_size VARCHAR(50) NOT NULL,                    -- Pipe Size
    max_wp VARCHAR(50) NOT NULL,                       -- Maximum Working Pressure
    schedule VARCHAR(10) NOT NULL,                     -- Schedule rating
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Offers table: Optional table for promotional pricing
CREATE TABLE offers (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,             -- Unique offer identifier
    product_id INT NOT NULL,                             -- References the product on offer
    price DECIMAL(10,2) NOT NULL,                        -- Promotional offer price
    priceCurrency VARCHAR(10) NOT NULL,                  -- Currency code for the offer
    priceValidUntil DATE NOT NULL,                       -- Date until which the offer is valid
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,      -- Timestamp when the offer was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Timestamp on offer updates
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
