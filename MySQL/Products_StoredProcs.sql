-- Geoff Dev Notes: I know the test doesn't require this, but wanted to show how I would implement stored procedures for this schema.

-- Test:
-- CALL sp_GetProductDetails(1);
-- CALL SET @new_product_id = 0; sp_InsertProduct('1-1/2" Schedule 80 PVC Pipe', 'High quality PVC for plumbing', 3.99, 'sku:8008-015AB-5', 4.2, 4.5, @new_product_id); SELECT @new_product_id;
-- CALL SET @new_offer_id = 0; sp_InsertOffer(1, 3.49, 'USD', '2025-12-31', @new_offer_id); SELECT @new_offer_id;

DELIMITER $$

-- Get all products in the database by ID
CREATE PROCEDURE sp_GetProductDetails(
    IN p_product_id INT  -- Input: The ID of the product to fetch details for
)
BEGIN
    -- Retrieve product details
    SELECT * FROM products 
    WHERE product_id = p_product_id;
    
    -- Retrieve related product images
    SELECT * FROM product_images 
    WHERE product_id = p_product_id;
    
    -- Retrieve related product specifications
    SELECT * FROM product_specifications 
    WHERE product_id = p_product_id;
END $$


-- Create a new product into the database and return the generated product ID
CREATE PROCEDURE sp_InsertProduct(
    IN p_name VARCHAR(255),              -- Product name
    IN p_description TEXT,               -- Product description
    IN p_price DECIMAL(10,2),            -- Product price
    IN p_sku VARCHAR(100),               -- Unique SKU
    IN p_product_weight DECIMAL(8,2),    -- Product weight
    IN p_product_rating DECIMAL(2,1),    -- Product rating
    OUT p_new_product_id INT             -- Output: New product ID
)
BEGIN
    -- Insert the new product record
    INSERT INTO products (name, description, price, sku, category_id, product_weight, product_rating)
    VALUES (p_name, p_description, p_price, p_sku, p_category_id, p_product_weight, p_product_rating);
    
    -- Capture the auto-generated product ID
    SET p_new_product_id = LAST_INSERT_ID();
END $$


-- Create an offer for a product in the database procedure
CREATE PROCEDURE sp_InsertOffer(
    IN p_product_id INT,                  -- The product ID to which the offer applies
    IN p_price DECIMAL(10,2),             -- Promotional offer price
    IN p_priceCurrency VARCHAR(10),       -- Currency code for the offer
    IN p_priceValidUntil DATE,            -- Date until which the offer is valid
    OUT p_new_offer_id INT                -- Output parameter for the new offer's ID
)
BEGIN
    -- Insert a new offer record for the specified product
    INSERT INTO offers (product_id, price, priceCurrency, priceValidUntil)
    VALUES (p_product_id, p_price, p_priceCurrency, p_priceValidUntil);
    
    -- Capture the auto-generated offer ID
    SET p_new_offer_id = LAST_INSERT_ID();
END $$
  
DELIMITER ;

