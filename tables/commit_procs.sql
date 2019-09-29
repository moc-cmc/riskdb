
if object_id("commit_procs") != NULL
    drop table
        commit_procs
go

create table
    commit_procs (
        commit_proc_id int identity,
        name char(30),
	commit_proc varchar(50) NULL,
	uncommit_proc varchar(50) NULL,
	description varchar(255),
	should_run varchar(1),
	ordering int,
	debug varchar(1) NULL
    )
go

/*
if not exists( select 1 from keys where relation = "commit_proc_id")
begin
        insert into keys values("commit_proc_id", 0)
end
*/

insert into commit_procs values("Save Trade Volumes", "cbo_savetradevolumes", "cbo_wipetradevolumes", "volume stored in trade_volumes", "Y", 4, NULL)
go
insert into commit_procs values("Save Trade Nets", "cbo_savetradenets", "cbo_wipetradenetsfordate", "nets stored in daily_trade_nets", "Y", 5, NULL)
go
insert into commit_procs values("Save Volume Cache", "cbo_savevolumecache", "cbo_wipevolumecache", "volumes broken down by type", "Y", 6, NULL)
go
insert into commit_procs values("Save Fee Schedules", "ag_commitscheduledfees", "ag_wipescheduledfees", "fees", "Y", 7, NULL)
go
insert into commit_procs values("Save Settlement Fees", "cbo_savesettlementfees", "cbo_wipesettlementfees", "settlement volume fees", "Y", 8, NULL)
go
insert into commit_procs values("Tally Pending Wires", "cbo_tallypendingwires", NULL, "process pb_wire_signoffs", "N", 9, NULL)
go
insert into commit_procs values("Close Rolling Spot", "bo_closerollingspot", "bo_wiperollingspot", "roll Rolling Spot trade type", "N", 10, NULL)
go
insert into commit_procs values("Autobook Resids", "bo_autobookresids", "bo_wipeautoresids", "auto book resids","N", 11, NULL)
go
insert into commit_procs values("Save PL by Type", "cbo_savepls", "cbo_wipepls", "save pl by type", "Y", 12, NULL)
go
insert into commit_procs values("Save Settlements", "cbo_booksettlements", NULL, "book FX settlements", "N", 13, NULL)
go
insert into commit_procs values("Save Credit by Account","bo_saveclientrisksum", "bo_wipeclientrisksum", "credit position by account", "Y", 14, NULL)
go
insert into commit_procs values("Save Equity by Account","bo_savecashequivs", "bo_wipecashequivs", "save equity by account", "Y", 15, NULL)
go
insert into commit_procs values("Save BO Spot Settles", "cbo_savebospotsettles", NULL, "saves prices in bo_spot_settles", "Y", 3, NULL)
go
insert into commit_procs values("Save BO Prices", "cbo_copyfopricestobo", NULL, "saves prices into bo_prices", "Y", 2, NULL)
go
insert into commit_procs values("Save Cross Prices", "r_savepricesettle", NULL, "saves cross prices from USD prices", "N", 1, NULL)
go
insert into commit_procs values("Save Ledger Fees", "cbo_ledgerfeerecon", NULL, "saves ledger fees", "N", 16, NULL)
go
insert into commit_procs values("Save Margin Data", "cbo_commitmargindata", NULL, "save margin data", "N", 17, NULL)
go
insert into commit_procs values("Roll Pending Transactions", "cbo_rollpendingtransactions", "cbo_unrollpendingtransactions", "rolls the transaction date on pending transactions due to settle omn commit to next business day", "Y", 18, NULL)
go
insert into commit_procs values("Save Interest Rates", "cbo_autosaveintmoves", "cbo_wipesaveintmoves", "saves interest rates", "Y", 19, NULL)
go
