<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>bms</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>

<body>
<nav class="navbar navbar-inverse " role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div>
        <a class="navbar-brand" href="#">Brand</a>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">

            <ul class="nav navbar-nav navbar-left">
                <li><a href="#">Menu</a></li>
                <li><a href="#">Menu</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
                <li><a href="#">Link</a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.navbar-container -->
</nav>
<div class="row">
    <div class="container">
        <h2>Contextual Classes</h2>
        <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
        <table class="table">
            <thead>
            <tr>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="item">
            <tr class="success">
                <td><c:out value="${item.price_high}"/></td>
                <td><c:out value="${item.price_low}"/></td>
                <td><c:out value="${item.price_market}"/></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="progress">
            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                40% Complete (success)
            </div>
        </div>
    </div>
</div>

</body>

</html>
