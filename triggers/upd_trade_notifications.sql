
if object_id("upd_trade_notifications") != NULL
    drop trigger
        upd_trade_notifications
go

create trigger
	upd_trade_notifications
on
	trade_notifications
for
	update
as

declare @result int

/* Do not send an update notification if we are enacting a trade status from the
 * notifiee */
if object_name(@@procid) not in ("r_didsendtradenotification")
begin
    select
        @result = syb_sendmsg("localhost", 9999, 
                "Notify /topic/Store.Notify." + @@servername + "." + db_name() + "."
                + "trade_notifications: update " 
                + convert(varchar(10), trade_notification_id) + " " 
                + convert(varchar(10), source_id) + " " 
                + convert(varchar(10), trade_id) + " " 
                + convert(varchar(10), status_id) + " " 
                + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), capture_date), 9)) + "' " 
                + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), notify_date), 9)) + "' " 
                + "'"+ rtrim(error) + "'"
        )
    from
        inserted
end

go
