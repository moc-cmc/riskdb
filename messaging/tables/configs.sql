if object_id('configs') is not NULL
    drop table
        configs
go

/**
 * The configs table lists ...
 */
create table
    configs (
        config_id int identity,
        name varchar(100),
                /* Name of the config, which may be a duplicate or variation of 
                 * the config_types.name and/or the subject row's name. This 
                 * name does not need to be unique */
        config_type_id int,
        subject_row_id int NULL,
                /* Row ID of the config_types.subject_table_id if relevant. 
                 * This value should only be used for administrative and 
                 * documentation purposes and should generally not be used for 
                 * joins. The subject should have its own config_id column or 
                 * an optional to-one join table to specify its configuration 
                 * specifically */
        external_ref varchar(100) NULL,
                /* If the contents of this configuration should be taken from 
                 * an external source, instead of or in addition to the 
                 * config_props table, this field should be populated with a 
                 * reference to the external source. The reference may be one 
                 * of the following:
                 * - An `https` or `sftp` URL
                 * - A GitHub URL `git://host/org/repo/base.../path/to/file`
                 * - ...
                 */
        date_created datetime,
                /* Date the config was created */
        date_modified datetime NULL
                /* Date the config was last modified, if ever */
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    configs (
        config_id
    )
go

create unique nonclustered index
    u_name
on
    configs (
        name
    )
go

if not exists(select * from keys where relation = 'configs')
    insert into keys values('configs', 0)
go

if not exists(select * from tables where name = 'configs')
    insert into tables(name, table_type) values('configs', 'L')
go