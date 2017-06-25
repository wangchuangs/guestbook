<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>留言板</title>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<c:import url="../main/header.jsp" charEncoding="UTF-8"></c:import>

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">
        <!-- 如果用户列表为空 -->
        <c:if test="${empty messageList}">
            <div class="jumbotron">
                <h1>恭喜,你是第一位</h1>
                <p>沙发永远属于幸运的人</p>
                <p><a class="btn btn-primary btn-lg" href="/home/message" role="button">添加留言</a></p>
            </div>
        </c:if>
        <!-- 如果用户列表非空 -->
        <c:if test="${!empty messageList}">
            <div class="col-xs-12 col-sm-9">

                <div class="jumbotron">
                    <h2>世界如此大</h2>
                    <p>世界如此之大,而我却如此渺小。在漫无边际的游荡中,曾经那个努力奋斗的少年哪去了?</p>
                </div>
                <div class="row">

                    <c:forEach items="${messageList}" var="message">
                        <div class="col-xs-6 col-lg-4">
                            <h3><a href="/message/detail/${message.id}" >${message.title}</a><span class="label label-default">${message.categoryByCategoryId.name}</span></h3>
                            <p>留言时间:&nbsp;${message.createTime}</p>
                            <p>${message.content}</p>
                            <p><a class="btn btn-default" href="/message/detail/${message.id}" role="button">查看详情</a></p>
                        </div>
                        <!--/.col-xs-6.col-lg-4-->
                    </c:forEach>

                </div><!--/row-->
            </div>
            <!--/.col-xs-12.col-sm-9-->
        </c:if>
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
            <div class="list-group">
                <a href="#" class="list-group-item active">分类</a>
                <c:forEach items="${categoryEntityList}" var="category">
                    <a href="#" class="list-group-item">${category.name}</a>
                </c:forEach>

            </div>
        </div><!--/.sidebar-offcanvas-->
    </div><!--/row-->
    <c:import url="../main/footer.jsp"/>
</div><!--/.container-->

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>