create function currency_count(currency CSTRING)
returns int
as $$
    declare
begin
    select count(1)
    from sales.currencyrate;
end
$$
