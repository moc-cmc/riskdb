create table
        rematch_log_matches(
                id int identity,
                rematch_log_id int,
                trade_match_id int
)

create unique nonclustered index
	u_rml
on
	rematch_log_matches(id)
go

create nonclustered index 
	n_rmi
on
	rematch_log_matches(rematch_log_id)
go

create nonclustered index        
        n_rmtm
on
        rematch_log_matches(trade_match_id)
go

insert into tables values("rematch_log_matches", "J")
go
