use
	risk_elad2
go

drop table
	transaction_round_turns
go

create table
	transaction_round_turns(
		account_transaction_id int,
		round_turn_id int)
go

create unique index
	u_trt
on
	transaction_round_turns(
		account_transaction_id)

create unique index
	n_trt
on
	transaction_round_turns(
		round_turn_id)
go

