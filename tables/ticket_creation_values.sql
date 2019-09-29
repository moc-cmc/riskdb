/* @author: Chris OConnor
 *
 * NOTE: This table is not normalized. It uses strings to try and determine
 *       details instead of a primary key ( _id ).
 *       Design choice so we do not have to look up the symbol from an _id
 *       when we are going to look up the _id again on insert into trades 
 */

if object_id("ticket_creation_values") != NULL
    drop table
        ticket_creation_values
go

create table
	ticket_creation_values
(
	trigger_symbol varchar(50), /* If @variable matches trigger symbol and source then create ticket(s) with details */
	source_id int,
        cl_create char(1) NULL, /* if 'Y' then create, else do not create */
        cl_int_account varchar(50) NULL,
	cl_ext_account varchar(50) NULL,
	cl_trader varchar(50) NULL,
	cl_counterparty varchar(50) NULL,
	cl_strategy varchar(50) NULL,
	cl_inv_qty char(1) NULL,
	cl_spread float NULL,
        lp_create char(1) NULL, /* if 'Y' then create, else do not create */
        lp_int_account varchar(50) NULL,
	lp_ext_account varchar(50) NULL,
	lp_trader varchar(50) NULL,
	lp_counterparty varchar(50) NULL,
	lp_strategy varchar(50) NULL,
	lp_inv_qty char(1) NULL,
	lp_spread float NULL
)

go

/*
insert into ticket_creation_values
select 
	        trigger_symbol,
        source_id int,
        cl_create , 
        cl_int_account ,
        cl_ext_account ,
        cl_trader ,
        cl_counterparty ,
        cl_strategy ,
        cl_inv_qty,
        cl_spread,
        lp_create , 
        lp_int_account ,
        lp_ext_account ,
        lp_trader ,
        lp_counterparty ,
        lp_strategy,
        lp_inv_qty,
        lp_spread
from
	ticket_creation_values2

go*/

create unique nonclustered index
	u_tcv
on
	ticket_creation_values(trigger_symbol, source_id)
go


	
