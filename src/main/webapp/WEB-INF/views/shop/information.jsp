<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>
<!DOCTYPE html>
<html>
<head>
    <title>J Land</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css?after"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/information.css"/> "/>
    <script src="https://kit.fontawesome.com/3303015ad2.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="header">
    <h1>J Land</h1>
    <p>Resize the browser window to see the effect.</p>
</div>

<div class="topnav">
    <a href="<c:url value='/'/>">JLand</a>
    <a href="<c:url value='/shop'/>">SHOP</a>
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
                <button type="button" id="submitBtn" data-pno="${product.pno}">Add to Bag</button>
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

        <%--  Arrow  --%>
        <aside>
            <a class="arrow-up" href="#" title="Back to top">
                <i class="fa-solid fa-arrow-up"></i>
            </a>
        </aside>
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
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {

        // customer review 영역 클릭 시 리뷰 목록 호출
        document.getElementById("customerInfo").addEventListener("click", function(event) {
            getToggle("customer", event);
        });

        // 리뷰 작성 함수
        document.getElementById("submitReview").addEventListener("click", function() {
            let reviewForm = document.getElementById("writeReviewForm");

            let reviewData = {
                pno: reviewForm.querySelector("#productNo").value,
                rating: reviewForm.querySelector("#reviewRating").value,
                title: reviewForm.querySelector("#reviewTitle").value,
                comment: reviewForm.querySelector("#reviewComment").value
            };

            if (reviewData.pno === "" || reviewData.rating === "" ||
                reviewData.title === "" || reviewData.comment === "") {
                alert("필수 항목(*)을 입력한 후 다시 시도해 주세요.");
                return;
            }

            fetch('<c:url value='/reviews'/>', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(reviewData)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    showPageReviewList(this);

                    modal.style.display = 'none';
                    document.body.style.overflow = 'auto';
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
        });

        // 리뷰의 up 또는 down 버튼 클릭 시 실행
        document.getElementById("customerToggled").addEventListener("click", function(event) {
            let rno = event.target.parentNode.parentNode.dataset.rno;

            if (event.target.id === "upBtn") {

                let upValueElement = event.target.parentElement.querySelector(".up");

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

                let downValueElement = event.target.parentElement.querySelector(".down");

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

        // 평점 (1 ~ 5 숫자만 입력 가능)
        document.getElementById('reviewRating').addEventListener('input', function () {
            const inputValue = document.getElementById('reviewRating').value;
            const isValid = /^[1-5]$/.test(inputValue);
            if (!isValid) {
                let msg = 'Overall rating should be a number between 1 and 5.';
                setMessage(msg, 'ratingMsg');
                document.getElementById('reviewRating').value = ''; // 유효하지 않은 값 제거
                console.log("reviewRatingInput() - msg: ", msg);
            }
        });

        // 리뷰 제목 (공백 x)
        document.getElementById('reviewTitle').addEventListener('blur', function () {
            const inputValue = document.getElementById('reviewTitle').value;
            const isValid = /\S/.test(inputValue);
            if (!isValid) {
                let msg = 'Review Title cannot be empty.';
                setMessage(msg, 'titleMsg');
                document.getElementById('reviewTitle').value = ''; // 유효하지 않은 값 제거
                console.log("reviewTitleInput() - msg: ", msg);
            }
        });

        // 리뷰 코멘트 (공백 x)
        document.getElementById('reviewComment').addEventListener('blur', function () {
            const inputValue = document.getElementById('reviewComment').value;
            const isValid = /\S/.test(inputValue);
            if (!isValid) {
                let msg = 'Review Comment cannot be empty.';
                setMessage(msg, 'commentMsg');
                document.getElementById('reviewComment').value = ''; // 유효하지 않은 값 제거
                console.log("reviewCommentInput() - msg: ", msg);
            }
        });

        // For Quantity change
        const qty = document.getElementById('qty');
        let qtyValue = document.getElementById("qty").value;

        document.getElementById("decreaseQtyBtn").addEventListener("click", function() {
            if (qtyValue > 1) {
                qtyValue--;
            }
            qty.value = qtyValue;
        });

        document.getElementById("increaseQtyBtn").addEventListener("click", function() {
            if (qtyValue >= 1 && qtyValue < 5) {
                qtyValue++;
            }
            qty.value = qtyValue;
        });


        // For Modal
        let modal;
        let modalClose = document.getElementById('modalClose');
        let writeModalCloseBtn = document.getElementById('writeModalCloseBtn');
        let closeBtn = document.querySelector('.modalClose');
        const body = document.body;

        // View to myBag Modal
        document.getElementById('submitBtn').addEventListener('click', function(event) {
            console.log("AddToBag Btn clicked.");

            let pno = event.target.dataset.pno;
            console.log("pno: ", pno);
            console.log("qtyValue: ", qtyValue);
            addToBag(pno, qtyValue);
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
            if (event.target === modal) {
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
    });


    let addToBag = function(pno, quantity) {
        fetch("/jland/cart?pno="+pno+"&quantity="+quantity, {
            method: 'POST'
        })
            .then(response => {
                console.log("response: ", response);

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                return response;
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);
            });
    }

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
    let toHtml = function (reviews) {
        console.log("reviews: ", reviews);

        // 리뷰가 존재하지 않을 때
        if (reviews.itemsList.length === 0) {
            let tmp = "<div>가장 빠르게 첫 리뷰를 등록해 보세요.</div>";
            return tmp;
        }

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
        console.log("showPrev", reviews.showPrev);
        console.log("showNext", reviews.showNext);
        tmp += "<a href='#none' data-pno=" + pno + " data-current-page=" + (reviews.beginPage - 1)
        tmp += " class='review-nav' onclick='showPageReviewList(this)'>" + (reviews.showPrev ? "&lt; " : "") + "</a> "
        for(let i = reviews.beginPage; i <= reviews.endPage; i++) {
            tmp += "<a href='#none' data-pno=" + pno
            tmp += " data-current-page="+i+" class='review-nav' onclick='showPageReviewList(this)'>"+i+"</a>"+" "
        }
        tmp += "<a href='#none' data-pno=" + pno + " data-current-page=" + (reviews.endPage + 1)
        tmp += " class='review-nav' onclick='showPageReviewList(this)'>" + (reviews.showNext ? "&gt;" : "") + "</a>"
        tmp += "</div>"
        tmp += "<br>"
        return tmp + "</ul>";
    }

    // 리뷰 목록을 불러오는 함수
    let showPageReviewList = function(info) {
        console.log("showPageReviewList() executed.");

        let pno = ${product.pno};
        let currentPage = 1;

        if (info.dataset !== null && typeof info.dataset === 'object' && Object.keys(info.dataset).length > 0) {
            pno = info.dataset.pno;
            currentPage = info.dataset.currentPage;
        }

        console.log("pno", pno);
        console.log("currentPage", currentPage);

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

                document.getElementById("reviewArea").innerHTML = toHtml(data);
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);
            });
    }

    // For Toggle
    let getToggle = function(status, event) {
        console.log("status:",status)
        console.log("event:", event)

        if (status === "customer") {
            showPageReviewList(this);
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

    function moveToCart() {
        window.location.href = '<c:url value="/cart"/>';
    }

    function setMessage(msg, element) {
        document.getElementById(element).innerHTML = msg;
    }
</script>
</body>
</html>