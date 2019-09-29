if object_id("external_account_notes") != NULL
    drop table
        external_account_notes
go

create table
	external_account_notes( 
		note_id int identity, 
		external_account_id int, 
		tico_account_id int, note varchar(255), 
		timestamp datetime)

go

create unique nonclustered index 
	u_ean
on
	external_account_notes(note_id)
go

