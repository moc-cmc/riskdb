if object_id('config_prop_types') is not NULL
    drop table
        config_prop_types
go

/**
 * The config_prop_types table lists ...
 */
create table
    config_prop_types (
        config_prop_type_id int identity,
        config_type_id int,
        name varchar(100),
                /* Prop names should be lower snake case. */
        datatype varchar(50),
                /* One of: 
                 * - Base types: string, int, float, bool, date 
                 * - Optional types: e.g. `string?`, `int?`, etc
                 * - Literal types: e.g. `'ses'`, `1`, `true`, etc
                 * - Union types: e.g. `string|int`, `string|bool`, etc
                 * - Array types: e.g. `string[]`, `int[]`, etc
                 */
        format varchar(50) NULL,
                /* A validation format, one of:
                 * - Built-in formats: email, phone, url, ip, ipv4, ipv6, 
                 *   semver, date, datetime, time, timezone
                 * - Regular expression: e.g. "^\\d{3}-\\d{2}-\\d{4}$" */
        def_value varchar(100) NULL,
                /* Default value, if any. See config_props.value for more 
                 * details about values */
        title varchar(100) NULL,
                /* An alternate title or input placeholder for the prop. 
                 * E.g. for prop 'smtp_url', "URL for SMTP or Amazon SES" */
        note varchar(200) NULL,
                /* A note or subtitle for the prop. e.g., "URL should be one of 
                 * the following, 'smtp://user:pass@host:port/" or 
                 * 'ses://user@region/?smid=smSecretId'" */
        input_group varchar(50) NULL,  
                /* For grouping input fields on a form, or csv. e.g. address */
        input_enums varchar(200) NULL,
                /* If specified, should be one of the three forms:
                 * - A list of values separated by commas (e.g. "smtp, ses")
                 * - A list of value=title pairs (e.g. "smtp=SMTP, ses=AWS SES")
                 * - The string `sql:` followed by a proc name or SQL
                 *   (e.g. "sql:api_providers") */
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    config_prop_types (
        config_prop_type_id
    )
go

create unique nonclustered index
    u_name
on
    config_prop_types (
        name
    )
go

if not exists(select * from keys where relation = 'config_prop_types')
    insert into keys values('config_prop_types', 0)
go

if not exists(select * from tables where name = 'config_prop_types')
    insert into tables(name, table_type) values('config_prop_types', 'L')
go