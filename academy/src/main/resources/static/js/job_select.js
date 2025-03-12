function updateSecondSelect() {
            
    var firstSelect = document.getElementById("firstSelect");
    var secondSelect = document.getElementById("secondSelect");
	
    secondSelect.innerHTML = "<option value=''> 직종 선택</option>";

    var selectedValue = firstSelect.value;
    var options = [];

    if(selectedValue === "") {options = [
        "직종 선택"
        ];
    }
     else if (selectedValue === "개발") {options = [
        "CTO(Chief Technology Officer)", "DBA(Database Admin.)",
        "ERP", "IOS 개발", "QA(Quality Assurance)", "VR 엔지니어", "게임개발",
        "기술지원", "네트워크/보안/운영", "백엔드 개발", "소프트웨어 개발", "소프트웨어 아키텍트",
        "안드로이드 개발", "웹 개발", "웹퍼블리셔", "클라우드 개발", "프론트엔드 개발", "하드웨어 개발"
        ];
    } else if (selectedValue === "교육") {options = [
        "교육기획/교재개발", "교직원", "대학교수", "외국어/어학원 강사", "유치원/보육 교사", "입시/보습/학원 강사",
        "전문강사", "초중고/특수학교 교사", "학습지/과외/방문 교사"
        ];
    } else if(selectedValue === "금융/재무") {options = [
        "경리/졸업/결산", "보헙계리사/손해사정인", "세무사", "손익/리스크관리", "외환/국제금융/펀드매니저",
        "은행원", "자산운용가", "재무기획/재무분석", "증권/투자분석가", "채권관리", "회계사"
    ];
    } else if(selectedValue === "기획/경영") {options = [
        "CEO (Chief Executive Officer)", "COO (Chief Operation Officer)", "PM/PO",
        "게임 기획", "경영기획/전략", "경영지원", "문화 기획", "비서", "사업 기획", "서비스 기획",
        "전략 기획", "컨설팅", "행사 기획"
    ];
    } else if(selectedValue === "데이터") {options = [
        "B1 엔지니어", "데이터 분석가", "데이터 사이언티스트", "데이터 엔지니어",
        "머신러닝 엔지니어", "빅데이터 엔지니어"
    ];
    } else if(selectedValue === "디자인") {options = [
        "UI/UX/GUI 디자인", "건축/설계 디자인", "광고/시각 디자인", "그래픽 디자인", "금속/공예 디자인",
        "브랜드 디자인", "애니메이션 디자인", "영상/모션 디자인", "웹 디자인", "일러스트레이터",
        "전시/무대 디자인", "제품/산업 디자인", "출판/편집 디자인", "캐릭터 디자인", "패션/섬유 디자인",
        "폰트 디자인", "환경/조경 디자인"
    ];
    } else if(selectedValue === "마케팅/시장조사") {options = [
        "CRM", "마케팅", "마케팅커뮤니케이션", "브랜드마케팅", "상품개발/기획/MD", "시장조사/분석", "온라인마케팅",
        "전략마케팅", "제품별마케팅"
    ];
    } else if(selectedValue === "미디어/홍보") {options = [
        "공연/무대/스텝", "광고기획/카피라이터", "기자", "대외협력", "방송연출/PD/감독", "배우/모델", "사진/포토그래퍼/카메라기자",
        "연예/엔터테인먼트", "영화제작/배급", "음악/음향/사운드", "인쇄/출판/편집", "작가/시나리오", "진행/아나운서",
        "카메라/조명/미술", "홍보"
    ];
    } else if(selectedValue === "법률/법무") {options = [
        "감사", "법률/법무", "변호사", "특허/변리사"
    ];
    } else if(selectedValue === "생산/제조") {options = [
        "금속/금형", "기계/기계설비", "바이오/제약/식품", "반도체/디스플레이", "비금속/요업/신소재", "생산/제조", "섬유/의류/패션",
        "안경/렌즈/광학", "전기/전자/제어", "포장/조립", "화학/에너지"
    ];
    } else if(selectedValue === "생산관리/품질관리") {options = [
        "생산/품질기획", "생산관리", "안전관리", "품질관리", "품질보증"
    ];
    } else if(selectedValue === "서비스/고객지원") {options = [
        "경호/경비원", "고객지원/CS", "고객지원/Desk", "기타 서비스직", "뷰티/미용",
        "스튜어디스/승무원", "여행가이드", "외식업/식음료", "웨딩플래너/커플매니저", "의전", "호텔리어"
    ];
    } else if(selectedValue === "엔지니어링") {options = [
        "건축설계", "공정설계", "기계설계", "배관설계", "시공/감리/공무", "유지/수리/정비", "전기설계",
        "조경/도시/인프라", "조달", "토목설계", "환경/안전/보건(ESH)"
    ];
    } else if(selectedValue === "연구개발") {options = [
        "광산", "금속/재료/신소재", "기계", "식품/제약", "유전공학/생명/생물", "인문/사회과학", "전기", "전자/반도체",
        "제어", "화학/화공/섬유", "환경/수질/대기/폐기물"
    ];
    } else if(selectedValue === "영업/제휴") {options = [
        "IT/솔루션영업", "국내영업", "금융/보험영업", "기술영업", "영업기획/관리/지원", "의약영업", "텔레마케팅", "판매/매장관리", "해외영업"
    ];
    } else if(selectedValue === "유통/무역") {options = [
        "관세사", "구매/자재/재고", "물류/유통/운송", "수출입관리", "트레이딩", "프로젝트/자원개발"
    ];
    } else if(selectedValue === "의약") {options = [
        "간병인", "간호사", "간호조무사", "물리치료사/작업치료사", "방사선사", "수의사", "안경사", "약사/한약사", 
        "영양사", "응급구조사", "의무기록사", "의사", "임상심리사/임상병리사", "치과의사", "치기공사/치과위생사", "한의사"
    ];
    } else if(selectedValue === "인사/총무") {options = [
        "노무", "보상", "비서/안내/수행원", "사무보조/문서작성", "인사관리", "인재개발/교육",
        "조직문화", "채용", "총무/사무", "헤드헌터"
    ];
    } else if(selectedValue === "전문직") {options = [
        "감정사/평가사/경매사", "문화/예술/스포츠", "부동산/공인중개사", "사서/문서관리", "상담사",
        "요리사/푸드스타일리스트", "제과제빵사", "종교", "통역/번역", "프로게이머", "항공기조종사/항해사", "행정사"
    ];
    } else if(selectedValue === "특수계층/공공") {options = [
        "공무원", "사회복지/요양/봉사", "장교/군인/부사관"
    ];
}

    options.forEach(function(option) {
        var newOption = document.createElement("option");
        newOption.value = option;
        newOption.textContent = option;
        secondSelect.appendChild(newOption);
    });
	
}