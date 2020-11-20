--Query 8
SELECT BusinessEntityID,
       Name,
	   PurchasingWebServiceURL
FROM Purchasing.Vendor
WHERE YEAR(ModifiedDate)=2011
ORDER BY CASE 
		when PurchasingWebServiceURL is null then 1 
		else 0 
		end,
		PurchasingWebServiceURL
;
