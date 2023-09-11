
create or replace procedure
    api_deriveconfigtype
        @login varchar(100) = NULL,
        @name varchar(100) = NULL,
        @impl_tag varchar(100) = NULL,
        @parent_type varchar(100) = NULL,
        @subject_table varchar(100) = NULL,
        @config_type_id int = NULL out
as

declare @login_account_id int
declare @parent_type_id int
declare @subject_table_id int

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

-- LOOKUP @parent_type_id - in config_types from @parent_type
if @parent_type is not NULL
begin
    select
        @parent_type_id = cftp.config_type_id
    from
        config_types cftp
    where
        cftp.name = @parent_type
    
    if @parent_type_id is NULL
    begin
        set @error = 'no such parent type: "' + @parent_type + '"'
        if @uses_output = 'Y' select status = 'Error', error = @error
        return
    end
end

-- LOOKUP @subject_table_id - in tb from @subject_table
if @subject_table = NULL
begin
    set @error = 'subject table required'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end

select
    @subject_table_id = tb.tables_id
from
    tables tb
where
    tb.name = @subject_table

if @subject_table_id is NULL
begin
    set @error = 'no such subject table: "' + @subject_table + '"'
    if @uses_output = 'Y' select status = 'Error', error = @error
    return
end



/* -------------------------------- ACTION -------------------------------- */

begin tran

    -- INSERT config_types
    insert into
        config_types (
            name,
            impl_tag,
            parent_type_id,
            subject_table_id
        )
        values (
            @name,
            @impl_tag,
            @parent_type_id
            @subject_table_id
        )

    if @@rowcount != 1
    begin
        set @error = 'system: failed to insert into config_types (name: "' + @name + '", ...)'
        if @uses_output = 'Y' select status = 'Error', error = @error
        rollback
        return
    end

    set @config_type_id = @@identity

    /* Loop through and copy of the prop types from the parent type */

    insert into
        config_prop_types (
            config_type_id,
            name,
            datatype,
            def_value
        )
    select
        config_type_id = @config_type_id,
        name,
        datatype,
        def_value
    from
        config_prop_types
    where
        config_type_id = @parent_type_id

commit tran

go