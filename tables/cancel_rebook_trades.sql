if object_id("cancel_rebook_trades") != NULL
    drop table
        cancel_rebook_trades
go

create table
    cancel_rebook_trades (
	cancel_trade_id int,
        rebook_trade_id int
	)
go

create unique nonclustered index
	u_cid
on
	cancel_rebook_trades(cancel_trade_id)
go
create nonclustered index
	u_rid
on
	cancel_rebook_trades(rebook_trade_id)
go

