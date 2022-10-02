window.onload = function() {
	var wrap = document.getElementsByClassName("wrap")[0];
	var uls = document.getElementsByClassName("sbody")[0];
	var hand = document.getElementsByClassName("hand")[0];
	var food = document.getElementsByClassName("food")[0]; //食物
	var lis = document.getElementsByTagName("li");
	var fens = document.getElementById("fens");

	//让头部动起来
	//判断方向的标志
	var handT = false; //ture上false下
	var handL = false; //ture左false右

	//控制定时器频率的
	var seep = 200;

	//键盘方向标志
	var handCt = false; //t被按f没有

	var handTop = 180,
		handLeft = 180; //初始值
	var stime;
	//本体和框架的宽高
	var handW = 30,
		handH = 30;
	var wrapW = 900,
		wrapH = 600;
	hand.style.top = handTop + "px";
	hand.style.left = handLeft + "px";

	//食物闪动
	setInterval(function() {
			if(food.style.opacity == "1") {
				food.style.opacity = "0.3";
			} else {
				food.style.opacity = "1";
			}
		}, 600)
		//存储身体各位置数组

	//存储位置数组
	var arrL = [];
	var arrT = [];

	function handMove() {
		stime = setInterval(function() {

			foodPingk();
			//-----sbody位置刷新函数,要写在hand位置获得之前才行
			//不然会重叠，因为是每次头部最后再移动位移就会先跑到前面了
			for(var i = lis.length - 1; i > 0; i--) {
				lis[i].style.left = lis[i - 1].style.left;
				lis[i].style.top = lis[i - 1].style.top;
			}
			//判断键盘上上下按键
			if(handCt) {

				if(handT) {
					if(handTop <= 0) { //边缘碰撞检测
						handTop = wrapH - handH;
					} else {
						handTop -= 30;
					}
				} else {
					if(handTop >= (wrapH - handH)) {

						handTop = 0;
					} else {
						handTop += 30;
					}
				}
				//				console.log(handTop);
				hand.style.top = handTop + "px";
			} else {

				if(handL) {
					if(handLeft <= 0) {
						handLeft = wrapW - handW;
					} {
						handLeft -= 30;
					}
				} else {
					if(handLeft >= (wrapW - handW)) {
						handLeft = 0;
					} else {
						handLeft += 30;
					}
				}
				//				console.log(handLeft);
				hand.style.left = handLeft + "px";
			}

			//存储位置数组
			arrL = [];
			arrT = [];
			for(var i = 0; i < lis.length; i++) {
				arrL.push(lis[i].style.left);
				arrT.push(lis[i].style.top);
			}
			console.log(arrL);
			console.log(arrT);
			//是否自杀了
			zisha();

		}, seep)
	}

	//判断是否撞到自己的函数
	function zisha() {
		//如果数组头部第一个和arrT、arrL里其他重复就是是叠加了
		for(var i = 1; i < arrT.length; i++) {
			if(arrT[0] == arrT[i] && arrL[0] == arrL[i]) {

				fens.innerHTML = "游戏结束：" + fen + "分<br/>点击任意键返回";
				uls.style.zIndex = "0";

				fen = 0;
				fens.style.fontSize = "100px";
				fens.style.lineHeight = "120px";
				clearInterval(stime);
				uls.style.opacity = "0.2";

				document.addEventListener("keydown", function() {
					//点击任意键返回
					location.reload();
				}, false)

			}
		}

	}

	//------随机产生的食物的位置
	function getRandom(min, max) {
		return Math.floor(Math.random() * (max - min) + min);
	}
	//宽度30个，高度20个
	function foods() {
		//		food.style.backgroundColor = "rgba(" + getRandom(0, 255) + "," + getRandom(0, 255) + "," + getRandom(0, 255) + ",1)";
		var foodRandomT = getRandom(0, 20);
		var foodRandomL = getRandom(0, 30);
		//不把食物在身体上
		for(var i = 0; i < arrT.length; i++) {
			while(foodRandomT == arrT[i] && foodRandomL == arrL[i]) {
				foodRandomT = getRandom(0, 20);
				foodRandomL = getRandom(0, 30);
				i = 0;
			}
		}

		food.style.top = foodRandomT * 30 + "px";
		food.style.left = foodRandomL * 30 + "px";

	}
	foods();
	//-----本体碰撞框内检测
	function sbodyPingk() {

		//碰到上下检测
		if(handTop <= 0) {
			handTop = wrapH - handH;
		} else if(handTop >= (wrapH - handH)) {

			handTop = 0;
		}
		//碰到左右检测
		if(handLeft <= 0) {
			handLeft = wrapW - handW;
		} else if(handLeft >= (wrapW - handW)) {
			handLeft = 0;
		}
	}
	//-----食物碰撞监测
	var fen = 0;

	function foodPingk() {
		var foodW = 30,
			foodH = 30;
		var foodLeft = food.offsetLeft;
		var foodTop = food.offsetTop;
		var foodRight = foodLeft + foodW;
		var foodBottom = foodTop + foodH;
		//碰撞情况,完全重叠

		if(foodLeft == handLeft && handTop == foodTop) {
			shuaxin();
		}

	}
	//刷新的函数
	function shuaxin() {
		foods();

		if(fens.style.fontSize == "300px") {
			fens.style.fontSize = "50px";
		} else {
			fens.style.fontSize = "300px";
		}
		fen += 1;
		fens.innerHTML = fen;
		//增加一个
		var newLi = document.createElement("li");
		uls.appendChild(newLi);
	}

	//-----同样的键值按两次不触发
	var TkeyCode = true,
		TkeyOld = 0;

	//-----检测键盘
	document.addEventListener("keydown", function(e) {
		uls.style.opacity = "1";
		fens.style.zIndex = "0";
		fens.innerHTML = fen;
		fens.style.fontSize = "300px";

		var e = e || window.event;
		var keyCode = e.keyCode || e.which;

		if(TkeyOld == keyCode) {
			TkeyCode = false;
		} else {
			TkeyCode = true;
		}
		if(TkeyCode == true) {
			TkeyOld = keyCode;
			//每次进入重置定时器
			clearInterval(stime);
			//加速
			if(e.shiftKey) {
				seep -= 40;
				if(seep < 40) {
					seep = 60;
				}
				//				alert(seep);
			}
			//开始运动
			handMove();
			//重新开始，刷新页面
			if(e.altKey) {
				location.reload();
			}
			//如果正在向左或右运动，左右键无效,反之同样
			if(handCt == false) {
				switch(keyCode) {

					case 40: //下
						handCt = true;
						handT = false;
						break;
					case 38: //上
						handCt = true;
						handT = true;
						break;
				}
			} else {
				switch(keyCode) {
					case 37: //左
						handCt = false;
						handL = true;
						break;
					case 39: //右
						handCt = false;
						handL = false;
						break;
				}
			}
		}
	}, false)

};