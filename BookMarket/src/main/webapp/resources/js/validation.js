/**
 * 
 */
function checkAddBook(e) {
	const bookId = document.getElementById("bookId");
	const name = document.getElementById("name");
	const unitPrice = document.getElementById("unitPrice");
	const unitsInStock = document.getElementById("unitsInStock");
	const description = document.getElementById("description");
	
	// 도서아이디 체크
	// '[도서 코드]\nISBN과 숫자를 조합하여 8~15자까지 입력하세요.\n첫 글자는 반드시 ISBN으로 시작하세요.'
	/* if (!/^ISBN[0-9]{4,11}$/.test(bookId.value)) 쌤은 변수도안만들고 이렇게하심 */ 
	const regExpBookId = /^ISBN[0-9]{4,11}$/;
	if (!regExpBookId.test(bookId.value)) {
		alert('[도서 코드]\nISBN과 숫자를 조합하여 8~15자까지 입력하세요.\n첫 글자는 반드시 ISBN으로 시작하세요.');
		bookId.focus(); // 유효성검사를 통과하지 못한 항목에 대해 focus가 가게끔
		e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
	}

	// 도서명 체크
	// '[도서명]\n최소 4자에서 최대 50자까지 입력하세요.'
	if (name.value.length < 4 || name.value.length > 50) {
		alert('[도서명]\n최소 4자에서 최대 50자까지 입력하세요.');
		name.focus(); // 유효성검사를 통과하지 못한 항목에 대해 focus가 가게끔
		e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
	}

	// 도서 가격 체크
	// '[가격]\n숫자만 입력하세요.'
	// '[가격]\n음수를 입력할 수 없습니다.'
	if (unitPrice.value.length === 0 || isNaN(unitPrice.value)) { // 주의!!!!! '' 빈문자열은 isNaN이 숫자로 인식한다. 그래서 length조건을 넣었음. 아니면 빈문자열로 넣든가.
		alert('[가격]\n숫자만 입력하세요.');
		unitPrice.focus(); // 유효성검사를 통과하지 못한 항목에 대해 focus가 가게끔
		e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
	}
	
	if ( unitPrice.value < 0 ) {
		alert('[가격]\n음수를 입력할 수 없습니다.');
		unitPrice.focus(); // 유효성검사를 통과하지 못한 항목에 대해 focus가 가게끔
		e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
	}
	
	// (참고, 나중에 쓸일 있을지 모르니) 만약 소수점 이하 최대 2자리까지 허용하는 숫자를 체크하는 정규식
	//  	/^[0-9]+(\.\d{1,2})?$/     // [0-9]랑 \d랑 똑같음
	

	// 재고 수 체크
	// "[재고 수]\n숫자만 입력하세요."
	if (unitsInStock.value.length === 0 || isNaN(unitsInStock.value)) { // 주의!!!!! '' 빈문자열은 isNaN이 숫자로 인식한다.
		alert("[재고 수]\n숫자만 입력하세요.");
		unitsInStock.focus();
		e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
	}

	// 상세설명 체크
	// "[상세설명]\n최소 100자 이상 입력하세요."
	if (description.value.length < 100) {
		alert("[상세설명]\n최소 100자 이상 입력하세요.");
		description.focus();
		e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
	}
}




/*const btn = document.querySelector('.btn');

btn.addEventListener('click', function(e) {
		e.preventDefault();
});*/