<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="zh">

<head>

    <link rel="shortcut icon" href="../../../images/favicon.ico" type="image/x-icon"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>毕业设计选题系统</title>
    <link rel="stylesheet" type="text/css" href="../../../css/styles.css">

</head>

<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1 id="title">毕业设计选题系统</h1>
            <form class="form">
                <input type="text" id="code" placeholder="请输入账号">
                <input type="password" id="password" placeholder="请输入密码">
                <button type="submit" id="login-button">登录</button>
            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
<div class="copyright">
    <div>
        西安工业大学北方信息工程学院毕业设计选题系统
        <br> Copyright 2019 HuangXin. All Rights Reserved ICP证：陕ICP备19002289号-1
        <br> 如果在使用过程中出现问题，请及时联系 <a href="http://wpa.qq.com/msgrd?v=3&uin=1538933906&site=qq&menu=yes">1538933906</a>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
<script>
    $('#login-button').click(function (event) {
        event.preventDefault();


        if ($('#code').val().length < 5 ||
            $('#password').val().length < 5
        ) {
            $("#title").text("请输入正确的账号或者密码");
            return;
        }
        $('.wrapper').addClass('form-success');
        $("#title").text("请稍等,正在登陆中~");
        $('form').fadeOut(500);//表格消失
        var list = {
            studentCode: $('#code').val(),
            studentPassword: $('#password').val(),
        };
        setTimeout(function () {
            $.ajax({
                //请求方式
                type: "post",
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url: "/login",
                //数据，json字符串
                data: JSON.stringify(list),
                //请求成功
                success: function (result) {
                    if (result == 200) {
                        $(location).attr('href', '/login/success');
                    } else {
                        $("#title").text("账号或者密码错误,请重试");
                        setTimeout(function () {
                            location.reload();
                        }, 2000)
                    }
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    $("#title").text("服务器发生错误,请稍后再试");
                    setTimeout(function () {
                        location.reload();
                    }, 3000)
                }
            });
        }, 1000)


    });
</script>


</body>

</html>