<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<div id="chart_area"></div>
<!--<script src="${pageContext.request.contextPath}/vendor/lib_d3/http_d3js.org_d3.v5.js" charset="UTF-8"></script>-->
<script src="${pageContext.request.contextPath}/vendor/lib_d3/http_d3js.org_d3.v4.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>

<script>
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url:'http://localhost:8080/rest/getjsonlist',
        dataType: 'json',
        async: true,
        data: "{}",
        success: function (data) {
            console.log(data);
            create_chart(data)
        },
        error: function (result) {
        }
    });

    function create_chart(data) {

        var canvas=d3.select(".chart_area").append("svg")
            .attr("width",1000)
            .attr("height",700);
        canvas.selectAll("rect")
        .data(data)
        .enter()
        .append("rect")
        .attr("width", function (d) {
                return d.getTod_price
        })
        .attr("height",50)
        .attr("y", function (d,i) {
                return i*80
        })
        .attr("fill","red");

        canvas.selectAll("text")
            .data(data)
            .enter()
            .append("text")
            .attr("fill","#ffffff")
            .attr("Y",function (d,i) {
                return i* 80 +25;
            })
            .attr("x",5)
            .text(function (d) {
                return d.date + "getTod_price : " + d.getTod_price;
            })
    }



</script>
