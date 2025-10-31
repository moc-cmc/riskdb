
drop table
	lmax_positions
go

create table
	lmax_positions (
		account_id int,
		timestamp varchar(25) NULL,
		instrument_id varchar(12) NULL,
		open_quantity float NULL,
		open_cost float NULL,
		unfilled_buy_quantity float NULL,
		unfilled_buy_cost float NULL,
		unfilled_sell_quantity float NULL,
		unfilled_sell_cost float NULL,
		currency varchar(5) NULL,
                side varchar(50) NULL)

go



