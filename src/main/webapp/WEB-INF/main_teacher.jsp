<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="../../../images/favicon.ico" type="image/x-icon"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>毕业设计选题系统</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../css/style.css">
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
                <li class="nav-item active">
                    <a class="nav-link" href="#">主页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">已被选择题目</a>
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
                        <h1 style="font-weight: 800;color: #50a3a2;">${info.teacherName}</h1>
                        <p style="text-align: left">
                            工号:${info.teacherCode}<br>职称:${info.teacherLevel}<br>研究方向:${info.teacherDirection}<br>来源:${info.teacherSource}
                        </p>
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
    老师登陆界面
</div>
</body>

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
<script src="https://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="../../../js/index.js"></script>


</html>
