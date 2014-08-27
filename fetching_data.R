# set a new environment for upcoming data
new.environment <- new.env()
# fetch a shanghai stock exchange stock china petrol from google
getSymbols("601857.ss", env = new.environment, src="google",from="2013-10-01", to = "2013-10-23")
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





# 上证指数的符号是SSEC， 获取代码
getSymbols("^SSEC")
# 最近三个月图表
chartSeries(SSEC, subset = "last 3 months")
# 上证指数代码为000001.ss，其中.ss代表从属于上交所。
getSymbols("000001.ss")
"""
the codes below does not work!!!!
# 上证A股指数的代码为000002.ss。用setSymbolLookup函数设定上证A股指数符号。
setSymbolLookup(A.Share.index = list(name="000002.ss", src = "yahoo"))
getSymbols("A.Share.index")
"""
# 上证A股的符号为SSEA， B股为SSEB
getSymbols("^SSEA")
getSymbols("^SSEB")

# 深圳成指代码为399001.sz
setSymbolLookup(component.index = list(name="399001.sz", src = "yahoo"))
getSymbols("component.index")
# 中国移动CHL
getSymbols("CHL")
# 三一重工600030.ss
setSymbolLookup(SANY.HEAVY = list(name="600030.ss", src = "yahoo"))
getSymbols("SANY.HEAVY")




# 从多种信息源里获得信息
getSymbols()
# 获取上市公司的股息数据
getDividend()
# 获取上市公司的财务报表
getFinancials()
# 获取汇率数据
getFX()
# 获取重金属交易数据 
getMetals()
# 获取上市公司的拆股数据
getSplits()
# 获取期权交易数据
getOptionChain()
# 获取即时的网络报价 
getQuote
# 从csv文件中读入数据
getSymbols.csv()
# 从FRED中获取数据
getSymbols.FRED()
# 从google中获取数据
getSymbols.google()
# 从MySQL中获取数据
getSymbols.MySQL()
# 从oanda中获取数据
getSymbols.oanda()
# 从R的二进制文件中获取数据
getSymbols.rda()
# 从SQLite数据库中获取数据
getSymbols.SQLite()
# 从雅虎网中获取数据
getSymbols.yahoo()


# 其他数据源  http://www.oanda.com/
# http://research.stlouisfed.org/fred2/
"""
RCurl
RJSON
RJSONIO
XML
Scraper
WDI
Tseries
参考: http://www.dataguru.cn/article-1466-1.html
http://f.dataguru.cn/forum.php?mod=viewthread&tid=147799
"""
"""
判断某数据是否是某类型的数据
is.OHLC()
is.OHLCV()
is.BBO()
is.TBBO()
is.HLC()
"""
"""
检查数据里面是否包含某类型的数据
has.OHLC() 
has.HLC() 
has.OHLCV() 
has.Op()
has.Hi()
has.Lo()
has.Cl()
has.Vo()
has.Ad()
has.Ask()
has.Bid()
has.Price()
has.Qty()
has.Trade()
"""
"""
提取某种数据类型
Op()
Hi()
Lo()
Cl()
Vo()
Ad()
HLC()
OHLC()
"""
"""
Delt() #计算变化率
Lag() #求滞后k期
Next() #求k个后
first() #求前k个
last() #求后k个
findPeaks() #找出峰值
findValleys() #找出谷值
seriesIncr() #差分后大于限值的点
seriesDecr() #差分后小于限值的点
endpoints() #寻找节点
to.weekly() #将OHLC数据转化为周数据
to.monthly() #将PHLC数据转化为月数据
periodicity() #返回数据的日期范围
"""








