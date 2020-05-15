<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>


<div class="row">
    <div class="container">
        <div class="content">
            <div class="container">
                <table class="table table-striped custab">
                    <thead>
                    <a href="#" class="w3-twothird"><h6><c:out value="${item.com_name}"/></h6></a>
                    <tr>
                        <th width="192" scope="col" class="text-center">전일종가</th>
                        <th width="192" scope="col" class="text-center">익일예측</th>
                        <th width="192" scope="col" class="text-center">등락적중률</th>
                        <th width="192" scope="col" class="text-center">최근한달수익율</th>
                        <th width="192" scope="col" class="text-center">오차범위</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center"  width=192 style="word-break:break-all"><c:out value="${item.price_high}"/></td>
                        <c:if test="${item.com_code < 0}">
                            <td>
                                <div class="progress justify-content-end align-middle">
                                    <div class="progress-bar bg-danger" role="progressbar"
                                         style="width<c:out value="${item.com_code}"/>" aria-valuenow="50"
                                         aria-valuemin="0"
                                         aria-valuemax="100">
                                        <c:out value="${item.com_code}"/>%
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${item.com_code > 0}">
                            <td  >
                                <div class="progress ">
                                    <div class="progress-bar bg-danger" role="progressbar"
                                         style="width<c:out value="${item.com_code}"/>" aria-valuenow="50"
                                         aria-valuemin="0"
                                         aria-valuemax="100">
                                        <c:out value="${item.com_code}"/>%
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <td >
                            <div class="progress ">
                                <div class="progress-bar bg-danger" role="progressbar"
                                     style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0"
                                     aria-valuemax="100">
                                    <c:out value="${item.com_code}"/>%
                                </div>
                            </div>
                        </td>
                        <td >
                            <div class="progress " width="150">
                                <div class="progress-bar bg-info" role="progressbar"
                                     style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0"
                                     aria-valuemax="100">
                                    <c:out value="${item.com_code}"/>%
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar"
                                     style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0"
                                     aria-valuemax="10">
                                    <c:out value="${item.com_code}"/>%
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div id="chart_area"></div>
            </div>
        </div>
    </div>
</div>
<div class="container">

    <table class="table table-striped custab">
        <thead>
        <tr>
            <th width="192" scope="col" class="text-center">주식명</th>
            <th width="192" scope="col" class="text-center">유사도</th>
            <th width="192" scope="col" class="text-center">예측</th>
            <th width="192" scope="col" class="text-center">수익율</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <c:forEach items="${list}" var="Sm_item">
            <td class="text-center"><c:out value="${Sm_item.com_name}"/></td>
            <td>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped active"
                         role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                         style="width:<c:out value="${Sm_item.volume}"/>%">
                        <c:out value="${Sm_item.volume}"/>%
                    </div>
                </div>
            </td>
            <td>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped active"
                         role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                         style="width:<c:out value="${Sm_item.volume}"/>%">
                        <c:out value="${Sm_item.volume}"/>%
                    </div>
                </div>
            </td>
            <td>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped active"
                         role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                         style="width:<c:out value="${Sm_item.volume}"/>%">
                        <c:out value="${Sm_item.volume}"/>%
                    </div>
                </div>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</div>
<!--<script src="${pageContext.request.contextPath}/vendor/lib_d3/http_d3js.org_d3.v5.js" charset="UTF-8"></script>-->
<script src="${pageContext.request.contextPath}/vendor/lib_d3/http_d3js.org_d3.v4.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script>
    var margin = {top: 10, right: 30, bottom: 30, left: 60},
        width = 500 - margin.left - margin.right,
        height = 200 - margin.top - margin.bottom;

    // append the svg object to the body of the page
    var svg = d3.select("#chart_area")
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")");

    //Read the data
    d3.csv("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/3_TwoNumOrdered_comma.csv",
        // When reading the csv, I must format variables:
        function (d) {
            return {date: d3.timeParse("%Y-%m-%d")(d.date), value: d.value}
        },
        // Now I can use this dataset:
        function (data) {

            // Add X axis --> it is a date format
            var x = d3.scaleTime()
                .domain(d3.extent(data, function (d) {
                    return d.date;
                }))
                .range([0, width]);
            svg.append("g")
                .attr("transform", "translate(0," + height + ")")
                .call(d3.axisBottom(x));

            // Add Y axis
            var y = d3.scaleLinear()
                .domain([0, d3.max(data, function (d) {
                    return +d.value;
                })])
                .range([height, 0]);
            svg.append("g")
                .call(d3.axisLeft(y));
            // Add the line
            svg.append("path")
                .datum(data)
                .attr("fill", "none")
                .attr("stroke", "steelblue")
                .attr("stroke-width", 1.5)
                .attr("d", d3.line()
                    .x(function (d) {
                        return x(d.date)
                    })
                    .y(function (d) {
                        return y(d.value)
                    })
                )

        })
</script>



