create or replace procedure
    api_createconfig 
        @login varchar(100) = NULL,
        @name varchar(100) = NULL,
        @config_type varchar(100) = NULL,
        @subject_row_id int = NULL,
        @config_id int out
as

declare @login_account_id int
declare @config_type_id int
declare @active_status_id int

/* -------------------------------- LOOKUP -------------------------------- */

-- LOOKUP @login_account_id - in tico_accounts from @login
select
    @login_account_id = ur.account_id
from
    tico_accounts ur
where
    ur.login = @login

if @login_account_id is NULL
begin
    set @error = 'no such login: ' + @login
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

-- LOOKUP @config_type_id - in cftp from @config_type
if @config_type = NULL
begin
    set @error = 'config type required'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

select
    @config_type_id = cftp.config_types_id
from
    config_types cftp
where
    cftp.name = @config_type

if @config_type_id is NULL
begin
    set @error = 'no such config type: "' + @config_type + '"'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

-- LOOKUP @active_status_id - in activity_statuses from 'Active'
select
    @active_status_id = st.activity_status_id
from
    activity_statuses st
where
    st.name = 'Active'

if @active_status_id is NULL
begin
    set @error = 'no such activity status: "' + 'Active' + '"'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end




/* -------------------------------- ACTION -------------------------------- */

-- INSERT configs
insert into
    configs (
        name,
        config_type_id,
        activity_status_id,
        subject_row_id,
        date_created,
        date_modified,
    )
    values (
        @name,
        @config_type_id,
        @active_status_id,
        @subject_row_id,
        @date_created,
        NULL
    )

if @@rowcount != 1
begin
    set @error = 'system: failed to insert into configs (name: "' + @name + '", ...)'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

set @config_id = @@identity

go