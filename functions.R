#frequently used functions!
# 计算不同阶段的收益率
periodReturn()
# 计算每日收益率
dailyReturn()
# 计算每周的收益率
weeklyReturn()
# 计算每月的收益率
monthlyReturn()
# 计算每个季度的收益率
quarterlyReturn()
# 计算年收益率
annualReturn()
yearlyReturn()
# 计算所有种类的收益率
allReturn()

# 举例
getSymbols("AAPL", src = "yahoo", from = "2013-10-01", to = "2013-10-23")
periodReturn(AAPL, period = "daily")
dailyReturn(AAPL)
# 计算某个时段的每日算术型收益
periodReturn(AAPL,period="daily",subset="2013-10-01::2013-10-23",type="arithmetic")
# 计算某个时段的每日对数型收益
periodReturn(AAPL,period="daily",subset="2013-10-01::2013-10-23",type="log")

# 基本图形的作图——条形图，蜡烛图，线图
chartTheme()
chartSeries()
# 在现有图形上修改
reChart()
barChart()
candleChart()
lineChart()

chartTheme() # 设置颜色
fg.col: foreground color
bg.col: background color
grid.col: grid color
border: border color
minor.tick: minor tickmark color
major.tick: major tickmark color
up.col: up bar/candle color
dn.col: down bar/candle color
up.up.col: up after up bar/candle color
up.dn.col: up after down bar/candle color
dn.dn.col:  down after down bar/candle color
dn.up.col:down after up bar/candle color
up.border: up bar/candle border color
dn.border: down bar/candle border color
up.up.border: up after up bar/candle border color
up.dn.border: up after down bar/candle border color
dn.dn.border: down after down bar/candle border color
dn.up.border: down after up bar/candle border color

# 举例
chartSeries(AAPL,name="AAPL CHART",subset="2013-10-01::2013-10-23")
# 不同形式的趋势图
chartSeries(AAPL,name="AAPL BARCHART",subset="2013-10-01::2013-10-23",type="bars")
chartSeries(AAPL,name="AAPL LINECHART",subset="2013-10-01::2013-10-23",type="line")
chartSeries(AAPL,name="AAPL LINECHART",subset="2013-10-01::2013-10-23",type="candlesticks")
# reChart可以在不重新再画一张新的图的前提下修改已经画出来的图
chartSeries(AAPL,name="AAPL BARCHART", subset="2013-10-01::2013-10-23",type="candlesticks")
reChart(type="bars",subset="2013-10-05::2013-10-29", show.grid=TRUE)
# 条形图
barChart(AAPL,theme="black",subset="first 10 weeks",bar.type="ohlc")
barChart(AAPL,theme="black",subset="first 10 weeks",bar.type="hlc")
# 蜡烛图
candleChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",multi.col=T)
# 线型图
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30")
# 线形，点状，或者点线趋势图
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",line.type="l")
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",line.type="p")
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",line.type="b")
# 技术分析图函数
addADX()
addATR()
addBBands()
addCCI()
addCMF()
addCMO()
addEMA()
addEnvelope()
addEVWMA()
addMACD()
addMomentum()
addExpiry()
addSAR()
addSMA()
addSMI()
addDEMA()
addDPO()
addROC()
addRSI()
addVo()
addWMA()
addWPR()
addZLEMA()

# 举例
chartSeries(AAPL,name="AAPL CANDLECHART",subset="2013-06::2013-10-23",type="candlesticks")
addADX()


"""
下载Apple，Microsoft，Oracle，Google公司2011-2012年交易行情数据，分别画出蜡烛图以及ADX子图
1 试对ADX指标进行技术分析，指出某段时间里根据ADX及相关指标研读出来的走势预测
2 求出每种股票在上述年份内ADX指标同时低于DI+和DI-的时间段
"""
getSymbols(c("AAPL","MSFT","ORCL","GOOGL"),src="yahoo", from = "2011-01-01", to = "2012-12-31")
chartSeries(AAPL, name = "AAPL", subset = "2011-01-01::2012-12-31")
addADX()
chartSeries(MSFT, name = "MSFT", subset = "2011-01-01::2012-12-31")
addADX()
chartSeries(ORCL, name = "ORCL", subset = "2011-01-01::2012-12-31")
addADX()
chartSeries(GOOGL, name = "GOOGL", subset = "2011-01-01::2012-12-31")
addADX()

apple <- ADX(AAPL)
index(apple[which(apple$ADX<apple$DIp & apple$ADX < apple$DIn),])
microsoft <- ADX(MSFT)
index(microsoft[which(microsoft$ADX<microsoft$DIp & microsoft$ADX < microsoft$DIn),])

oracl <- ADX(ORCL)
index(oracl[which(oracl$ADX<oracl$DIp & oracl$ADX < oracl$DIn),])

google <- ADX(GOOGL)
index(google[which(google$ADX<google$DIp & google$ADX < google$DIn),])
# 以上对于第二题的解答有误，不应该用ADX(AAPL)来获取ADX的计算值，而是用以上参数，即将Hi，Lo，Cl一一罗列。
apple <- ADX(cbind(Hi(AAPL),Lo(AAPL),Cl(AAPL)),n=14,maType="EMA",wilder=TRUE)
apple[which(apple$ADX < apple$DIp & apple$ADX < apple$DIn),]
