CREATE PROC AllOrdersProc
	@YEAR int,
as

BEGIN
	SET NOCOUNT ON
	SELECT
		O.ID,O.CustomerId,C.FirstName,C.LastName,O.OrderDate,O.Prices
	FROM Orders O
	INNER JOIN Customers C ON C.ID=O.CustomerId
	SET NOCOUNT OFF
END

EXEC AllOrdersProc 
