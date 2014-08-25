# set a new environment for upcoming data
new.environment <- new.env()
# fetch a shanghai stock exchange stock china petrol from google
getSymbols("601857.ss", env = new.environment, scr="google",from="2013-10-01", to = "2013-10-23")
# list all data under the new environment.
ls(envir=new.environment)
# print the stock data
get("601857.SS",envir = new.environment)
# fetch a shenzhen stock exchange stock zhong liang ji tuan from google
getSymbols("000930.sz", env = new.environment, scr="google",from="2012-10-01", to = "2013-10-23")
# set a new value zhongliang to store the data.
zhongliang <- get("000930.SZ",envir = new.environment)
# explore the zhongliang data
head(zhongliang)
# rename zhongliang's column names
names(zhongliang) <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
# getting financial reports
getFinancials("000930.sz")
# it does not work to get the financial report of zhong liang sheng hua
viewFinancials(000930.sz.f)
# it works on APPLE.
getFinancials("AAPL")
viewFinancials(AAPL.f)
