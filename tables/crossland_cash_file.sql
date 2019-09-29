use
	risk_harbor
go

drop table
	crossland_cash_file
go


create table
	crossland_cash_file(
		id int identity,
		trade_date datetime,
		external_account_id int,
		identifier varchar(50),
                SHADDT varchar(50),
                GFIRM varchar(50),
                GLOC varchar(50),
                GSLS varchar(50),
                GACCT varchar(50),
                REGION varchar(50),
                GCRCDE varchar(50),
                GCRISO varchar(50),
                GSTAT varchar(50),
                RBCSH float,
                RDEP float,
                RWTH float,
                RINT float,
                RFUTPL float,
                RFCMNS float,
                ROLC float,
                ROSC float,
                RONC float,
                ROCMNS float,
                RCFE01 float,
                RCOPUR float,
                RCOSLD float,
                RCOMAT float,
                RMISC float,
                RECSH float,
                IOTE float,
                ILPV float,
                ISPV float,
                ITIMG float,
                ITMMG float,
                ICLAMT float,
                ICLAGE float,
                ICLNBR float,
                ICOMKT float,
                ICOMRG float,
                HMINT float,
                INPV float,
                MGEXDF float,
                ORGZCD varchar(50))

go

create unique index
	u_ccf
on
	crossland_cash_file(
		identifier)
go

create unique index
	n_ccf
on
	crossland_cash_file(
		trade_date,
		external_account_id)

go



