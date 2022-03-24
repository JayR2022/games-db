SELECT *
FROM customer
JOIN order_tb ON customer.customer_id=order_tb.customer_id;
