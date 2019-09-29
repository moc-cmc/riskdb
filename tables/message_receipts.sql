
if object_id("message_receipts") != NULL
    drop table
        message_receipts
go

/* 
 * Receipts are created along with their messages with a status of "New". Once
 * the receipt is scheduled by r_checkmessages, whcih sets the status to
 * "Pending". Message delivery applications perform sending of all messages in
 * "Pending" status for messages that are in "Active" status and then mark the
 * receipts with "Sent". If read receipt is supported, read messages should be
 * marked as "Received". A message can be cancelled by setting it's status to
 * "Cancelled", in which case, any messages still stuck in "New" (ie. still
 * needs scheduling) won't be sent.
 */
create table
    message_receipts (
        message_receipt_id int identity,
        message_id int,
        message_recipient_id int,
        status_id int, /* New, Pending, Sent, Cancelled, Received */
        status_date datetime
    )
go
