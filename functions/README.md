### Sybase Functions

Sybase ASE supports user defined functions. They can be used just like any other functions in sybase ASE like sum, abs, max, etc. This makes them easy to use in select statements.

### Examples

Note that these procs need to be called wit dbo prefix

```tsql
[22] SYB0302.risk_qson.1> select dbo.f_striptrailingzeros("1.00002000")
[22] SYB0302.risk_qson.2> go
                               
 ------------------------------
 1.00002                       
```

```tsql
[29] SYB0304.risk_oanda_dev.1> select trade_id, trade_date, bo_trade_date = dbo.f_botradedate(trade_date) from trades where trade_date >= "20201118 16:58:38" and trade_date <= "20201118 17:05"
[29] SYB0304.risk_oanda_dev.2> go
 trade_id    trade_date                 bo_trade_date             
 ----------- -------------------------- --------------------------
      219106 Nov 18 2020 04:58:38:000PM Nov 18 2020 12:00:00:000AM
      219107 Nov 18 2020 04:58:38:000PM Nov 18 2020 12:00:00:000AM
      219108 Nov 18 2020 04:58:38:000PM Nov 18 2020 12:00:00:000AM
      219109 Nov 18 2020 04:58:38:000PM Nov 18 2020 12:00:00:000AM
      219110 Nov 18 2020 04:58:38:000PM Nov 18 2020 12:00:00:000AM
      219111 Nov 18 2020 04:58:38:000PM Nov 18 2020 12:00:00:000AM
      219112 Nov 18 2020 05:01:25:000PM Nov 19 2020 12:00:00:000AM
      219113 Nov 18 2020 05:01:25:000PM Nov 19 2020 12:00:00:000AM

(8 rows affected)
```


### Resources

- http://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.infocenter.dc36272.1572/html/commands/CHDEDGJI.htm
