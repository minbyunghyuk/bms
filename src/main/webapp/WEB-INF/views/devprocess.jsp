<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>
<style>
.돋움 {font-family: 돋움;}
.dotum {font-family: dotum;}
.돋움체 {font-family: 돋움체;}

.굴림 {font-family: 굴림;}
.gulim {font-family: gulim;}
.굴림체 {font-family: 굴림체;}

.고딕 {
    font-family: 고딕, serif;}
.고딕체 {
    font-family: 고딕체, serif;}

.궁서 {font-family: 궁서;}
.궁서체 {font-family: 궁서체;}

.times {font-family: times;}
.courier {font-family: courier;}
.arial {font-family: arial;}
</style>

<div class="row">
    <div class="container">
        <br class="content-center">

        <h1 class="고딕체">주가 예측 시스템 (Stock Predict Service)</h1><br><br>

        <h3>I.프로젝트 개요</h3>
        <p class="고딕">농작물 가격 예측으로 시작했지만 사용자에게 서비스 제공함에있어 충분하지 않는 아이템으로 판단
            사용자에게 필요한 서비스에 대해 고민하던 중 농작물과 관련된 주식에대한 분석결과 연관성이 있음 을 확인</p>
        <p> 농작물과 각 농업 관련 주식들의 상관관계 확인 후 각 주식별 상관관계가 있는 농작물을 추가해 시계열 예측을 진행했을 때
            더 높은 예측율 산출되는것을 확인함더 나아가 유제품, 원유가격, 환율, 코스피 등 다양한 변수와 그에 관련된 주식을 추가하여 사용자에게 주식예측서비스를 제공하고자 함</p>
        <br>
        <h3>II.팀 소개 및 역할</h3>
        <p>BMS (BigData marketing Service)</p>
        <P>마케팅에대한 관심도가있던 인원끼리모여 사용자에게 예측서비스를 제공하고자하는 취지의 모임</p>

        <p>민병혁 : Web Service 구현</p>
        <p>최현수 : Data 수집 및 적재</p>
        <p>권태양 : Data 처리 및 분석</p>
        <br>
        <h3>III.시스템 구성도 </h3>
        <div>
            <img src="assets/System.png" alt="System" width="867" height="297">
        </div>
        <h3>IV.구현 과정 </h3>
        <h5>-데이터 수집</h5><br><br><br><br><br>






        <h5>-데이터 분석</h5><br>
        <img src="assets/ImgList/데이터%20합병.png" alt="DataFrame" width="867" height="297"><br>
        <p class="고딕">수집된 데이터를 각각 전처리 후 하나의 데이터프레임으로 병합
        <p>(1)모델 선정</p>
        <img src="assets/ImgList/상관관계.png" alt="DataFrame" width="867" height="350"><br>
        각 주식 별 상관관계가 있는 변수 확인 후 모델 학습할 조합 생성<br>
        <img src="assets/ImgList/모델%20조합.png" alt="Model" width="600" height="200"><br>
        ex)아시아종묘 : 감자, 우유, 환율의 상관관계가 다른 변수보다 높음->아시아 종묘와 감자, 우유, 환율 각각의 조합으로 모델링<br>
        주식은 대략 20개 / 주식 별 조합은 3-4개  총 7-80개의 모델 학습이 필요  시간 별 데이터가 아닌 일별 데이터로  주식 별 데이터의 수가 많지 않다고 판단<br>
        RNN, LSTM이 아닌 GRU인 이유 <br>
        - RNN : 장기 의존성 문제(과거 데이터의 정보를 기억하는 기능이 떨어짐)<br>
        - LSTM : 많은 모델 학습이 필요하기 때문에 학습이 빠른 GRU 선택<br>
        : 소량의 데이터에 더 잘 학습되는 GRU 선택<br>
        - GRU : LSTM 간소화 버전<br>
        <img src="assets/ImgList/모델비교.png" alt="compare" width="600" height="500"><br>
        모델링 후 주식 별 예측률, 수익률 비교 <br>
        예측률 기준으로 모델 선택<br>
        예측률이 같을 경우 수익률 기준으로 모델 선택<br>
        아시아종묘의 경우 우유와 모델링 했을 때  예측률이 약 60%로 가장 높다.<br>
        RNN, LSTM이 아닌 GRU인 이유<br>
        - RNN : 장기 의존성 문제<br>
        - LSTM : 많은 모델 학습이 필요하기 때문에 학습이 빠른 GRU 선택, 소량의 데이터에 더 잘 학습되는 GRU 선택<br>
        주식은 대략 20개 / 주식 별 조합은 3-4개 총 7-80개의 모델 학습이 필요<br><br>
        (2)모델링 진행<br>
        -모델링 결과값<br>
        -주식 별 예측률, 수익률 비교 예측률 기준으로 모델 선택<br>
        -예측률이 같을 경우 수익률 기준으로 모델 선택 <br>
        주식 별 최종 모델 학습 후 Web에 필요한 Data 생성<br>
        <h5>3.시각화</h5>
        <P>MVC 패턴으로  Spring Boot 웹서버 구현</P>
        JPA :자바 어플리케이션에서 관계형 데이터베이스를 사용하는 방식을 정의한 인터페이스<br>
        Hibernate : JPA 의 구현체 이며 DB에있는 데이터를 JAVA의 POJO로 인식하여 접근하게해주는 역할<br>
        JDBC : DB 에접근할수 있도록 JAVA에서 제공하는 API <br>


        <a href="/" class="w3-bar-item w3-button">결과물보기 !</a>
    </div>
</div>

