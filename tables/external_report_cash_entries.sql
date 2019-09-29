use
	risk_rcm
go

if object_id("external_report_cash_entries") != null
    drop table
        external_report_cash_entries
go

create table
    external_report_cash_entries (
    
        external_report_cash_entry_id numeric(10,0) identity,
        external_report_id int,
        external_account_day_id int NULL,

        /* Identifiers */
        date datetime,
        identifier varchar(50) null,
        rec_id varchar(5) null,
        firm varchar(5) null,
        ofc varchar(5) null,
        
        external_account_id int null,
        external_account varchar(25) null,
        account_number int null,
        account_type varchar(10) null,
        curr_cd varchar(10) null,
        net numeric(30,4) null,
        cmnt_cd varchar(5) null,
        symbol varchar(50) null,
        jrnl_date datetime null,
        security_description varchar(50) null,
        delete_cd varchar(5) null,
        jrnl_seq_no int null,
        jrnl_rr_no int null,
        
        /* Annotations */
        note varchar(50) null

    )
go


create unique clustered index
    u_erm
on
    external_report_cash_entries (
        external_report_cash_entry_id
    )

create unique index
    i_erm
on
    external_report_cash_entries (
        identifier
    )

go


/*

sp_rename external_report_cash_entries, external_report_cash_entries_o

(load)
insert into external_report_cash_entries select 
    external_report_id,
    NULL,
    date,
    identifier,
    rec_id,
    firm,
    ofc,
    external_account_id,
    external_account,
    account_number,
    account_type,
    curr_cd,
    net,
    cmnt_cd,
    symbol,
    jrnl_date,
    security_description,
    delete_cd,
    jrnl_seq_no,
    jrnl_rr_no,
    note
from
    external_report_cash_entries_o
    
if (select count(*) from external_report_cash_entries_o) = (select count(*) from external_report_cash_entries) 
begin
    drop table external_report_cash_entries_o
    select "OK"
end
else
    select "Mismatch"

*/

