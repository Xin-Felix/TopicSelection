<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% int date = new Date().getHours();
    request.setAttribute("date", date); %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="../../../images/favicon.ico" type="image/x-icon"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>毕业设计选题系统</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../css/style.css">
    <script src="https://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="../../../js/index.js"></script>
    <style>
        body {
            width: 100%;
            height: 1800px;
            background-color: #50a3a2;
            background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
            background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
            opacity: 0.8;
        }
    </style>
</head>
<body>

<div class="htmleaf-container">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark navbar-offcanvas">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="font-weight: 800">毕业设计选题系统</a>
            <ul class="navbar-nav navbar-top">
                <li class="nav-item">
                    <a class="nav-link" href="/login/success">主页</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">搜索题目<span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right navbar-icon" type="button" data-toggle="collapse"
                    data-target="#navbar-mobile" aria-controls="navbar-mobile" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="icon-bar bar1"></span>
                <span class="icon-bar bar2"></span>
                <span class="icon-bar bar3"></span>
            </button>
            <div class="navbar-collapse collapse ml-auto" id="navbar-mobile">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-image">
                        <h1 style="font-weight: 800;color: #50a3a2;">${info.studentName}</h1>
                        <p>
                            学号:${info.studentCode}<br>专业:${info.studentMajor==1?"计算机科学与技术":(info.studentMajor==2?"软件工程":(info.studentMajor==3?"信息管理与信息系统":"物联网"))}<br>联系方式:${info.studentPhone}
                        </p>
                    </li>
                    <li class="nav-item">
                        <a href="/login/success/changePassword" class="nav-link">更改密码</a>
                    </li>
                    <li class="nav-item">
                        <a href="/exit" class="nav-link">退出登录</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>


<div class="box_flex">
    <div>
        <input type="text" id="keyword" placeholder="请输入关键词" style="width: 400px;height: 40px;border-radius: 2px">
        <input type="submit" id="submit" value="搜索" class="btn btn-primary" style="margin-top: -5px">
    </div>


</div>


<div class="box_flex">


    <c:if test="${question!=null}">

        <c:forEach items="${question}" var="item" varStatus="index">

            <div class="main">
                <div class="message">
                    <div>
                        <div class="title" style="height: 5em">
                            设计题目:<br>
                            <p>
                                    ${item.titleName}
                            </p>
                        </div>
                        <div class="type">
                            题目类型:
                            <p>
                                    ${item.titleType}
                            </p>
                        </div>
                        <div class="host">
                            指导老师:
                            <p>
                                    ${item.teacherMessage.teacherName}
                            </p>
                        </div>
                        <div class="source">
                            题目来源:
                            <p>
                                    ${item.titleSource}
                            </p>
                        </div>
                        <div class="intro">
                            题目简介:
                            <p>
                                    ${item.titleContent}
                            </p>
                        </div>
                    </div>
                    <div class="operation">

                        <c:if test="${date >=15 }">
                            <div class="choose">
                                <button class="btn btn-danger choose_question${index.index}" id="${item.titleId}">选择它
                                </button>
                            </div>
                            <div class="look">
                                <button class="btn btn-primary" name="look_question${index.index}"
                                        message_intro="题目简介:${item.titleContent}"
                                        message_background="题目背景:${item.titleBackground}"
                                        message_require="题目要求:${item.titleRequire}">
                                    查看它
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>


</body>
<script>
    $("#submit").click(function () {
        var keyword = document.getElementById("keyword").value;

        location.href = "/login/success/search/" + keyword;
    })


</script>

<script>

    <c:forEach items="${question}" varStatus="index">

    $("[name='look_question${index.index}']").click(function () {

        var intro = $("[name='look_question${index.index}']").attr("message_intro");
        var background = $("[name='look_question${index.index}']").attr("message_background");
        var require = $("[name='look_question${index.index}']").attr("message_require");

        alert(intro + "\r\n" + background + "\r\n" + require + "\r\n");
    })


    $(".choose_question${index.index}").click(function () {

            var r = confirm("是否选择?");
            if (r == true) {
                $.ajax({
                    //请求方式
                    type: "GET",
                    //请求地址
                    url: "/login/success/choose?questionId=" + $(".choose_question${index.index}").attr('id'),
                    //请求成功
                    success: function (result) {
                        if (result != 200) {
                            alert("课程已被他人选取或其他原因,请刷新页面重试~");
                        } else {
                            alert("祝贺,选课成功~");
                        }
                        location.href = "/login/success";
                    },
                    //请求失败，包含具体的错误信息
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText);
                    }
                })
            } else {
            }
        }
    )

    </c:forEach>
</script>

<!--下雪 喜欢的可以用哦-->
<script type="text/javascript">
    /* 控制下雪 */
    function snowFall(snow) {
        /* 可配置属性 */
        snow = snow || {};
        this.maxFlake = snow.maxFlake || 200;
        /* 最多片数 */
        this.flakeSize = snow.flakeSize || 10;
        /* 雪花形状 */
        this.fallSpeed = snow.fallSpeed || 1;
        /* 坠落速度 */
    }

    /* 兼容写法 */
    requestAnimationFrame = window.requestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        function (callback) {
            setTimeout(callback, 1000 / 60);
        };

    cancelAnimationFrame = window.cancelAnimationFrame ||
        window.mozCancelAnimationFrame ||
        window.webkitCancelAnimationFrame ||
        window.msCancelAnimationFrame ||
        window.oCancelAnimationFrame;
    /* 开始下雪 */
    snowFall.prototype.start = function () {
        /* 创建画布 */
        snowCanvas.apply(this);
        /* 创建雪花形状 */
        createFlakes.apply(this);
        /* 画雪 */
        drawSnow.apply(this)
    }

    /* 创建画布 */
    function snowCanvas() {
        /* 添加Dom结点 */
        var snowcanvas = document.createElement("canvas");
        snowcanvas.id = "snowfall";
        snowcanvas.width = window.innerWidth - 20;
        snowcanvas.height = document.body.clientHeight;
        snowcanvas.setAttribute("style", "position:absolute; top: 0; left: 0; z-index: 1; pointer-events: none;");
        document.getElementsByTagName("body")[0].appendChild(snowcanvas);
        this.canvas = snowcanvas;
        this.ctx = snowcanvas.getContext("2d");
        /* 窗口大小改变的处理 */
        window.onresize = function () {
            snowcanvas.width = window.innerWidth;
            /* snowcanvas.height = window.innerHeight */
        }
    }

    /* 雪运动对象 */
    function flakeMove(canvasWidth, canvasHeight, flakeSize, fallSpeed) {
        this.x = Math.floor(Math.random() * canvasWidth);
        /* x坐标 */
        this.y = Math.floor(Math.random() * canvasHeight);
        /* y坐标 */
        this.size = Math.random() * flakeSize + 2;
        /* 形状 */
        this.maxSize = flakeSize;
        /* 最大形状 */
        this.speed = Math.random() * 1 + fallSpeed;
        /* 坠落速度 */
        this.fallSpeed = fallSpeed;
        /* 坠落速度 */
        this.velY = this.speed;
        /* Y方向速度 */
        this.velX = 0;
        /* X方向速度 */
        this.stepSize = Math.random() / 30;
        /* 步长 */
        this.step = 0
        /* 步数 */
    }

    flakeMove.prototype.update = function () {
        var x = this.x,
            y = this.y;
        /* 左右摆动(余弦) */
        this.velX *= 0.98;
        if (this.velY <= this.speed) {
            this.velY = this.speed
        }
        this.velX += Math.cos(this.step += .05) * this.stepSize;

        this.y += this.velY;
        this.x += this.velX;
        /* 飞出边界的处理 */
        if (this.x >= canvas.width || this.x <= 0 || this.y >= canvas.height || this.y <= 0) {
            this.reset(canvas.width, canvas.height)
        }
    };
    /* 飞出边界-放置最顶端继续坠落 */
    flakeMove.prototype.reset = function (width, height) {
        this.x = Math.floor(Math.random() * width);
        this.y = 0;
        this.size = Math.random() * this.maxSize + 2;
        this.speed = Math.random() * 1 + this.fallSpeed;
        this.velY = this.speed;
        this.velX = 0;
    };
    // 渲染雪花-随机形状（此处可修改雪花颜色！！！）
    flakeMove.prototype.render = function (ctx) {
        var snowFlake = ctx.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.size);
        snowFlake.addColorStop(0, "rgba(255, 255, 255, 0.9)");
        /* 此处是雪花颜色，默认是白色 */
        snowFlake.addColorStop(.5, "rgba(255, 255, 255, 0.5)");
        /* 若要改为其他颜色，请自行查 */
        snowFlake.addColorStop(1, "rgba(255, 255, 255, 0)");
        /* 找16进制的RGB 颜色代码。 */
        ctx.save();
        ctx.fillStyle = snowFlake;
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.fill();
        ctx.restore();
    };

    /* 创建雪花-定义形状 */
    function createFlakes() {
        var maxFlake = this.maxFlake,
            flakes = this.flakes = [],
            canvas = this.canvas;
        for (var i = 0; i < maxFlake; i++) {
            flakes.push(new flakeMove(canvas.width, canvas.height, this.flakeSize, this.fallSpeed))
        }
    }

    /* 画雪 */
    function drawSnow() {
        var maxFlake = this.maxFlake,
            flakes = this.flakes;
        ctx = this.ctx, canvas = this.canvas, that = this;
        /* 清空雪花 */
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        for (var e = 0; e < maxFlake; e++) {
            flakes[e].update();
            flakes[e].render(ctx);
        }
        /*  一帧一帧的画 */
        this.loop = requestAnimationFrame(function () {
            drawSnow.apply(that);
        });
    }

    /* 调用及控制方法 */
    var snow = new snowFall({maxFlake: 60});
    snow.start();
</script>


</html>
