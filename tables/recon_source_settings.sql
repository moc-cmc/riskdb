
create table
	recon_source_settings(
		recon_source_setting_id int,
		source_id int,
		default_internal_account_id int NULL,
		match_inverted_trades char(1) NULL,
		conventional_dates char(1) NULL
)
		
go

create unique index
	u_ms
on
	recon_source_settings(
		recon_source_setting_id)
go

create unique index
	n_ms
on
	recon_source_settings(
		source_id)
go


if not exists(select name from tables where name = "recon_source_settings")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"recon_source_settings",
		"L"
	)
end
go

delete

from
	keys
where
	relation = "recon_source_settings"

insert into
	keys
values(
	"recon_source_settings",
	0)

go
