if exists(select name from sysobjects where id = object_id("archive_trade_notifications"))
begin
	if not exists( select name from syscolumns where id = object_id("archive_trade_notifications") and name = "archive_batch_id")
        begin
		select 'renaming archive_trade_notifications'
		exec
			sp_rename 
				@objname="archive_trade_notifications",
				@newname="archive_trade_notificationsold"
	end
end
go


create table
    archive_trade_notifications (
        archive_batch_id int,
        trade_notification_id int,
        source_id int,
        trade_id int,
        status_id int,
        capture_date datetime,
        notify_date datetime null,
        error varchar(250) null
    )
go



