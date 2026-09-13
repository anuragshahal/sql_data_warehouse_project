
truncate bronze.crm_cust_info
bulk insert bronze.crm_cust_info
from 'C:\Users\shaha\Downloads\source_crm\cust_info.csv'
with (
firstrow =2,
fieldterminator = ',',
tablock
);


bulk insert bronze.crm_prd_info
from 'C:\Users\shaha\Downloads\source_crm\prd_info.csv'
with (
firstrow =2,
fieldterminator = ',',
tablock
);

truncate bronze.crm_sales_details;
bulk insert bronze.crm_sales_details
from 'C:\Users\shaha\Downloads\source_crm\sales_details.csv'
with (
firstrow =2,
fieldterminator = ',',
tablock
);


bulk insert bronze.erp_cust_az12
from 'C:\Users\shaha\Downloads\source_erp\CUST_AZ12.csv'
with (
firstrow =2,
fieldterminator = ',',
tablock
);

bulk insert bronze.erp_loc_a101
from 'C:\Users\shaha\Downloads\source_erp\LOC_A101.csv'
with (
firstrow =2,
fieldterminator = ',',
tablock
);

bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\shaha\Downloads\source_erp\PX_CAT_G1V2.csv'
with (
firstrow =2,
fieldterminator = ',',
tablock
);


/*
create or alter procedure proc_load as
begin
declare @timenow datetime;
print 'work has started';
set @timenow = getdate();
print 'time is '+cast(@timenow as varchar);

end

exec proc_load
*/
