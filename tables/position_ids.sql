
if object_id("position_ids") != NULL
    drop table
        position_ids 
go


create table
	position_ids(
		position_id varchar(15),
		external_account_id int,
		contract_id int,
		buysell varchar(1))

go

create unique nonclustered index pi on position_ids (position_id)
go


