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
                    <h2>종목별 세부 예상 조회  </h2>
                    <tr>
                        <th class="text-center">주식명</th>
                        <th class="text-center">금일종가</th>
                        <th class="text-center">익일예측</th>
                        <th class="text-center">등락적중률</th>
                        <th class="text-center">최근한달수익율</th>
                        <th class="text-center">평균오차범위</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center" width="192" style="word-break:break-all">
                            <c:out value="${model.com_name}"/>
                        </td>
                        <td class="text-center" width="192" style="word-break:break-all"><c:out
                                value="${model.tod_price}"/></td>

                        <c:if test="${model.next_day_return >0.0}">
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100" style="width:100%;color:wheat;" >
                                        <c:out value="${model.next_day_return}"/>%(<c:out value="${model.next_day_return_value}"/>)
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${model.next_day_return < 0.0}">
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100" style="width:100%;color:wheat;" >
                                        <c:out value="${model.next_day_return}"/>%(<c:out value="${model.next_day_return_value}"/>)
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <td>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                     aria-valuemax="100" style="width:<c:out value="${model.mean_match_status*100}"/>%;">
                                    <fmt:formatNumber value="${model.mean_match_status*100}"/>%
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                     aria-valuemax="100" style="width:<c:out value="${model.tod_return*40}"/>%;">
                                    <fmt:formatNumber value="${model.tod_return*100}"/>%
                                </div>
                            </div>
                        </td>
                        <td class="text-center" width=192 style="word-break:break-all"><c:out
                                value="±${model.mean_price_error}"/></td>
                    </tr>
                    </tbody>

                </table>
                <div id="chart_area"></div>
                <svg id="chart"></svg>
                <h2> <c:out value="${model.com_name}"/> 유사한종목 </h2>
                <table class="table table-striped custab">
                    <thead>
                    <tr>
                        <th class="text-center">주식명</th>
                        <th class="text-center">금일종가</th>
                        <th class="text-center">익일예측</th>
                        <th class="text-center">등락적중률</th>
                        <th class="text-center">최근한달수익율</th>
                        <th class="text-center">평균오차범위</th>
                    </tr>
                    </thead>
                    <c:forEach items="${list}" var="item">
                        <tbody>
                        <tr>
                            <td  style="cursor:pointer;" class="text-center text-primary" width="192"
                                 onClick=" location.href='/get?name=<c:out value="${item.com_name}"/>'">
                                <c:out value="${item.com_name}"/>
                            </td>
                            <td class="text-center" width="192" style="word-break:break-all"><c:out
                                    value="${item.tod_price}"/></td>

                            <c:if test="${item.next_day_return >0.0}">
                                <td>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                             aria-valuemax="100" style="width:100%;color:wheat;" >
                                            <c:out value="${item.next_day_return}"/>%(<c:out value="${item.next_day_return_value}"/>)
                                        </div>
                                    </div>
                                </td>
                            </c:if>
                            <c:if test="${item.next_day_return < 0.0}">
                                <td>
                                    <div class="progress">
                                        <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                             aria-valuemax="100" style="width:100%;color:wheat;" >
                                            <c:out value="${item.next_day_return}"/>%(<c:out value="${item.next_day_return_value}"/>)
                                        </div>
                                    </div>
                                </td>
                            </c:if>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100" style="width:<c:out value="${item.mean_match_status*100}"/>%;">
                                        <fmt:formatNumber value="${item.mean_match_status*100}"/>%
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100" style="width:<c:out value="${item.tod_return*40}"/>%;">
                                        <fmt:formatNumber value="${item.tod_return*100}"/>%
                                    </div>
                                </div>
                            </td>
                            <td class="text-center" width=192 style="word-break:break-all"><c:out
                                    value="±${item.mean_price_error}"/></td>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>

            </div>
        </div>
    </div>
</div>



<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script>

        var margin = {top: 20, right: 20, bottom: 30, left: 50},
        width = 960 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

        // Parse the date / time
        var parseDate = d3.time.format("%Y-%m-%d").parse;

        var x = d3.scaleTime().range([0, width]);
        var y = d3.scaleLinear().range([height, 0]);
        // define the 1st line
        var valueline = d3.line()
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y(d.getTod_price); });

        // define the 2nd line
        var valueline2 = d3.line()
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y(d.getTom_price); });

        var svg = d3.select("body").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
        "translate(" + margin.left + "," + margin.top + ")");

        var com_name ='<c:out value="${model.com_name}"/>';
        var url = "http://localhost:8080/rest/getjsonlist?name="+com_name;
        console.log(url);

        // Get the data
        $.ajax({
        url: url,
        success: function (data) {
        // Get the data
        d3.json(url, function (error, data) {
        data.forEach(function (d) {
             d.date = parseDate(d.date);
        console.log(d)
    });
        x.domain(d3.extent(data, function(d) { return d.date; }));
        y.domain([0, d3.max(data, function(d) {
        return Math.max(d.getTom_price, d.getTod_price); })]);

        // Add the valueline path.
        svg.append("path")
        .data([data])
        .attr("class", "line")
        .attr("d", valueline);

        // Add the valueline2 path.
        svg.append("path")
        .data([data])
        .attr("class", "line")
        .style("stroke", "red")
        .attr("d", valueline2);

        // Add the X Axis
        svg.append("g")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

        // Add the Y Axis
        svg.append("g")
        .call(d3.axisLeft(y));
    })
    }
    });
        // Get the data


</script>



