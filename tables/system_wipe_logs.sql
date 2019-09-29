create table
	system_wipe_logs(
		system_wipe_log_id int identity,
		user_id int,
		timestamp datetime,
		system_wipe_identifier varchar(100),
		begin_date datetime NULL,
		end_date datetime NULL,
                total_trades int NULL,
                total_transactions int NULL
)

create unique nonclustered index
	pk
on
	system_wipe_logs(system_wipe_log_id)
go

	
create nonclustered index 
	n_srt
on
	system_wipe_logs(timestamp)
go
	

		
