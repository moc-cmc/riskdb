
create or replace procedure
    api_setconfigprop
        @login varchar(100) = NULL,
        @config varchar(100) = NULL,
        @name varchar(100) = NULL,
        @value varchar(100) = NULL,
        @config_prop_id int = NULL out
as

declare @login_account_id int
declare @config_id int
declare @config_type_id int
declare @config_prop_type_id int

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

-- LOOKUP @config_id - in cf from @config
if @config = NULL
begin
    set @error = 'config required'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

select
    @config_id = cf.config_id,
    @config_type_id = cf.config_type_id
from
    configs cf
where
    cf.name = @config

if @config_id is NULL
begin
    set @error = 'no such config: "' + @config + '"'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

-- LOOKUP @config_prop_type_id - in cfprtp from @name
if @name = NULL
begin
    set @error = 'config prop type id required'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

select
    @config_prop_type_id = prtp.config_prop_types_id
from
    config_prop_types prtp
where
    prtp.name = @name
and
    prtp.config_type_id = @config_type_id

if @name_id is NULL
begin
    set @error = 'no such config prop type id: "' + @name + '"'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end



/* -------------------------------- ACTION -------------------------------- */

-- INSERT config_props
insert into
    config_props (
        config_id,
        config_prop_type_id,
        value
    )
    values (
        @config_id,
        config_prop_type_id,
        value
    )

if @@rowcount != 1
begin
    set @error = 'system: failed to insert into config_props (name: "' + @name + '", ...)'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

set @config_prop_id = @@identity


go