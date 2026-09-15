

create view gold.dim_cust as 
SELECT 
ROW_NUMBER() over(order by cst_id) as customer_key 
	  ,[cst_id] customer_id
      ,[cst_key] customer_number
      ,[cst_firstname] first_name
      ,[cst_lastname] last_name
      ,[cst_marital_status] marital_status
	  ,
case 
when cst_gndr!='n/a' then cst_gndr
else coalesce(gen,'n/a')
end gender
	  ,az.bdate birthdate
	  ,loc.cntry country
	  
      ,[cst_create_date] create_date
  FROM [datawarehouse].[silver].[crm_cust_info] cu
  left join [silver].erp_cust_az12 az
  on cu.cst_key=az.cid
  left join silver.erp_loc_a101 loc
  on cu.cst_key=loc.cid





create view gold.dim_prd as
SELECT ROW_NUMBER() over(order by [prd_start_dt],prd_key) as prd_key
	  ,[prd_id]
      ,[prd_key] as prd_num
      ,[prd_nm] as prd_name
	  
	  ,px.id as cat_id
	  ,cat
	  ,subcat
	  ,maintenance
      ,[prd_cost]
      ,[prd_line]
      ,[prd_start_dt]
  FROM [datawarehouse].[silver].[crm_prd_info] pd
  left join silver.erp_px_cat_g1v2 px
  on pd.cat_id=px.id
  where prd_end_dt is null

--select * from gold.dim_prd


use datawarehouse

create view gold.fact_sales as
SELECT [sls_ord_num]
	  ,pd.prd_key
	  ,cu.customer_key      
      ,[sls_order_dt]
      ,[sls_ship_dt]
      ,[sls_due_dt]
      ,[sls_sales]
      ,[sls_quantity]
      ,[sls_price]
  FROM [datawarehouse].[silver].[crm_sales_details] sal
  left join gold.dim_cust cu on
  sal.sls_cust_id = cu.customer_id
  left join gold.dim_prd pd on
  sal.sls_prd_key = pd.prd_num


