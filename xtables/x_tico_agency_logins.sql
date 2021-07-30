create existing table
        x_tico_agency_logins(
		login varchar(50),
		activity_date datetime,
		num_logins varchar(50),
                _db_name varchar(50) NULL,
                _begin_date datetime NULL,
                _end_date datetime NULL)
external procedure at
        'TICO_AGENCY.tico_agency..ti_activeusers'
go
