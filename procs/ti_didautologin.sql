
if object_id("ti_didautologin") != NULL
    drop procedure
        ti_didautologin
go

create procedure
  ti_didautologin
    @login varchar(100),
    @user varchar(100),
    @session_id varchar(100)
as

declare @account_id int
declare @password varchar(50)

/* We will temporarily set the user's password as the user's session
 * id and then turn it off afterwards */

select
  @password = ''

update
  accounts
set
  password = @password
where
  login = @user

if @@rowcount != 1
begin
  select
    status = 'ok',
    message = ''
  return
end

select
  status = 'ok',
  message = ''

go


