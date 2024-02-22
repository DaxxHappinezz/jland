'use strict';

// 로그인 관련
let msg = "${msg}"
    
if (msg == "LOG_ERR") alert("ID 또는 Password를 확인 후 이용해 주세요.");

// 회원가입 관련
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

// pwVisibility 버튼 클릭 시 부모 요소 type을 text or password로 변경
const pwVisibilityBtn = document.getElementById('pwVisibility');

pwVisibilityBtn.addEventListener('click', ()=> {
    const userPassword = document.getElementById('userPassword');
    if (userPassword.type == 'password') {
        userPassword.type = 'Text';
        userPassword.classList.toggle('active');
    } else {
        userPassword.type = 'password';
        userPassword.classList.remove('active');
    }
});

// Check ID 버튼 클릭 시 ajax로 가입 가능한 ID 기능 추가
const checkIdBtn = document.getElementById('checkIdBtn');
checkIdBtn.addEventListener('click', ()=> {
    console.log("btn clicked.")
});
 
//   $(document).ready(function() {
//     $('#checkIdBtn').click(function() {
//       let userId = $('#userId').val();
//       $.ajax({
//         type: 'post',
//         url:'<c:url value="/account/check-id"/>',
//         data: 'id=' + userId,
//         success:function(data) {
//           if (data === 'CHK_OK') {
//             alert("사용 가능한 ID입니다.")
//           }
//         },
//         error:function(data) {
//           if (data.responseText === 'CHK_ERR') {
//             alert("사용할 수 없는 ID입니다.")
//           }
//         }
//       });
//     });
//   });