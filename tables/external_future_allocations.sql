
if object_id("external_future_allocations") != NULL
    drop table
        external_future_allocations
go

create table
    external_future_allocations (
        ext_future_allocation_id int,
        remainder_ext_account_id int,
        remainder_int_account_id int,
        external_account_id int,
        internal_account_id int,
        percentage float,
        fund_id int
    )
go
