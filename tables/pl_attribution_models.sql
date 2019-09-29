drop table pl_attribution_models
go

create table
	pl_attribution_models
(
	pl_attribution_model_id int,
	name varchar(30),
	description varchar(255) NULL
)
go

create unique nonclustered index
	u_pla
on
	pl_attribution_models(pl_attribution_model_id)
go

create unique nonclustered index
	u_pln
on
	pl_attribution_models(name)
go

insert into pl_attribution_models values(1, "Deal Grouping Notional Volume", "Sum MTM pl for each trade in deal. Attribute percentage of total PL to entity based on the volume of the dealt notional vs total volume of deal to taker accounts")
insert into pl_attribution_models values(2, "Per Trade MTM", "Attibribute MTM pl for each trade to the entity on the trade record. Does not use deal grouping")


insert into keys values("pl_attribution_models", 3)
go

