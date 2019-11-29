<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/5 0005
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="../../../images/favicon.ico" type="image/x-icon"/>
    <title>更改密码</title>
    <script src="https://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
</head>
<body>
<script>


    var first;
    var second;
    var txt = prompt("请输入新密码：", "");
    if (txt == null || txt == "" || txt.length < 6) {
        alert("至少输入六位数字")
    } else {
        first = txt;
        var txt2 = prompt("再次输入密码：", "");
        if (txt2 == null || txt2 == "" || txt2.length < 6) {
            alert("至少输入六位数字");
            location.reload();
        } else {
            second = txt2;
        }
        if (!(first === second)) {
            alert("两次输入不同,请重新输入~")
            location.reload();
        } else {
            $.ajax({
                //请求方式
                type: "POST",
                //请求地址
                url: "/login/success/changePassword/" + second,
                //请求成功
                success: function (result) {
                    if (result == 200) {

                        alert("更改成功,请重新登录")
                    } else {

                        alert("更改失败,请退出重新登陆")
                    }
                    location.href = "/exit"
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText);
                    alert("更改失败,请退出重新登陆")
                    location.href = "/exit"
                }
            })
        }
    }


</script>
</body>
</html>
