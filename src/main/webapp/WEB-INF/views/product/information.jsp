<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
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
        background-color: rgba(0,0,0,0.4);
    }

    /* 모달 내용 스타일 */
    .modal-content {
        background-color: #fefefe;
        margin: 20px auto;
        border: 1px solid #888;
        width: 80%;
        max-width: 600px; /* 최대 가로 크기 설정 */
        max-height: 95%; /* 최대 세로 크기 설정 */
        overflow: auto; /* 내용이 넘칠 경우 스크롤 표시 */
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    /* 닫기 버튼 스타일 */
    .modalClose {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        margin: 15px 15px 0 0;
    }

    .modalClose:hover,
    .modalClose:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .modal-header,
    .modal-body,
    .modal-footer,
    .modal-body-row {
        padding: 15px;
    }

    .modal-body {
        height: 230px;
        width: 100%;
        justify-content: space-between;
        display: flex;
        align-items: center; /* 수직 중앙 정렬 */
    }

    .modal-footer {
        height: 100px;
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
        align-items: center; /* 수직 가운데 정렬 */
    }
    .modal-footer > #submitReview {
        align-items: center; /* 수직 중앙 정렬 */
    }

    .modal-body-row,
    .modalContentInfo {
        display: flex;
        flex-direction: column;
    }

    .modal-body-row,
    .modalContentInfoDetail {
        margin: auto 0;
    }

    .modalContentImage,
    .modalContentInfo {
        height: 100%; /* 부모인 .modal-body에 맞추기 위해 높이 100%로 설정 */
        flex: 1; /* 남은 공간을 모두 차지하도록 설정 */
    }

    .modalContentImage {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .modalContentInfo {
        padding-left: 20px;
    }

    .modalContentImage img {
        height: 100%;
        width: auto;
        display: block;
        margin: auto; /* 이미지를 컨테이너 내에서 수평으로 가운데에 위치시킴 */
    }

    .toggled {
        display: none; /* 초기에 숨김 상태 */
        padding: 0 15px;
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
    .updown {
        width: 20px;
        height: 20px;
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
                <div>
                    <button type="button" name="decreaseQtyBtn" id="decreaseQtyBtn">&minus;</button>
                    <input type="[0-9]*" id="qty" value="1" readonly/>
                    <button type="button" name="increaseQtyBtn"  id="increaseQtyBtn">&plus;</button>
                    <small>Limit 5</small>
                </div>
                <button type="button" id="submitBtn">Add to Bag</button>
            </div>
        </div>

        <div class="productInfoArea" onclick="getToggle('test')">
            <h2><span class="toggleTitle">Features</span></h2>
            <span id="testToggleIcon" class="toggleIcon">&plus;</span>
        </div>
        <div id="testToggled" class="toggled">This is the element to toggle</div>

        <div class="productInfoArea" onclick="getToggle('spec')">
            <h2><span class="toggleTitle">Specifications</span></h2>
            <span id="specToggleIcon" class="toggleIcon">&plus;</span>
        </div>
        <div id="specToggled" class="toggled">This is the element to toggle</div>
        <div id="customerInfo" class="productInfoArea">
            <h2>
                <span class="toggleTitle">Customer reviews</span>
                <span class="starContainer"></span>
                <span>${product.review_cnt}</span>
            </h2>
            <span id="customerToggleIcon" class="toggleIcon">&plus;</span>
        </div>
        <div id="customerToggled" class="toggled">
            <br>
            <span>Overall Rating</span>
            <div>
                <span class="starContainer"></span>
                <span>${avgRating}</span>
                <span>(${product.review_cnt})</span>
            </div>
            <hr>
            <p>Please note that by submitting a helpfulness vote on a review your IP address is collected and stored by our trusted third party service provider for the sole purpose of preventing multiple entries from the same IP address. To see how to control your personal data, please see our Privacy policy.</p>
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
            <span><button id="writeReviewBtn">Write a Review</button></span>
            <hr>
            <div id="reviewArea"></div>
        </div>
    </div>
</div>

<!-- modal -->
<%-- view to myBag --%>
<div id="myBagModal" class="modal">
    <div class="modal-content">
        <span class="modalClose">&times;</span>
        <div class="modal-header">
            <h2>Added to My Bag</h2>
        </div>
        <hr>
        <div class="modal-body">
            <div class="modalContentImage">
                <img src="<c:url value='/resources/img/test.png'/>" alt="testimage"/>
            </div>
            <div class="modalContentInfo">
                <div class="modalContentInfoDetail">
                    <p><span>${product.pname}</span></p>
                    <p><span>$${product.price}</span></p>
                    <p><span id="modalQty"></span></p>
                </div>
            </div>
        </div>
        <hr>
        <div class="modal-footer">
            <button type="button" id="modalClose">Continue Shopping</button>
            <button type="button" id="myBagBtn" onclick="moveToCart()">View My Bag</button>
        </div>
    </div>
</div>

<%-- write a review --%>
<div id="writeReviewModal" class="modal">
    <div class="modal-content">
        <span id="writeModalCloseBtn" class="modalClose">&times;</span>
        <div class="modal-header">
            <h2>Write a Review</h2>
        </div>
        <hr>
        <div class="modal-body">
            <div class="modalContentImage">
                <img src="<c:url value='/resources/img/test.png'/>" alt="testimage"/>
            </div>
            <div class="modalContentInfo">
                <div class="modalContentInfoDetail">
                    <h4>${product.pname}</h4>
                </div>
            </div>
        </div>
        <div class="modal-body-row">
            <form id="writeReviewForm">
                <label for="productNo"></label>
                <input type="hidden" id="productNo" value="${product.pno}">
                <label for="reviewRating">Overall rating<span>*</span></label>
                <br>
                <input type="text" name="rating" id="reviewRating" placeholder="1 ~ 5 Point">
                <br>
                <div id="ratingMsg" class="msg"></div>
                <br>
                <label for="reviewTitle">Review Title<span>*</span></label>
                <br>
                <input type="text" name="title" id="reviewTitle" placeholder="Review Title">
                <br>
                <div id="titleMsg" class="msg"></div>
                <br>
                <label for="reviewComment">Write your review<span>*</span></label>
                <br>
                <textarea name="comment" id="reviewComment" placeholder="Review Content"></textarea>
                <br>
                <div id="commentMsg" class="msg"></div>
            </form>
        </div>
        <hr>
        <div class="modal-footer">
            <button type="button" id="submitReview">Submit review</button>
        </div>
    </div>
</div>

<div class="footer">
    <h2>Footer</h2>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {

        // 리뷰 전송 시 검증 함수 호출
        reviewFormValidation();

        // customer rivew 영역 클릭 시 리뷰 목록 호출
        document.getElementById("customerInfo").addEventListener("click", function(event) {
            getToggle("customer", event);
        });

        // 리뷰 작성 함수
        document.getElementById("submitReview").addEventListener("click", async function() {
            console.log("this is form check().");
            let reviewForm = document.getElementById("writeReviewForm");

            if (!(reviewFormValidation())) { // await를 사용하여 비동기 결과를 기다립니다.
                console.log("formCheck is not true.");
                return;
            }

            let reviewData = {
                pno: reviewForm.querySelector("#productNo").value,
                rating: reviewForm.querySelector("#reviewRating").value,
                title: reviewForm.querySelector("#reviewTitle").value,
                comment: reviewForm.querySelector("#reviewComment").value
            };
            console.log("reviewData:", reviewData);

            fetch('<c:url value='/reviews'/>', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(reviewData)
            })
                .then(response => {
                    // 응답이 성공적으로 받아졌을 때의 처리
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    console.log(response);

                    window.location.reload()

                    console.log("after reload() executed.");
                    getToggle('customer');

                    return response;
                })
                .then(data => {
                    console.log(data);
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                    return false;
                });
            return true;
        })

        // 리뷰의 up 또는 down 버튼 클릭 시 실행
        document.getElementById("customerToggled").addEventListener("click", function(event) {
            // 클릭된 버튼의 rno 가져오기
            let rno = event.target.parentNode.parentNode.dataset.rno;

            // 클릭된 요소 id가 upBtn일 때
            if (event.target.id === "upBtn") {
                console.log(`upCalcBtn clicked`);

                // 부모 요소에서 upValueElement 클래스 찾기
                let upValueElement = event.target.parentElement.querySelector(".up");

                // /reviews/up/{rno} patch method
                fetch(`/jland/reviews/up/`+rno, {
                    method: 'PATCH',
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        let up_cnt = data.up_cnt;

                        upValueElement.innerHTML = up_cnt;
                    })
                    .catch(error => {
                        console.error('There has been a problem with your fetch operation:', error);
                    });
            }

            // 클릭된 요소 id가 downBtn일 때
            if (event.target.id === "downBtn") {
                console.log(`downBtn clicked`);

                // 부모 요소에서 downValueElement 클래스 찾기
                let downValueElement = event.target.parentElement.querySelector(".down");

                // /reviews/down/{rno} patch method
                fetch(`/jland/reviews/down/`+rno, {
                    method: 'PATCH',
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        let down_cnt = data.down_cnt;

                        downValueElement.innerHTML = down_cnt;
                    })
                    .catch(error => {
                        console.error('There has been a problem with your fetch operation:', error);
                    });
            }


        });
    });

    // For Quantity change
    const qty = document.getElementById('qty');
    let qtyValue = document.getElementById("qty").value;
    const decreaseQtyBtn = document.getElementById("decreaseQtyBtn");
    const increaseQtyBtn = document.getElementById("increaseQtyBtn");

    console.log("qtyValue:",qtyValue);

    decreaseQtyBtn.addEventListener("click", function() {
       if (qtyValue > 1) {
           qtyValue--;
       }
        qty.value = qtyValue;
    });

    increaseQtyBtn.addEventListener("click", function() {
       if (qtyValue >= 1 && qtyValue < 5) {
           qtyValue++;
       }
        qty.value = qtyValue;
    });

    let avgRating = ${empty avgRating ? 0.0 : avgRating};
    drawStars(avgRating);

    function drawStars(starCount) {
        let starContainer = document.querySelector('.starContainer');
        starContainer.innerHTML = ''; // Clear previous stars

        for (let i = 0; i < starCount; i++) {
            let star = document.createElement('span');
            star.innerHTML = '&#9733;'; // Unicode for a star symbol
            starContainer.appendChild(star);
        }

        return starContainer;
    }

    // fetch 시 받아온 json 값을 html 형식으로 변환
    let toHTML = function (reviews) {
        let tmp = "<ul>";
        let pno;
        reviews.itemsList.forEach(function(review) {
            pno = review.pno
            tmp += "<li data-rno=" + review.rno
            tmp += " data-pno=" + review.pno
            tmp += " data-uno=" + review.uno + ">"
            tmp += "<span class='created'>" + review.created +"</span>"
            tmp += "<br>"
            tmp += "<span class='starContainer'>"
            tmp += drawStars(review.rating).innerHTML
            tmp += "</span>"
            tmp += "<br>"
            tmp += "<span class='title'>" + review.title + "</span>"
            tmp += "<br>"
            tmp += "<span class='givenName'>" + review.givenName + "</span>"
            tmp += " <span class='familyName'>" + review.familyName + "</span>"
            tmp += "<br>"
            tmp += "<span class='comment'>" + review.comment + "</span>"
            tmp += "<br>"
            tmp += "<div style='display: flex;'>"
            tmp += "<img src='<c:url value="/resources/img/thumb-up.png"/>' id='upBtn' class='updown' style='width: 20px; height: 20px; alt='thumb-up'>"
            tmp += "<span class='up'>" + review.up + "</span>"
            tmp += "<img src='<c:url value="/resources/img/thumb-down.png"/>' id='downBtn' class='updown' style='width: 20px; height: 20px; alt='thumb-down'>"
            tmp += "<span class='down'>" + review.down + "</span>"
            tmp += "<div><a href='#none' class='modfyBtn'>수정</a>"
            tmp += "<a href='#none' class='deleteBtn'>삭제</a></div>"
            tmp += "</div>"
            tmp += "</li>"
            tmp += "<hr>"
        })

        tmp += "<div id='reviewNav'>"
        for(let i = reviews.beginPage; i <= reviews.endPage; i++) {
            tmp += "<a href='#none' data-pno=" + pno
            tmp += " data-current-page="+i+" class='current-page' onclick='showPageReviewList(this)'>"+i+"</a>"+" "
        }
        tmp += "</div>"
        tmp += "<br>"
        return tmp + "</ul>";
    }

    let showPageReviewList = function(info) {

        let pno = info.dataset.pno;
        let currentPage = info.dataset.currentPage; // 수정된 부분

        fetch("/jland/reviews/page?pno="+pno+"&currentPage="+currentPage, {
            method: 'GET'
        })
            .then(response => {
                console.log("response: ", response);

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                return response.json();
            })
            .then(data => {
                console.log("success-data: ", data);

                document.getElementById("reviewArea").innerHTML = toHTML(data);
                drawStars(avgRating);
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);
            });
    }

    let showReviewList = function(pno) {
        fetch(`/jland/reviews/page?pno=${pno}`, {
            method: 'GET'
        })
            .then(response => {
                console.log("response: ", response);

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                return response.json();
            })
            .then(data => {
                console.log("success-data: ", data);

                document.getElementById("reviewArea").innerHTML = toHTML(data);
                drawStars(avgRating);
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);
            });
    }


    // For Toggle
    let getToggle = function (status, event) {
        console.log("status:",status)
        console.log("event:", event)

        let pno = ${product.pno};
        if (status === "customer") {
            showReviewList(pno);
        }
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


    // For Modal
    let modal;
    let modalClose = document.getElementById('modalClose');
    let writeModalCloseBtn = document.getElementById('writeModalCloseBtn');
    let closeBtn = document.querySelector('.modalClose');
    const body = document.body;

    // View to myBag Modal
    document.getElementById('submitBtn').addEventListener('click', function() {
        modal = document.getElementById('myBagModal')
        modal.style.display = 'block';

        let modalQty = document.getElementById("modalQty");
        modalQty.innerHTML = `Qty: `+qtyValue;

        document.body.style.overflow = 'hidden'; // 페이지 스크롤 막음
    });

    // 모달 닫기(x) 버튼 클릭 시 이벤트 처리
    closeBtn.addEventListener('click', function() {
        modal.style.display = 'none';
        document.body.style.overflow = 'auto'; // 모달 컨테이너 스크롤 복원
    });

    // Write a Review Close Button 클릭 시 이벤트 처리
    writeModalCloseBtn.addEventListener('click', function() {
        modal.style.display = 'none';
        document.body.style.overflow = 'auto'; // 모달 컨테이너 스크롤 복원
    });

    // continue shopping 클릭 시 이벤트 처리
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

    // Write a Review Modal
    document.getElementById('writeReviewBtn').addEventListener('click', function() {
        console.log("writeReviewBtn Clicked");
        modal = document.getElementById('writeReviewModal');
        console.log("modal:",modal);
        modal.style.display = 'block';
        document.body.style.overflow = 'hidden'; // 페이지 스크롤 막음
    });

    function moveToCart() {
        window.location.href = '<c:url value="/cart"/>';
    }

    function setMessage(msg, element){
        document.getElementById(element).innerHTML = msg;
    }

    function reviewFormValidation() {
        // 평점 (1 ~ 5 숫자만 입력 가능)
        const reviewRatingInput = document.getElementById('reviewRating');
        reviewRatingInput.addEventListener('input', function () {
            const inputValue = reviewRatingInput.value;
            const isValid = /^[1-5]$/.test(inputValue);
            if (!isValid) {
                let msg = 'Overall rating should be a number between 1 and 5.';
                setMessage(msg, 'ratingMsg');
                reviewRatingInput.value = ''; // 유효하지 않은 값 제거
                return false;
            }
        });

        // 리뷰 제목 (공백 x)
        const reviewTitleInput = document.getElementById('reviewTitle');
        reviewTitleInput.addEventListener('input', function () {
            const inputValue = reviewTitleInput.value;
            const isValid = /\S/.test(inputValue);
            if (!isValid) {
                let msg = 'Review Title cannot be empty.';
                setMessage(msg, 'titleMsg');
                reviewTitleInput.value = ''; // 유효하지 않은 값 제거
                return false;
            }
        });

        // 리뷰 코멘트 (공백 x)
        const reviewCommentInput = document.getElementById('reviewComment');
        reviewCommentInput.addEventListener('input', function () {
            const inputValue = reviewCommentInput.value;
            const isValid = /\S/.test(inputValue);
            if (!isValid) {
                let msg = 'Review Comment cannot be empty.';
                setMessage(msg, 'commentMsg');
                reviewCommentInput.value = ''; // 유효하지 않은 값 제거
                return false;
            }
        });
        return true;
    }
</script>
</body>
</html>