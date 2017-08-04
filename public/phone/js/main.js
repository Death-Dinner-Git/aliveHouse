//控制比例大小
(function() {
	var b = document.documentElement,
		a = function() {
			var a = b.getBoundingClientRect().width;
			b.style.fontSize = 0.0625 * (640 <= a ? 640 : a) + "px"
		},
		c = null;
	window.addEventListener("resize", function() {
		clearTimeout(c);
		c = setTimeout(a, 300)
	});
	a()
})();
mui.init();
/*滚动*/
(function($) {
	//阻尼系数
	var deceleration = mui.os.ios ? 0.003 : 0.0009;
	$('.mui-scroll-wrapper').scroll({
		bounce: false,
		indicators: true, //是否显示滚动条
		deceleration: deceleration
	});
})(mui);
mui('.mui-scroll-wrapper').on('tap','a' ,function(){location.href = this.getAttribute('href')})
	mui('.mui-scroll-wrapper').scroll({
				scrollY: true, //是否竖向滚动
				scrollX: false, //是否横向滚动
				startX: 0, //初始化时滚动至x
				startY: 0, //初始化时滚动至y
				indicators: true, //是否显示滚动条
				deceleration:0.0006, //阻尼系数,系数越小滑动越灵敏 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
				bounce: true //是否启用回弹
				});
			mui('.mui-scroll-wrapper').on('tap', '#top',foo_1);
			function foo_1(){
			mui('.mui-scroll-wrapper').scroll().scrollTo(0,0,1000);//100毫秒滚动到顶
			}
			
mui.init();
			mui('.mui-scroll-wrapper').scroll({
				scrollY: true, //是否竖向滚动
				scrollX: false, //是否横向滚动
				startX: 0, //初始化时滚动至x
				startY: 0, //初始化时滚动至y
				indicators: true, //是否显示滚动条
				deceleration:0.0006, //阻尼系数,系数越小滑动越灵敏 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
				bounce: true //是否启用回弹
				});
			mui('.zhu').on('tap', '#top',foo_1);
			function foo_1(){
			mui('.zhu').scroll().scrollTo(0,0,100);//100毫秒滚动到顶
			}
			 //侧滑容器父节点
			var offCanvasWrapper = mui('#offCanvasWrapper');
			 //主界面容器
			var offCanvasInner = offCanvasWrapper[0].querySelector('.mui-inner-wrap');
			 //菜单容器
			var offCanvasSide = document.getElementById("offCanvasSide");
			if (!mui.os.android) {
				
				var spans = document.querySelectorAll('.android-only');
				for (var i = 0, len = spans.length; i < len; i++) {
					spans[i].style.display = "none";
				}
			}
			 //移动效果是否为整体移动
			var moveTogether = false;
			 //侧滑容器的class列表，增加.mui-slide-in即可实现菜单移动、主界面不动的效果；
			var classList = offCanvasWrapper[0].classList;
			 //变换侧滑动画移动效果；
			mui('.mui-input-group').on('change', 'input', function() {
				if (this.checked) {
					offCanvasSide.classList.remove('mui-transitioning');
					offCanvasSide.setAttribute('style', '');
					classList.remove('mui-slide-in');
					classList.remove('mui-scalable');
					switch (this.value) {
						case 'main-move':
							if (moveTogether) {
								//仅主内容滑动时，侧滑菜单在off-canvas-wrap内，和主界面并列
								offCanvasWrapper[0].insertBefore(offCanvasSide, offCanvasWrapper[0].firstElementChild);
							}
							break;
						case 'main-move-scalable':
							if (moveTogether) {
								//仅主内容滑动时，侧滑菜单在off-canvas-wrap内，和主界面并列
								offCanvasWrapper[0].insertBefore(offCanvasSide, offCanvasWrapper[0].firstElementChild);
							}
							classList.add('mui-scalable');
							break;
						case 'menu-move':
							classList.add('mui-slide-in');
							break;
						case 'all-move':
							moveTogether = true;
							//整体滑动时，侧滑菜单在inner-wrap内
							offCanvasInner.insertBefore(offCanvasSide, offCanvasInner.firstElementChild);
							break;
					}
					offCanvasWrapper.offCanvas().refresh();
				}
			});
//			 //主界面‘显示侧滑菜单’按钮的点击事件
//			document.getElementById('offCanvasShow').addEventListener('tap', function() {
//				offCanvasWrapper.offCanvas('show');
//			});
//			 //菜单界面，‘关闭侧滑菜单’按钮的点击事件
//			document.getElementById('offCanvasHide').addEventListener('tap', function() {
//				offCanvasWrapper.offCanvas('close');
//			});
			 //主界面和侧滑菜单界面均支持区域滚动；
			mui('#offCanvasSideScroll').scroll();
			mui('#offCanvasContentScroll').scroll();
			 //实现ios平台原生侧滑关闭页面；
			if (mui.os.plus && mui.os.ios) {
				mui.plusReady(function() { //5+ iOS暂时无法屏蔽popGesture时传递touch事件，故该demo直接屏蔽popGesture功能
					plus.webview.currentWebview().setStyle({
						'popGesture': 'none'
					});
				});
			}
			