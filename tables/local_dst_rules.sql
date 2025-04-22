if object_id('local_dst_rules') != null
    drop table 
        local_dst_rules
go

create table 
    local_dst_rules (
        local_dst_rules int identity,
        reference_year int not null,
        effective_date datetime not null,
        std_offset int not null,        /* Standard time offset in minutes */
        dst_offset int not null,        /* DST offset in minutes */
        dst_start datetime not null,    /* DST start for reference year */
        dst_end datetime not null
              /* DST end for reference year */
    )
with
    identity_gap = 5
go

create index
    ed_ldr
on
    local_dst_rules (effective_date)
go

-- Rules for America/New_York (local)
insert into local_dst_rules values(
    2007, '2007-01-01', -300, -240, '2007-03-11 02:00', '2007-11-04 02:00'
    -- '2007-01-01', 2007, '2007-03-11 02:00', '2007-11-04 02:00', -300, -240
)
-- 1987-2006 rule
insert into local_dst_rules values(
    1987, '1987-01-01', -300, -240, '1987-04-05 02:00', '1987-10-25 02:00'
    -- '1987-01-01', 1987, '1987-04-05 02:00', '1987-10-25 02:00', -300, -240
)
-- 1976-1986 rule
insert into local_dst_rules values(
    1976, '1976-01-01', -300, -240, '1976-04-25 02:00', '1976-10-31 02:00'
    -- '1976-01-01', 1976, '1976-04-25 02:00', '1976-10-31 02:00', -300, -240
)
-- 1975 special case
insert into local_dst_rules values(
    1975, '1975-01-01', -300, -240, '1975-02-23 02:00', '1975-10-26 02:00'
    -- '1975-01-01', 1975, '1975-02-23 02:00', '1975-10-26 02:00', -300, -240
)
-- 1974 special case
insert into local_dst_rules values(
    1974, '1974-01-01', -300, -240, '1974-01-06 02:00', '1974-10-27 02:00'
    -- '1974-01-01', 1974, '1974-01-06 02:00', '1974-10-27 02:00', -300, -240
)
-- 1967-1973 rule
insert into local_dst_rules values(
    1967, '1967-01-01', -300, -240, '1967-04-30 02:00', '1967-10-29 02:00'
    -- '1967-01-01', 1967, '1967-04-30 02:00', '1967-10-29 02:00', -300, -240
)

go