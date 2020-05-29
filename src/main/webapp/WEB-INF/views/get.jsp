<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%@ include file="../includes/header.jsp" %>


<style>


    .line {
        fill: none;
        stroke: steelblue;
        stroke-width: 1.5px;
    }

    .legend rect {
        fill: white;
        stroke: black;
        opacity: 0.8;
    }

    .overlay {
        fill: none;
        pointer-events: all;
    }

    .focus circle {
        fill: #F1F3F3;
        stroke: steelblue;
        stroke-width: 2px;
    }

    .hover-line {
        stroke: steelblue;
        stroke-width: 2px;
        stroke-dasharray: 3,3;
    }
    body,h1,h2,h3,h4,h5,h6,table {font-family: "Raleway", sans-serif}

    .w3-bar .w3-button {
        padding: 20px;
    }


</style>
<div class="row">
    <div class="container">
        <div class="content">
            <div class="container2">
                <table class="table table-striped custab">
                    <h2>종목별 세부 예상 조회 </h2>
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
                    <tbody>
                    <tr>
                        <td class="text-center" width="192" style="word-break:break-all">
                            <c:out value="${model.com_name}"/>
                        </td>
                        <c:if test="${model.tod_status < 0}">
                        <td class="text-center" width="192" style="word-break:break-all">
                                <c:out value="${model.tod_price}"/> <span class="triangle test_1"></span>

                            </c:if>
                            <c:if test="${model.tod_status > 0}">
                        <td class="text-center" width="192" style="word-break:break-all">
                            <c:out value="${model.tod_price}"/> <span class="triangle test_2"></span>

                        </td>
                        </c:if>
                        <c:if test="${model.next_day_return >0.0}">
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100" style="width:100%;color:wheat;">
                                        <c:out value="${model.next_day_return}"/>%(<c:out
                                            value="${model.next_day_return_value}"/>)
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${model.next_day_return < 0.0}">
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0"
                                         aria-valuemax="100" style="width:100%;color:wheat;">
                                        <c:out value="${model.next_day_return}"/>%(<c:out
                                            value="${model.next_day_return_value}"/>)
                                    </div>
                                </div>
                            </td>
                        </c:if>
                        <td>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                     aria-valuemax="100"
                                     style="width:<c:out value="${model.mean_match_status*100}"/>%;">
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

                <div class="svg">
                    <svg width="1200" height="400"></svg>
                </div>
                <h2><c:out value="${model.com_name}"/> 유사한종목 </h2>
                <c:if test="${fn:length(list)==0}">
                <table class="table table-striped custab">
                    <tr>
                        <th class="text-center"> 유사 항목이 존재하지않습니다.</th>
                    </tr>
                    </c:if>
                </table>


                <c:if test="${fn:length(list)!=0}">
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
                                <td style="cursor:pointer;" class="text-center text-primary" width="192"
                                    onClick=" location.href='/get?name=<c:out value="${item.com_name}"/>'">
                                    <c:out value="${item.com_name}"/>
                                </td>
                                <c:if test="${item.tod_status < 0}">
                                <td class="text-center" width="192" style="word-break:break-all">
                                        <c:out value="${item.tod_price}"/> <span class="triangle test_1"></span>

                                    </c:if>
                                    <c:if test="${item.tod_status > 0}">
                                <td class="text-center" width="192" style="word-break:break-all">
                                    <c:out value="${item.tod_price}"/> <span class="triangle test_2"> </span>
                                </td>
                                </c:if>
                                <c:if test="${item.next_day_return >0.0}">
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                                 aria-valuemin="0"
                                                 aria-valuemax="100" style="width:100%;color:wheat;">
                                                <c:out value="${item.next_day_return}"/>%(<c:out
                                                    value="${item.next_day_return_value}"/>)
                                            </div>
                                        </div>
                                    </td>
                                </c:if>
                                <c:if test="${item.next_day_return < 0.0}">
                                    <td>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="60"
                                                 aria-valuemin="0"
                                                 aria-valuemax="100" style="width:100%;color:wheat;">
                                                <c:out value="${item.next_day_return}"/>%(<c:out
                                                    value="${item.next_day_return_value}"/>)
                                            </div>
                                        </div>
                                    </td>
                                </c:if>
                                <td>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0"
                                             aria-valuemax="100"
                                             style="width:<c:out value="${item.mean_match_status*100}"/>%;">
                                            <fmt:formatNumber value="${item.mean_match_status*100}"/>%
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60"
                                             aria-valuemin="0"
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
                </c:if>
                <button type="button" class="btn btn-primary  pull-right" onclick="location.href='view'">전체리스트로 돌아가기
                </button>
            </div>
        </div>
    </div>
</div>

<!-- load the d3.js library -->
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="assets/js/d3.legend.js"></script>

<script>
    var svg = d3.select("svg"),
        // margin = {top: 20, right: 20, bottom: 30, left: 40}, //test
        margin = {top: 20, right: 200, bottom: 30, left: 40}, //test
        width = +svg.attr("width") - margin.left - margin.right;
        height = +svg.attr("height") - margin.top - margin.bottom;

    var parseTime = d3.timeParse("%Y-%m-%d");
    var parseDate = d3.timeFormat("%m-%d");
    bisectDate = d3.bisector(function(d) { return d.date; }).left;

    var x = d3.scaleTime().range([0, width]);
    var y = d3.scaleLinear().range([height, 0]);

    var x1 = d3.scaleTime().range([0, width]);
    var y1 = d3.scaleLinear().range([height, 0]);


    var valueline = d3.line()
        .x(function (d) {
            return x(d.date);
        })
        .y(function (d) {
            //console.log(d.getTom_price);
            return y(d.getTod_price);
        });

    // define the 2nd line
    var valueline2 = d3.line()
        .x(function (d) {
            return x(d.date);
        })
        .y(function (d) {
            //console.log(d.getTom_price);
            return y(d.getTom_price);
        });

    var g = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var name = '<c:out value="${model.com_name}"/>';
    var url = "http://localhost:8080/rest/getjsonlist?name=" + name;
    d3.json(url, function(error, data) {
        if (error) throw error;

        data.forEach(function(d) {
            d.date = parseTime(d.date);
            d.date2 = parseDate(d.date);
            d.getTod_price = +d.getTod_price;
            d.getTom_price = +d.getTom_price;
        });

        x.domain(d3.extent(data, function(d) { return d.date; }));
        y.domain([0, d3.max(data, function (d) {
            return Math.max(d.getTod_price-5, d.getTom_price);
        })]);




        g.append("g")
            .attr("class", "axis axis--x")
            .attr("transform", "translate(0," + height + ")")
            .call(d3.axisBottom(x));

        g.append("g")
            .attr("class", "axis axis--y")
            .call(d3.axisLeft(y).ticks(6).tickFormat(function(d) { return parseInt(d) + "k"; }))
            .append("text")
            .attr("class", "axis-title")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .attr("fill", "#5D6971");


        g.append("path")
            .datum(data)
            .attr("class", "line")
            .attr("d", valueline);

        g.append("path")
            .datum(data)
            .attr("class", "line")
            .style("stroke", "#ff7f0e")
            .attr("d", valueline2);



        var serise = ["실제값", "예측값"];
        var colors = d3.scaleOrdinal(d3.schemeCategory10);
        var legend = svg.append("g")
            .attr("text-anchor", "end")
            .selectAll("g")
            .data(serise)
            .enter().append("g")
            .attr("transform", function (d, i) {
                return "translate(0," + i * 20 + ")";
            });

        legend.append("rect")
            .attr("x", width - 10)
            .attr("width", 19)
            .attr("height", 19)
            .attr("fill", colors);

        legend.append("text")
            .attr("x", width - 20)
            .attr("y", 9.5)
            .attr("dy", "0.32em")
            .text(function (d) {
                return d;
            });
        var focus = g.append("g")
            .attr("class", "focus")
            .style("display", "none");

        focus.append("line")
            .attr("class", "x-hover-line hover-line")
            .attr("y1", 0)
            .attr("y2", height);

        focus.append("circle")
            .attr("r", 7.5)
            .style("fill", "none")
            .style("stroke", "blue")
            .attr("r", 4);

        focus.append("text")
            .attr("x", 5)
            .attr("dy", ".10em");

        focus.append("text2")
            .attr("x", 5)
            .attr("dy", ".10em");

        svg.append("rect")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            .attr("class", "overlay")
            .attr("width", width)
            .attr("height", height)
            .on("mouseover", function() { focus.style("display", null); })
            .on("mouseout", function() { focus.style("display", "none"); })
            .on("mousemove", mousemove);

        function mousemove() {
            var x0 = x.invert(d3.mouse(this)[0]),
                i = bisectDate(data, x0, 1),
                d0 = data[i - 1],
                d1 = data[i],
                d = x0 - d0.date > d1.date - x0 ? d1 : d0;
            focus.attr("transform", "translate(" + x(d.date) + "," + y(d.getTod_price) + ")");
            var text =  parseDate(d.date)+"실제값:"+d.getTod_price +"예측값:"+d.getTom_price;
            focus.select("text").text(function () {

                return text;
            });
             focus.select(".x-hover-line").attr("y2", height - y(d.getTod_price));
             focus.select(".y-hover-line").attr("x2", width + width);
        }

    });
</script>