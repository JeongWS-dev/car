<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>
<!DOCTYPE html>
<html>
<head>

<title>드라이빙 라운지 선택</title> 
<!-- 내가만든 css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/drivingLoungeChoice.css">
<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- jQuery -->
    <script src="<%= ctxPath %>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%= ctxPath %>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
    <!-- Bootstrap JS -->
    <script src="<%= ctxPath %>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <!-- Kakao Maps -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8cd36a9ca80015c17a395ab719b2d8d"></script>
    <!-- Custom JS -->
    <script type="text/javascript" src="<%= ctxPath %>/js/drivingLoungeChoice.js"></script>
    
 
<script type="text/javascript">
// 시승신청하기 버튼을 눌렀을때 달력이 나와 일정을 선택한다.
//$(function() {
$(document).ready(function(){    
  $("#courseDate").datepicker({
//      dateFormat: "yy-mm-dd",
//      onSelect: function(dateText) {
//          $("#selectedDate").val(dateText);
//          $('#dateModal').modal('hide');
//      }
  });
});

function openDateModal() {
  $('#dateModal').modal('show');
}
</script>
<jsp:include page="../drivingApply_header.jsp"></jsp:include>

<div id="container">
    <div id="map" style="width:100%; height:900px;"></div>
    <div id="latlngResult" style="display: none;"></div>
    
 
    <div id="in-container">
        <div id="place" style="text-align: center; background-color: lightgray; ">
            <span style="color: gray; padding: 2% 0">지역 선택</span>
            <c:if test="${not empty requestScope.areaList}">
                <div id="table">
                    
                    <table id="areatable">
                        
                        <c:forEach var = "area_map" items="${requestScope.areaList}">
                            <tr>
                                <td><button id="areachoicebtn" onclick="choiceArea('${area_map.Area}')">${area_map.Area}</button></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </c:if>

        </div>
        
    </div>

</div>


    <!-- 모달 -->
    <div>
        <label for="courseDate">Course Date: </label>
        <input type="text" id="selectedDate" name="selectedDate" readonly/>
        <button type="button" class="btn btn-primary" onclick="openDateModal()">Select Date</button>
    </div>

        <!-- Date Modal -->
        <div class="modal fade" id="dateModal" tabindex="-1" role="dialog" aria-labelledby="dateModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="dateModalLabel">Select Course Date</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="courseDate"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
<jsp:include page="../Main_Footer.jsp"></jsp:include>