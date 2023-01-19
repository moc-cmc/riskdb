
if object_id("user_agreement_reqs") != NULL
    drop table user_agreement_reqs
go

create table 
    user_agreement_reqs (
        user_agreement_req_id int identity,
        user_agreement_id int,          -- Subject agreement
        user_id int,                    -- User tico_accounts.account_id
        token varchar(25),              -- Unique agreement key
        request_date datetime,          -- Date requested (onboarding)
        -- transient properties
        request_status_id int,          -- signing status
        sign_date datetime null,        -- Date signed 
        ip_addr_id int null,            -- IP address
        user_agent_id int null,         -- User agent 
        data varchar(1000) null         -- Associated data in JSON format
    )
go

create unique nonclustered index 
    u_uar
on  
    user_agreement_reqs (
        user_agreement_req_id
    )
go

create unique nonclustered index 
    n_uar
on  
    user_agreement_reqs (
        user_agreement_id,
        user_id
    )
go

if not exists(select name from tables where name = "user_agreement_reqs")
	insert into tables(name, table_type) values("user_agreement_reqs", "J")

go
