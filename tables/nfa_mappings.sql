create table
      nfa_mappings(
              nfa_mapping_id int identity,
              external_account_id int,
              spectrum_file varchar(50),
              routing_number int,
              account_number varchar(50),
              owner varchar(50),
              bank_name varchar(50))

go

create unique nonclustered index
        u_nfam
on
        nfa_mappings(
        	external_account_id,
        	spectrum_file)
go
