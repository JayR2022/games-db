/* Create a view which shows all games that are low in stock and get total price of all remaining stock*/

CREATE VIEW low_stock(product_id,title, price_of_remain_stock)
AS SELECT product_id,title, (price*stock) AS price_of_remain_stock
FROM product
WHERE stock<'150';