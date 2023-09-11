create or replace procedure
    api_defineconfigprop
        @login varchar(100) = NULL,
        @config_type varchar(100) = NULL,
        @name varchar(100) = NULL,
        @datatype varchar(50) = NULL,
        @def_value varchar(100) = NULL,
        @config_prop_type_id int = NULL out
as

declare @login_account_id int
declare @config_type_id int

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



/* -------------------------------- ACTION -------------------------------- */

-- INSERT config_prop_types
insert into
    config_prop_types (
        config_type_id,
        name,
        datatype,
        def_value
    )
    values (
        @config_type_id,
        @name,
        @datatype,
        @def_value
    )

if @@rowcount != 1
begin
    set @error = 'system: failed to insert into config_prop_types (name: "' + @name + '", ...)'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

set @config_prop_type_id = @@identity

go