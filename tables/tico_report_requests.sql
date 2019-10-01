
/* tico_reports(name="${run} - ", "run=QSON Trading&tradeDate=${today}") */
/*
  * tico_reports() - reports themselves, templates, and base params, 
  *   proc name or nav title, login/password, form params,
  *   name is the title which could be templated
  * report_types() - 
  * tico_report_requests() - created reports, tracks status, url, etc. 
  *   login - 
  *   report_date - 
  *   
  */

  /*
   * New(7) - 
   * Processing(4) - picked up and generating PDF
   * Generated(-) - 
   * Failed(-) - 
   * Uploaded(-) - 
   * Failed(-) - 
   */

create table 
  tico_report_requests (
    tico_report_request_id int,
    tico_report_id int,
    as_of_date datetime,
    request_date datetime,
    status_id int, 
    error varchar(250) null,
    modify_date datetime null,
    filename varchar(100) null,
    params varchar(150) null,
    url varchar(150) null
  )
go

create unique nonclustered index
	u_i
on
	tico_report_requests(tico_report_request_id)
go

create unique nonclustered index
	u_rd
on
	tico_report_requests(tico_report_id, as_of_date)
go

delete from keys where relation = "tico_report_requests"
insert into keys values("tico_report_requests", 0)
go

