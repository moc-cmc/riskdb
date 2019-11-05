create or replace trigger
    ins_credit_update_requests
on
    credit_update_requests
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_update_requests: insert " 
 
        + convert(varchar(10), a.credit_update_request_id) + " "
	+ convert(varchar(10), a.credit_update_type_id) + " "
	+ convert(varchar(10), a.status_id) + " "
	+ convert(varchar(10), a.tico_account_id) + " "
	+ "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.timestamp), 9) + "' "
	+ convert(varchar(10), a.source_id) + " "
	+ "'" + str_replace(a.identifier, "'", "\'") + "' "
	+ (case when a.credit_profile_id = NULL then "NULL" else convert(varchar(10), a.credit_profile_id) end) + " "
	+ "'" + str_replace(a.message, "'", "\'") + "'"
    )
from
    inserted a

go
