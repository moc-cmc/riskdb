/* Sybase ASE 16.0 - TSQL stored procedure 
 * Syntax Rules:
 *     1. Use lowercase values for reserved words
 */
 create or replace procedure
    r_monthlyrevenue 
        @login varchar(50),
        @year varchar(50),
        @month varchar(50),
        @external_account varchar(100) = NULL

as

declare @tico_account_id int
declare @begin_date datetime
declare @end_date datetime
declare @external_account_id int
declare @total_revenue float
declare @ungrouped_total_revenue float


exec
    r_firstandlastdayofmonth
        @year = @year,
        @month = @month,
        @first_of_month = @begin_date output,
        @last_of_month = @end_date output

declare @error_style varchar(200)
declare @total_style varchar(200)
declare @style varchar(200)
declare @selected_style varchar(200)
declare @subtotal_style varchar(200)
declare @client_style varchar(200)

select
    @error_style = "background:#FAE6E6;border: 1px solid white;font-weight:bold",
    @subtotal_style = "background:#FAF7ED;border: 1px solid white;",
    @total_style = "background:#F5F3CE;border: 1px solid white;font-weight:bold",
    @style = "background:#FFFFFF;border: 1px solid white",
    @selected_style = "background:#FFF942;border: 1px solid white;font-weight:bold",
    @client_style = "background:#E4E4F2;border: 1px solid white;font-weight:bold"

create table
    #meta(
        meta_type varchar(200),
        name varchar(50) NULL,
        action varchar(100) NULL,
        value varchar(200) NULL)
insert into 
    #meta
values(
    "Row Style",
    "style",
    NULL,  
    NULL)

insert into
    #meta
values (
    "Column Group",
    "section",
    NULL,
    NULL)

insert into
	#meta
values(
	"Column Format",
	"amount",
	"Number",
	"#,##0.00;<span style=""color:red"">(#,##0.00)</span>")

insert into
	#meta
values(
	"Column Format",
	"percent_of_total", 
	"Number",
	"#,##0.00%")


create table
    #external_accounts(
        external_account_id int,
        symbol varchar(50),
        name varchar(150),
        external_account_type_id int
    )

select
    @external_account_id = external_account_id
from
    external_accounts
where
    symbol = @external_account
if @external_account_id is NULL
begin
    insert into
        #external_accounts
    select
        ea.external_account_id,
        ea.symbol,
        ea.name,
        ea.external_account_type_id
    from
        external_accounts ea
    where
	symbol not like "IB %"
end
else
begin
    insert into
        #external_accounts
    select
        ea.external_account_id,
        ea.symbol,
        ea.name,
        ea.external_account_type_id
    from
        external_accounts ea
    where
        ea.external_account_id = @external_account_id
end


create table
    #account_transactions(
        account_transaction_id int,
        entered_by int,
        external_account_id int,
        transaction_type_id int,
        transaction_date datetime,
        currency_id int,
        amount float,
        note varchar(255) null,
        revenue_date varchar(10) null,
        transaction_type varchar(100) null
    )

insert into
    #account_transactions
select
    a.account_transaction_id,
    a.entered_by,
    a.external_account_id,
    a.transaction_type_id,
    a.transaction_date,
    a.currency_id,
    a.amount,
    a.note,
    null,
    b.name
from
    account_transactions a,
    transaction_types b,
    #external_accounts c
where
    a.transaction_type_id = b.transaction_type_id
and
    a.external_account_id = c.external_account_id
and
    a.transaction_date > @begin_date 
and
    a.transaction_date <= @end_date

update
    #account_transactions
set
    revenue_date = @month
where
    transaction_type like '%' + @month + '%'



insert into
    #account_transactions
select
    a.account_transaction_id,
    a.entered_by,
    a.external_account_id,
    a.transaction_type_id,
    a.transaction_date,
    a.currency_id,
    a.amount,
    a.note,
    @month, 
    b.name
from
    account_transactions a,
    transaction_types b,
    #external_accounts c
where
    a.transaction_type_id = b.transaction_type_id
and
    a.external_account_id = c.external_account_id
and
    datepart(year, a.transaction_date) = convert(int, @year)
and
    b.name like '%' + @month + '%'
and
    a.account_transaction_id not in (
        select
            account_transaction_id
        from
            #account_transactions)
delete from
    #account_transactions
where
    transaction_type in ("Payment", "Statement Date")

insert into
    #account_transactions
select
    a.account_transaction_id,
    a.entered_by,
    a.external_account_id,
    a.transaction_type_id,
    a.transaction_date,
    a.currency_id,
    d.amount,
    "Allocated from total " + rtrim(convert(varchar(50), -a.amount)) + ":" + a.note,
    @month,
    b.name
from
    account_transactions a,
    transaction_types b,
    #external_accounts c,
    ledger_breakouts d
where
    a.transaction_type_id = b.transaction_type_id
and
    a.external_account_id = c.external_account_id
and
    a.account_transaction_id = d.account_transaction_id
and 
    d.month = @month
and
    d.amount != a.amount

/* look at this one closely */
update
    #account_transactions
set
    a.revenue_date = b.month
from
    #account_transactions a,
    ledger_breakouts b
where
    a.account_transaction_id = b.account_transaction_id
and
    b.month = @month
and
    a.amount = b.amount

update
    #account_transactions
set
    amount = amount * -1



/*select
    * 
from
    #account_transactions*/

/* Create output table that shows sub total revenue for each external account
 * where the revenue monnth is the same as the month passed in with a total row at
 * the start of the table using the style variables
    */ 
create table
    #output(
        id int identity,
        external_account_id int NULL,
        external_account varchar(150) NULL,
        revenue_date varchar(10) NULL,
        transaction_type varchar(100) NULL,
        amount float NULL,
        style varchar(200) NULL,
        ordering int NULL,
        section varchar(200) NULL,
        note varchar(255) NULL,
        account_transaction_id int NULL
    )

select
    @total_revenue = sum(amount)
from
    #account_transactions
where
    revenue_date = @month

select
    @ungrouped_total_revenue = sum(amount)
from
    #account_transactions
where
    revenue_date = NULL

insert into
    #output(
        external_account_id,
        external_account,
        revenue_date,
        transaction_type,
        amount,
        style,
        ordering,
        section 
    )
values(
        NULL,
        'Total Revenue',
        @month,
        NULL,
        @total_revenue,
        @selected_style,
        1,
        'Revenue'
    )

insert into
    #output(
        external_account_id,
        external_account,
        revenue_date,
        transaction_type,
        amount,
        style,
        ordering,
        section
    )
values(
        NULL,
        'Ungrouped Total Revenue',
        @month,
        NULL,
        @ungrouped_total_revenue,
        @error_style,
        2,
        'Ungrouped'
    )

insert into
    #output(
        external_account_id,
        external_account,
        revenue_date,
        transaction_type,
        amount,
        style,
        ordering,
        section
    )
select
    b.external_account_id,
    b.symbol,
    a.revenue_date,
    NULL,
    sum(a.amount),
    @client_style,
    3,
    "Revenue" 
from
    #account_transactions a,
    #external_accounts b
where
    a.external_account_id = b.external_account_id
and
    a.revenue_date = @month
group by
    b.external_account_id,
    b.symbol,
    a.revenue_date

insert into
    #output(
        external_account_id,
        external_account,
        revenue_date,
        transaction_type,
        amount,
        style,
        ordering,
        section
    )
select
    b.external_account_id,
    b.symbol,
    a.revenue_date,
    NULL,
    sum(a.amount),
    @client_style,
    3,
    "Ungrouped" 
from
    #account_transactions a,
    #external_accounts b
where
    a.external_account_id = b.external_account_id
and
    a.revenue_date = NULL
group by
    b.external_account_id,
    b.symbol,
    a.revenue_date

insert into
    #output(
        external_account_id,
        external_account,
        revenue_date,
        transaction_type,
        amount,
        style,
        ordering,
        section,
        note,   
        account_transaction_id
    )
select
    b.external_account_id,
    b.symbol,
    a.revenue_date,
    a.transaction_type,
    a.amount,
    @style,
    3,
    'Revenue',
    a.note,
    a.account_transaction_id
from
    #account_transactions a,
    #external_accounts b
where
    a.external_account_id = b.external_account_id
and
    a.revenue_date = @month

insert into
    #output(
        external_account_id,
        external_account,
        revenue_date,
        transaction_type,
        amount,
        style,
        ordering,
        section,
        note,
        account_transaction_id
    )
select
    b.external_account_id,
    b.symbol,
    a.revenue_date,
    a.transaction_type,
    a.amount,
    @style,
    3,
    'Ungrouped',
    a.note,
    a.account_transaction_id
from
    #account_transactions a,
    #external_accounts b
where
    a.external_account_id = b.external_account_id
and
    a.revenue_date = NULL

select
    *
from
    #meta

select
    section = "Warning",
    note = "This report is for informational purposes only. Transactions may be missing if the name of the month is missing, abbreviated, or truncated in the transaction type. Single lineitem quaterlies need an entry into ledger_breakouts to allocate the monthly revenue.",
    style = @style

select
    percent_of_total = case when @total_revenue != 0 and external_account != "Ungrouped Total Revenue" then (amount / @total_revenue) else NULL end,
    amount,
    external_account,
    revenue_date + " " + @year as revenue_date,
    style = case when ordering = 1 then @selected_style
                when ordering = 2 then @error_style
                when ordering = 3 then @style
                else @style end,
    section = "Revenue Summary"
from
    #output
where 
    account_transaction_id is NULL
and
    revenue_date is not NULL
order by
    section,
    ordering,
    external_account,
    transaction_type

select
    external_account,
    revenue_date,
    account_transaction_id,
    transaction_type,
    amount,
    note,
    style,
    section
from
    #output
order by
    section,
    ordering,
    external_account,
    transaction_type

go
