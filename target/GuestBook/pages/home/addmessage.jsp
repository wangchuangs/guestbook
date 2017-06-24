<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加留言</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
<div class="container">
    <h1>添加留言</h1>
    <hr/>
    <form:form action="/addmessage" method="post" commandName="message" role="form">
        <div class="form-group">
            <label for="title">请输入标题:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="请输入标题:"/>
        </div>
        <div class="form-group">
            <label for="userByUserId.id">请选择用户:</label>
            <select class="form-control" id="userByUserId.id" name="userByUserId.id">
                <c:forEach items="${userEntityList}" var="user">
                    <option value="${user.id}">${user.nickname}</option>
                </c:forEach>
            </select>
            <label for="categoryByCategoryId.id">请选择分类:</label>
            <select class="form-control" id="categoryByCategoryId.id" name="categoryByCategoryId.id">
                <c:forEach items="${categoryEntityList}" var="category">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="content">请输入内容:</label>
            <textarea class="form-control" id="content" name="content" rows="3" placeholder="请输入留言内容"></textarea>
        </div>
        <%
            Date date = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = df.format(date);

        %>

        <input   type="hidden" class="form-control" id="create_Time" name="createTime" value="<%=time%>"/>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>