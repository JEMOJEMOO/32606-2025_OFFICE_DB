CURSOR c_overdue IS
SELECT *
FROM CheckoutRecord
WHERE CheckoutStatus='Borrowed';
