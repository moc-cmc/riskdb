
if object_id("client_mkt_accounts") != NULL
    drop table
        client_mkt_accounts
go

create table
    client_mkt_accounts (
        cl_external_account_id int,
	mkt_external_account_id int
    )
go

create unique nonclustered index
	u_cl
on
	client_mkt_accounts(cl_external_account_id)
go

create nonclustered index 
	n_mkt
on
	client_mkt_accounts(mkt_external_account_id)
go


