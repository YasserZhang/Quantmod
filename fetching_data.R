library(quantmod)
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

"""
quantmod的ETL函数下载Apple,Microsoft,Oracle,Google四家公司全量股票行情数据

1)求出Apple公司在2013.1-2013.10的股票总成交量使用
"""
library(quantmod)
# set a new environment for upcoming data
new.environment <- new.env()
getSymbols("AAPL", env=new.environment, scr="yahoo", from = "2013-01-01", to = "2013-10-01")
ls(new.environment)
Apple <- get("AAPL", envir = new.environment)
summary(Apple)
dim(Apple)
# 重命名列名
names(Apple)  <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
head(Apple$Volume)
# 计算交易量总和
sum(Apple$Volume)
20,663,792,100 股

"""
2)找出这些股票暴涨暴跌的时间点（例如开盘价或收盘价比前一天涨跌幅度超过2%），
通过搜索引擎寻找是什么原因导致这些暴涨暴跌，观察（或用程序分析）数据，看就暴涨暴跌事件是否有可以利用的买卖规律
"""
首先看AAPL
getSymbols("AAPL", src="yahoo")
# 重新命名数据框列名
name <- c("Open","High","Low","Close","Volume","Adjusted")
names(AAPL) <- name
# 每日股票收盘价的变化率，即计算后一天收盘价与前一天收盘价的价差并除以前天收盘价。
change_rate_A <- (Next(AAPL$Close, 1)[-length(AAPL$Close)] - AAPL$Close[-length(AAPL$Close)])/AAPL$Close[-length(AAPL$Close)]
# 用Delt（）计算变化率更加方便。
change_rate_A <- Delt(Cl(AAPL),type=("arithmetic"))
# 列出所有变化率大于2%或小于-2%的日期及具体数量。
big_change_A <- change_rate_A[which(change_rate_A > 0.02 | change_rate_A < -0.02)]
big_change_A
# 求股价有大变动的日期的总数
length(big_change_A)
[1] 501
# 列出其中的最大值
big_change_A[which(big_change_A == max(big_change_A))]
2008-10-10
0.1390496
# 列出其中的最小值
big_change_A[which(big_change_A == min(big_change_A))]
2014-06-06
-0.8548569
"""
由于股价有大变动的日期太多，有501天，在此无法把每次的原因一一罗列，所以我只挑最大值和最小值重点解释。
最大值发生在2008年10月10日。10月3日，关于乔布斯的健康传言进一步打压苹果股票，到10月9日以到一个新低点，但由于10月14日苹果即将推出新的苹果笔记本产品以及10月21日公司即将发布新一季度财报等原因，股价至此开始强烈触底反弹。
最小值发生在2014年6月6日，原因是苹果分拆股票。
"""
MFST
getSymbols("MSFT", src="yahoo")
# 重新命名数据框列名
name <- c("Open","High","Low","Close","Volume","Adjusted")
names(MSFT) <- name
# 每日股票收盘价的变化率，即计算后一天收盘价与前一天收盘价的价差并除以前天收盘价。
change_rate_M <- (Next(MSFT$Close, 1)[-length(MSFT$Close)] - MSFT$Close[-length(MSFT$Close)])/MSFT$Close[-length(MSFT$Close)]
# a better way to calculate change rate using Delt()
change_rate_M <- Delt(Cl(MSFT),type= ("arithmetic"))
# 列出所有变化率大于2%或小于-2%的日期及具体数量。
big_change_M <- change_rate_M[which(change_rate_M > 0.02 | change_rate_M < -0.02)]
big_change_M
# 求股价有大变动的日期的总数
length(big_change_M)
# 列出其中的最大值
big_change_M[which(big_change_M == max(big_change_M))]
# 列出其中的最小值
big_change_M[which(big_change_M == min(big_change_M))]
"""
股价变化的最大值发生在2008年10月13日，原因同样是经济危机刚发生时股价急剧下挫引起的触底强烈反弹。
最小值发生在2009年1月22日，原因是微软决定裁员5000人，再加上新一季财报表现不佳，净利润律同比减少了大约7%。
"""
ORCL
getSymbols("ORCL", src="yahoo")
# 计算股票收盘价变动率
change_rate_O <- Delt(Cl(ORCL), type = ("arithmetic"))
# 取出股价波动较大的日期和数值
big_change_O <- change_rate_O[which(change_rate_O > 0.02 | change_rate_O < -0.02)]
# 求有多少天股价波动较大
length(big_change_O)
# 求出股价波动最大值
big_change_O[which(big_change_O == max(big_change_O))]
# 求出股价波动最小值
big_change_O[which(big_change_O == min(big_change_O))]
"""
最大值发生在2008年10月13日，原因同样是经济危机引起的股价急剧下挫后的触底反弹。
最小值发生在2011年12月21日，原因是刚发布的财报成绩非常不理想，软件销量只增长
3%，远远低于华尔街11%的预期，而去年同一季度的软件销量增长高达21%。
正是由于去年同期增长过快，导致今年目标过高，难攀高峰。
"""
GOOG
getSymbols("GOOG", src="google",from = "2007-01-01", to ="2014-08-28")
change_rate_G <- Delt(Cl(GOOG), type = ("arithmetic"))
big_change_G <- change_rate_G[which(change_rate_G > 0.02 | change_rate_G < -0.02)]
length(big_change_G)
big_change_G[which(big_change_G==max(big_change_G))]
big_change_G[which(big_change_G==min(big_change_G))]
"""
最大值发生在2008年4月18日，google一季度财报表现强劲，净利润达130亿美元，同比增长高达30%。
最小值发生在2008年9月29日，经济危机开始，股价当日发生急剧下挫。
"""






getSymbols("AAPL", src="yahoo")
getSymbols("MSFT", src="yahoo")
getSymbols("ORCL", src="yahoo")
getSymbols("GOOG", src="yahoo")
tickers <- c("AAPL","MSFT","ORCL","GOOG")
getSymbols(tickers,env=new.environment, src = "yahoo")
chartSeries(AAPL, subset = "last 12 months")
chartSeries(MSFT, subset = "last 12 months")
chartSeries(ORCL, subset = "last 12 months")
chartSeries(GOOG, subset = "last 12 months")
head(get("AAPL"))
ls()
# a experiment, testing how to calculate the change rate from the Close price to the Open price
apple <- last(AAPL, 50)
head(apple)
(Next(apple,1)[-50] - apple$AAPL.Close[-50])/apple$AAPL.Close[-50]
# the experiment is succesful!
apple <- last(AAPL$AAPL.Close, 50)
head(apple)
rate <- (Next(apple,1)[-50] - apple$AAPL.Close[-50])/apple$AAPL.Close[-50]
rate[which(rate > 0.02 | rate < -0.02)]
(95.97-94.03)/94.03
names(AAPL)
name <- c("Open","High","Low","Close","Volume","Adjusted")
names(AAPL) <- name
names(MSFT) <- name
names(ORCL) <- name
names(GOOG) <- name
nrow(AAPL)
change_rate_A <- (Next(AAPL$Close, 1)[-length(AAPL$Close)] - AAPL$Close[-length(AAPL$Close)])/AAPL$Close[-length(AAPL$Close)]
big_change_A <- change_rate_A[which(change_rate_A > 0.02 | change_rate_A < -0.02)]
min(big_change_A)
summary(big_change_A)
chartSeries(AAPL)

"""
3)截取一段时间内这四家公司股价数据（注意分红派息除权对股价的影响），
用R中的相关性分析判断股价之间的相关性，或者用R基础课程第八周所讲的MIC指标对其进行分析
"""


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








