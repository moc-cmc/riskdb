
if object_id("upd_deal_notifications") != NULL
    drop trigger
        upd_deal_notifications
go

create trigger
	upd_deal_notifications
on
	deal_notifications
for
	update
as

declare @result int

/* Do not send an update notification if we are enacting a deal status from the
 * notifiee */
if object_name(@@procid) not in ("r_didsenddealnotification")
begin
    select
        @result = syb_sendmsg("localhost", 9999, 
                "Notify /topic/Store.Notify." + @@servername + "." + db_name() + "."
                + "deal_notifications: update " 
                + convert(varchar(10), deal_notification_id) + " " 
                + convert(varchar(10), source_id) + " " 
                + convert(varchar(10), deal_id) + " " 
                + convert(varchar(10), status_id) + " " 
                + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), capture_date), 9)) + "' " 
                + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), notify_date), 9)) + "' " 
                + "'"+ rtrim(error) + "'"
        )
    from
        inserted
end

go
