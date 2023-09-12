drop table
	proposed_roll_batches
go

create table
	proposed_roll_batches(
		prb_id int,
		batch_transaction_id int,
		contract_id int,
		position numeric(30,4),
		closing_date datetime,
		roll_date datetime,
		closing_price float NULL,
		roll_price float NULL,
		points float NULL,
		risk_book_deal_id int NULL,
		timestamp datetime)
go

create unique index
	u_prb
on
	proposed_roll_batches(
		prb_id)
go

create unique index
	n_prb
on
	proposed_roll_batches(
		batch_transaction_id,
		contract_id)
go

delete
from
	keys
where
	relation = "proposed_roll_batches"
go

insert into
	keys
values(
	"proposed_roll_batches",
	0)
go
