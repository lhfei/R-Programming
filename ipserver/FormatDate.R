as.POSIXct((z - 719529)*86400, origin = "1970-01-01", tz = "UTC")

x1 <- as.POSIXct(1426408415890, origin = "1970-01-01", tz = "UTC")

x1 <- as.POSIXct((1009815483015 - 719529)*86400, origin = "1970-01-01", tz = "UTC")

z <- 1009815483015
# ways to convert this
as.POSIXct(z, origin = "1960-01-01")                # local

z <- 7.343736909722223e5 # 2010-08-23 16:35:00
as.POSIXct((z - 719529)*86400, origin = "1970-01-01", tz = "UTC")


z <- 1426667830366 

op <- options(digits.secs = 3)
# avoid rounding down: milliseconds are not exactly representable
as.POSIXct((z+0.1)/1000, origin = "1970-01-01")
options(op)


## Stata date-times: milliseconds since 1960-01-01 00:00:00 GMT
## format %tc excludes leap-seconds, assumed here
## For format %tC including leap seconds, see foreign::read.dta()
z <- 1579598122120
op <- options(digits.secs = 3)
# avoid rounding down: milliseconds are not exactly representable
as.POSIXct((z+0.1)/1000, origin = "1960-01-01")
options(op)



