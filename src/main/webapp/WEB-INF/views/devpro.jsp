<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>


<div class="row">
    <div class="container">
        <div class="content-center">
            <div class="container">
                <h2> 차별화된 주가 예측 시스템</h2>

                <P class="text-center">기존의 주가예측보다 농작물 가격과의 상관성을 더한 예측으로 약10% 향상된 예측율</P>
                <P class="text-center"> (예상 수익률 10% 정확도 80%)</P>
                <div class="button">
                    <input type="button" class="btn btn-primary" value="View Developer Process" onclick="/view"/><br/>
                </div>
                <h2>TOP 5 Hot Stocks Today </h2>
                <table class="table table-striped custab">
                    <thead>
                    <tr>
                        <th class="text-center">주식명</th>
                        <th class="text-center">금일종가</th>
                        <th class="text-center">익일예측</th>
                        <th class="text-center">등락적중률</th>
                        <th class="text-center" title="한달전 종가에서 30일 기준으로 투자를 진행한 경우">최근한달수익율</th>
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
                <button type="button" class="btn btn-primary  pull-right" onclick="location.href='view'">ViewMore</button>
            </div>
        </div>

    </div>

</div>
