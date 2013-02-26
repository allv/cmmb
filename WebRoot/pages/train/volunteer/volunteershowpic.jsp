<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.axis.CategoryAxis"%>
<%@page import="org.jfree.chart.axis.NumberAxis"%>
<%@page import="org.jfree.chart.axis.ValueAxis"%>
<%@page import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>
<%@page import="org.jfree.chart.plot.CategoryPlot"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.chart.renderer.category.LineAndShapeRenderer"%>
<%@page import="org.jfree.chart.title.TextTitle"%>
<%@page import="org.jfree.data.category.CategoryDataset"%>
<%@page import="org.jfree.data.general.DatasetUtilities"%>
<%@page import="org.jfree.ui.RectangleInsets"%>
<%@page import="org.jfree.chart.labels.ItemLabelAnchor"%>
<%@page import="org.jfree.chart.labels.ItemLabelPosition"%>
<%@page import="org.jfree.ui.TextAnchor"%>
<%@page import="org.jfree.chart.ChartRenderingInfo"%>
<%@page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="java.awt.Color"%>
<%@page import="java.util.*"%>
<%@page import="java.awt.Font"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.wootion.cmmb.view.utils.MyChartUtility"%>


<%
  /***********基础数据*****************/
  //存入当年，每个月的数据
  int[] m1=(int[])request.getAttribute("data");
  String[] md={"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};
  //String[] mn=marks.get(2).split(",");
  double[][] data = new double[1][md.length];
  for(int i=0;i<1;i++){
     for(int j=0;j<data[i].length;j++){
          data[i][j]=m1[j];
     }
  }
  
  //给值
  String[] columnKeys=new String[md.length];
  for(int i=0;i<columnKeys.length;i++){
      //columnKeys[i]=md[i]+"\n("+mn[i]+")";
      columnKeys[i]=md[i];
  }
  
  String[] rowKeys = { "小时数"};
  String chartTitle = "志愿者服务时间曲线";
  String xName = "月份";
  String yName = "小时";
  int width = 50*md.length;
  int height = 330;
  /*******************************/

  CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data);

  JFreeChart chart = ChartFactory.createLineChart(chartTitle, // 图表标题
      xName, // 目录轴的显示标签
      yName, // 数值轴的显示标签
      dataset, // 数据集
      PlotOrientation.VERTICAL, // 图表方向：水平、垂直
      true, // 是否显示图例(对于简单的柱状图必须是false)
      false, // 是否生成工具
      false // 是否生成URL链接
      );

  chart.setTextAntiAlias(false);

  TextTitle title = new TextTitle(chartTitle);
  title.setFont(new Font("隶书", Font.BOLD, 25));
  chart.setTitle(title);// 设置图标题的字体重新设置title

  chart.getLegend().setItemFont(new Font("SansSerif", Font.BOLD, 12));// 图例显示格式

  chart.setBackgroundPaint(Color.WHITE);//设置背景颜色
  chart.setBorderVisible(true);//设置背景边框

  CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();//获取图表

  categoryplot.setDomainGridlinesVisible(true);// x轴网格是否可见

  categoryplot.setRangeGridlinesVisible(true); // y轴网格是否可见

  categoryplot.setRangeGridlinePaint(Color.WHITE);// 虚线色彩

  categoryplot.setDomainGridlinePaint(Color.WHITE);// 虚线色彩

  categoryplot.setBackgroundPaint(Color.lightGray);//设定图表数据显示部分背景色

  categoryplot.setAxisOffset(new RectangleInsets(5D, 5D, 5D, 5D)); // 设置轴和面板之间的距离 参数1：上距 参数2：左距 参数3：下距 参数4：右距

  CategoryAxis domainAxis = categoryplot.getDomainAxis();//横轴
  domainAxis.setLabelFont(new Font("SansSerif", Font.TRUETYPE_FONT, 11));// 轴标题
  domainAxis.setTickLabelFont(new Font("SansSerif", Font.TRUETYPE_FONT, 11));// 轴数值
  //domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45); // 横轴上的Lable 45度倾斜
  domainAxis.setLowerMargin(0.0);// 设置距离图片左端距离
  domainAxis.setUpperMargin(0.0);// 设置距离图片右端距离
  domainAxis.setMaximumCategoryLabelLines(4);  //设置最大显示行数

  ValueAxis rangeAxis = categoryplot.getRangeAxis(); //纵轴  
  rangeAxis.setLabelFont(new Font("SansSerif", Font.TRUETYPE_FONT, 11));// 轴标题
  rangeAxis.setTickLabelFont(new Font("SansSerif", Font.TRUETYPE_FONT, 11));// 轴数值
  rangeAxis.setRange(0, 13);//纵轴显示范围
  rangeAxis.setAutoTickUnitSelection(true);

  rangeAxis.setLowerMargin(5);// 设置距离图片下端距离
  rangeAxis.setUpperMargin(0.5);// 设置距离图片上端距离

  NumberAxis numberaxis = (NumberAxis) categoryplot.getRangeAxis();
  numberaxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
  numberaxis.setAutoRangeIncludesZero(true);
  numberaxis.setUpperMargin(1.15); // 设置最高的一个 Item 与图片顶端的距离
  numberaxis.setLowerMargin(0.15);// 设置最低的一个 Item 与图片底端的距离
  DecimalFormat df = new DecimalFormat("#0");
  numberaxis.setNumberFormatOverride(df); //设置纵轴精度

  categoryplot.setRangeAxis(numberaxis);

  LineAndShapeRenderer lineandshaperenderer = (LineAndShapeRenderer) categoryplot.getRenderer();// 获得renderer

  lineandshaperenderer.setBaseShapesVisible(true); // 点（即数据点）可见

  lineandshaperenderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
  lineandshaperenderer.setBaseItemLabelsVisible(true);// 显示折点数据
  lineandshaperenderer.setBaseItemLabelFont(new Font("SansSerif", Font.TRUETYPE_FONT, 12));// 折点数据字体
  lineandshaperenderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE10,
      TextAnchor.BASELINE_CENTER));//这点数据显示位置

  lineandshaperenderer.setBaseLinesVisible(true); // 点（即数据点）间有连线可见

  ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());

  String filename = MyChartUtility.saveMyChartAsPNG(chart, width, height, info, session);

  String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;
%>
<%@ include file="../import.jsp"%>
<HTML>

  <HEAD>
  <script type="text/javascript">
    var basePath = '<%=basePath%>';
    var filename= '<%=filename%>' ;
    window.onunload = function(){
       //每次离开删除掉服务器上的图片 防止图片太多撑爆服务器磁盘
       $.ajax({
		      type : "POST",
		      async:false,
		      url : basePath + "/memberdeleteFile.do?filename=" + filename+"&r="+Math.random(),
		      success : function(msg) {
						var result = msg;
					},
			  failure : function() {
				   alert("未知错误发生,请联系管理员解决！");
			  }
	   });
    }
    function download(filename){
        $.ajax({
					type : "POST",
					url : basePath + "/download.do?filename=" + filename,
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('下载成功');
							window.location.href = basePath + "/volunteerlist.do";
						} else {
							alert('下载失败');
						}
					},
					failure : function() {
						alert("未知错误发生,请联系管理员解决！");
					}
				});
    }
  </script>
  </HEAD>

 <BODY>
  <P ALIGN="CENTER">
   <img src="<%=graphURL%>" width=<%=width%> height=<%=height%> border=0
    usemap="#<%= filename %>">
  </P>
  <div style="text-align:center">
	  <!-- 下载文件链接内容为定义的下载Action -->  
        <!-- 下载文件名作为链接参数fileName值，用OGNL表达式表达 -->   
         <a href="download.do?filename=<%=filename %>"><span style="color:blue">[下载至本地]</span></a> 
        <a href="volunteerlist.do"><span style="color:blue">[返回]</span></a> 
  </div>
 </BODY>
</HTML>
