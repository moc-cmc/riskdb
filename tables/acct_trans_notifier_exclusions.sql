create table
    acct_trans_notifier_exclusions (
        exclusion_id int identity,
        source_id int,
        external_account_id int null,
        transaction_type_id int null,
	notifier_exclusion_date datetime null
    )
go
