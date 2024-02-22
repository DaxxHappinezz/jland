<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<main>
    <section id="signin-page" class="section">
        <img src="<c:url value='/resources/img/jland_logo.png'/>" alt="jland logo" class="account__section__logo"/>
        <h1 class="account__section__title">Welcome back J Land</h1>
        <form class="account__section__form min-container" action="/jland/account/login" method="post">
            <fieldset class="fieldset">
                <label>
                    <input class="account__section__fieldset__input" type="text" name="id" placeholder="Your ID"/>
                </label>
                <small><a class="account__section__a" href="#none">Forgot ID?</a></small>
            </fieldset>
            <fieldset class="fieldset">
                <label>
                    <input class="account__section__fieldset__input" type="password" name="pw" placeholder="Your Password"/>
                </label>
                <small><a class="account__section__a" href="#none">Forgot Password?</a></small>
            </fieldset>
            <fieldset class="fieldset">
                <label for="rememberId">
                    <input type="checkbox" id="rememberId" name="rememberId"/><span class="account__section__a">Remember Me</span>
                </label>
            </fieldset>
            <button class="account__section__form__submit">Sign in</button>
        </form>
        <div class="account__section__join">
            <p class="account__section__text">Join us?</p>
            <a class="account__section__a" href="<c:url value='/account/add'/>">Create account</a>
        </div>
        <a class="account__section__a" href="/jland/">Back to HOME</a>
    </section>
</main>
<script src="<c:url value='/resources/js/account/account.js'/>" defer></script>