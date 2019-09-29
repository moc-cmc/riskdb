use
	risk_finotec
go

drop table
	cfh_rolls_queue
go

create table
	cfh_rolls_queue(
		crq_id int,
		tradeId varchar(100) NULL,
		executionTime varchar(100) NULL,
		tradeDate varchar(100) NULL,
		valueDate varchar(100) NULL,
		buySell varchar(100) NULL,
		tradeType varchar(100) NULL,
		track varchar(100) NULL,
		dealtAmount varchar(100) NULL,
		amountCurrency varchar(100) NULL,
		rate varchar(100) NULL,
		fee varchar(100) NULL,
		feeCurrency varchar(100) NULL,
		contraAmount varchar(100) NULL,
		contraCurrency varchar(100) NULL,
		pL varchar(100) NULL,
		pLCurrency varchar(100) NULL,
		client varchar(100) NULL)
go

delete

from
	keys
where
	relation = "cfh_rolls_queue"

go

insert into
	keys
values(
	"cfh_rolls_queue",
	0)
go

