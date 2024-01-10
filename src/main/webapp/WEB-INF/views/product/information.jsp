<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${pageContext.request.getSession(false) == null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>
<!DOCTYPE html>
<html>
<style>
    .content {
        background-color: white;
        margin-top: 20px;
    }
    .imgArea {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 66.66%;
        height: 25rem;
        float: left;
        padding: 15px;
        border-right: 1px solid #dddddd;
    }

    .detailArea {
        width: 33.33%;
        float: left;
        padding: 15px;
    }

    .content-a::after {
        content: "";
        display: table;
        clear: both;
    }

    .content-a {
        border-top: 1px solid #dddddd;
    }

    .productInfoArea {
        display: flex;
        background-color: #f2f2f2;
        width: 100%;
        padding: 15px;
        border: 1px solid #dddddd;
        justify-content: space-between; /* 내부 요소들을 좌우로 정렬합니다. */
        align-items: center;
    }

    /* Modal */
    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }

    /* 모달 내용 스타일 */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 600px; /* 최대 가로 크기 설정 */
        max-height: 80%; /* 최대 세로 크기 설정 */
        overflow: auto; /* 내용이 넘칠 경우 스크롤 표시 */
    }

    /* 닫기 버튼 스타일 */
    .modalClose, .toggleBtn {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .modalClose:hover,
    .modalClose:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .toggled {
        display: none; /* 초기에 숨김 상태 */
    }

    .row {
        position: relative; /* 이미지 크기 조절을 위한 상대 위치 설정 */
    }

    .row img {
        height: 100%; /* 이미지를 부모 요소의 너비에 맞게 조절 */
        width: auto; /* 가로 비율을 유지한 채 세로 비율 자동 조정 */
        display: block; /* 이미지 간격 등을 위해 블록 레벨 요소로 설정 */
    }

    .calculation {
        float: left;
    }
</style>
<head>
    <title>J Land</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"/>
</head>
<body>

<div class="header">
    <h1>J Land</h1>
    <p>Resize the browser window to see the effect.</p>
</div>

<div class="topnav">
    <a href="<c:url value='/'/>">JLand</a>
    <a href="<c:url value='/products'/>">SHOP</a>
    <a href="<c:url value='/service'/>">HELP</a>
    <a href="<c:url value='${loginLink}'/>" class="topnav-right">${isLogin}</a>
    <a href="<c:url value='/cart'/>" class="topnav-right">My Cart</a>
    <a href="<c:url value='/wishlist'/>" class="topnav-right">Wishlist</a>
    <a href="<c:url value='/cart'/>" class="topnav-right">search</a>
</div>

<div class="row">
    <div class="content">
        <div class="content-a">
            <div class="imgArea">
                <img src="<c:url value='/resources/img/test.png'/>" alt="testimage"/>
            </div>
            <div class="detailArea">detail
                <p>Overall Rating: ${product.review_cnt}</p>
                <p>${product.pname}</p>
                <p>₩ ${product.price}</p>
                <form action="#none" method="post">
                    <div>
                        <button type="button" name="decreaseBtn" id="decreaseBtn">&minus;</button>
                        <input type="[0-9]*" value="1"/>
                        <button type="button" name="increaseBtn"  id="increaseBtn">&plus;</button>
                    </div>
                    <button type="button" id="submitBtn">Add to Bag</button>
                </form>
            </div>
        </div>

        <div class="productInfoArea" onclick="toggledTest('test')">
            <h2><span class="toggleTitle">Features</span></h2>
            <span id="testToggleIcon" class="toggleIcon">&plus;</span>
        </div>
        <div id="testToggled" class="toggled">This is the element to toggle</div>

        <div class="productInfoArea" onclick="toggledTest('spec')">
            <h2><span class="toggleTitle">Specifications</span></h2>
            <span id="specToggleIcon" class="toggleIcon">&plus;</span>
        </div>
        <div id="specToggled" class="toggled">This is the element to toggle</div>

        <div class="productInfoArea" onclick="toggledTest('customer')">
            <h2>
                <span class="toggleTitle">Customer reviews</span>
                <span class="starContainer"></span>
                <span>${product.review_cnt}</span>
            </h2>
            <span id="customerToggleIcon" class="toggleIcon">&plus;</span>
        </div>
        <div id="customerToggled" class="toggled">
            <span>Overall Rating</span>
            <div>
                <span class="starContainer"></span>
                <span>${avgRating}</span>
                <span>(${product.review_cnt})</span>
            </div>
            <hr>
            <form action="#">
                <label for="lang"></label>
                <select name="languages" id="lang">
                    <option value="">Most relevant</option>
                    <option value="">Date - newest first</option>
                    <option value="">Date - oldest first</option>
                    <option value="">Rating - High to Low</option>
                    <option value="">Rating - Low to High</option>
                </select>
            </form>
            <button id="writeReviewBtn">Write a Review</button>
            <hr>
            <c:forEach var="review" items="${reviewList}">
                <div>
                    <p>${review.created}</p>
                    <p>${review.rating}</p>
                    <p>${review.title}</p>
                    <p>${review.uno}</p>
                    <p>${review.comment}</p>
                    <div class="calculation">
                        <button type="button" id="upCalcBtn" class="calcBtn">Up</button>
                        <span class="upCalcValue">${review.up}</span>
                        <button type="button" id="downCalcBtn" class="calcBtn">Down</button>
                        <span class="downCalcValue">${review.down}</span>
                    </div>
                </div>
                <br>
                <hr>
            </c:forEach>
        </div>
    </div>
</div>

<!-- modal -->
<%-- view to myBag --%>
<div id="myBagModal" class="modal">
    <div class="modal-content">
        <span class="modalClose">&times;</span>
        <p>Added to My Bag</p>
        <hr>
        <div class="modal-body">
            <img src="<c:url value='/resources/img/test.png'/>" alt="testimage"/>
            <h4>${product.pname}</h4>
            <h5>${product.price}</h5>
            <h5>${product.quantity}</h5>
        </div>
        <div class="modal-footer">
            <button type="button" id="modalClose">Continue Shopping</button>
            <button type="button" id="myBagBtn">View My Bag</button>
        </div>
    </div>
</div>

<%-- write a review --%>
<div id="writeReviewModal" class="modal">
    <div class="modal-content">
        <span class="modalClose">&times;</span>
        <div class="modal-body">
            <img src="<c:url value='/resources/img/test.png'/>" alt="testimage"/>
            <h4>${product.pname}</h4>
            <form action="#none" method="post" id="writeReviewForm">
                <label>Overall rating<span>*</span>
                    <input type="text" name="rating">
                </label>
                <br>
                <label>Review Title<span>*</span>
                    <input type="text" name="rating">
                </label>
                <br>
                <label>Write your review<span>*</span>
                    <input type="text" name="rating">
                </label>
                <br>
                <button type="button" id="submitReview">Submit review</button>
            </form>
        </div>
        <div class="modal-footer">
        </div>
    </div>
</div>




<div class="footer">
    <h2>Footer</h2>
</div>

<script>

    let avgRating = ${avgRating};
    drawStars(avgRating);

    function drawStars(starCount) {
        let starContainer = document.querySelector('.starContainer');
        starContainer.innerHTML = ''; // Clear previous stars

        for (let i = 0; i < starCount; i++) {
            let star = document.createElement('span');
            star.innerHTML = '&#9733;'; // Unicode for a star symbol
            starContainer.appendChild(star);
        }
    }

    function toggledTest(status) {
        console.log("status:",status)

        const elementToggled = document.getElementById(status+"Toggled");
        const toggleIcon = document.getElementById(status+"ToggleIcon");

        if (elementToggled.style.display === "none" || elementToggled.style.display === "") {
            toggleIcon.innerHTML = "&minus;";
            showToggleContent(elementToggled);
        } else {
            toggleIcon.innerHTML = "&plus;";
            hideToggleContent(elementToggled);
        }
    }

    function showToggleContent(toggleElement) {
        toggleElement.style.display = "block";
    }

    function hideToggleContent(toggleElement) {
        toggleElement.style.display = "none";
    }


    let modal;
    let modalClose = document.getElementById('modalClose');
    let closeBtn = document.querySelector('.modalClose');
    const body = document.body;

    // View to myBag Modal
    document.getElementById('submitBtn').addEventListener('click', function() {
        modal = document.getElementById('myBagModal')
        modal.style.display = 'block';
        document.body.style.overflow = 'hidden'; // 페이지 스크롤 막음
    });


    // Write a Review Modal
    document.getElementById('writeReviewBtn').addEventListener('click', function() {
        console.log("writeReviewBtn Clicked");
        modal = document.getElementById('writeReviewModal');
        console.log("modal:",modal);
        modal.style.display = 'block';
        document.body.style.overflow = 'hidden'; // 페이지 스크롤 막음
    });

    // 모달 닫기 버튼 클릭 시 이벤트 처리
    closeBtn.addEventListener('click', function() {
        modal.style.display = 'none';
        document.body.style.overflow = 'auto'; // 모달 컨테이너 스크롤 복원
    });

    // 모달 닫기 버튼 클릭 시 이벤트 처리
    modalClose.addEventListener('click', function() {
        modal.style.display = 'none';
        document.body.style.overflow = 'auto'; // 모달 컨테이너 스크롤 복원
    });

    // 모달 바깥 영역 클릭 시 닫기 기능 추가
    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
            document.body.style.overflow = 'auto'; // 모달 컨테이너 스크롤 복원
        }
    });

    let submitReview = document.getElementById("submitReview");
    const form = document.getElementById("writeReviewForm");

    submitReview.addEventListener("click", function() {
        const formData = new FormData(form);
        // POST 요청을 보냅니다.
        fetch('<c:url value='/reviews'/>', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
            .then(response => {
                // 응답이 성공적으로 받아졌을 때의 처리
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                // return response.json(); // JSON 형태로 변환된 응답 데이터를 반환합니다.
                console.log(response);
            })
            .then(data => {
                // JSON 데이터를 사용하는 코드
                console.log(data);
            })
            .catch(error => {
                // 에러 발생 시 처리
                console.error('There has been a problem with your fetch operation:', error);
            });
    });
</script>
</body>
</html>