### Sybase Functions

Sybase ASE supports user defined functions. They can be used just like any other functions in sybase ASE like sum, abs, max, etc. This makes them easy to use in select statements.

### Examples

Note that these procs need to be called wit dbo prefix

```
[22] SYB0302.risk_qson.1> select dbo.f_striptrailingzeros("1.00002000")
[22] SYB0302.risk_qson.2> go
                               
 ------------------------------
 1.00002                       
```


### Resources

- http://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.infocenter.dc36272.1572/html/commands/CHDEDGJI.htm
