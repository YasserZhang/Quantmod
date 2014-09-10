# ���㲻ͬ�׶ε�������
periodReturn()
# ����ÿ��������
dailyReturn()
# ����ÿ�ܵ�������
weeklyReturn()
# ����ÿ�µ�������
monthlyReturn()
# ����ÿ�����ȵ�������
quarterlyReturn()
# ������������
annualReturn()
yearlyReturn()
# �������������������
allReturn()

# ����
getSymbols("AAPL", src = "yahoo", from = "2013-10-01", to = "2013-10-23")
periodReturn(AAPL, period = "daily")
dailyReturn(AAPL)
# ����ĳ��ʱ�ε�ÿ������������
periodReturn(AAPL,period="daily",subset="2013-10-01::2013-10-23",type="arithmetic")
# ����ĳ��ʱ�ε�ÿ�ն���������
periodReturn(AAPL,period="daily",subset="2013-10-01::2013-10-23",type="log")

# ����ͼ�ε���ͼ��������ͼ������ͼ����ͼ
chartTheme()
chartSeries()
# ������ͼ�����޸�
reChart()
barChart()
candleChart()
lineChart()

chartTheme() # ������ɫ
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

# ����
chartSeries(AAPL,name="AAPL CHART",subset="2013-10-01::2013-10-23")
# ��ͬ��ʽ������ͼ
chartSeries(AAPL,name="AAPL BARCHART",subset="2013-10-01::2013-10-23",type="bars")
chartSeries(AAPL,name="AAPL LINECHART",subset="2013-10-01::2013-10-23",type="line")
chartSeries(AAPL,name="AAPL LINECHART",subset="2013-10-01::2013-10-23",type="candlesticks")
# reChart�����ڲ������ٻ�һ���µ�ͼ��ǰ�����޸��Ѿ���������ͼ
chartSeries(AAPL,name="AAPL BARCHART", subset="2013-10-01::2013-10-23",type="candlesticks")
reChart(type="bars",subset="2013-10-05::2013-10-29", show.grid=TRUE)
# ����ͼ
barChart(AAPL,theme="black",subset="first 10 weeks",bar.type="ohlc")
barChart(AAPL,theme="black",subset="first 10 weeks",bar.type="hlc")
# ����ͼ
candleChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",multi.col=T)
# ����ͼ
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30")
# ���Σ���״�����ߵ�������ͼ
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",line.type="l")
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",line.type="p")
lineChart(AAPL,theme="white",subset="2013-10-05::2013-10-30",line.type="b")
# ��������ͼ����
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

# ����
chartSeries(AAPL,name="AAPL CANDLECHART",subset="2013-06::2013-10-23",type="candlesticks")
addADX()


"""
����Apple��Microsoft��Oracle��Google��˾2011-2012�꽻���������ݣ��ֱ𻭳�����ͼ�Լ�ADX��ͼ
1 �Զ�ADXָ����м���������ָ��ĳ��ʱ�������ADX�����ָ���ж�����������Ԥ��
2 ���ÿ�ֹ�Ʊ�����������ADXָ��ͬʱ����DI+��DI-��ʱ���
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
# ���϶��ڵڶ���Ľ�����󣬲�Ӧ����ADX(AAPL)����ȡADX�ļ���ֵ�����������ϲ���������Hi��Lo��Clһһ���С�
apple <- ADX(cbind(Hi(AAPL),Lo(AAPL),Cl(AAPL)),n=14,maType="EMA",wilder=TRUE)
apple[which(apple$ADX < apple$DIp & apple$ADX < apple$DIn),]