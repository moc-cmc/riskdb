
if object_id("ti_willautologin") != NULL
    drop procedure
        ti_willautologin
go

create procedure
  ti_willautologin
    @login varchar(100),
    @user varchar(100),
    @session_id varchar(100)
as

declare @account_id int
declare @password varchar(15)

/* We will temporarily set the user's password as the user's session
 * id and then turn it off afterwards */

select
  @account_id = account_id
from
  accounts
where
  login = @user

select
  @password = case @session_id
    when null then ''
    else convert(varchar(15), @session_id)
  end

update
  accounts
set
  password = @password
where
  login = @user

select
  status = 'ok',
  message = 'session',
  password = @password

go


