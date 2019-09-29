
if object_id("currencies") != NULL
    drop view
        currencies
go

create view
    	currencies
as
select distinct
    	currency_id
from
	credit_profiles
go
