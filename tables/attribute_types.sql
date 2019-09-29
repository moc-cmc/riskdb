
if object_id("attribute_types") != NULL
    drop table
        attribute_types
go

create table
    attribute_types (
        attribute_type_id int,
        name char(200),
	column_name varchar(30),
	datatype varchar(50)
    )
go

insert into attribute_types select 1,"Timing","e_timing","string"   
go
 insert into attribute_types select 3,"Option Expiration","optexp_expiration","date"   
go
 insert into attribute_types select 4,"Source Trade Trade Id","source_trade_trade_id","number"    
go
 insert into attribute_types select 5,"Upper Window End","upper_window_end","date"    
go
 insert into attribute_types select 6,"Upper Window Start","upper_window_start","date"   
go
 insert into attribute_types select 7,"Barrier Location","barrier_location","string"    
go
 insert into attribute_types select 8,"Barrier Direction","barrier_direction","string"   
go
 insert into attribute_types select 9,"Upper Barrier","upper_barrier","number"   
go
 insert into attribute_types select 10,"Lower Barrier","lower_barrier","number"     
go
 insert into attribute_types select 11,"Time Zone","option_cut_code","string"   
go
 insert into attribute_types select 12,"Rebate Currency","rebate_currency","string"   
go
 insert into attribute_types select 13,"Rebate Amount","rebate_amount","number"     
go
 insert into attribute_types select 14,"Option Settlement Date","option_settlement_date","date"          
go
 insert into attribute_types select 15,"Lower Window Start","lower_window_start","date"          
go
 insert into attribute_types select 16,"Lower Window End","lower_window_end","date"   
go
 insert into attribute_types select 17,"Fixing Source","fixing_source","string"     
go
 insert into attribute_types select 18,"Exotic Type","e_bt","string"   
go
 insert into attribute_types select 19,"Counter Amount","abs_counter_qty","number"    
go
 insert into attribute_types select 21,"Put Call","optcon_put_call","string"    
go
 insert into attribute_types select 22,"Exercise Style","exercise_style","string"   
go
 insert into attribute_types select 23,"Strike","optcon_strike","number"    
go
 insert into attribute_types select 25,"Notional","notional","number"    
go

