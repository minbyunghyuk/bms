<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>


<div class="row">
    <div class="container">
        <div class="content">
            <div class="container">

                <table class="table table-striped custab">
                    <h2>전체 예상 종목 </h2>
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
                            <td class="text-center" width="192" style="word-break:break-all"><c:out
                                    value="${item.tod_price}"/></td>

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
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100"
                                         style="width:<c:out value="${item.mean_match_status*100}"/>%;">
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

<script>



</script>