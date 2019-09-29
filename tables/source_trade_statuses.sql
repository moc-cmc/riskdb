drop table
	source_trade_statuses
go

create table
	source_trade_statuses(
		source_trade_status_id int,
		source_id int,
		trade_id int,
		status_id int
	)

create unique nonclustered index un_sts on source_trade_statuses(source_trade_status_id)
go

create unique nonclustered index un_sctst on source_trade_statuses(source_id,trade_id)
go


if not exists( select 1 from keys where relation = "source_trade_statuses")
begin
        insert into keys values("source_trade_statuses", 0)
end
go
