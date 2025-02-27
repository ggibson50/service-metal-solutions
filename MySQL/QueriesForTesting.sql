-- Products Test Data
INSERT INTO products (name, description, price, sku, product_weight, product_rating)
VALUES ('1-1/2" Schedule 80 PVC Pipe', 'High quality PVC for plumbing', 3.99, 'sku:8008-015AB-5', 4.2, 4.5);

SELECT * FROM products;

-- Product Images Test Data
INSERT INTO product_images (product_id, image_url, alt_text)
VALUES (1, 'https://www.pvcfittingsonline.com/media/catalog/product/cache/1/image/650x/040ec09b1e35df139433887a97daa66f/0/1/015.jpg', '1-1/2" Schedule 80 PVC Pipe');

SELECT * FROM product_images;

-- Product Specifications Test Data
INSERT INTO product_specifications (product_id, pipe_size, max_wp, schedule)
VALUES (1, '1 inch', '470 PSI', '80');

SELECT * FROM product_specifications;


-- Offers Test Data
INSERT INTO offers (product_id, price, priceCurrency, priceValidUntil)
VALUES (1, 3.49, 'USD', '2025-12-31');

SELECT * FROM offers;