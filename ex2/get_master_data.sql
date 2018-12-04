PROCEDURE "get_master_data" ( 
	             out ex_emp_exists boolean, 
	             out ex_employees "MD.Employees",
	             out ex_emp_count int,
	             out ex_business_partners "MD.BusinessPartner",
	             out ex_bp_count int)
   LANGUAGE SQLSCRIPT
   SQL SECURITY INVOKER
   AS
BEGIN USING "MasterData" as MData; 

 ex_emp_exists  = MData:"employee_exists"('199999');   

 call MData:"get_employee_data"( ex_employees ); 
 ex_emp_count = MData:rowcount;
 
 call MData:"get_business_partner_data"( ex_business_partners );
 ex_bp_count = MData:rowcount;
 
END;
