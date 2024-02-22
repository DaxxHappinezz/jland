<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<!-- Main -->
<main>
  <section id="registration-page" class="section">
    <img src="<c:url value="/resources/img/jland_logo.png"/>" alt="jland logo" class="account__section__logo"/>
    <h1 class="account__section__title">Create your account of J Land </h1>
    <!-- <h2> this is account/registration page </h2> -->
    <p class="account__section__text">Already have an account?
      <span><a class="account__section__a" href="jland/account/login">Sign in</a></span>
    </p>
    <form class="account__section__form min-container" action="/jland/account/add" method="post" onsubmit="return formCheck(this)">
      <fieldset class="fieldset">
        <div id="msg">
<%--          <c:if test="${not empty param.msg}"></c:if>--%>
        </div>
        <label for="userGivenName">First name
          <input class="account__section__fieldset__input" type="text" name="givenName" id="userGivenName" placeholder="Write your first name"/>
        </label>
        <label for="userFamilyName">Last name
          <input class="account__section__fieldset__input" type="text" name="familyName" id="userFamilyName" placeholder="Write your last name"/>
        </label>
        <label class="account__section__fieldset__label" for="userId">ID
          <input class="account__section__fieldset__input" type="text" name="id" id="userId" placeholder="Write your id"/>
          <button type="button" id="checkIdBtn" class="input__inner-btn">Check</button>
        </label>
        <label class="account__section__fieldset__label" for="userPassword">Password
          <input class="account__section__fieldset__input" type="password" name="pw" id="userPassword" placeholder="Write your password"/>
          <button type="button" id="pwVisibility" class="input__inner-btn">
            <i class="fa-solid fa-eye-slash"></i>
          </button>
        </label>
        <label for="userCountry">Country
          <input class="account__section__fieldset__input" type="text" name="country" id="userCountry" placeholder="South Korea"/>
        </label>
        <!-- <label for="userCountry">Birth
            <input class="account__section__fieldset__input-date" type="date" name="country" id="userCountry"/>
        </label> -->
        <div class="user-birth">
          <label for="userDay">Day
            <input class="account__section__fieldset__input" type="text" name="day" id="userDay" placeholder="DD"/>
          </label>
          <label for="userMonth">Month
            <input class="account__section__fieldset__input" type="text" name="month" id="userMonth" placeholder="MM"/>
          </label>
          <label for="userYear">Year
            <input class="account__section__fieldset__input" type="text" name="year" id="userYear" placeholder="YYYY"/>
          </label>
        </div>
      </fieldset>
      <button class="account__section__form__submit" type="submit">Create Account</button>
    </form>
<%--    <a class="account__section__a" href="jland/">Back to HOME</a>--%>
  </section>
</main>
<script src="<c:url value="/resources/js/account/account.js"/>"></script>