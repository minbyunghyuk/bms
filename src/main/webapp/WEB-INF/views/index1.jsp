<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="container">
        <div class="content">
            <h4><c:out value="${item.com_name}"/></h4>
            <div class="w3-container w3-dark-grey w3-padding-32">
                <div class="w3-row">
                    <div class="w3-container w3-third">
                        <h5 class="w3-bottombar w3-border-green">Demographic</h5>
                        <p>Language</p>
                        <p>Country</p>
                        <p>City</p>
                    </div>
                    <div class="w3-container w3-third">
                        <h5 class="w3-bottombar w3-border-red">System</h5>
                        <p>Browser</p>
                        <p>OS</p>
                        <p>More</p>
                    </div>
                    <div class="w3-container w3-third">
                        <h5 class="w3-bottombar w3-border-orange">Target</h5>
                        <p>Users</p>
                        <p>Active</p>
                        <p>Geo</p>
                        <p>Interests</p>
                    </div>
                </div>
            </div>
            <table class="table table-sm ">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">전일종가</th>
                    <th scope="col">익일예측</th>
                    <th scope="col">등락적중률</th>
                    <th scope="col">최근한달수익율</th>
                    <th scope="col">오차범위</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><c:out value="${item.price_high}"/></td>
                    <c:if test="${item.com_code < 0}">
                    <td>
                        <div class="progress justify-content-end">
                            <div class="progress-bar bg-danger" role="progressbar" style="width<c:out value="${item.com_code}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    </c:if>
                    <c:if test="${item.com_code > 0}">
                    <td>
                        <div class="progress ">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item.com_code}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    </c:if>
                    <td>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item.com_code}"/>%
                            </div>
                        </div>
                    </td>

                    <td><c:out value="${item1.price_high}"/></td>
                    <c:if test="${item1.com_code < 0}">
                    <td>
                        <div class="progress justify-content-end">
                            <div class="progress-bar bg-danger" role="progressbar" style="width<c:out value="${item1.com_code}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item1.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    </c:if>
                    <c:if test="${item1.com_code > 0}">
                    <td>
                        <div class="progress ">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item1.com_code}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item1.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    </c:if>
                    <td>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item1.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item1.com_code}"/>%
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width<c:out value="${item.volume}"/>" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                <c:out value="${item1.com_code}"/>%
                            </div>
                        </div>
                    </td>

            </table>
            <div id="chart_area"></div>
        </div>
        <div class="container">
            <h2 align="center"><c:out value="${item.com_name}"/> 유사주식 </h2>
            <table class="table align-items-center table-sm">
                <thead >
                <tr>
                    <th>주식명</th>
                    <th>유사도</th>
                    <th>예측</th>
                    <th>수익율</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                 <c:forEach items="${list}" var="Sm_item">
                    <td><c:out value="${Sm_item.com_name}"/></td>
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
        width = 600 - margin.left - margin.right,
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



