<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"D:\upupw\aliveHouse\public/../application/home\view\build\build.html";i:1495099883;s:69:"D:\upupw\aliveHouse\public/../application/home\view\layouts\main.html";i:1494989626;}*/ ?>
<!-- 右侧主体内容开启 -->
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Cache-Control" content="no-transform">
	<meta name="renderer" content="webkit">
	<meta name="mobile-agent" content="format=html5;url=http://m.alivehouse.com/">
	<meta name="keywords" content="">
	<meta name="description" content="">

	<title> [ Home ] </title>

	<!-- Favicon -->
	<link rel="shortcut icon" href="/static/images/favicon.png" type="image/x-icon">
	<link rel="canonical" href="/home/build/build.html">

	<!-- Load base CSS -->
	<link type="text/css" href="/static/css/home/layerBase2.css" rel="stylesheet">
	<link type="text/css" href="/static/css/home/fkTheme.css" rel="stylesheet" id="jzThemeFrame">
	<link type="text/css" href="/static/css/home/fkModule.css" rel="stylesheet" id="jzModule2_1">
	<link type="text/css" href="/static/css/home/searchBoxStyle1.css" rel="stylesheet">
	<link type="text/css" href="/static/css/home/newSearchBoxStyle.min.css" rel="stylesheet">
	<link type="text/css" href="/static/css/home/bannerAnimation.css" rel="stylesheet" >
	<link type="text/css" href="/static/css/home/jzcusstyle.css" rel="stylesheet">

	<!-- This page CSS -->
	<link type="text/css" href="/static/css/home/floatBtn1.min.css" rel="stylesheet">
	<link type="text/css" href="/static/css/home/poshytipAndmCustomScrollbar.min.css" rel="stylesheet">

	<!-- Load base JS -->
	<script src="/static/js/home/imageEffect.min.js"></script>
	<script src="/static/js/home/photoSlide.min.js"></script>
	<script type="text/javascript">
        var _cid = 13775917;
	</script>

	<!-- Define base CSS -->
	<style id="stylemodule"></style>
	<style id="styleWebSite" type="text/css">
		#memberBar{width:1200px;}
		#webTop{width:1200px;}
		#absTopForms{width:1200px;}
		.webNavDefault{width:1200px;}
		#webHeader{width:1200px;}
		#absForms{width:1200px;}
		div#webContainer{width:1200px;}
		#absBottomForms{width:1200px;}
		#webFooter{width:1200px;}
		div.webNav .navMainContent{width:1200px;}
		div.nav .navMainContent{width:1200px;}
		.fullmeasureContent{width:1200px;}
		#fk-webHeaderZone {width:1200px;margin-left:-600.0px;}
		#fk-webFooterZone {width:1200px;margin-left:-600.0px;}
		#fk-webBannerZone {width:1200px;margin-left:-600.0px;}
		#webBanner{width:100%;}
	</style>
	<style id="styleTitle" type="text/css"></style>

	<!-- Define base JS -->
	<script type="text/javascript">
        (function(FUN,undefined){var list=[];FUN.run=function(){if(arguments.length<1){throw new Error("jzUtils.run 参数错误");return}var name=arguments[0].name,callMethod=arguments[0].callMethod||false,prompt=arguments[0].prompt||false,promptMsg=arguments[0].promptMsg||"功能还在加载中，请稍候",base=arguments[0].base||(window.Fai&&Fai.top.Site)||top.Site||window,args=Array.prototype.slice.call(arguments),funcArgs=args.slice(1),callbackFunc={},result;result=checkMethod(name,base);if(result.success){callMethod=false;try{result.func.apply(result.func,funcArgs)}catch(e){console&&console.log&&console.log("错误:name="+e.name+"; message="+e.message)}}else{if(prompt){window.Fai&&Fai.ing(promptMsg,true)}}if(callMethod){callbackFunc.name=name;callbackFunc.base=base;callbackFunc.args=funcArgs;list.push(callbackFunc)}};FUN.trigger=function(option){if(typeof option!=="object"){throw new Error("jzUtils.trigger 参数错误");return}var funcName=option.name||"",base=option.base||(window.Fai&&Fai.top.Site)||top.Site||window,newList=[],result,func,i,param;if(funcName.length<1){return}for(i=0;i<list.length;i++){param=list[i];if(param.name==funcName){result=checkMethod(funcName,base);if(result.success){try{result.func.apply(result.func,param.args)}catch(e){console&&console.log&&console.log("错误:name="+e.name+"; message="+e.message)}}}else{newList.push(param)}}list=newList};function checkMethod(funcName,base){var methodList=funcName.split("."),readyFunc=base,result={"success":true,"func":function(){}},methodName,i;for(i=0;i<methodList.length;i++){methodName=methodList[i];if(methodName in readyFunc){readyFunc=readyFunc[methodName]}else{result.success=false;return result}}result.func=readyFunc;return result}})(window.jzUtils||(window.jzUtils={}))
        var _faiAjax = function(){
            //for regexp
            var r = /\?/;
            var _o = {
                type:"get",
                url:"",
                data:"",
                error:function(){},
                success:function(){}
            };
            var _sendRequest=function(o) {
                var xmlhttp = null;
                //init option code
                o.type = o.type || _o.type;
                o.url = o.url || _o.url;
                o.data = o.data || _o.data;
                o.error = o.error || _o.error;
                o.success = o.success || _o.success;
                if (window.XMLHttpRequest) {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }else{
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                //the instructions param takes the form of an eval statement
                if(o.type != "post") {
                    o.url += ( this.r.test( o.url ) ? "&" : "?" ) + o.data;
                    xmlhttp.open("GET", o.url, true);
                    xmlhttp.onreadystatechange=function() {
                        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                            o.success( xmlhttp.responseText );
                        }else if( o.error ){
                            o.error();
                        }
                    }
                    xmlhttp.send();
                } else {
                    xmlhttp.open("POST", o.url, true);
                    //Send the proper header information along with the request
                    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
                    xmlhttp.onreadystatechange=function() {
                        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                            o.success( xmlhttp.responseText );
                        }else{
                            o.error();
                        }
                    }
                    xmlhttp.send(o.data);
                }
            }
            return {
                ajax:function(option){
                    try {
                        //此次调用的错误不让抛出给window。防止函数重入
                        _sendRequest(option);
                    }catch(e){
                        //alert(e);
                    }
                }
            };
        }();
	</script>

</head>
<body class="g_body g_locale2052 g_cusSiteWidth">

	<div id="g_main" class="g_main g_col108 " style="width: 1903px;">
	<div id="web" class="g_web ">

		<!-- This webTopTable start -->
		<section>

			<table class="webTopTable" cellpadding="0" cellspacing="0">
				<tbody>
				<tr>
					<td align="center">
						<div id="webTop" class="webTop">
							<div id="corpTitle" class="corpTitle corpTitle2" fontpatterntitle="false" style="top:42px;left:12px;;" _linktype="0" onpaste="Fai.top.Site.corpTitleFormatPasteDatacorpTitle();">
								<div class="newPrimaryTitle">
									<b>
										<font color="#1e50ae" style="color: rgb(30, 80, 174);">
											<font style="color: rgba(255, 101, 55, 1);">Alive</font>&nbsp;
										</font>
										<font color="#cccccc" style="color: rgba(204, 204, 204, 1);">House</font>
									</b>
								</div>
							</div>
						</div>
					</td>
				</tr>
				</tbody>
			</table>

		</section>
		<!-- This webTopTable end -->

		<!-- This absTopTable start -->
		<section>

			<table class="absTopTable" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td align="center">
						<div id="absBannerForms" class="forms sideForms absForms">
							<div style="position:absolute;"></div><!-- for ie6 -->

						</div>
					</td>
				</tr>
				</tbody>
			</table>

		</section>
		<!-- This absTopTable end -->

		<!-- This webNavTable start -->
		<section>

			<table class="webNavTable" cellpadding="0" cellspacing="0">
				<tbody>
				<tr>
					<td align="center">
						<div id="webNav" class="webNav webNavDefault">
							<div id="nav" class="nav nav2 fixedNavPos ">
								<div class="navMainContent">
									<table class="navTop" cellpadding="0" cellspacing="0">
										<tbody>
										<tr>
											<td class="navTopLeft"></td>
											<td class="navTopCenter"></td>
											<td class="navTopRight"></td>
										</tr>
										</tbody>
									</table>
									<table class="navContent" cellpadding="0" cellspacing="0">
										<tbody>
										<tr>
											<td class="navLeft"></td>
											<td class="navCenterContent" id="navCenterContent" valign="top" align="left">
												<div id="navCenter" class="navCenter" style="width: 550px;">
													<div class="itemPrev" style="display: none;"></div>
													<div class="itemContainer">
														<table title="" class="item itemCol2 itemIndex1" cellpadding="0" cellspacing="0" colid="2" id="nav2">
															<tbody>
															<tr>
																<td class="itemLeft"></td>
																<td class="itemCenter">
																	<a hidefocus="true" style="outline:none;" href="/home/index/index.html" target="_self"><span class="itemName0">Home</span></a>
																</td>
																<td class="itemRight"></td>
															</tr>
															</tbody>
														</table>

														<div class="itemSep"></div>
														<table title="" class="item itemCol109 itemIndex2" cellpadding="0" cellspacing="0" colid="109" id="nav109">
															<tbody>
															<tr>
																<td class="itemLeft"></td>
																<td class="itemCenter">
																	<a hidefocus="true" style="outline:none;" href="/home/rent/rent.html" target="_self"><span class="itemName0">Rent</span></a>
																</td>
																<td class="itemRight"></td>
															</tr>
															</tbody>
														</table>

														<div class="itemSep"></div>
														<table title="" class="item itemCol106 itemIndex3" cellpadding="0" cellspacing="0" colid="106" id="nav106">
															<tbody>
															<tr>
																<td class="itemLeft"></td>
																<td class="itemCenter">
																	<a hidefocus="true" style="outline:none;" href="/home/house/secondhandhouse.html" target="_self"><span class="itemName0">Second-House</span></a>
																</td>
																<td class="itemRight"></td>
															</tr>
															</tbody>
														</table>

														<div class="itemSep"></div>
														<table title="" class="item itemCol105 itemIndex4" cellpadding="0" cellspacing="0" colid="105" id="nav105">
															<tbody>
															<tr>
																<td class="itemLeft"></td>
																<td class="itemCenter">
																	<a hidefocus="true" style="outline:none;" href="/home/house/newhouse.html" target="_self"><span class="itemName0">New-House</span></a>
																</td>
																<td class="itemRight"></td>
															</tr>
															</tbody>
														</table>

														<div class="itemSep"></div>
														<table title="" class="item itemCol108 itemIndex5 itemSelected" cellpadding="0" cellspacing="0" colid="108" id="nav108">
															<tbody>
															<tr>
																<td class="itemLeft"></td>
																<td class="itemCenter">
																	<a hidefocus="true" style="outline:none;" href="/home/build/build.html" target="_self" onclick="return false;"><span class="itemName0">Build</span></a>
																</td>
																<td class="itemRight"></td>
															</tr>
															</tbody>
														</table>
													</div>
													<div class="itemNext" style="display: none;"></div>
												</div>
											</td>
											<td class="navRight"></td>
										</tr>
										</tbody>
									</table>
									<table class="navBottom" cellpadding="0" cellspacing="0">
										<tbody>
										<tr>
											<td class="navBottomLeft"></td>
											<td class="navBottomCenter"></td>
											<td class="navBottomRight"></td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
							<a href="/home/contact/contact.html" style="display:none;">Contact</a>
						</div>
					</td>
				</tr>
				</tbody>
			</table>

		</section>
		<!-- This webNavTable end -->

		<!-- This webHeaderTable start -->
		<section>

			<table class="webHeaderTable" cellpadding="0" cellspacing="0" id="webHeaderTable">
				<tbody>
				<tr>
					<td align="center" class="webHeaderTd fk-moduleZoneWrap">
						<div id="fk-webHeaderZone" class="J_moduleZone fk-webHeaderZone fk-moduleZone forms sideForms">
							<div class="fk-moduleZoneBg"></div>
						</div>
						<div id="webHeader" class="webHeader">
							<table class="headerTable" cellpadding="0" cellspacing="0">
								<tbody><tr>
									<td class="headerCusLeft"></td>
									<td class="headerCusMiddle" align="center" valign="top">
										<div class="headerNav">
										</div>
									</td>
									<td class="headerCusRight"></td>
								</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
				</tbody>
			</table>

		</section>
		<!-- This webHeaderTable end -->

		<table class="webBannerTable J_webBannerTable" cellpadding="0" cellspacing="0">
			<tbody><tr>
				<td align="center" class="fk-moduleZoneWrap">
					
					<div id="fk-webBannerZone" class="J_moduleZone fk-webBannerZone fk-moduleZone forms sideForms">
						<div class="fk-moduleZoneBg"></div>
						
					</div>
					<div id="webBanner" class="webBanner">
						<table class="bannerTable" cellpadding="0" cellspacing="0">
							<tbody><tr>
								<td class="bannerLeft"></td>
								<td class="bannerCenter" align="center" valign="top">
									<div class="bannerTop"></div>
<div id="banner" class="banner extBanner" style="background: none; height: 300px; overflow: hidden; display: block;" normalheight="300" defaultwidth="0">
	
	
	
<div class="imageSwitchShowName photoSwitchBg" style="position: absolute; display: none; z-index: 2; width: 1903px; height: 30px; line-height: 30px;"><span class="spanHiddenName spanShowName" style="margin-left: 10px;"></span></div><div class="imageSwitchBtnArea" style="position: absolute; z-index: 3; display: none; width: 19px;"><a class="imageSwitchBtn imageSwitchBtnSel"><span>1</span></a></div><div></div><div class="switchGroup " style="width: 1903px; position: relative; height: 300px; overflow: hidden; margin: 0px auto;"><div class="numImg" id="numImg0" style="position:absolute;width:100%;">
<a class="J_bannerItem" hidefocus="true" title="" href="javascript:;" target="" style="width: 1903px; height: 300px; cursor: default; background-position: 50% 50%; background-repeat: no-repeat; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1; background-size: cover; background-image: url(&quot;http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo7uW9nwYwgA84rAI.jpg&quot;);" onclick="return false;">
</a>
</div>
</div></div>

								</td>
								<td class="bannerRight"></td>
							</tr>
						</tbody></table>
					</div>
				</td>
			</tr>
		</tbody></table>

		<table class="absMiddleTable" cellpadding="0" cellspacing="0">
			<tbody><tr>
				<td align="center">
					<div id="absForms" class="forms sideForms absForms">
						
					</div>
				</td>
			</tr>
		</tbody></table>
		


		<div id="fullmeasureTopForms" class="fullmeasureContainer forms fk-fullmeasureForms fullmeasureForms fullmeasureTopForms">
			<div id="module388" _indexclass="formIndex1" _modulestyle="80" _moduleid="388" class="form form388 formIndex1 formStyle80 fk-formFullmeasure " title="" style="height: 850px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false" fmslidestyle="0" fmpage="1" iscarousel="0" displaytime="4" carouselspeed="1">
<div class="fillContentRelative" style="position: relative; z-index: -1; height: 894px; width: 100%; display: none;"></div><div style="position: static;" class="fullmeasureOuterContentPage fullmeasureOuterContentPage1 J_fullmeasurePageShow" page="1">			<div class="fullmeasureOuterContentBg fullmeasureOuterContentBg388 fullmeasureStyle0"></div><div class="fullmeasureOuterContent fullmeasureOuterContent388">
<div class="fullmeasureContent fullmeasureContent388" id="fullmeasureContent388_1" moduleid="388"><div class="fullmeasureContentBg fullmeasureContentBg388"></div><div id="module529" _indexclass="formIndex1" _modulestyle="7" _moduleid="529" class="form form529 formStyle7 formIndex1" title="" style="" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="388" _inpack="0" _autoheight="1" _global="false" _independent="false">
<table class="formTop formTop529" cellpadding="0" cellspacing="0"><tbody><tr><td class="left"></td><td class="center"></td><td class="right"></td></tr></tbody></table>
<table class=" formMiddle formMiddle529" style="" cellpadding="0" cellspacing="0"><tbody><tr>
<td class="formMiddleLeft formMiddleLeft529"></td>
<td class="formMiddleCenter formMiddleCenter529 " valign="top">
<div class="formMiddleContent formMiddleContent529 fk-formContentOtherPadding" tabstyle="0">
<div>
<div class="newsList J_newsList  newsNewModuleStyle_four " id="newsList529" _showsetting="0" newslisttype="6" scroll="0">
<div topclassname="top1" topswitch="on" newsid="14" newsname="二手房过户有什么需要准备的？" class="J_newsListLine line noHover   fk-newsLineHeight  newsListLine1" style="width: 310px; height: 340px;"><table id="lineBody14" class="J_lineBody lineBody" cellpadding="0" cellspacing="0"><tbody><tr id="module529tr14"><td class="mixNewsTitle newsListLineBodyTd" valign="top"><div class="J_articlePhotoBox articlePhotoBox" newid="14" newsflag="0"><a class="J_articlePicHref articlePicLink1" href="http://www.ot13227318.icoc.me/nd.php?id=14&amp;_np=108_529" target="_blank" style="width:320px;height:184px;"><div class="cutImgPanel J_cutImgPanel newsListCutImgPanel1" style="bottom:49.0px;"> <img class="J_newsListPic newsPic newsListNewsPic1" alt="文章附图" title="" src="/static/uploads/ima11.jpg" style="width:310.0px;height:282.0px;"></div></a></div><div class="J_articleDesc newsListArticleDesc"><div class="J_newsTitle newsTitle newsListNewsTitle1" style="width: 100%;"><div class="J_newsListTopFlag  newsListTopFlag1"><a class="no-mixNewsStyleTitleTip" href="http://www.ot13227318.icoc.me/nd.php?id=14&amp;_np=108_529" target="_blank"></a></div><a hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=14&amp;_np=108_529" target="_blank" title="二手房过户有什么需要准备的？" class="J_mixNewsStyleTitle fk-newsListTitle mixNewsStyleTitle " mix="1">二手房过户有什么需要准备的？</a></div><p class="mixNewsStyleSummary fk-newsListSummary ">购买二手房办理过户是重中之重，往往很多纠纷都会出现在过户的环节，所以我们再购买二手房之前先了解一下购房过户手续的一...</p>
</div></td>
</tr>
</tbody></table>
</div>
<div topclassname="top1" topswitch="on" newsid="13" newsname="房企当下拿地 到底是&quot;馅饼&quot;还是&quot;陷阱&quot;？" class="J_newsListLine line noHover   fk-newsLineHeight  newsListLine1" style="width: 310px; height: 340px;"><table id="lineBody13" class="J_lineBody lineBody" cellpadding="0" cellspacing="0"><tbody><tr id="module529tr13"><td class="mixNewsTitle newsListLineBodyTd" valign="top"><div class="J_articlePhotoBox articlePhotoBox" newid="13" newsflag="0"><a class="J_articlePicHref articlePicLink1" href="http://www.ot13227318.icoc.me/nd.php?id=13&amp;_np=108_529" target="_blank" style="width:320px;height:184px;"><div class="cutImgPanel J_cutImgPanel newsListCutImgPanel1" style="bottom:48.90909px;"> <img class="J_newsListPic newsPic newsListNewsPic1" alt="文章附图" title="" src="/static/uploads/ima20.png" style="width:310.0px;height:281.81818px;"></div></a></div><div class="J_articleDesc newsListArticleDesc"><div class="J_newsTitle newsTitle newsListNewsTitle1" style="width: 100%;"><div class="J_newsListTopFlag  newsListTopFlag1"><a class="no-mixNewsStyleTitleTip" href="http://www.ot13227318.icoc.me/nd.php?id=13&amp;_np=108_529" target="_blank"></a></div><a hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=13&amp;_np=108_529" target="_blank" title="房企当下拿地 到底是&quot;馅饼&quot;还是&quot;陷阱&quot;？" class="J_mixNewsStyleTitle fk-newsListTitle mixNewsStyleTitle " mix="1">房企当下拿地 到底是"馅饼"还是"陷阱"？</a></div><p class="mixNewsStyleSummary fk-newsListSummary ">统计显示，仅7月前10天，全国单幅地块成交金额超过5亿的地块达29宗，其中溢价率超50%的地王达18宗。一二线城市...</p>
</div></td>
</tr>
</tbody></table>
</div>
<div topclassname="top1" topswitch="on" newsid="12" newsname="房产中介套路深 虚假宣传渗透交易每个环节" class="J_newsListLine line noHover   fk-newsLineHeight  newsListLine1" style="width: 310px; height: 340px;"><table id="lineBody12" class="J_lineBody lineBody" cellpadding="0" cellspacing="0"><tbody><tr id="module529tr12"><td class="mixNewsTitle newsListLineBodyTd" valign="top"><div class="J_articlePhotoBox articlePhotoBox" newid="12" newsflag="0"><a class="J_articlePicHref articlePicLink1" href="http://www.ot13227318.icoc.me/nd.php?id=12&amp;_np=108_529" target="_blank" style="width:320px;height:184px;"><div class="cutImgPanel J_cutImgPanel newsListCutImgPanel1" style="bottom:-11.230766px;"> <img class="J_newsListPic newsPic newsListNewsPic1" alt="文章附图" title="" src="/static/uploads/ima20.png" style="width:310.0px;height:161.53847px;"></div></a></div><div class="J_articleDesc newsListArticleDesc"><div class="J_newsTitle newsTitle newsListNewsTitle1" style="width: 100%;"><div class="J_newsListTopFlag  newsListTopFlag1"><a class="no-mixNewsStyleTitleTip" href="http://www.ot13227318.icoc.me/nd.php?id=12&amp;_np=108_529" target="_blank"></a></div><a hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=12&amp;_np=108_529" target="_blank" title="房产中介套路深 虚假宣传渗透交易每个环节" class="J_mixNewsStyleTitle fk-newsListTitle mixNewsStyleTitle " mix="1">房产中介套路深 虚假宣传渗透交易每个环节</a></div><p class="mixNewsStyleSummary fk-newsListSummary ">一套叫价1.4亿元的所谓“清朝格格府邸”近日成为链家等房产中介网站上的“网红”，甚至引来北京市文物局辟谣：并非登记...</p>
</div></td>
</tr>
</tbody></table>
</div>
<div topclassname="top1" topswitch="on" newsid="11" newsname="楼市上涨效应向二线传导:厦门信贷收紧 南京土地&quot;高烧&quot;" class="J_newsListLine line noHover   fk-newsLineHeight  newsListLine1" style="width: 310px; height: 340px;"><table id="lineBody11" class="J_lineBody lineBody" cellpadding="0" cellspacing="0"><tbody><tr id="module529tr11"><td class="mixNewsTitle newsListLineBodyTd" valign="top"><div class="J_articlePhotoBox articlePhotoBox" newid="11" newsflag="0"><a class="J_articlePicHref articlePicLink1" href="http://www.ot13227318.icoc.me/nd.php?id=11&amp;_np=108_529" target="_blank" style="width:320px;height:184px;"><div class="cutImgPanel J_cutImgPanel newsListCutImgPanel1" style="bottom:-1.4890518px;"> <img class="J_newsListPic newsPic newsListNewsPic1" alt="文章附图" title="" src="/static/uploads/ima20.png" style="width:310.0px;height:181.0219px;"></div></a></div><div class="J_articleDesc newsListArticleDesc"><div class="J_newsTitle newsTitle newsListNewsTitle1" style="width: 100%;"><div class="J_newsListTopFlag  newsListTopFlag1"><a class="no-mixNewsStyleTitleTip" href="http://www.ot13227318.icoc.me/nd.php?id=11&amp;_np=108_529" target="_blank"></a></div><a hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=11&amp;_np=108_529" target="_blank" title="楼市上涨效应向二线传导:厦门信贷收紧 南京土地&quot;高烧&quot;" class="J_mixNewsStyleTitle fk-newsListTitle mixNewsStyleTitle " mix="1">楼市上涨效应向二线传导:厦门信贷收紧 南京土地"高烧"</a></div><p class="mixNewsStyleSummary fk-newsListSummary ">近日,住建部部长座谈会召开,对于“经济走势仍然分化,新旧发展动力的转换需要一个过程,新动力的成长势头正在加快”,有...</p>
</div></td>
</tr>
</tbody></table>
</div>
<div topclassname="top1" topswitch="on" newsid="10" newsname="北漂租房调查:月租跳涨千元 律师不愿接维权案" class="J_newsListLine line noHover   fk-newsLineHeight  newsListLine1" style="width: 310px; height: 340px;"><table id="lineBody10" class="J_lineBody lineBody" cellpadding="0" cellspacing="0"><tbody><tr id="module529tr10"><td class="mixNewsTitle newsListLineBodyTd" valign="top"><div class="J_articlePhotoBox articlePhotoBox" newid="10" newsflag="0"><a class="J_articlePicHref articlePicLink1" href="http://www.ot13227318.icoc.me/nd.php?id=10&amp;_np=108_529" target="_blank" style="width:320px;height:184px;"><div class="cutImgPanel J_cutImgPanel newsListCutImgPanel1" style="bottom:49.0px;"> <img class="J_newsListPic newsPic newsListNewsPic1" alt="文章附图" title="" src="/static/uploads/ima07.jpg" style="width:310.0px;height:282.0px;"></div></a></div><div class="J_articleDesc newsListArticleDesc"><div class="J_newsTitle newsTitle newsListNewsTitle1" style="width: 100%;"><div class="J_newsListTopFlag  newsListTopFlag1"><a class="no-mixNewsStyleTitleTip" href="http://www.ot13227318.icoc.me/nd.php?id=10&amp;_np=108_529" target="_blank"></a></div><a hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=10&amp;_np=108_529" target="_blank" title="北漂租房调查:月租跳涨千元 律师不愿接维权案" class="J_mixNewsStyleTitle fk-newsListTitle mixNewsStyleTitle " mix="1">北漂租房调查:月租跳涨千元 律师不愿接维权案</a></div><p class="mixNewsStyleSummary fk-newsListSummary ">“不租房不搬家，不足以谈北漂。”把最后一包行李拖进新租的房子，小段终于松了一口气。这是她来到北京三年第三次搬家，从...</p>
</div></td>
</tr>
</tbody></table>
</div>
<div topclassname="top1" topswitch="on" newsid="9" newsname="2016年广州中考普高提前批统一计划录取19860人" class="J_newsListLine line noHover   fk-newsLineHeight  newsListLine1" style="width: 310px; height: 340px;"><table id="lineBody9" class="J_lineBody lineBody" cellpadding="0" cellspacing="0"><tbody><tr id="module529tr9"><td class="mixNewsTitle newsListLineBodyTd" valign="top"><div class="J_articlePhotoBox articlePhotoBox" newid="9" newsflag="0"><a class="J_articlePicHref articlePicLink1" href="http://www.ot13227318.icoc.me/nd.php?id=9&amp;_np=108_529" target="_blank" style="width:320px;height:184px;"><div class="cutImgPanel J_cutImgPanel newsListCutImgPanel1" style="bottom:49.0px;"> <img class="J_newsListPic newsPic newsListNewsPic1" alt="文章附图" title="" src="/static/uploads/ima10.jpg" style="width:310.0px;height:282.0px;"></div></a></div><div class="J_articleDesc newsListArticleDesc"><div class="J_newsTitle newsTitle newsListNewsTitle1" style="width: 100%;"><div class="J_newsListTopFlag  newsListTopFlag1"><a class="no-mixNewsStyleTitleTip" href="http://www.ot13227318.icoc.me/nd.php?id=9&amp;_np=108_529" target="_blank"></a></div><a hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=9&amp;_np=108_529" target="_blank" title="2016年广州中考普高提前批统一计划录取19860人" class="J_mixNewsStyleTitle fk-newsListTitle mixNewsStyleTitle " mix="1">2016年广州中考普高提前批统一计划录取19860人</a></div><p class="mixNewsStyleSummary fk-newsListSummary ">7月12日，普通高中提前批统一计划录取结束。今年提前批统一计划为20270个，共录取19860人，其中公办学校19...</p>
</div></td>
</tr>
</tbody></table>
</div>
<div class="clearfloat"></div>
</div>
</div></div>
</td>
<td class="formMiddleRight formMiddleRight529"></td>
</tr></tbody></table>
<table class="formBottom formBottom529" cellpadding="0" cellspacing="0"><tbody><tr><td class="left left529"></td><td class="center center529"></td><td class="right right529"></td></tr></tbody></table>
<div class="clearfloat clearfloat529"></div>
</div>
</div></div>
<div class="clearfloat clearfloat388"></div>
</div></div>


		<wbr style="display:none;"></div>
		
		<table id="webContainerTable" class="webContainerTable" cellpadding="0" cellspacing="0">
			<tbody><tr>
				<td align="center">
					<div id="webContainer" class="webContainer">
						<div id="container" class="container">
	<table class="containerTop" cellpadding="0" cellspacing="0">
		<tbody><tr valign="top">
			<td class="left"></td>
			<td class="center"></td>
			<td class="right"></td>
		</tr>
	</tbody></table>

	<table class="containerMiddle" cellpadding="0" cellspacing="0">
		<tbody><tr valign="top">
			<td id="containerMiddleLeft" class="containerMiddleLeft">
					
					
					
					
			</td>

			<td class="containerMiddleCenter">
				<div id="containerMiddleCenterTop" class="containerMiddleCenterTop">
					
				</div>

				<div id="containerForms" class="containerForms">
					<div id="topForms" class="column forms mainForms topForms" style="display:none">
						
					</div>

					<table class="containerFormsMiddle" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<td valign="top" id="containerFormsLeft" class="containerFormsLeft" style="display:none">
								<div class="containerFormsLeftTop">
								</div>
								<div id="leftForms" class="column forms sideForms leftForms">
									
								</div>
								<div class="containerFormsLeftBottom">
								</div>
							</td>

							<td valign="top" id="containerFormsCenter" class="containerFormsCenter">
					
								<div id="centerTopForms" class="column forms mainForms centerTopForms">
									<div id="module385" _indexclass="formIndex1" _modulestyle="7" _moduleid="385" systempattern="110" class="form form385 formIndex1 formStyle7 jz-modulePattern110" title="" style="" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="1" _global="false" _independent="false">
<table class="formTop formTop385" cellpadding="0" cellspacing="0"><tbody><tr><td class="left"></td><td class="center"></td><td class="right"></td></tr></tbody></table>
<table class=" formMiddle formMiddle385" style="" cellpadding="0" cellspacing="0"><tbody><tr>
<td class="formMiddleLeft formMiddleLeft385"></td>
<td class="formMiddleCenter formMiddleCenter385 " valign="top">
<div class="formMiddleContent formMiddleContent385 fk-formContentOtherPadding" tabstyle="0">
<div>
<div class="newsList J_newsList  newsNewModuleStyle_three " id="newsList385" _showsetting="0" newslisttype="5" scroll="0">
<div topclassname="top1" topswitch="on" newsid="12" newsname="房产中介套路深 虚假宣传渗透交易每个环节" class="J_newsListLine line noHover g_item   fk-newsLineHeight   "><div class="J_newsCalendar newsCalendar newsListCalendar2" style="vertical-align:top;">
<a class="fk-newsListDate" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=12&amp;_np=108_385" target="_blank">2017/05/15</a>
</div>
<div id="lineBody12" class="J_lineBody lineBody newsListLineBody2"><div class="newsCircleOuter"><div class="newsCircle"></div>
</div>
<div class="newsTitlePanel">
<div class="J_newsTitle newsTitle" style="width: 100%;">
<div class="J_newsListTopFlag "></div>
<a class="fk-newsListTitle" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=12&amp;_np=108_385" target="_blank" title="房产中介套路深 虚假宣传渗透交易每个环节">房产中介套路深 虚假宣传渗透交易每个环节</a>
</div><div><p class="pic-mixNewsStyleSummary fk-newsListSummary">一套叫价1.4亿元的所谓“清朝格格府邸”近日成为链家等房产中介网站上的“网红”，甚至引来北京市文物局辟谣：并非登记...</p>
</div></div>
</div></div>
<div class="J_separatorLine separatorLine g_separator "></div>
<div topclassname="top1" topswitch="on" newsid="13" newsname="房企当下拿地 到底是&quot;馅饼&quot;还是&quot;陷阱&quot;？" class="J_newsListLine line noHover g_item   fk-newsLineHeight   "><div class="J_newsCalendar newsCalendar newsListCalendar2" style="vertical-align:top;">
<a class="fk-newsListDate" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=13&amp;_np=108_385" target="_blank">2017/05/15</a>
</div>
<div id="lineBody13" class="J_lineBody lineBody newsListLineBody2"><div class="newsCircleOuter"><div class="newsCircle"></div>
</div>
<div class="newsTitlePanel">
<div class="J_newsTitle newsTitle" style="width: 100%;">
<div class="J_newsListTopFlag "></div>
<a class="fk-newsListTitle" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=13&amp;_np=108_385" target="_blank" title="房企当下拿地 到底是&quot;馅饼&quot;还是&quot;陷阱&quot;？">房企当下拿地 到底是"馅饼"还是"陷阱"？</a>
</div><div><p class="pic-mixNewsStyleSummary fk-newsListSummary">统计显示，仅7月前10天，全国单幅地块成交金额超过5亿的地块达29宗，其中溢价率超50%的地王达18宗。一二线城市...</p>
</div></div>
</div></div>
<div class="J_separatorLine separatorLine g_separator "></div>
<div topclassname="top1" topswitch="on" newsid="10" newsname="北漂租房调查:月租跳涨千元 律师不愿接维权案" class="J_newsListLine line noHover g_item   fk-newsLineHeight   "><div class="J_newsCalendar newsCalendar newsListCalendar2" style="vertical-align:top;">
<a class="fk-newsListDate" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=10&amp;_np=108_385" target="_blank">2017/05/15</a>
</div>
<div id="lineBody10" class="J_lineBody lineBody newsListLineBody2"><div class="newsCircleOuter"><div class="newsCircle"></div>
</div>
<div class="newsTitlePanel">
<div class="J_newsTitle newsTitle" style="width: 100%;">
<div class="J_newsListTopFlag "></div>
<a class="fk-newsListTitle" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=10&amp;_np=108_385" target="_blank" title="北漂租房调查:月租跳涨千元 律师不愿接维权案">北漂租房调查:月租跳涨千元 律师不愿接维权案</a>
</div><div><p class="pic-mixNewsStyleSummary fk-newsListSummary">“不租房不搬家，不足以谈北漂。”把最后一包行李拖进新租的房子，小段终于松了一口气。这是她来到北京三年第三次搬家，从...</p>
</div></div>
</div></div>
<div class="J_separatorLine separatorLine g_separator "></div>
<div topclassname="top1" topswitch="on" newsid="14" newsname="二手房过户有什么需要准备的？" class="J_newsListLine line noHover g_item   fk-newsLineHeight   "><div class="J_newsCalendar newsCalendar newsListCalendar2" style="vertical-align:top;">
<a class="fk-newsListDate" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=14&amp;_np=108_385" target="_blank">2017/05/15</a>
</div>
<div id="lineBody14" class="J_lineBody lineBody newsListLineBody2"><div class="newsCircleOuter"><div class="newsCircle"></div>
</div>
<div class="newsTitlePanel">
<div class="J_newsTitle newsTitle" style="width: 100%;">
<div class="J_newsListTopFlag "></div>
<a class="fk-newsListTitle" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=14&amp;_np=108_385" target="_blank" title="二手房过户有什么需要准备的？">二手房过户有什么需要准备的？</a>
</div><div><p class="pic-mixNewsStyleSummary fk-newsListSummary">购买二手房办理过户是重中之重，往往很多纠纷都会出现在过户的环节，所以我们再购买二手房之前先了解一下购房过户手续的一...</p>
</div></div>
</div></div>
<div class="J_separatorLine separatorLine g_separator "></div>
<div topclassname="top1" topswitch="on" newsid="11" newsname="楼市上涨效应向二线传导:厦门信贷收紧 南京土地&quot;高烧&quot;" class="J_newsListLine line noHover g_item   fk-newsLineHeight   "><div class="J_newsCalendar newsCalendar newsListCalendar2" style="vertical-align:top;">
<a class="fk-newsListDate" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=11&amp;_np=108_385" target="_blank">2017/05/15</a>
</div>
<div id="lineBody11" class="J_lineBody lineBody newsListLineBody2"><div class="newsCircleOuter"><div class="newsCircle"></div>
</div>
<div class="newsTitlePanel">
<div class="J_newsTitle newsTitle" style="width: 100%;">
<div class="J_newsListTopFlag "></div>
<a class="fk-newsListTitle" hidefocus="true" href="http://www.ot13227318.icoc.me/nd.php?id=11&amp;_np=108_385" target="_blank" title="楼市上涨效应向二线传导:厦门信贷收紧 南京土地&quot;高烧&quot;">楼市上涨效应向二线传导:厦门信贷收紧 南京土地"高烧"</a>
</div><div><p class="pic-mixNewsStyleSummary fk-newsListSummary">近日,住建部部长座谈会召开,对于“经济走势仍然分化,新旧发展动力的转换需要一个过程,新动力的成长势头正在加快”,有...</p>
</div></div>
</div></div>
<div class="J_separatorLine separatorLine g_separator  newsListSeparatorLine "></div>
<div class="clearfloat"></div>
<div class="J_timeLine newsListTimeLine" style="height: 620px; left: 105.797px;"></div>
</div>
</div></div>
</td>
<td class="formMiddleRight formMiddleRight385"></td>
</tr></tbody></table>
<table class="formBottom formBottom385" cellpadding="0" cellspacing="0"><tbody><tr><td class="left left385"></td><td class="center center385"></td><td class="right right385"></td></tr></tbody></table>
<div class="clearfloat clearfloat385"></div>
</div>


								</div>
								<div class="containerFormsCenterMiddle J_containerFormsCenterMiddle">
									<div id="middleLeftForms" class="column forms mainForms middleLeftForms" style="display:none">
									
									</div>
									<div id="middleRightForms" class="column forms mainForms middleRightForms" style="display:none">
									
									</div>	
									<div class="clearfloat"></div>
								</div>
								<div id="centerBottomForms" class="column forms mainForms centerBottomForms" style="display:none">
									
								</div>
							</td>

							<td valign="top" id="containerFormsRight" class="containerFormsRight" style="display:none">
								<div class="containerFormsRightTop">
								</div>
								<div id="rightForms" class="column forms sideForms rightForms">
									
								</div>
								<div class="containerFormsRightBottom">
								</div>
							</td>
						</tr>
					</tbody></table>

					<div id="bottomForms" class="column forms mainForms bottomForms" style="display:none">
						
					</div>

					<div id="containerPlaceholder" class="containerPlaceholder"></div>
					
				</div>

				<div id="containerMiddleCenterBottom" class="containerMiddleCenterBottom">
				</div>

			</td>

			<td id="containerMiddleRight" class="containerMiddleRight"></td>
		</tr>
	</tbody></table>
	
	<table class="containerBottom" cellpadding="0" cellspacing="0">
		<tbody><tr valign="top">
			<td class="left"></td>
			<td class="center"></td>
			<td class="right"></td>
		</tr>
	</tbody></table>
</div>

					</div>
				</td>
			</tr>
		</tbody></table>		

		<div id="fullmeasureBottomForms" class="fullmeasureContainer forms fk-fullmeasureForms fullmeasureForms fullmeasureBottomForms" style="display: none;">
			
		<wbr style="display:none;"></div>
		
		<table class="absBottomTable" cellpadding="0" cellspacing="0">
			<tbody><tr>
				<td align="center">
					<div id="absBottomForms" class="forms sideForms absForms">
						<div style="position:absolute;"></div><!-- for ie6 -->
						
					</div>
				</td>
			</tr>
		</tbody></table>

		<table id="webFooterTable" class="webFooterTable" cellpadding="0" cellspacing="0">
			<tbody><tr>
				<td align="center" valign="top" class="fk-moduleZoneWrap">
					<div id="fk-webFooterZone" class="J_moduleZone fk-webFooterZone fk-moduleZone forms sideForms">
						<div class="fk-moduleZoneBg"></div>
						<div id="module555" bannertitle="图片" _indexclass="formIndex1" _modulestyle="79" _moduleid="555" class="form form555 formIndex1 formStyle79 formInZone " title="" style="position: absolute; top: 45px; left: 62px; width: 127px; height: 126px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent555"><div class="floatImg floatImg_J"><a hidefocus="true" class="J_floatImg_jump ">
								<div class="floatImgWrap"><img id="float_img_555" class="float_in_img J_defImage " src="/static/images/shadow-buy-house.png" style="height: 126px;"></div></a>
							</div></div>
						</div>

						<div id="module557" bannertitle="图片" _indexclass="formIndex2" _modulestyle="79" _moduleid="557" class="form form557 formIndex2 formStyle79 formInZone " title="" style="position: absolute; top: 44px; left: 368px; width: 127px; height: 126px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent557"><div class="floatImg floatImg_J"><a hidefocus="true" class="J_floatImg_jump ">
								<div class="floatImgWrap"><img id="float_img_557" class="float_in_img J_defImage " src="/static/images/shadow-sale-house.png" style="height: 126px;"></div></a>
							</div></div>
						</div>

						<div id="module558" bannertitle="图片" _indexclass="formIndex3" _modulestyle="79" _moduleid="558" class="form form558 formIndex3 formStyle79 formInZone " title="" style="position: absolute; top: 44px; left: 677px; width: 127px; height: 126px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent558"><div class="floatImg floatImg_J"><a hidefocus="true" class="J_floatImg_jump ">
								<div class="floatImgWrap"><img id="float_img_558" class="float_in_img J_defImage " src="/static/images/shadow-rent-house.png" style="height: 126px;"></div></a>
							</div></div>
						</div>

						<div id="module559" bannertitle="图片" _indexclass="formIndex4" _modulestyle="79" _moduleid="559" class="form form559 formIndex4 formStyle79 formInZone " title="" style="position: absolute; top: 45px; left: 977px; width: 126px; height: 126px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent559"><div class="floatImg floatImg_J"><a hidefocus="true" class="J_floatImg_jump ">
								<div class="floatImgWrap"><img id="float_img_559" class="float_in_img J_defImage " src="/static/images/shadow-manage-money.png" style="height: 126px;"></div></a>
							</div></div>
						</div>

						<div id="module560" bannertitle="文本" _indexclass="formIndex5" _modulestyle="86" _moduleid="560" class="form form560 formIndex5 formStyle86 formInZone  siteEditor " title="" style="position: absolute; top: 194px; left: 37px; width: 162px; height: 40px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent560"><div class="fk-editor simpleText fk-editor-break-word "><span style="color: rgb(255, 255, 255); font-size: 16px; text-align: center; display: block;">Buy-House</span></div></div>
						</div>

						<div id="module561" bannertitle="文本" _indexclass="formIndex6" _modulestyle="86" _moduleid="561" class="form form561 formIndex6 formStyle86 formInZone  siteEditor " title="" style="position: absolute; top: 194px; left: 326px; width: 202px; height: 40px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent561"><div class="fk-editor simpleText fk-editor-break-word "><span style="color: rgb(255, 255, 255); font-size: 16px; text-align: center; display: block;">Sale-House</span></div></div>
						</div>

						<div id="module562" bannertitle="文本" _indexclass="formIndex7" _modulestyle="86" _moduleid="562" class="form form562 formIndex7 formStyle86 formInZone  siteEditor " title="" style="position: absolute; top: 195px; left: 646px; width: 202px; height: 40px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent562"><div class="fk-editor simpleText  "><span style="color: rgb(255, 255, 255); font-size: 16px; text-align: center; display: block;">Rent-Wanted</span></div></div>
						</div>

						<div id="module563" bannertitle="文本" _indexclass="formIndex8" _modulestyle="86" _moduleid="563" class="form form563 formIndex8 formStyle86 formInZone  siteEditor " title="" style="position: absolute; top: 195px; left: 944px; width: 202px; height: 40px;" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _autoheight="0" _global="false" _independent="false">
							<div class="lightModuleOuterContent lightModuleOuterContent563"><div class="fk-editor simpleText  "><span style="color: rgb(255, 255, 255); font-size: 16px; text-align: center; display: block;">Manage-Money</span></div></div>
						</div>


					</div>
					<div id="webFooter" class="webFooter">
						<div id="footer" class="footer">
							<table class="footerTop" cellpadding="0" cellspacing="0">
								<tbody>
								<tr valign="top">
									<td class="topLeft"></td>
									<td class="topCenter"></td>
									<td class="topRight"></td>
								</tr>
								</tbody>
							</table>
							<table class="footerMiddle" cellpadding="0" cellspacing="0">
								<tbody>
								<tr valign="top">
									<td class="middleLeft"></td>
									<td class="middleCenter" align="center" width="100%">
										<div class="footerContent" style="display: flex;">
											<div style="margin: auto;">
												<div class="footerInfo">
													<p>Copyright<font face="Arial">©</font>2017-2017 活着的房 版权所有</p>
												</div>
												<div class="footerSupport" id="footerSupport">
												<span class="footerMobile">
													<a hidefocus="true" href="http://www.alivehouse.com/" target="_blank">手机版</a>
												</span>
													<span class="footerSep">|</span>
													<span id="footerbeian">
													<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=XXX" style="display:inline-block;text-decoration:none;height:20px;line-height:20px; margin-right:5px;">
														<img src="/static/images/beianIcon.png" width="20" height="20" />
														<span style="height:20px;line-height:20px;margin: 0px 5px 0px 0px; color:#898989;"> 备案信息 </span>
													</a>
												</span>
													<span id="footerbeianinfo">
													<a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">
														<span style="height:20px;line-height:20px;margin: 0px 5px 0px 0px; color:#898989;"> XXX </span>
													</a>
												</span>

													<span class="footerSep">|</span>
													<span id="footerLogin" class="footerLogin">
													<a name="popupLogin" hidefocus="true" href="/" onclick="Fai.closeTip(&quot;#footerLogin&quot;);">登录</a>
												</span>
													<span class="bgplayerButton" id="bgplayerButton" style="display:none;"></span>
												</div>
											</div>
										</div>
									</td>
									<td class="middleRight"></td>
								</tr>
								</tbody>
							</table>

							<table class="footerBottom" cellpadding="0" cellspacing="0">
								<tbody><tr valign="top">
									<td class="bottomLeft"></td>
									<td class="bottomCenter"></td>
									<td class="bottomRight"></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>

				</td>
			</tr>
			</tbody></table>

		<div class="clearfloat"></div>
	</div>	
</div>



	<!-- fixed Left-Top -->
	<div class="floatLeftTop" style="top: 0px;">
		<div id="floatLeftTopForms" class="forms sideForms floatForms">

		</div>
	</div>

	<!-- fixed Right-Top -->
	<div class="floatRightTop" style="top: 0px;">
		<div id="floatRightTopForms" class="forms sideForms floatForms">

		</div>
	</div>

	<!-- fixed Left-Bottom -->
	<div class="floatLeftBottom">
		<div id="floatLeftBottomForms" class="forms sideForms floatForms">

		</div>
	</div>

	<!-- fixed Right-Bottom -->
	<div class="floatRightBottom">
		<div id="floatRightBottomForms" class="forms sideForms floatForms">

		</div>
	</div>

	<!-- background music -->
	<div id="bgMusic" class="bgMusic"></div>

	<!-- Load Core CSS -->

	<!-- Load Core JS -->
	<script type="text/javascript" src="/static/js/home/jquery-core.min.js"></script>
	<script type="text/javascript" src="/static/js/home/jquery-mousewheel.min.js"></script>
	<script type="text/javascript" src="/static/js/home/fai.min.js"></script>
	<script type="text/javascript" src="/static/js/home/jquery-ui-core.min.js"></script>
	<script type="text/javascript" src="/static/js/home/site.min.js"></script>
	<script type="text/javascript" src="/static/js/home/messageConfig.js"></script>

	<!-- define Core JS -->
	<script type="text/javascript">


        function showYuanDanWindow(){
            var hasShowYuanDanLuckyGuy = $.cookie("hasShowYuanDanLuckyGuy",{path:"/"});
            var _hasGetYuanDanLuckyGuy_ = $.cookie("_hasGetYuanDanLuckyGuy_",{path:"/"});
            var _openbigImg = false;

            if(_openbigImg == true){
                if(hasShowYuanDanLuckyGuy == 'true' || _hasGetYuanDanLuckyGuy_ != 'true' ){
                    Site.isShowThreeDaysLuckyGuy = "true";
                    Site.isTenMinutes = 'true';
                    $.cookie("hasShowYuanDanLuckyGuy",false,{path:"/"});
                    Site.drawLottery();
                }else{

                    Site.sendResult2();
                }
            }
        }



        var fk_sale = new Object();
        fk_sale.cid = 13775917;
        fk_sale.siteVer = 10;
        fk_sale.popupWindowSiteVer = 10;
        fk_sale.isLuckyGuyFlag = false;
        fk_sale.popupWindowEndYear = 2017;
        fk_sale.popupWindowEndMonth = 5;
        fk_sale.popupWindowEndDay = 31;
        fk_sale.popupWindowDays = 15;
        fk_sale.popupWindowMs = 1346686515;
        fk_sale.openDays = 0;
        fk_sale.openMinutes = 1402;
        fk_sale.popupWindowEndSignupHours = 720.0;
        fk_sale.url = 'http://www.faisco.cn/portal.php#appId=shop';
        fk_sale.showDomainWindowFlag = false;
        fk_sale.cacct = 'ot13227318';
        fk_sale.imgBigSrc = 'http://jz.faisys.com/image/pro/20170101/salesPromotion.png?v=201701101133';
        fk_sale.imgBigBtn = 'http://jz.faisys.com/image/pro/20170101/btn_buy.png?v=201701101133';
        fk_sale.imgClose = 'http://jz.faisys.com/image/pro/20170101/close.png?v=201701101133';
        fk_sale.siteFirstLogin = true;
        fk_sale.isShowAdvertisementWindowThreeMinute = false;
        fk_sale.textUrl = 'http://www.faisco.cn/portal.php#appId=shop';
        fk_sale.domainImgBigBg = 'http://jz.faisys.com/image/pro/20160101/domainSearchImg.png';
        fk_sale.domainImgClose = 'http://jz.faisys.com/image/pro/20160101/close.png?v=201601181937';
        fk_sale.siteBizBigClose = 'http://jz.faisys.com/image/pro/20160701/close_popup.png';
        fk_sale.siteBizBigBg = 'http://jz.faisys.com/image/pro/20160701/popup02.png';
        fk_sale.showSiteBizWindow = false;
        fk_sale.showSitePopWindow = false;
        fk_sale.openFlyer = false;


	</script>

	<script type="text/javascript">
        // 为了避免用户误操作，在域名结尾输入多余字符导致cookie失效问题，这里校验一下浏览器的host是否与后台拿到的host一致
        //if (window.location.host != 'www.ot13227318.icoc.me') { window.location.href = 'http://' + 'www.ot13227318.icoc.me'; }
        //console.log(window.location.host.lastIndexOf("."));
        var _jsErrCahche = [];
        window.onerror = function(sMsg,sUrl,sLine){
            if (typeof Site == 'undefined') {
                alert('您的网页未加载完成，请尝试按“CTRL+功能键F5”重新加载。');
            }
            if( sLine < 1 || typeof sMsg != 'string' || sMsg.length < 1 ){
                return;
            }

            var log = "Error:" + sMsg + ";Line:" + sLine + ";Url:" + sUrl;
            var alertLog = "Error:"+sMsg+"\n" + "Line:" + sLine + "\n" + "Url:" + sUrl + "\n";
            var encodeUrl = function (url){
                return typeof url === "undefined" ? "" : encodeURIComponent(url);
            };

            var ajax = true;
            var obj = { 'm' : sMsg, 'u' : sUrl, 'l' : sLine };
            for( var i = 0; i < _jsErrCahche.length; i ++ ){
                if( _jsErrCahche[i].m == obj.m && _jsErrCahche[i].u == obj.u && _jsErrCahche[i].l == obj.l  ){
                    ajax = false;
                    break;
                }
            }

            if( ajax ){
                _jsErrCahche.push( obj );
                _faiAjax.ajax({
                    type	: "post",
                    url		: "ajax/logJsErr_h.php?cmd=jsErr",
                    data	: 'msg='+ encodeUrl(log)
                });
            }
            if(false){
                alert( alertLog );
            }
        };


        Fai.top = window;
        var bgmCloseToOpen = false;
        var _debug = false;
        var _isPre = false;
        var _devMode = false;
        var _colOtherStyleData = {"independentList":[],"y":0,"h":0,"layout4Width":0,"layout5Width":0};						// 当前页面的数据
        var _templateOtherStyleData = {"independentList":[],"h":540,"y":0,"layout4Width":0,"layout5Width":0};						// 全局的数据


        var _templateDefLayout = {BANNER_NAV:0,NAV_FLOAT:1,LEFT_NAV_BANNER_RIGHT_HIDE:3,LEFT_NAV_CENTER_BANNER_RIGHT_HIDE:4,LEFT_BANNER_NAV_RIGHT_HIDE:5,LEFT_NAV_EXPEND_CENTER_BANNER:6,CENTER_TOP_BANNER_RIGHT_HIDE:7,LEFT_HIDE_CENTER_TOP_BANNER:8,NAV_FLOAT_ON_BANNER:9,NAV_BANNER:10};


        $(function() {






            //Site.changeTheLogoSize();
            Site.showOrHideMailBox();




            Site.loginSiteInit('ot13227318','faisco.cn', false,"");

            //topBarMember





            // 绑定退出事件
            Site.bindBeforeUnloadEvent(false, false, false);

            Site.initTemplateLayout(_templateDefLayout.NAV_FLOAT, true, false );
            // spider统计






            // ajax统计
            Site.total({colId:108, pdId:-1, ndId:-1, sc:0, rf:"/home/house/newhouse.html"});
            //前端性能数据上报
            //Site.report();
            //保留旧用户的初始化版式区域4 和区域5 中，区域4的padding-right空间
            Site.colLayout45Width();
            //各个模块inc吐出脚本
            Site.initCorpTitleJump();
            Site.initBanner({"_open":true,"data":[{"title":"","desc":"","imgWidth":1920,"imgHeight":300,"ot":1,"src":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo7uW9nwYwgA84rAI.jpg","edgeLeft":"","edgeRight":""}],"width":1920,"height":300,"playTime":4000,"animateTime":1500,"from":"banner","btnType":1,"wideScreen":false}, {"_open":false}, 4);
            Site.loadNewsList(529, {"y":0,"s":0,"w":1}, false);
            Site.loadNewsNewStyle(529, false,false,false,true,false,true,false,false,false);

            Site.setFullMeasureBgHightInIe6( 388);;$(function(){Site.inFullmeasueAnimation.animateFm(388,0,1,{"c":0,"d":4.0,"s":1.0});});
            Site.loadNewsList(385, {"y":0,"s":0,"w":1}, false);
            Site.loadNewsNewStyle(385, false,false,false,true,true,false,false,false,false);

            jzUtils.run({ "name": "ImageEffect.FUNC.BASIC.Init", "callMethod": true }, {"moduleId": 555, "imgEffOption": {"effType":1,"borderType":false,"borderColor":"#000","borderWidth":1,"borderStyle":1,"hoverPicPath":"http://0.ss.faisys.com/image/floatImgHoverDef.png","openHoverPic":false,"isFontIcon":false,"ishovFont":false,"hovFont":"faisco-icons-contact2","hovFontColor":"#222222","picPath":"http://10428547.s61i.faiusr.com/4/shadow-buy-house.png","isInit":false}, "tagetOption": {"targetParent":"floatImg_J","target":"floatImg_J"}, "callback": Site.createImageEffectContent_photo, "callbackArgs": []});
            jzUtils.run({ "name": "ImageEffect.FUNC.BASIC.Init", "callMethod": true }, {"moduleId": 557, "imgEffOption": {"effType":1,"borderType":false,"borderColor":"#000","borderWidth":1,"borderStyle":1,"hoverPicPath":"http://0.ss.faisys.com/image/floatImgHoverDef.png","openHoverPic":false,"isFontIcon":false,"ishovFont":false,"hovFont":"faisco-icons-contact2","hovFontColor":"#222222","picPath":"http://10428547.s61i.faiusr.com/4/shadow-sale-house.png","isInit":false}, "tagetOption": {"targetParent":"floatImg_J","target":"floatImg_J"}, "callback": Site.createImageEffectContent_photo, "callbackArgs": []});
            jzUtils.run({ "name": "ImageEffect.FUNC.BASIC.Init", "callMethod": true }, {"moduleId": 558, "imgEffOption": {"effType":1,"borderType":false,"borderColor":"#000","borderWidth":1,"borderStyle":1,"hoverPicPath":"http://0.ss.faisys.com/image/floatImgHoverDef.png","openHoverPic":false,"isFontIcon":false,"ishovFont":false,"hovFont":"faisco-icons-contact2","hovFontColor":"#222222","picPath":"http://10428547.s61i.faiusr.com/4/shadow-rent-house.png","isInit":false}, "tagetOption": {"targetParent":"floatImg_J","target":"floatImg_J"}, "callback": Site.createImageEffectContent_photo, "callbackArgs": []});
            jzUtils.run({ "name": "ImageEffect.FUNC.BASIC.Init", "callMethod": true }, {"moduleId": 559, "imgEffOption": {"effType":1,"borderType":false,"borderColor":"#000","borderWidth":1,"borderStyle":1,"hoverPicPath":"http://0.ss.faisys.com/image/floatImgHoverDef.png","openHoverPic":false,"isFontIcon":false,"ishovFont":false,"hovFont":"faisco-icons-contact2","hovFontColor":"#222222","picPath":"http://10428547.s61i.faiusr.com/4/shadow-manage-money.png","isInit":false}, "tagetOption": {"targetParent":"floatImg_J","target":"floatImg_J"}, "callback": Site.createImageEffectContent_photo, "callbackArgs": []});








            Site.initPage();	// 这个要放在最后，因为模块组初始化时会把一些模块隐藏，导致没有高度，所以要放最后执行




            setTimeout(afterModuleLoaded, 0);






            Site.triggerGobalEvent("siteReadyLoad");



        });

        function afterModuleLoaded() {

            Site.initPage2();



            //Site.mallCartInit(_colId);
            //Site.mobiWebInit();






        } // afterModuleLoaded end

        var _lcid = 2052;
        var _siteDomain = 'http://www.ot13227318.icoc.me';
        var _resRoot = 'http://0.ss.faisys.com';
        var _colId = 108;
        var _fromColId = -1;
        var _designAuth = false;
        var _manageMode = false;
        var _oem = false;
        var _siteVer = 10;
        var _manageStatus = false;
        var _webRightBar = false;
        var _isMemberLogin = false;// 会员是否登陆了



        var nav2SubMenu=[];
        var nav109SubMenu=[];
        var nav106SubMenu=[];
        var nav105SubMenu=[];
        var nav108SubMenu=[{"hidden":false,"colId":9,"href":"/home/contact/contact.html","target":" target='_self'","colName":"Contact","html":"<span class='itemName0'>Contact<\/span>","title":"","onclick":"return true;"}];

        var _customBackgroundData = {"id":"","sw":1200,"bBg":{"c":"#000","f":"","r":3,"p":"","y":0},"cBg":{"c":"#000","f":"","r":3,"p":"","y":0},"cmBg":{"c":"#000","f":"","r":3,"p":"","y":0},"s":true,"h":false,"r":3,"o":"","e":0,"wbh":-1,"wbw":-1,"clw":-1,"crw":-1,"wbws":-1,"wbs":0,"p":"","bm":{},"cm":{},"cp":{"y":0}};          //自定义的数据
        var _templateBackgroundData = {"id":"","bBg":{"c":"#000","f":"","r":3,"p":"","y":0},"cBg":{"c":"#000","f":"","r":3,"p":"","y":0},"cmBg":{"c":"#000","f":"","r":3,"p":"","y":0},"sw":1200,"s":true,"h":false,"r":3,"o":"","e":0,"wbh":-1,"wbw":-1,"clw":-1,"crw":-1,"wbws":-1,"wbs":1,"p":"","bm":{},"cm":{},"cp":{"y":0}};// 模版的数据

        var _templateBannerData = {"ce":{},"pl":0,"l":[{"i":"AD0Ig8H8BBACGAAg8eaUwgUo0MSLnQUwgA84jAY","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo0MSLnQUwgA84jAY.jpg","w":1920,"h":780,"tp":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo0MSLnQUwgA84jAY!100x100.jpg"},{"i":"AD0Ig8H8BBACGAAg8eaUwgUolPudngQwgA84jAY","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUolPudngQwgA84jAY.jpg","w":1920,"h":780,"tp":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUolPudngQwgA84jAY!100x100.jpg"},{"i":"AD0Ig8H8BBACGAAg7OaUwgUogKCStwUwgA84jAY","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg7OaUwgUogKCStwUwgA84jAY.jpg","w":1920,"h":780,"tp":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg7OaUwgUogKCStwUwgA84jAY!100x100.jpg"}],"n":[{"t":1,"i":"AD0Ig8H8BBACGAAg7OaUwgUogKCStwUwgA84jAY","e":0,"u":"","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg7OaUwgUogKCStwUwgA84jAY.jpg","w":1920,"h":780,"el":"","er":""},{"t":1,"i":"AD0Ig8H8BBACGAAg8eaUwgUo0MSLnQUwgA84jAY","e":0,"u":"","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo0MSLnQUwgA84jAY.jpg","w":1920,"h":780,"el":"","er":""}],"s":4,"bt":0,"at":2,"i":4000,"a":1500,"h":false,"o":false,"t":1,"p":0,"pt":0,"ws2":false,"f":{},"c":3,"ws":false};		// 模版的数据

        var _pageBannerData = {"ce":{},"pl":0,"l":[{"i":"AD0Ig8H8BBACGAAg8eaUwgUo7uW9nwYwgA84rAI","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo7uW9nwYwgA84rAI.jpg","w":1920,"h":300,"tp":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo7uW9nwYwgA84rAI!100x100.jpg"},{"i":"AD0Ig8H8BBACGAAg7uaUwgUo_o-FiwUwgA84rAI","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg7uaUwgUo_o-FiwUwgA84rAI.jpg","w":1920,"h":300,"tp":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg7uaUwgUo_o-FiwUwgA84rAI!100x100.jpg"},{"i":"AD0Ig8H8BBACGAAg6eaUwgUox5jZ4gMwgA84rAI","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg6eaUwgUox5jZ4gMwgA84rAI.jpg","w":1920,"h":300,"tp":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg6eaUwgUox5jZ4gMwgA84rAI!100x100.jpg"}],"n":[{"t":1,"i":"AD0Ig8H8BBACGAAg8eaUwgUo7uW9nwYwgA84rAI","e":0,"u":"","p":"http://10428547.s61i.faiusr.com/2/AD0Ig8H8BBACGAAg8eaUwgUo7uW9nwYwgA84rAI.jpg","w":1920,"h":300,"el":"","er":""}],"s":4,"i":4000,"a":1500,"h":false,"o":false,"t":1,"p":0,"pt":0,"bt":1,"ws2":false,"f":{},"c":3,"at":0,"ws":false};					// 当前页面的自定义数据（页面独立样式设置）
        var _bannerData = _pageBannerData;

        var _useTemplateHeaderZone = true;				// 是否使用全局模版
        var _useTemplateFooterZone = true;				// 是否使用全局模版

        var _mallOpen = false;
        var _couponOpen = false

        var toolBoxShowView = false;
        var toolBoxShowSet = false;


        var _navStyleData = {"no":true,"s":0,"ns":{"w":601,"h":-1},"cs":{"w":601,"h":-1},"np":{},"ncp":{"y":1,"t":45,"r":-1,"b":-1,"l":493,"hl":351,"ht":80},"cp":{"y":0,"t":-1,"l":-1},"nis":{"w":-1,"h":-1},"gt":{"f":"微软雅黑","s":16,"w":0,"c":"#4d4d4d","y":0},"ht":{"c":"#ffffff","y":0},"nb":{"c":"#000","f":"","r":0,"p":"","y":0},"cb":{"c":"#000","f":"","r":0,"p":"","y":0},"nib":{"c":"#000","r":0,"f":"","p":"","y":0},"nihb":{"c":"#fe8300","f":"AD0Ig8H8BBAEGAAg6_aUwgUotIO4ggEwZDgo","r":-1,"p":"http://10428547.s61i.faiusr.com/4/AD0Ig8H8BBAEGAAg6_aUwgUotIO4ggEwZDgo.png","y":0},"niss":{"w":-1,"h":-1},"nisb":{"c":"#000","r":0,"f":"","p":"","y":0},"nsigt":{"f":"微软雅黑","s":16,"w":0,"c":"#ffffff","ta":0,"y":0},"nsiht":{"c":"#ffffff","y":0},"nsis":{"w":-1,"h":-1},"nsib":{"c":"#fe8300","r":0,"f":"","p":"","y":0},"nsihb":{"c":"#ff9626","r":0,"f":"","p":"","y":0},"nsiho":0,"nmove":1,"v":2,"ntf":{"t":0,"ht":0},"nsmt":{},"nsmb":{},"nrs":{"n":{"t":0},"c":{"t":0},"i":{"t":0},"smt":{"t":0},"smb":{"t":0},"si":{"t":0},"is":{"t":0},"sis":{"t":0},"tmt":{"t":0},"tmb":{"t":0},"ti":{"t":0},"tis":{"t":0}},"nsw":{"n":{"t":0},"c":{"t":0},"i":{"t":0},"sm":{"t":0},"si":{"t":0},"is":{"t":0},"sis":{"t":0}},"nbr":{"n":{"t":0},"i":{"t":0},"sm":{"t":0},"si":{"t":0},"is":{"t":0},"sis":{"t":0},"tm":{"t":0},"ti":{"t":0},"tis":{"t":0}},"ntmt":{},"ntmb":{}};				      // 栏目导航样式
        var _navHidden =false;                                  //true:隐藏；flase：显示
        var _siteDemo = false;



        var _backToTop = true;
        var _aid = 13775917;
        var _templateLayout = _templateDefLayout.NAV_FLOAT;
        var _webBannerHeight = -1;
        var _isTemplateVersion2 = true;
        var _uiMode= false;

        var _choiceCurrencyVal = "￥";
        var _moduleAnimationPercent = -1;

        var _useTemplateBackground = true;		// 是否使用模版



	</script>

	<script type="text/javascript">

        var fk_old_onload = window.onload;
        window.onload = function(){




            Site.cacheModuleFunc.runSiteInit();


            if(typeof fk_old_onload == "function"){
                fk_old_onload.apply(this, arguments);
            }




            Site.pageOnload();





        };



        Site.beforeUnloadFunc();






        $LAB.script("http://1.ss.faisys.com/js/photoSlide.min.js?v=201702271724");
        $LAB.script("http://1.ss.faisys.com/js/imageEffect.min.js?v=201703131745")
            .wait(function () {
                jzUtils.trigger({
                    "name": "ImageEffect.FUNC.BASIC.Init",
                    "base":Site
                });
            });








	</script>


</body></html>
<!-- 右侧主体内容结束 -->