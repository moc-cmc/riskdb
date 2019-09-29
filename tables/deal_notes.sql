
if object_id("deal_notes") != NULL
    drop table
        deal_notes
go

create table
    deal_notes (
        deal_id int,
        note varchar(255)
    )
go

create unique nonclustered index
	u_dn
on
	deal_notes(deal_id)
go

