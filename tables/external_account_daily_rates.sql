create table
        external_account_daily_rates(
                external_account_id int,
                product_id int,
                rate_date datetime,
                rate float,
                payment_days_offset int)
go

create unique nonclustered index u_eadr on external_account_daily_rates(external_account_id,product_id,rate_date)
go
