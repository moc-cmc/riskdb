if object_id('config_props') is not NULL
    drop table
        config_props
go

/**
 * A prop value for a config.
 */
create table
    config_props (
        config_prop_id int identity,
        config_id int,
        config_prop_type_id int,
        value varchar(100) NULL,
                /* Values are processed according to config_prop_types:
                 * - Parsed using the prop type's `datatype`
                 * - Validated using the prop type's `format`, if specified 
                 * - Mapped using the prop type's `input_enums` if specified
                 * - If the value is prefixed with `$ref:<reference>`, the 
                 *   value is looked up at runtime. Currently, the following
                 *   types of references are supported:
                 *   - `$ref:sm:<secret-id>` – The value is looked up in
                 *     AWS Secrets Manager using the secret id.
                 *   - `$ref:#<doc-path>` – Refers to another config with the 
                 *     given document path
                 * - Parsed literals: null, NULL
                 */
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    config_props (
        config_prop_id
    )
go

create unique nonclustered index
    u_name
on
    config_props (
        name
    )
go

if not exists(select * from keys where relation = 'config_props')
    insert into keys values('config_props', 0)
go

if not exists(select * from tables where name = 'config_props')
    insert into tables(name, table_type) values('config_props', 'L')
go