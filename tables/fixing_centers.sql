create table
    fixing_centers (
        fixing_center_id int,
        symbol char(50)
    )
go

create unique nonclustered index u_fs on fixing_centers(fixing_center_id, symbol)
go

insert into
	keys
values(
	"fixing_centers",
	0)
go


