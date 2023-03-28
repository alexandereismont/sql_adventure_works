with salesorder_detail as (
  select ssod.productid, ssod.carriertrackingnumber, ssod.orderqty
  from sales.salesorderdetail ssod
  where ssod.orderqty = 1
),

carier_cound_salsorder_datail as (
    select sod.carriertrackingnumber, count(1)
    from salesorder_detail sod
    group by sod.carriertrackingnumber)

select *
from carier_cound_salsorder_datail
where carriertrackingnumber like '%9B';