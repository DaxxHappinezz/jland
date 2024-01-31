<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
  <title>JLand Join in</title>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<h1>Create your JLand account</h1>
<h2> this is account/registration page </h2>
<h3>Already have an account?</h3>
<a href="<c:url value='/account/login'/>">Sign in</a>
<form action="<c:url value='/account/add'/>" method="post" onsubmit="return formCheck(this)">
  <fieldset>
    <div id="msg">
      <c:if test="${not empty param.msg}"></c:if>
    </div>
    <label for="userGivenName">First name</label>
    <input type="text" name="givenName" id="userGivenName" placeholder="Write your first name"/>
    <br>
    <label for="userFamilyName">Last name</label>
    <input type="text" name="familyName" id="userFamilyName" placeholder="Write your last na  me"/>
    <br>
    <label for="userId">ID</label>
    <input type="text" name="id" id="userId" placeholder="Write your id"/>
    <button type="button" id="checkIdBtn"><i>Check ID</i></button>
    <br>
    <label for="userPassword">Password</label>
    <input type="password" name="pw" id="userPassword" placeholder="Write your password"/>
    <button type="button"><i>img</i></button>
    <br>
    <label for="userCountry">Country</label>
    <input type="text" name="country" id="userCountry" placeholder="South Korea"/>
    <br>
    <label for="userDay">Day</label>
    <input type="text" name="day" id="userDay" placeholder="DD"/>
    <br>
    <label for="userMonth">Month</label>
    <input type="text" name="month" id="userMonth" placeholder="MM"/>
    <br>
    <label for="userYear">Year</label>
    <input type="text" name="year"id="userYear" placeholder="YYYY"/>
    <br>
    <button type="submit">Create Account</button>
  </fieldset>
</form>
<script>
  function formCheck(form) {
    let msg = "";

    if (form.givenName.value === '' || form.givenName.value.length < 2) {
      console.log("givenName validation");
      setMsg("!! Check your first name", form.givenName);
      return false;
    }
    if (form.familyName.value === '' || form.familyName.value.length < 1) {
      console.log("familyName validation");
      setMsg("!! Check your last name", form.familyName);
      return false;
    }
    if (form.id.value === '' || form.id.value.length < 4) {
      console.log("id validation");
      setMsg("!! Check your ID", form.id);
      return false;
    }
    if (form.pw.value === '' || form.pw.value.length < 4) {
      console.log("pw validation");
      setMsg("!! Check your password", form.pw);
      return false;
    }
    return true;
  }

  function setMsg(msg, element) {
    document.getElementById("msg").innerHTML = `<small><p>${'${msg}'}</p></small>`;

    if (element) {
      element.select();
    }
  }

  // Check ID 버튼 클릭 시 ajax로 가입 가능한 ID 기능 추가
  $(document).ready(function() {
    $('#checkIdBtn').click(function() {
      let userId = $('#userId').val();

      $.ajax({
        type: 'post',
        url:'<c:url value="/account/check-id"/>',
        data: 'id=' + userId,
        success:function(data) {
          if (data === 'CHK_OK') {
            alert("사용 가능한 ID입니다.")
          }
        },
        error:function(data) {
          if (data.responseText === 'CHK_ERR') {
            alert("사용할 수 없는 ID입니다.")
          }
        }
      });
    });
  });
</script>
</body>
</html>
