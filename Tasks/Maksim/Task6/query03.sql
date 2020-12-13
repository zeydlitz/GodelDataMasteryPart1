--Query  3
SELECT empid,
       custid,
       qty
FROM dbo.EmpCustOrders
CROSS APPLY (
            VALUES('A', A),('B', B),('C', C),('D', D)) AS C(custid, qty)
WHERE qty IS NOT NULL
;
