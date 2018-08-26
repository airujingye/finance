/**
 * 加载图表
 */
//保存所有图表数据
var echartDatas;
//获取其中一个图表父级
var parentEle;
//获取自定义属性上的值
var chartData;
//获取图表父级的id
var chartId;
//获取图表类型
var chartType;
var legend_data,title_text,xAxis_data,series;

//从后台获取图表数据
function getEchartDatas(tableName){
	$.ajax({
		//url:GM.rootPath+"/snaker/Chart!getChartNames.action",
		url:GM.rootPath+"/finance/Chart!getChart.action",
		type:"post",
		data:{"chartName":tableName},
		async:false,
		dataType:"json",
		success:function(data){
			echartDatas=data[tableName];
		}	
	});
}

//根据id名称加载图表数据
function loadEchartData(chartType,chartId,chartData){
	//判断图表类型加载数据
	switch(chartType){
		//饼状图
		case "cake":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				//保存数据
				var dataValue=[];
				//数据
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//数据循环
						dataValue.push({
							value:seriesdata[i]||"",
							name:echartDatas["legend"][i]||""
						});
					}
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
					            name: '访问来源',
					            type: 'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:dataValue,
					            itemStyle: {
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		//环形图
		case "ring":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				//保存数据
				var dataValue=[];
				//数据
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//数据循环
						dataValue.push({
							value:seriesdata[i]||"",
							name:echartDatas["legend"][i]||""
						});
					}
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
								name:'访问来源',
					            type:'pie',
					            radius: ['40%', '55%'],
					            data:dataValue
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		//折线图
		case "line":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//图表数据
				chartData.series=echartDatas["data"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//y轴数据
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
					            name:echartDatas["legend"][i]||"",
					            type:'line',
					            stack: '总量',
					            data:seriesdata
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
			//折线图
		case "area":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//图表数据
				chartData.series=echartDatas["data"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//y轴数据
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
					            name:echartDatas["legend"][i]||"",
					            type:'line',
					            stack: '总量',
					            areaStyle: {normal: {}},
					            data:seriesdata
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		case "columns":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//y轴数据
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
					            name:echartDatas["legend"][i]||"",
					            type:'line',
					            data:seriesdata
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		case "points":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//y轴数据
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
		        	            name:echartDatas["legend"][i]||"",
		        	            type:'scatter',
		        	            large: true,
		        	            symbolSize: 3,
		        	            data: (function () {
		        	                var d = [];
		        	                var len = 10000;
		        	                var x = 0;
		        	                while (len--) {
		        	                    x = (Math.random() * 10).toFixed(3) - 0;
		        	                    d.push([
		        	                        x,
		        	                        (Math.sin(x) - x * (len % 2 ? 0.1 : -0.1) * Math.random()).toFixed(3) - 0
		        	                    ]);
		        	                }
		        	                return d;
		        	            })()
			        	        
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		case "bubbles":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表数据
				chartData.series=echartDatas["data"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//y轴数据
				chartData.yAxis.data=echartDatas["yAxisdata"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
								name: echartDatas["legend"][i]||"",
		                      	type: 'scatter',
			                    itemStyle: {
			  		              normal: {
					                  opacity: 0.8,
					                  shadowBlur: 10,
					                  shadowOffsetX: 0,
					                  shadowOffsetY: 0,
					                  shadowColor: 'rgba(0, 0, 0, 0.5)'
					              }
					          },
			                    data: seriesdata
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		case "lables":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//y轴数据
				chartData.yAxis.data=echartDatas["yAxisdata"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
			                    name: echartDatas["legend"][i]||"",
			                    type: 'parallel',
			                    lineStyle: {
			  		              normal: {
					                  width: 1,
					                  opacity: 0.5
					              }
					          },
			                    data: seriesdata
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		case "datas":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//y轴数据
				chartData.yAxis.data=echartDatas["yAxisdata"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				//保存数据
				var dataValue=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//数据循环
						dataValue.push({
							name:echartDatas["legend"][i]||"",
							x: 300,
			                y: 300
						});
					}
				for(var i=0;i<echartDatas["seriesdata"].length;i++){
					//获取其中的一条数据
					var seriesdata=echartDatas["seriesdata"][i];
					//把字符串格式的数据转换成数组格式数据
					seriesdata=seriesdata.split(",");
					//设置折线模板数据
					var echartTemplate= {
							type: 'graph',
				            layout: 'none',
				            symbolSize: 50,
				            roam: true,
				            label: {
				                normal: {
				                    show: true
				                }
				            },
				            edgeSymbol: ['circle', 'arrow'],
				            edgeSymbolSize: [4, 10],
				            edgeLabel: {
				                normal: {
				                    textStyle: {
				                        fontSize: 20
				                    }
				                }
				            },
				            data: dataValue||[{
				                name: '节点1',
				                x: 300,
				                y: 300
				            }, {
				                name: '节点2',
				                x: 800,
				                y: 300
				            }, {
				                name: '节点3',
				                x: 550,
				                y: 100
				            }, {
				                name: '节点4',
				                x: 550,
				                y: 500
				            }],
				            // links: [],
				            links: [{
				                source: 0,
				                target: 1,
				                symbolSize: [5, 20],
				                label: {
				                    normal: {
				                        show: true
				                    }
				                },
				                lineStyle: {
				                    normal: {
				                        width: 5,
				                        curveness: 0.2
				                    }
				                }
				            }, {
				                source: '节点2',
				                target: '节点1',
				                label: {
				                    normal: {
				                        show: true
				                    }
				                },
				                lineStyle: {
				                    normal: { curveness: 0.2 }
				                }
				            }, {
				                source: '节点1',
				                target: '节点3'
				            }, {
				                source: '节点2',
				                target: '节点3'
				            }, {
				                source: '节点2',
				                target: '节点4'
				            }, {
				                source: '节点1',
				                target: '节点4'
				            }],
				            lineStyle: {
				                normal: {
				                    opacity: 0.9,
				                    width: 2,
				                    curveness: 0
				                }
				            }
				        };
					//把字符串格式的数据转换成数组格式数据
					chartData.series.push(echartTemplate);
				}
				}
			}
			break;
		case "radar":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表标题
				chartData.title.text=echartDatas["title"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
				for(var i=0;i<echartDatas["seriesdata"].length;i++){
					//获取其中的一条数据
					var seriesdata=echartDatas["seriesdata"][i];
					//把字符串格式的数据转换成数组格式数据
					seriesdata=seriesdata.split(",");
					//设置折线模板数据
					var echartTemplate= {
							name: echartDatas["legend"][i]||"",
				            type: 'radar',
				            lineStyle: {
				    		    normal: {
				    		        width: 1,
				    		        opacity: 0.5
				    		    }
				    		},
				            data: seriesdata,
				            symbol: 'none',
				            itemStyle: {
				                normal: {
				                    color: '#F9713C'
				                }
				            },
				            areaStyle: {
				                normal: {
				                    opacity: 0.1
				                }
				            }
				        };
					//把字符串格式的数据转换成数组格式数据
					chartData.series.push(echartTemplate);
				}
				}
			}
			break;
		case "step":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
					for(var i=0;i<echartDatas["seriesdata"].length;i++){
						//获取其中的一条数据
						var seriesdata=echartDatas["seriesdata"][i];
						//把字符串格式的数据转换成数组格式数据
						seriesdata=seriesdata.split(",");
						//设置折线模板数据
						var echartTemplate= {
								 name:echartDatas["legend"][i]||"",
						         type:'bar',
						         data:seriesdata
					        };
						//把字符串格式的数据转换成数组格式数据
						chartData.series.push(echartTemplate);
					}
				}
			}
			break;
		case "press":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				//保存数据
				var dataValue=[];
				//数据
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
				for(var i=0;i<echartDatas["seriesdata"].length;i++){
					//获取其中的一条数据
					var seriesdata=echartDatas["seriesdata"][i];
					//把字符串格式的数据转换成数组格式数据
					seriesdata=seriesdata.split(",");
					//数据循环
					dataValue.push({
						value:seriesdata[i]||"",
						name:echartDatas["legend"][i]||""
					});
				}
				for(var i=0;i<echartDatas["seriesdata"].length;i++){
					//获取其中的一条数据
					var seriesdata=echartDatas["seriesdata"][i];
					//把字符串格式的数据转换成数组格式数据
					seriesdata=seriesdata.split(",");
					//设置折线模板数据
					var echartTemplate= {
							name: '预期',
				            type: 'funnel',
				            left: '10%',
				            width: '80%',
				            label: {
				                normal: {
				                    formatter: '{b}预期'
				                },
				                emphasis: {
				                    position:'inside',
				                    formatter: '{b}预期: {c}%'
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false
				                }
				            },
				            itemStyle: {
				                normal: {
				                    opacity: 0.7
				                }
				            },
				            data: dataValue||[
				                {value: 60, name: '访问'},
				                {value: 40, name: '咨询'},
				                {value: 20, name: '订单'},
				                {value: 80, name: '点击'},
				                {value: 100, name: '展现'}
				            ]
				        };
					//把字符串格式的数据转换成数组格式数据
					chartData.series.push(echartTemplate);
				}
				}
			}
			break;
		case "map":
			//循环单独一条图表数据对象
			for(var key in echartDatas){
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//图表图例
				chartData.legend.data=echartDatas["legend"];
				//x轴数据
				chartData.xAxis.data=echartDatas["xAxisdata"];
				//限定图表y轴接受的数据类型
				chartData.series=[];
				//保存数据
				var dataValue=[];
				//数据
				if(echartDatas["seriesdata"]&&echartDatas["seriesdata"].length>0){
				for(var i=0;i<echartDatas["seriesdata"].length;i++){
					//获取其中的一条数据
					var seriesdata=echartDatas["seriesdata"][i];
					//把字符串格式的数据转换成数组格式数据
					seriesdata=seriesdata.split(",");
					//数据循环
					dataValue.push({
						value:seriesdata[i]||"",
						name:Math.round(Math.random()*1000)
					});
				}
				for(var i=0;i<echartDatas["seriesdata"].length;i++){
					//获取其中的一条数据
					var seriesdata=echartDatas["seriesdata"][i];
					//把字符串格式的数据转换成数组格式数据
					seriesdata=seriesdata.split(",");
					//设置折线模板数据
					var echartTemplate= {
							name: echartDatas["legend"][i]||"",
				            type: 'map',
				            mapType: 'china',
				            roam: false,
				            label: {
				                normal: {
				                    show: true
				                },
				                emphasis: {
				                    show: true
				                }
				            },
				            data:dataValue||[
				                {name: '北京',value: randomData() },
				                {name: '天津',value: randomData() },
				                {name: '上海',value: randomData() },
				                {name: '重庆',value: randomData() },
				                {name: '河北',value: randomData() },
				                {name: '河南',value: randomData() },
				                {name: '云南',value: randomData() },
				                {name: '辽宁',value: randomData() },
				                {name: '黑龙江',value: randomData() },
				                {name: '湖南',value: randomData() },
				                {name: '安徽',value: randomData() },
				                {name: '山东',value: randomData() },
				                {name: '新疆',value: randomData() },
				                {name: '江苏',value: randomData() },
				                {name: '浙江',value: randomData() },
				                {name: '江西',value: randomData() },
				                {name: '湖北',value: randomData() },
				                {name: '广西',value: randomData() },
				                {name: '甘肃',value: randomData() },
				                {name: '山西',value: randomData() },
				                {name: '内蒙古',value: randomData() },
				                {name: '陕西',value: randomData() },
				                {name: '吉林',value: randomData() },
				                {name: '福建',value: randomData() },
				                {name: '贵州',value: randomData() },
				                {name: '广东',value: randomData() },
				                {name: '青海',value: randomData() },
				                {name: '西藏',value: randomData() },
				                {name: '四川',value: randomData() },
				                {name: '宁夏',value: randomData() },
				                {name: '海南',value: randomData() },
				                {name: '台湾',value: randomData() },
				                {name: '香港',value: randomData() },
				                {name: '澳门',value: randomData() }
				            ]
				        };
					//把字符串格式的数据转换成数组格式数据
					chartData.series.push(echartTemplate);
				}
				}
			}
			break;
		default: break;  
	}
	return chartData;
}

//图表实例化
function initcharts(obj){
	if(obj=="gmb_cake_charts"){//饼状图
		//通过类名获取饼状图
		var ele=document.getElementsByClassName("gmb_cake_charts");
		//循环饼状图
		for(var i=0;i<ele.length;i++){
			//初始化其中一个饼状图
			var cake_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据（id）
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				legend_data=chartData.legend.data;
				title_text=chartData.title.text;
				series=chartData.series;
			}
				var option = {
					    title : {
					        text: title_text||'某站点用户访问来源',
					        x: 'center'
					    },
					    tooltip : {
					        trigger:'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    legend: {
					        orient: 'vertical',
					        left: 'left',
					        data: legend_data||['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
					    },
					    series : series||[
					        {
					            name: '访问来源',
					            type: 'pie',
					            radius : '55%',
					            center: ['50%', '60%'],
					            data:[
					                {value:335, name:'直接访问'},
					                {value:310, name:'邮件营销'},
					                {value:234, name:'联盟广告'},
					                {value:135, name:'视频广告'},
					                {value:1548, name:'搜索引擎'}
					            ],
					            itemStyle: {
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					};
			cake_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_line_charts"){//柱状图
		var ele=document.getElementsByClassName("gmb_line_charts");
		for(var i=0;i<ele.length;i++){
			var line_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
        //var line_charts = echarts.init(document.getElementsByClassName("gmb_line_charts"));
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				title_text=chartData.title.text;
				legend_data=chartData.legend.data;
				series=chartData.series;
				xAxis_data=chartData.xAxis.data;
			}
		        var option = {
		        	    title: {
		        	        text: title_text||'统计'
		        	    },
		        	    tooltip: {
		        	        trigger: 'axis'
		        	    },
		        	    legend: {
		        	        data:legend_data||['GDP','PPI','工业增长速度','固定资产投资','粮食产量']
		        	    },
		        	    grid: {
		        	        left: '3%',
		        	        right: '4%',
		        	        bottom: '3%',
		        	        containLabel: true
		        	    },
		        	    toolbox: {
		        	        feature: {
		        	            saveAsImage: {}
		        	        }
		        	    },
		        	    xAxis: {
		        	        type: 'category',
		        	        boundaryGap: false,
		        	        data: xAxis_data||['周一','周二','周三','周四','周五','周六','周日']
		        	    },
		        	    yAxis: {
		        	        type: 'value'
		        	    },
		        	    series:series|| [
		        	        {
		        	            name:'GDP',
		        	            type:'line',
		        	            stack: '总量',
		        	            data:[120, 132, 101, 134, 90, 230, 210]
		        	        },
		        	        {
		        	            name:'PPI',
		        	            type:'line',
		        	            stack: '总量',
		        	            data:[220, 182, 191, 234, 290, 330, 310]
		        	        },
		        	        {
		        	            name:'工业增长速度',
		        	            type:'line',
		        	            stack: '总量',
		        	            data:[150, 232, 201, 154, 190, 330, 410]
		        	        },
		        	        {
		        	            name:'固定资产投资',
		        	            type:'line',
		        	            stack: '总量',
		        	            data:[320, 332, 301, 334, 390, 330, 320]
		        	        },
		        	        {
		        	            name:'粮食产量',
		        	            type:'line',
		        	            stack: '总量',
		        	            data:[820, 932, 901, 934, 1290, 1330, 1320]
		        	        }
		        	    ]
		        	};
		        line_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_area_charts"){//面积图
		var ele=document.getElementsByClassName("gmb_area_charts");
		for(var i=0;i<ele.length;i++){
			var area_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
        //var area_charts = echarts.init(document.getElementsByClassName("gmb_area_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				title_text=chartData.title.text;
				legend_data=chartData.legend.data;
				series=chartData.series;
				xAxis_data=chartData.xAxis.data;
			}
		        var option = {
		        	    title: {
		        	        text: title_text||'本周统计分析'
		        	    },
		        	    tooltip : {
		        	        trigger: 'axis'
		        	    },
		        	    legend: {
		        	        data:legend_data||['申请量','初审量','复审量','受理量','办理完结量']
		        	    },
		        	    toolbox: {
		        	        feature: {
		        	            saveAsImage: {}
		        	        }
		        	    },
		        	    grid: {
		        	        left: '3%',
		        	        right: '4%',
		        	        bottom: '3%',
		        	        containLabel: true
		        	    },
		        	    xAxis : [
		        	        {
		        	            type : 'category',
		        	            boundaryGap : false,
		        	            data : xAxis_data||['周一','周二','周三','周四','周五','周六','周日']
		        	        }
		        	    ],
		        	    yAxis : [
		        	        {
		        	            type : 'value'
		        	        }
		        	    ],
		        	    series :series||[
		        	        {
		        	            name:'申请量',
		        	            type:'line',
		        	            stack: '总量',
		        	            areaStyle: {normal: {}},
		        	            data:[120, 132, 101, 134, 90, 230, 210]
		        	        },
		        	        {
		        	            name:'初审量',
		        	            type:'line',
		        	            stack: '总量',
		        	            areaStyle: {normal: {}},
		        	            data:[220, 182, 191, 234, 290, 330, 310]
		        	        },
		        	        {
		        	            name:'复审量',
		        	            type:'line',
		        	            stack: '总量',
		        	            areaStyle: {normal: {}},
		        	            data:[150, 232, 201, 154, 190, 330, 410]
		        	        },
		        	        {
		        	            name:'受理量',
		        	            type:'line',
		        	            stack: '总量',
		        	            areaStyle: {normal: {}},
		        	            data:[320, 332, 301, 334, 390, 330, 320]
		        	        },
		        	        {
		        	            name:'办理完结量',
		        	            type:'line',
		        	            stack: '总量',
		        	            label: {
		        	                normal: {
		        	                    show: true,
		        	                    position: 'top'
		        	                }
		        	            },
		        	            areaStyle: {normal: {}},
		        	            data:[820, 932, 901, 934, 1290, 1330, 1320]
		        	        }
		        	    ]
		        	};
        	area_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_columns_charts"){//柱状图
		var ele=document.getElementsByClassName("gmb_columns_charts");
		for(var i=0;i<ele.length;i++){
			var columns_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
        //var columns_charts = echarts.init(document.getElementsByClassName("gmb_columns_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
		        columns_charts.showLoading();
		        $.ajax({
		        	  url: "finance/Chart!gmbColumnsCharts.action",
		        	  dataType: "json",
		        	  success: function (data) {
				        	columns_charts.hideLoading();
				        	console.log(data.data);
				            columns_charts.setOption({// 指定图表的配置项和数据
					            title: {
					                text: title_text||'金额统计分析'
					            },
					            tooltip: {},
					            legend: {
					                data:['金额']
					            },
					            xAxis: {
					            	data: data.categories,
					            },
					            yAxis: {},
					            series: series||[{
					                name: '金额',
					                type: 'bar',
					                data: data.data,
					            }]
					        });// 使用刚指定的配置项和数据显示图表。
				        },
		        	 
		        });
		}
	}else if(obj=="gmb_points_charts"){//散点图
		var ele=document.getElementsByClassName("gmb_points_charts");
		for(var i=0;i<ele.length;i++){
			var points_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
        //var points_charts = echarts.init(document.getElementsByClassName("gmb_points_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
		        var option = {
		        	    title: {
		        	        text: title_text||'大规模散点图'
		        	    },
		        	    tooltip : {
		        	        trigger: 'axis',
		        	        showDelay : 0,
		        	        axisPointer:{
		        	            show: true,
		        	            type : 'cross',
		        	            lineStyle: {
		        	                type : 'dashed',
		        	                width : 1
		        	            }
		        	        },
		        	        zlevel: 1
		        	    },
		        	    legend: {
		        	        data:legend_data||['sin','cos']
		        	    },
		        	    toolbox: {
		        	        show : true,
		        	        feature : {
		        	            mark : {show: true},
		        	            dataZoom : {show: true},
		        	            dataView : {show: true, readOnly: false},
		        	            restore : {show: true},
		        	            saveAsImage : {show: true}
		        	        }
		        	    },
		        	    xAxis : [
		        	        {
		        	            type : 'value',
		        	            scale:true
		        	        }
		        	    ],
		        	    yAxis : [
		        	        {
		        	            type : 'value',
		        	            scale:true
		        	        }
		        	    ],
		        	    series : series||[
		        	        {
		        	            name:'sin',
		        	            type:'scatter',
		        	            large: true,
		        	            symbolSize: 3,
		        	            data: (function () {
		        	                var d = [];
		        	                var len = 10000;
		        	                var x = 0;
		        	                while (len--) {
		        	                    x = (Math.random() * 10).toFixed(3) - 0;
		        	                    d.push([
		        	                        x,
		        	                        (Math.sin(x) - x * (len % 2 ? 0.1 : -0.1) * Math.random()).toFixed(3) - 0
		        	                    ]);
		        	                }
		        	                return d;
		        	            })()
		        	        },
		        	        {
		        	            name:'cos',
		        	            type:'scatter',
		        	            large: true,
		        	            symbolSize: 2,
		        	            data: (function () {
		        	                var d = [];
		        	                var len = 20000;
		        	                var x = 0;
		        	                while (len--) {
		        	                    x = (Math.random() * 10).toFixed(3) - 0;
		        	                    d.push([
		        	                        x,
		        	                        (Math.cos(x) - x * (len % 2 ? 0.1 : -0.1) * Math.random()).toFixed(3) - 0
		        	                    ]);
		        	                }
		        	                return d;
		        	            })()
		        	        }
		        	    ]
		        	};
        	points_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_bubbles_charts"){//气泡图
		var ele=document.getElementsByClassName("gmb_bubbles_charts");
		for(var i=0;i<ele.length;i++){
			var bubbles_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var bubbles_charts = echarts.init(document.getElementsByClassName("gmb_bubbles_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
		var dataBJ = [
		              [1,55,9,56,0.46,18,6,"良"],
		              [2,25,11,21,0.65,34,9,"优"],
		              [3,56,7,63,0.3,14,5,"良"],
		              [4,33,7,29,0.33,16,6,"优"],
		              [5,42,24,44,0.76,40,16,"优"],
		              [6,82,58,90,1.77,68,33,"良"],
		              [7,74,49,77,1.46,48,27,"良"],
		              [8,78,55,80,1.29,59,29,"良"],
		              [9,267,216,280,4.8,108,64,"重度污染"],
		              [10,185,127,216,2.52,61,27,"中度污染"],
		              [11,39,19,38,0.57,31,15,"优"],
		              [12,41,11,40,0.43,21,7,"优"],
		              [13,64,38,74,1.04,46,22,"良"],
		              [14,108,79,120,1.7,75,41,"轻度污染"],
		              [15,108,63,116,1.48,44,26,"轻度污染"],
		              [16,33,6,29,0.34,13,5,"优"],
		              [17,94,66,110,1.54,62,31,"良"],
		              [18,186,142,192,3.88,93,79,"中度污染"],
		              [19,57,31,54,0.96,32,14,"良"],
		              [20,22,8,17,0.48,23,10,"优"],
		              [21,39,15,36,0.61,29,13,"优"],
		              [22,94,69,114,2.08,73,39,"良"],
		              [23,99,73,110,2.43,76,48,"良"],
		              [24,31,12,30,0.5,32,16,"优"],
		              [25,42,27,43,1,53,22,"优"],
		              [26,154,117,157,3.05,92,58,"中度污染"],
		              [27,234,185,230,4.09,123,69,"重度污染"],
		              [28,160,120,186,2.77,91,50,"中度污染"],
		              [29,134,96,165,2.76,83,41,"轻度污染"],
		              [30,52,24,60,1.03,50,21,"良"],
		              [31,46,5,49,0.28,10,6,"优"]
		          ];

		          var dataGZ = [
		              [1,26,37,27,1.163,27,13,"优"],
		              [2,85,62,71,1.195,60,8,"良"],
		              [3,78,38,74,1.363,37,7,"良"],
		              [4,21,21,36,0.634,40,9,"优"],
		              [5,41,42,46,0.915,81,13,"优"],
		              [6,56,52,69,1.067,92,16,"良"],
		              [7,64,30,28,0.924,51,2,"良"],
		              [8,55,48,74,1.236,75,26,"良"],
		              [9,76,85,113,1.237,114,27,"良"],
		              [10,91,81,104,1.041,56,40,"良"],
		              [11,84,39,60,0.964,25,11,"良"],
		              [12,64,51,101,0.862,58,23,"良"],
		              [13,70,69,120,1.198,65,36,"良"],
		              [14,77,105,178,2.549,64,16,"良"],
		              [15,109,68,87,0.996,74,29,"轻度污染"],
		              [16,73,68,97,0.905,51,34,"良"],
		              [17,54,27,47,0.592,53,12,"良"],
		              [18,51,61,97,0.811,65,19,"良"],
		              [19,91,71,121,1.374,43,18,"良"],
		              [20,73,102,182,2.787,44,19,"良"],
		              [21,73,50,76,0.717,31,20,"良"],
		              [22,84,94,140,2.238,68,18,"良"],
		              [23,93,77,104,1.165,53,7,"良"],
		              [24,99,130,227,3.97,55,15,"良"],
		              [25,146,84,139,1.094,40,17,"轻度污染"],
		              [26,113,108,137,1.481,48,15,"轻度污染"],
		              [27,81,48,62,1.619,26,3,"良"],
		              [28,56,48,68,1.336,37,9,"良"],
		              [29,82,92,174,3.29,0,13,"良"],
		              [30,106,116,188,3.628,101,16,"轻度污染"],
		              [31,118,50,0,1.383,76,11,"轻度污染"]
		          ];

		          var dataSH = [
		              [1,91,45,125,0.82,34,23,"良"],
		              [2,65,27,78,0.86,45,29,"良"],
		              [3,83,60,84,1.09,73,27,"良"],
		              [4,109,81,121,1.28,68,51,"轻度污染"],
		              [5,106,77,114,1.07,55,51,"轻度污染"],
		              [6,109,81,121,1.28,68,51,"轻度污染"],
		              [7,106,77,114,1.07,55,51,"轻度污染"],
		              [8,89,65,78,0.86,51,26,"良"],
		              [9,53,33,47,0.64,50,17,"良"],
		              [10,80,55,80,1.01,75,24,"良"],
		              [11,117,81,124,1.03,45,24,"轻度污染"],
		              [12,99,71,142,1.1,62,42,"良"],
		              [13,95,69,130,1.28,74,50,"良"],
		              [14,116,87,131,1.47,84,40,"轻度污染"],
		              [15,108,80,121,1.3,85,37,"轻度污染"],
		              [16,134,83,167,1.16,57,43,"轻度污染"],
		              [17,79,43,107,1.05,59,37,"良"],
		              [18,71,46,89,0.86,64,25,"良"],
		              [19,97,71,113,1.17,88,31,"良"],
		              [20,84,57,91,0.85,55,31,"良"],
		              [21,87,63,101,0.9,56,41,"良"],
		              [22,104,77,119,1.09,73,48,"轻度污染"],
		              [23,87,62,100,1,72,28,"良"],
		              [24,168,128,172,1.49,97,56,"中度污染"],
		              [25,65,45,51,0.74,39,17,"良"],
		              [26,39,24,38,0.61,47,17,"优"],
		              [27,39,24,39,0.59,50,19,"优"],
		              [28,93,68,96,1.05,79,29,"良"],
		              [29,188,143,197,1.66,99,51,"中度污染"],
		              [30,174,131,174,1.55,108,50,"中度污染"],
		              [31,187,143,201,1.39,89,53,"中度污染"]
		          ];

		          var schema = [
		              {name: 'date', index: 0, text: '日'},
		              {name: 'AQIindex', index: 1, text: 'AQI指数'},
		              {name: 'PM25', index: 2, text: 'PM2.5'},
		              {name: 'PM10', index: 3, text: 'PM10'},
		              {name: 'CO', index: 4, text: '一氧化碳（CO）'},
		              {name: 'NO2', index: 5, text: '二氧化氮（NO2）'},
		              {name: 'SO2', index: 6, text: '二氧化硫（SO2）'}
		          ];


		          var itemStyle = {
		              normal: {
		                  opacity: 0.8,
		                  shadowBlur: 10,
		                  shadowOffsetX: 0,
		                  shadowOffsetY: 0,
		                  shadowColor: 'rgba(0, 0, 0, 0.5)'
		              }
		          };

		          var option = {
		              backgroundColor: '#404a59',
		              color: [
		                  '#dd4444', '#fec42c', '#80F1BE'
		              ],
		              legend: {
		                  y: 'top',
		                  data: legend_data||['北京', '上海', '广州'],
		                  textStyle: {
		                      color: '#fff',
		                      fontSize: 16
		                  }
		              },
		              grid: {
		                  x: '10%',
		                  x2: 150,
		                  y: '18%',
		                  y2: '10%'
		              },
		              tooltip: {
		                  padding: 10,
		                  backgroundColor: '#222',
		                  borderColor: '#777',
		                  borderWidth: 1,
		                  formatter: function (obj) {
		                      var value = obj.value;
		                      return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
		                          + obj.seriesName + ' ' + value[0] + '日：'
		                          + value[7]
		                          + '</div>'
		                          + schema[1].text + '：' + value[1] + '<br>'
		                          + schema[2].text + '：' + value[2] + '<br>'
		                          + schema[3].text + '：' + value[3] + '<br>'
		                          + schema[4].text + '：' + value[4] + '<br>'
		                          + schema[5].text + '：' + value[5] + '<br>'
		                          + schema[6].text + '：' + value[6] + '<br>';
		                  }
		              },
		              xAxis: {
		                  type: 'value',
		                  name: xAxis_data||'日期',
		                  nameGap: 16,
		                  nameTextStyle: {
		                      color: '#fff',
		                      fontSize: 14
		                  },
		                  max: 31,
		                  splitLine: {
		                      show: false
		                  },
		                  axisLine: {
		                      lineStyle: {
		                          color: '#eee'
		                      }
		                  }
		              },
		              yAxis: {
		                  type: 'value',
		                  name: 'AQI指数',
		                  nameLocation: 'end',
		                  nameGap: 20,
		                  nameTextStyle: {
		                      color: '#fff',
		                      fontSize: 16
		                  },
		                  axisLine: {
		                      lineStyle: {
		                          color: '#eee'
		                      }
		                  },
		                  splitLine: {
		                      show: false
		                  }
		              },
		              visualMap: [
		                  {
		                      left: 'right',
		                      top: '10%',
		                      dimension: 2,
		                      min: 0,
		                      max: 250,
		                      itemWidth: 30,
		                      itemHeight: 120,
		                      calculable: true,
		                      precision: 0.1,
		                      text: ['圆形大小：PM2.5'],
		                      textGap: 30,
		                      textStyle: {
		                          color: '#fff'
		                      },
		                      inRange: {
		                          symbolSize: [10, 70]
		                      },
		                      outOfRange: {
		                          symbolSize: [10, 70],
		                          color: ['rgba(255,255,255,.2)']
		                      },
		                      controller: {
		                          inRange: {
		                              color: ['#c23531']
		                          },
		                          outOfRange: {
		                              color: ['#444']
		                          }
		                      }
		                  },
		                  {
		                      left: 'right',
		                      bottom: '5%',
		                      dimension: 6,
		                      min: 0,
		                      max: 50,
		                      itemHeight: 120,
		                      calculable: true,
		                      precision: 0.1,
		                      text: ['明暗：二氧化硫'],
		                      textGap: 30,
		                      textStyle: {
		                          color: '#fff'
		                      },
		                      inRange: {
		                          colorLightness: [1, 0.5]
		                      },
		                      outOfRange: {
		                          color: ['rgba(255,255,255,.2)']
		                      },
		                      controller: {
		                          inRange: {
		                              color: ['#c23531']
		                          },
		                          outOfRange: {
		                              color: ['#444']
		                          }
		                      }
		                  }
		              ],
		              series: series||[
		                  {
		                      name: '北京',
		                      type: 'scatter',
		                      itemStyle: itemStyle,
		                      data: dataBJ
		                  },
		                  {
		                      name: '上海',
		                      type: 'scatter',
		                      itemStyle: itemStyle,
		                      data: dataSH
		                  },
		                  {
		                      name: '广州',
		                      type: 'scatter',
		                      itemStyle: itemStyle,
		                      data: dataGZ
		                  }
		              ]
		          };
		     bubbles_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_lables_charts"){//标签云
		var ele=document.getElementsByClassName("gmb_lables_charts");
		for(var i=0;i<ele.length;i++){
			var lables_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var lables_charts = echarts.init(document.getElementsByClassName("gmb_lables_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据（id）
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
			var dataBJ = [
		              [1,55,9,56,0.46,18,6,"良"],
		              [2,25,11,21,0.65,34,9,"优"],
		              [3,56,7,63,0.3,14,5,"良"],
		              [4,33,7,29,0.33,16,6,"优"],
		              [5,42,24,44,0.76,40,16,"优"],
		              [6,82,58,90,1.77,68,33,"良"],
		              [7,74,49,77,1.46,48,27,"良"],
		              [8,78,55,80,1.29,59,29,"良"],
		              [9,267,216,280,4.8,108,64,"重度污染"],
		              [10,185,127,216,2.52,61,27,"中度污染"],
		              [11,39,19,38,0.57,31,15,"优"],
		              [12,41,11,40,0.43,21,7,"优"],
		              [13,64,38,74,1.04,46,22,"良"],
		              [14,108,79,120,1.7,75,41,"轻度污染"],
		              [15,108,63,116,1.48,44,26,"轻度污染"],
		              [16,33,6,29,0.34,13,5,"优"],
		              [17,94,66,110,1.54,62,31,"良"],
		              [18,186,142,192,3.88,93,79,"中度污染"],
		              [19,57,31,54,0.96,32,14,"良"],
		              [20,22,8,17,0.48,23,10,"优"],
		              [21,39,15,36,0.61,29,13,"优"],
		              [22,94,69,114,2.08,73,39,"良"],
		              [23,99,73,110,2.43,76,48,"良"],
		              [24,31,12,30,0.5,32,16,"优"],
		              [25,42,27,43,1,53,22,"优"],
		              [26,154,117,157,3.05,92,58,"中度污染"],
		              [27,234,185,230,4.09,123,69,"重度污染"],
		              [28,160,120,186,2.77,91,50,"中度污染"],
		              [29,134,96,165,2.76,83,41,"轻度污染"],
		              [30,52,24,60,1.03,50,21,"良"],
		              [31,46,5,49,0.28,10,6,"优"]
		          ];

		          var dataGZ = [
		              [1,26,37,27,1.163,27,13,"优"],
		              [2,85,62,71,1.195,60,8,"良"],
		              [3,78,38,74,1.363,37,7,"良"],
		              [4,21,21,36,0.634,40,9,"优"],
		              [5,41,42,46,0.915,81,13,"优"],
		              [6,56,52,69,1.067,92,16,"良"],
		              [7,64,30,28,0.924,51,2,"良"],
		              [8,55,48,74,1.236,75,26,"良"],
		              [9,76,85,113,1.237,114,27,"良"],
		              [10,91,81,104,1.041,56,40,"良"],
		              [11,84,39,60,0.964,25,11,"良"],
		              [12,64,51,101,0.862,58,23,"良"],
		              [13,70,69,120,1.198,65,36,"良"],
		              [14,77,105,178,2.549,64,16,"良"],
		              [15,109,68,87,0.996,74,29,"轻度污染"],
		              [16,73,68,97,0.905,51,34,"良"],
		              [17,54,27,47,0.592,53,12,"良"],
		              [18,51,61,97,0.811,65,19,"良"],
		              [19,91,71,121,1.374,43,18,"良"],
		              [20,73,102,182,2.787,44,19,"良"],
		              [21,73,50,76,0.717,31,20,"良"],
		              [22,84,94,140,2.238,68,18,"良"],
		              [23,93,77,104,1.165,53,7,"良"],
		              [24,99,130,227,3.97,55,15,"良"],
		              [25,146,84,139,1.094,40,17,"轻度污染"],
		              [26,113,108,137,1.481,48,15,"轻度污染"],
		              [27,81,48,62,1.619,26,3,"良"],
		              [28,56,48,68,1.336,37,9,"良"],
		              [29,82,92,174,3.29,0,13,"良"],
		              [30,106,116,188,3.628,101,16,"轻度污染"],
		              [31,118,50,0,1.383,76,11,"轻度污染"]
		          ];

		          var dataSH = [
		              [1,91,45,125,0.82,34,23,"良"],
		              [2,65,27,78,0.86,45,29,"良"],
		              [3,83,60,84,1.09,73,27,"良"],
		              [4,109,81,121,1.28,68,51,"轻度污染"],
		              [5,106,77,114,1.07,55,51,"轻度污染"],
		              [6,109,81,121,1.28,68,51,"轻度污染"],
		              [7,106,77,114,1.07,55,51,"轻度污染"],
		              [8,89,65,78,0.86,51,26,"良"],
		              [9,53,33,47,0.64,50,17,"良"],
		              [10,80,55,80,1.01,75,24,"良"],
		              [11,117,81,124,1.03,45,24,"轻度污染"],
		              [12,99,71,142,1.1,62,42,"良"],
		              [13,95,69,130,1.28,74,50,"良"],
		              [14,116,87,131,1.47,84,40,"轻度污染"],
		              [15,108,80,121,1.3,85,37,"轻度污染"],
		              [16,134,83,167,1.16,57,43,"轻度污染"],
		              [17,79,43,107,1.05,59,37,"良"],
		              [18,71,46,89,0.86,64,25,"良"],
		              [19,97,71,113,1.17,88,31,"良"],
		              [20,84,57,91,0.85,55,31,"良"],
		              [21,87,63,101,0.9,56,41,"良"],
		              [22,104,77,119,1.09,73,48,"轻度污染"],
		              [23,87,62,100,1,72,28,"良"],
		              [24,168,128,172,1.49,97,56,"中度污染"],
		              [25,65,45,51,0.74,39,17,"良"],
		              [26,39,24,38,0.61,47,17,"优"],
		              [27,39,24,39,0.59,50,19,"优"],
		              [28,93,68,96,1.05,79,29,"良"],
		              [29,188,143,197,1.66,99,51,"中度污染"],
		              [30,174,131,174,1.55,108,50,"中度污染"],
		              [31,187,143,201,1.39,89,53,"中度污染"]
		          ];

		          var schema = [
		              {name: 'date', index: 0, text: '日期'},
		              {name: 'AQIindex', index: 1, text: 'AQI'},
		              {name: 'PM25', index: 2, text: 'PM2.5'},
		              {name: 'PM10', index: 3, text: 'PM10'},
		              {name: 'CO', index: 4, text: ' CO'},
		              {name: 'NO2', index: 5, text: 'NO2'},
		              {name: 'SO2', index: 6, text: 'SO2'},
		              {name: '等级', index: 7, text: '等级'}
		          ];

		          var lineStyle = {
		              normal: {
		                  width: 1,
		                  opacity: 0.5
		              }
		          };

		          option = {
		              backgroundColor: '#333',
		              legend: {
		                  bottom: 30,
		                  data: legend_data||['北京', '上海', '广州'],
		                  itemGap: 20,
		                  textStyle: {
		                      color: '#fff',
		                      fontSize: 14
		                  }
		              },
		              tooltip: {
		                  padding: 10,
		                  backgroundColor: '#222',
		                  borderColor: '#777',
		                  borderWidth: 1,
		                  formatter: function (obj) {
		                      var value = obj[0].value;
		                      return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
		                          + obj[0].seriesName + ' ' + value[0] + '日期：'
		                          + value[7]
		                          + '</div>'
		                          + schema[1].text + '：' + value[1] + '<br>'
		                          + schema[2].text + '：' + value[2] + '<br>'
		                          + schema[3].text + '：' + value[3] + '<br>'
		                          + schema[4].text + '：' + value[4] + '<br>'
		                          + schema[5].text + '：' + value[5] + '<br>'
		                          + schema[6].text + '：' + value[6] + '<br>';
		                  }
		              },
		              // dataZoom: {
		              //     show: true,
		              //     orient: 'vertical',
		              //     parallelAxisIndex: [0]
		              // },
		              parallelAxis: [
		                  {dim: 0, name: schema[0].text, inverse: true, max: 31, nameLocation: 'start'},
		                  {dim: 1, name: schema[1].text},
		                  {dim: 2, name: schema[2].text},
		                  {dim: 3, name: schema[3].text},
		                  {dim: 4, name: schema[4].text},
		                  {dim: 5, name: schema[5].text},
		                  {dim: 6, name: schema[6].text},
		                  {dim: 7, name: schema[7].text,
		                  type: 'category', data: ['优', '良', '轻度污染', '中度污染', '重度污染', '严重污染']}
		              ],
		              visualMap: {
		                  show: true,
		                  min: 0,
		                  max: 150,
		                  dimension: 2,
		                  inRange: {
		                      color: ['#d94e5d','#eac736','#50a3ba'].reverse(),
		                      // colorAlpha: [0, 1]
		                  }
		              },
		              parallel: {
		                  left: '5%',
		                  right: '18%',
		                  bottom: 100,
		                  parallelAxisDefault: {
		                      type: 'value',
		                      name: 'AQI指数',
		                      nameLocation: 'end',
		                      nameGap: 20,
		                      nameTextStyle: {
		                          color: '#fff',
		                          fontSize: 12
		                      },
		                      axisLine: {
		                          lineStyle: {
		                              color: '#aaa'
		                          }
		                      },
		                      axisTick: {
		                          lineStyle: {
		                              color: '#777'
		                          }
		                      },
		                      splitLine: {
		                          show: false
		                      },
		                      axisLabel: {
		                          textStyle: {
		                              color: '#fff'
		                          }
		                      }
		                  }
		              },
		              series: series||[
		                  {
		                      name: '北京',
		                      type: 'parallel',
		                      lineStyle: lineStyle,
		                      data: dataBJ
		                  },
		                  {
		                      name: '上海',
		                      type: 'parallel',
		                      lineStyle: lineStyle,
		                      data: dataSH
		                  },
		                  {
		                      name: '广州',
		                      type: 'parallel',
		                      lineStyle: lineStyle,
		                      data: dataGZ
		                  }
		              ]
		          };
	          lables_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_datas_charts"){//数字图表
		var ele=document.getElementsByClassName("gmb_datas_charts");
		for(var i=0;i<ele.length;i++){
			var datas_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var datas_charts = echarts.init(document.getElementsByClassName("gmb_datas_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//根据表英文名获取数据
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
				var option = {
					    title: {
					        text: title_text||'简单关系图'
					    },
					    tooltip: {},
					    animationDurationUpdate: 1500,
					    animationEasingUpdate: 'quinticInOut',
					    series : series||[
					        {
					            type: 'graph',
					            layout: 'none',
					            symbolSize: 50,
					            roam: true,
					            label: {
					                normal: {
					                    show: true
					                }
					            },
					            edgeSymbol: ['circle', 'arrow'],
					            edgeSymbolSize: [4, 10],
					            edgeLabel: {
					                normal: {
					                    textStyle: {
					                        fontSize: 20
					                    }
					                }
					            },
					            data:[{
					                name: '节点1',
					                x: 300,
					                y: 300
					            }, {
					                name: '节点2',
					                x: 800,
					                y: 300
					            }, {
					                name: '节点3',
					                x: 550,
					                y: 100
					            }, {
					                name: '节点4',
					                x: 550,
					                y: 500
					            }],
					            // links: [],
					            links: [{
					                source: 0,
					                target: 1,
					                symbolSize: [5, 20],
					                label: {
					                    normal: {
					                        show: true
					                    }
					                },
					                lineStyle: {
					                    normal: {
					                        width: 5,
					                        curveness: 0.2
					                    }
					                }
					            }, {
					                source: '节点2',
					                target: '节点1',
					                label: {
					                    normal: {
					                        show: true
					                    }
					                },
					                lineStyle: {
					                    normal: { curveness: 0.2 }
					                }
					            }, {
					                source: '节点1',
					                target: '节点3'
					            }, {
					                source: '节点2',
					                target: '节点3'
					            }, {
					                source: '节点2',
					                target: '节点4'
					            }, {
					                source: '节点1',
					                target: '节点4'
					            }],
					            lineStyle: {
					                normal: {
					                    opacity: 0.9,
					                    width: 2,
					                    curveness: 0
					                }
					            }
					        }
					    ]
					};
					datas_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_ring_charts"){//圆环图表
		var ele=document.getElementsByClassName("gmb_ring_charts");
		for(var i=0;i<ele.length;i++){
			var ring_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var ring_charts = echarts.init(document.getElementsByClassName("gmb_ring_charts"));// 基于准备好的dom，初始化echarts实例
				//获取其中一个饼状图的父级
				parentEle=ele[i].parentNode;
				//判断当前图表的自定义属性是否有值
				if(parentEle.getAttribute("chartData")!=null){
					//获取自定义属性上的值
					chartData=JSON.parse(parentEle.getAttribute("chartData"));
					//获取图表父级的id
					chartId=parentEle.getAttribute("id");
					//获取图表类型
					chartType=parentEle.getAttribute("type");
					//根据表英文名获取数据（id）
					getEchartDatas(chartId);
					//根据id名称加载图表数据
					chartData=loadEchartData(chartType,chartId,chartData);
					//保存标题
					title_text=chartData.title.text;
					//保存图例
					legend_data=chartData.legend.data;
					//保存纵轴数据
					series=chartData.series;
					//保存横轴数据
					xAxis_data=chartData.xAxis.data;
				}
				ring_charts.showLoading();
		        $.ajax({
		        	  url: "finance/Chart!gmbColumnsCharts.action",
		        	  dataType: "json",
		        	  success: function (data) {
		        		  ring_charts.hideLoading();
				        	console.log(data.data);
				        	ring_charts.setOption({// 指定图表的配置项和数据
				        		title: {
							        text: title_text||'金额统计'
							    },
					            tooltip: {
							        trigger: 'item',
							        formatter: "{a} <br/>{b}: {c} ({d}%)"
							    },
							    legend: {
							        orient: 'horizontal',
							        x: 'right',
							        data : data.categories,
							    },
							    series: series||[
							        {
							            name:'金额统计',
							            type:'pie',
							            radius: ['40%', '55%'],
							            data: data.ringData,
							        }
							    ]
							    
					        });// 使用刚指定的配置项和数据显示图表。
				        },
		        });
		}
	}else if(obj=="gmb_dashboard_charts"){//仪表盘
		var ele=document.getElementsByClassName("gmb_dashboard_charts");
		for(var i=0;i<ele.length;i++){
			var dashboard_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var dashboard_charts = echarts.init(document.getElementsByClassName("gmb_dashboard_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据（id）
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
				var option = {
					    tooltip : {
					        formatter: "{a} <br/>{c} {b}"
					    },
					    toolbox: {
					        show: true,
					        feature: {
					            restore: {show: true},
					            saveAsImage: {show: true}
					        }
					    },
					    series : [
					        {
					            name: '速度',
					            type: 'gauge',
					            z: 3,
					            min: 0,
					            max: 220,
					            splitNumber: 11,
					            radius: '50%',
					            axisLine: {            // 坐标轴线
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    width: 10
					                }
					            },
					            axisTick: {            // 坐标轴小标记
					                length: 15,        // 属性length控制线长
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: 'auto'
					                }
					            },
					            splitLine: {           // 分隔线
					                length: 20,         // 属性length控制线长
					                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					                    color: 'auto'
					                }
					            },
					            title : {
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    fontWeight: 'bolder',
					                    fontSize: 20,
					                    fontStyle: 'italic'
					                }
					            },
					            detail : {
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    fontWeight: 'bolder'
					                }
					            },
					            data:[{value: 40, name: 'km/h'}]
					        },
					        {
					            name: '转速',
					            type: 'gauge',
					            center: ['20%', '55%'],    // 默认全局居中
					            radius: '35%',
					            min:0,
					            max:7,
					            endAngle:45,
					            splitNumber:7,
					            axisLine: {            // 坐标轴线
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    width: 8
					                }
					            },
					            axisTick: {            // 坐标轴小标记
					                length:12,        // 属性length控制线长
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: 'auto'
					                }
					            },
					            splitLine: {           // 分隔线
					                length:20,         // 属性length控制线长
					                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					                    color: 'auto'
					                }
					            },
					            pointer: {
					                width:5
					            },
					            title: {
					                offsetCenter: [0, '-30%'],       // x, y，单位px
					            },
					            detail: {
					                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                    fontWeight: 'bolder'
					                }
					            },
					            data:[{value: 1.5, name: 'x1000 r/min'}]
					        },
					        {
					            name: '油表',
					            type: 'gauge',
					            center: ['77%', '50%'],    // 默认全局居中
					            radius: '25%',
					            min: 0,
					            max: 2,
					            startAngle: 135,
					            endAngle: 45,
					            splitNumber: 2,
					            axisLine: {            // 坐标轴线
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    width: 8
					                }
					            },
					            axisTick: {            // 坐标轴小标记
					                splitNumber: 5,
					                length: 10,        // 属性length控制线长
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    color: 'auto'
					                }
					            },
					            axisLabel: {
					                formatter:function(v){
					                    switch (v + '') {
					                        case '0' : return 'E';
					                        case '1' : return 'Gas';
					                        case '2' : return 'F';
					                    }
					                }
					            },
					            splitLine: {           // 分隔线
					                length: 15,         // 属性length控制线长
					                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					                    color: 'auto'
					                }
					            },
					            pointer: {
					                width:2
					            },
					            title : {
					                show: false
					            },
					            detail : {
					                show: false
					            },
					            data:[{value: 0.5, name: 'gas'}]
					        },
					        {
					            name: '水表',
					            type: 'gauge',
					            center : ['77%', '50%'],    // 默认全局居中
					            radius : '25%',
					            min: 0,
					            max: 2,
					            startAngle: 315,
					            endAngle: 225,
					            splitNumber: 2,
					            axisLine: {            // 坐标轴线
					                lineStyle: {       // 属性lineStyle控制线条样式
					                    width: 8
					                }
					            },
					            axisTick: {            // 坐标轴小标记
					                show: false
					            },
					            axisLabel: {
					                formatter:function(v){
					                    switch (v + '') {
					                        case '0' : return 'H';
					                        case '1' : return 'Water';
					                        case '2' : return 'C';
					                    }
					                }
					            },
					            splitLine: {           // 分隔线
					                length: 15,         // 属性length控制线长
					                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					                    color: 'auto'
					                }
					            },
					            pointer: {
					                width:2
					            },
					            title: {
					                show: false
					            },
					            detail: {
					                show: false
					            },
					            data:[{value: 0.5, name: 'gas'}]
					        }
					    ]
					};
					dashboard_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_radar_charts"){//雷达图
		var ele=document.getElementsByClassName("gmb_radar_charts");
		for(var i=0;i<ele.length;i++){
			var radar_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var radar_charts = echarts.init(document.getElementsByClassName("gmb_radar_charts"));// 基于准备好的dom，初始化echarts实例
		//获取其中一个饼状图的父级
		parentEle=ele[i].parentNode;
		//判断当前图表的自定义属性是否有值
		if(parentEle.getAttribute("chartData")!=null){
			//获取自定义属性上的值
			chartData=JSON.parse(parentEle.getAttribute("chartData"));
			//获取图表父级的id
			chartId=parentEle.getAttribute("id");
			//获取图表类型
			chartType=parentEle.getAttribute("type");
			//根据表英文名获取数据（id）
			getEchartDatas(chartId);
			//根据id名称加载图表数据
			chartData=loadEchartData(chartType,chartId,chartData);
			//保存标题
			title_text=chartData.title.text;
			//保存图例
			legend_data=chartData.legend.data;
			//保存纵轴数据
			series=chartData.series;
			//保存横轴数据
			xAxis_data=chartData.xAxis.data;
		}
		var dataBJ = [
		    [55,9,56,0.46,18,6,1],
		    [25,11,21,0.65,34,9,2],
		    [56,7,63,0.3,14,5,3],
		    [33,7,29,0.33,16,6,4],
		    [42,24,44,0.76,40,16,5],
		    [82,58,90,1.77,68,33,6],
		    [74,49,77,1.46,48,27,7],
		    [78,55,80,1.29,59,29,8],
		    [267,216,280,4.8,108,64,9],
		    [185,127,216,2.52,61,27,10],
		    [39,19,38,0.57,31,15,11],
		    [41,11,40,0.43,21,7,12],
		    [64,38,74,1.04,46,22,13],
		    [108,79,120,1.7,75,41,14],
		    [108,63,116,1.48,44,26,15],
		    [33,6,29,0.34,13,5,16],
		    [94,66,110,1.54,62,31,17],
		    [186,142,192,3.88,93,79,18],
		    [57,31,54,0.96,32,14,19],
		    [22,8,17,0.48,23,10,20],
		    [39,15,36,0.61,29,13,21],
		    [94,69,114,2.08,73,39,22],
		    [99,73,110,2.43,76,48,23],
		    [31,12,30,0.5,32,16,24],
		    [42,27,43,1,53,22,25],
		    [154,117,157,3.05,92,58,26],
		    [234,185,230,4.09,123,69,27],
		    [160,120,186,2.77,91,50,28],
		    [134,96,165,2.76,83,41,29],
		    [52,24,60,1.03,50,21,30],
		    [46,5,49,0.28,10,6,31]
		];

		var dataGZ = [
		    [26,37,27,1.163,27,13,1],
		    [85,62,71,1.195,60,8,2],
		    [78,38,74,1.363,37,7,3],
		    [21,21,36,0.634,40,9,4],
		    [41,42,46,0.915,81,13,5],
		    [56,52,69,1.067,92,16,6],
		    [64,30,28,0.924,51,2,7],
		    [55,48,74,1.236,75,26,8],
		    [76,85,113,1.237,114,27,9],
		    [91,81,104,1.041,56,40,10],
		    [84,39,60,0.964,25,11,11],
		    [64,51,101,0.862,58,23,12],
		    [70,69,120,1.198,65,36,13],
		    [77,105,178,2.549,64,16,14],
		    [109,68,87,0.996,74,29,15],
		    [73,68,97,0.905,51,34,16],
		    [54,27,47,0.592,53,12,17],
		    [51,61,97,0.811,65,19,18],
		    [91,71,121,1.374,43,18,19],
		    [73,102,182,2.787,44,19,20],
		    [73,50,76,0.717,31,20,21],
		    [84,94,140,2.238,68,18,22],
		    [93,77,104,1.165,53,7,23],
		    [99,130,227,3.97,55,15,24],
		    [146,84,139,1.094,40,17,25],
		    [113,108,137,1.481,48,15,26],
		    [81,48,62,1.619,26,3,27],
		    [56,48,68,1.336,37,9,28],
		    [82,92,174,3.29,0,13,29],
		    [106,116,188,3.628,101,16,30],
		    [118,50,0,1.383,76,11,31]
		];

		var dataSH = [
		    [91,45,125,0.82,34,23,1],
		    [65,27,78,0.86,45,29,2],
		    [83,60,84,1.09,73,27,3],
		    [109,81,121,1.28,68,51,4],
		    [106,77,114,1.07,55,51,5],
		    [109,81,121,1.28,68,51,6],
		    [106,77,114,1.07,55,51,7],
		    [89,65,78,0.86,51,26,8],
		    [53,33,47,0.64,50,17,9],
		    [80,55,80,1.01,75,24,10],
		    [117,81,124,1.03,45,24,11],
		    [99,71,142,1.1,62,42,12],
		    [95,69,130,1.28,74,50,13],
		    [116,87,131,1.47,84,40,14],
		    [108,80,121,1.3,85,37,15],
		    [134,83,167,1.16,57,43,16],
		    [79,43,107,1.05,59,37,17],
		    [71,46,89,0.86,64,25,18],
		    [97,71,113,1.17,88,31,19],
		    [84,57,91,0.85,55,31,20],
		    [87,63,101,0.9,56,41,21],
		    [104,77,119,1.09,73,48,22],
		    [87,62,100,1,72,28,23],
		    [168,128,172,1.49,97,56,24],
		    [65,45,51,0.74,39,17,25],
		    [39,24,38,0.61,47,17,26],
		    [39,24,39,0.59,50,19,27],
		    [93,68,96,1.05,79,29,28],
		    [188,143,197,1.66,99,51,29],
		    [174,131,174,1.55,108,50,30],
		    [187,143,201,1.39,89,53,31]
		];

		var lineStyle = {
		    normal: {
		        width: 1,
		        opacity: 0.5
		    }
		};

		var option = {
		    backgroundColor: '#161627',
		    title: {
		        text: title_text||'AQI - 雷达图',
		        left: 'center',
		        textStyle: {
		            color: '#eee'
		        }
		    },
		    legend: {
		        bottom: 5,
		        data: legend_data||['北京', '上海', '广州'],
		        itemGap: 20,
		        textStyle: {
		            color: '#fff',
		            fontSize: 14
		        },
		        selectedMode: 'single'
		    },
		    // visualMap: {
		    //     show: true,
		    //     min: 0,
		    //     max: 20,
		    //     dimension: 6,
		    //     inRange: {
		    //         colorLightness: [0.5, 0.8]
		    //     }
		    // },
		    radar: {
		        indicator: [
		            {name: 'AQI', max: 300},
		            {name: 'PM2.5', max: 250},
		            {name: 'PM10', max: 300},
		            {name: 'CO', max: 5},
		            {name: 'NO2', max: 200},
		            {name: 'SO2', max: 100}
		        ],
		        shape: 'circle',
		        splitNumber: 5,
		        name: {
		            textStyle: {
		                color: 'rgb(238, 197, 102)'
		            }
		        },
		        splitLine: {
		            lineStyle: {
		                color: [
		                    'rgba(238, 197, 102, 0.1)', 'rgba(238, 197, 102, 0.2)',
		                    'rgba(238, 197, 102, 0.4)', 'rgba(238, 197, 102, 0.6)',
		                    'rgba(238, 197, 102, 0.8)', 'rgba(238, 197, 102, 1)'
		                ].reverse()
		            }
		        },
		        splitArea: {
		            show: false
		        },
		        axisLine: {
		            lineStyle: {
		                color: 'rgba(238, 197, 102, 0.5)'
		            }
		        }
		    },
		    series: series||[
		        {
		            name: '北京',
		            type: 'radar',
		            lineStyle: lineStyle,
		            data: dataBJ,
		            symbol: 'none',
		            itemStyle: {
		                normal: {
		                    color: '#F9713C'
		                }
		            },
		            areaStyle: {
		                normal: {
		                    opacity: 0.1
		                }
		            }
		        },
		        {
		            name: '上海',
		            type: 'radar',
		            lineStyle: lineStyle,
		            data: dataSH,
		            symbol: 'none',
		            itemStyle: {
		                normal: {
		                    color: '#B3E4A1'
		                }
		            },
		            areaStyle: {
		                normal: {
		                    opacity: 0.05
		                }
		            }
		        },
		        {
		            name: '广州',
		            type: 'radar',
		            lineStyle: lineStyle,
		            data: dataGZ,
		            symbol: 'none',
		            itemStyle: {
		                normal: {
		                    color: 'rgb(238, 197, 102)'
		                }
		            },
		            areaStyle: {
		                normal: {
		                    opacity: 0.05
		                }
		            }
		        }
		    ]
		};
			radar_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_step_charts"){//阶梯图
		var ele=document.getElementsByClassName("gmb_step_charts");
		for(var i=0;i<ele.length;i++){
			var step_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var step_charts = echarts.init(document.getElementsByClassName("gmb_step_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据（id）
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
			var option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:legend_data||['直接访问','邮件营销','联盟广告','视频广告','搜索引擎','百度','谷歌','必应','其他']
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : xAxis_data||['周一','周二','周三','周四','周五','周六','周日']
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : series||[
				        {
				            name:'直接访问',
				            type:'bar',
				            data:[320, 332, 301, 334, 390, 330, 320]
				        },
				        {
				            name:'邮件营销',
				            type:'bar',
				            stack: '广告',
				            data:[120, 132, 101, 134, 90, 230, 210]
				        },
				        {
				            name:'联盟广告',
				            type:'bar',
				            stack: '广告',
				            data:[220, 182, 191, 234, 290, 330, 310]
				        },
				        {
				            name:'视频广告',
				            type:'bar',
				            stack: '广告',
				            data:[150, 232, 201, 154, 190, 330, 410]
				        },
				        {
				            name:'搜索引擎',
				            type:'bar',
				            data:[662, 888, 964, 1026, 1279, 1300, 1570],
				            markLine : {
				                lineStyle: {
				                    normal: {
				                        type: 'dashed'
				                    }
				                },
				                data : [
				                    [{type : 'min'}, {type : 'max'}]
				                ]
				            }
				        },
				        {
				            name:'百度',
				            type:'bar',
				            barWidth : 5,
				            stack: '搜索引擎',
				            data:[620, 732, 701, 734, 1090, 1130, 1120]
				        },
				        {
				            name:'谷歌',
				            type:'bar',
				            stack: '搜索引擎',
				            data:[120, 132, 101, 134, 290, 230, 220]
				        },
				        {
				            name:'必应',
				            type:'bar',
				            stack: '搜索引擎',
				            data:[60, 72, 71, 74, 190, 130, 110]
				        },
				        {
				            name:'其他',
				            type:'bar',
				            stack: '搜索引擎',
				            data:[62, 82, 91, 84, 109, 110, 120]
				        }
				    ]
				};
				step_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_press_charts"){//漏斗图表
		var ele=document.getElementsByClassName("gmb_press_charts");
		for(var i=0;i<ele.length;i++){
			var press_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var press_charts = echarts.init(document.getElementsByClassName("gmb_press_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据（id）
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
			var option = {
				    title: {
				        text: title_text||'漏斗图',
				        subtext: '纯属虚构'
				    },
				    tooltip: {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c}%"
				    },
				    toolbox: {
				        feature: {
				            dataView: {readOnly: false},
				            restore: {},
				            saveAsImage: {}
				        }
				    },
				    legend: {
				        data: legend_data||['展现','点击','访问','咨询','订单']
				    },
				    series: series||[
				        {
				            name: '预期',
				            type: 'funnel',
				            left: '10%',
				            width: '80%',
				            label: {
				                normal: {
				                    formatter: '{b}预期'
				                },
				                emphasis: {
				                    position:'inside',
				                    formatter: '{b}预期: {c}%'
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false
				                }
				            },
				            itemStyle: {
				                normal: {
				                    opacity: 0.7
				                }
				            },
				            data: [
				                {value: 60, name: '访问'},
				                {value: 40, name: '咨询'},
				                {value: 20, name: '订单'},
				                {value: 80, name: '点击'},
				                {value: 100, name: '展现'}
				            ]
				        },
				        {
				            name: '实际',
				            type: 'funnel',
				            left: '10%',
				            width: '80%',
				            maxSize: '80%',
				            label: {
				                normal: {
				                    position: 'inside',
				                    formatter: '{c}%',
				                    textStyle: {
				                        color: '#fff'
				                    }
				                },
				                emphasis: {
				                    position:'inside',
				                    formatter: '{b}实际: {c}%'
				                }
				            },
				            itemStyle: {
				                normal: {
				                    opacity: 0.5,
				                    borderColor: '#fff',
				                    borderWidth: 2
				                }
				            },
				            data: [
				                {value: 30, name: '访问'},
				                {value: 10, name: '咨询'},
				                {value: 5, name: '订单'},
				                {value: 50, name: '点击'},
				                {value: 80, name: '展现'}
				            ]
				        }
				    ]
				};
				press_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
		}
	}else if(obj=="gmb_map_charts"){//地图图表
		var ele=document.getElementsByClassName("gmb_map_charts");
		for(var i=0;i<ele.length;i++){
			var map_charts = echarts.init(ele[i]);// 基于准备好的dom，初始化echarts实例
		//var map_charts = echarts.init(document.getElementsByClassName("gmb_map_charts"));// 基于准备好的dom，初始化echarts实例
			//获取其中一个饼状图的父级
			parentEle=ele[i].parentNode;
			//判断当前图表的自定义属性是否有值
			if(parentEle.getAttribute("chartData")!=null){
				//获取自定义属性上的值
				chartData=JSON.parse(parentEle.getAttribute("chartData"));
				//获取图表父级的id
				chartId=parentEle.getAttribute("id");
				//获取图表类型
				chartType=parentEle.getAttribute("type");
				//根据表英文名获取数据（id）
				getEchartDatas(chartId);
				//根据id名称加载图表数据
				chartData=loadEchartData(chartType,chartId,chartData);
				//保存标题
				title_text=chartData.title.text;
				//保存图例
				legend_data=chartData.legend.data;
				//保存纵轴数据
				series=chartData.series;
				//保存横轴数据
				xAxis_data=chartData.xAxis.data;
			}
				function randomData() {
				    return Math.round(Math.random()*1000);
				}
				var option = {
				    title: {
				        text: title_text||'iphone销量',
				        subtext: '纯属虚构',
				        left: 'center'
				    },
				    tooltip: {
				        trigger: 'item'
				    },
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data:legend_data||['iphone3','iphone4','iphone5']
				    },
				    visualMap: {
				        min: 0,
				        max: 2500,
				        left: 'left',
				        top: 'bottom',
				        text: ['高','低'],           // 文本，默认为数值文本
				        calculable: true
				    },
				    toolbox: {
				        show: true,
				        orient: 'vertical',
				        left: 'right',
				        top: 'center',
				        feature: {
				            dataView: {readOnly: false},
				            restore: {},
				            saveAsImage: {}
				        }
				    },
				    series: series||[
				        {
				            name: 'iphone3',
				            type: 'map',
				            mapType: 'china',
				            roam: false,
				            label: {
				                normal: {
				                    show: true
				                },
				                emphasis: {
				                    show: true
				                }
				            },
				            data:[
				                {name: '北京',value: randomData() },
				                {name: '天津',value: randomData() },
				                {name: '上海',value: randomData() },
				                {name: '重庆',value: randomData() },
				                {name: '河北',value: randomData() },
				                {name: '河南',value: randomData() },
				                {name: '云南',value: randomData() },
				                {name: '辽宁',value: randomData() },
				                {name: '黑龙江',value: randomData() },
				                {name: '湖南',value: randomData() },
				                {name: '安徽',value: randomData() },
				                {name: '山东',value: randomData() },
				                {name: '新疆',value: randomData() },
				                {name: '江苏',value: randomData() },
				                {name: '浙江',value: randomData() },
				                {name: '江西',value: randomData() },
				                {name: '湖北',value: randomData() },
				                {name: '广西',value: randomData() },
				                {name: '甘肃',value: randomData() },
				                {name: '山西',value: randomData() },
				                {name: '内蒙古',value: randomData() },
				                {name: '陕西',value: randomData() },
				                {name: '吉林',value: randomData() },
				                {name: '福建',value: randomData() },
				                {name: '贵州',value: randomData() },
				                {name: '广东',value: randomData() },
				                {name: '青海',value: randomData() },
				                {name: '西藏',value: randomData() },
				                {name: '四川',value: randomData() },
				                {name: '宁夏',value: randomData() },
				                {name: '海南',value: randomData() },
				                {name: '台湾',value: randomData() },
				                {name: '香港',value: randomData() },
				                {name: '澳门',value: randomData() }
				            ]
				        },
				        {
				            name: 'iphone4',
				            type: 'map',
				            mapType: 'china',
				            label: {
				                normal: {
				                    show: true
				                },
				                emphasis: {
				                    show: true
				                }
				            },
				            data:[
				                {name: '北京',value: randomData() },
				                {name: '天津',value: randomData() },
				                {name: '上海',value: randomData() },
				                {name: '重庆',value: randomData() },
				                {name: '河北',value: randomData() },
				                {name: '安徽',value: randomData() },
				                {name: '新疆',value: randomData() },
				                {name: '浙江',value: randomData() },
				                {name: '江西',value: randomData() },
				                {name: '山西',value: randomData() },
				                {name: '内蒙古',value: randomData() },
				                {name: '吉林',value: randomData() },
				                {name: '福建',value: randomData() },
				                {name: '广东',value: randomData() },
				                {name: '西藏',value: randomData() },
				                {name: '四川',value: randomData() },
				                {name: '宁夏',value: randomData() },
				                {name: '香港',value: randomData() },
				                {name: '澳门',value: randomData() }
				            ]
				        },
				        {
				            name: 'iphone5',
				            type: 'map',
				            mapType: 'china',
				            label: {
				                normal: {
				                    show: true
				                },
				                emphasis: {
				                    show: true
				                }
				            },
				            data:[
				                {name: '北京',value: randomData() },
				                {name: '天津',value: randomData() },
				                {name: '上海',value: randomData() },
				                {name: '广东',value: randomData() },
				                {name: '台湾',value: randomData() },
				                {name: '香港',value: randomData() },
				                {name: '澳门',value: randomData() }
				            ]
				        }
				    ]
				};
					map_charts.setOption(option);// 使用刚指定的配置项和数据显示图表。
				
		};
	};
};

//加载图表
var charts=["gmb_cake_charts","gmb_line_charts","gmb_area_charts","gmb_columns_charts","gmb_points_charts","gmb_bubbles_charts","gmb_tree_charts","gmb_lables_charts","gmb_datas_charts","gmb_ring_charts","gmb_dashboard_charts","gmb_radar_charts","gmb_step_charts","gmb_step_charts","gmb_press_charts","gmb_map_charts"];
//循环图表
$(document).ready(function(){
	for(var i=0;i<charts.length;i++){
		//加载相同图表
		$("."+charts[i]).each(function(){
			initcharts(charts[i]);
		});
	}
});

