drop table
        queued_deals
go

create table
    queued_deals (
        queued_deal_id int,
	batch_id int,
	deal_type_id int,
	timestamp datetime
    )
go

delete

from
	keys
where
	relation = "queued_deals"

insert into
	keys
values(
	"queued_deals",
	0)
go


