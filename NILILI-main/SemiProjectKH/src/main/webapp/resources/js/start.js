
//상수 페이지 전역에 선언

const main = document.querySelector("#main");
const qna = document.querySelector("#qna");
const result = document.querySelector("#result");
// div영역안에 들어갈 텍스트를 상수로 선언해 넣는다.

const endPoint = 12; //질문이 총 12개이므로 endPoint를 12로 설정해둔다

const select = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; //12개의 장소를 하나의 배열에 넣고 밸류값이 큰순서대로 정렬하기위해 배열 선언



//-----------------------------------------------------------------------------------------------------------------------------------


//시작 함수
function begin(){
  main.style.WebkitAnimation = "fadeOut 1s"; //시각효과
  main.style.animation = "fadeOut 1s";//시각효과
  setTimeout(() => {
    qna.style.WebkitAnimation = "fadeIn 1s";//시각효과
    qna.style.animation = "fadeIn 1s";//시각효과
    setTimeout(() => {
      main.style.display = "none";//위의 타임아웃이 끝났을때 메인 영역을 안보이게 설정하여 qna 영역이 나오게 한다.
      qna.style.display = "block"//qna 영역블록 레벨로 설정 블록 레벨 요소는 항상 새로운 줄에서 시작하며, 가능한 가로 폭을 모두 차지!
    }, 450)
    let qIdx = 0; //진행 정도를 알수있게 qIdx 설정
    goNext(qIdx);
  }, 450);
}



//-----------------------------------------------------------------------------------------------------------------------------------



//답변 눌렀을때 다음으로 넘어가기
function goNext(qIdx){
	
  if(qIdx === endPoint){ //qIdx가 endpoint와 같아지면 결과페이지로 보내고 리턴 그래야 이프구문 밑의 구문이 실행 안됨
    goResult();
    return;
  }
  
  //qIdx가 endPoint보다 작을때는 밑의 구문을 실행
  var q = document.querySelector('.qBox'); //qBox안을 q로 채우는데
  q.innerHTML = qnaList[qIdx].q; //q는 innerHTML을 사용하여 qna리스트의 qIdx번째의 q값을 가져와서 넣는다
  for(let i in qnaList[qIdx].a){ //답변박스가 세개가 다 나오도록 for in 루프 사용하여 addAnswer 함수실행 (답변이 총 세개이므로)
    addAnswer(qnaList[qIdx].a[i].answer, qIdx, i); //qnaList[qIdx].a[i].answer => answerText 로 받아짐 (밑함수에서)
  }
  var status = document.querySelector('.statusBar');
  status.style.width = (100/endPoint) * (qIdx+1) + '%'; 
  //전체를 100으로보고 엔드포인트로 나눈다음 qIdx의 크기만큼 가로를 설정해 qIdx가 커질때마다 진행도가 보여짐
}



//-----------------------------------------------------------------------------------------------------------------------------------



//답변박스 뽑아내는 함수
function addAnswer(answerText, qIdx, idx){
  var a = document.querySelector('.answerBox');
  var answer = document.createElement('button');//버튼을 새로 만드는데 그버튼을 answer라는 변수로 선언
  answer.classList.add('answerList');//answer 버튼의 클래스리스트에 추가한다.
  answer.classList.add('my-3');//스타일 추가 (부트스트랩)
  answer.classList.add('py-3');//스타일 추가 (부트스트랩)
  answer.classList.add('mx-auto');//스타일 추가(부트스트랩)
  answer.classList.add('fadeIn');//시각효과

  a.appendChild(answer); //answer를 a의 자식으로 추가하고
  answer.innerHTML = answerText; //answer안에 문구를 추가한다

  answer.addEventListener("click", function(){//답변박스 클릭하는 함수
    var children = document.querySelectorAll('.answerList');
    for(let i = 0; i < children.length; i++){
      children[i].disabled = true;
      children[i].style.WebkitAnimation = "fadeOut 0.5s";
      children[i].style.animation = "fadeOut 0.5s";
    }
    setTimeout(() => {
      var target = qnaList[qIdx].a[idx].type;
      for(let i = 0; i < target.length; i++){
        select[target[i]] += 1;
      }

      for(let i = 0; i < children.length; i++){
        children[i].style.display = 'none';
      }
      goNext(++qIdx); //클릭하면 답변박스 다 사라지게하고 gonext함수에 qIdx ++ 해서 넘김 
    },450)
  }, false);
}



//-----------------------------------------------------------------------------------------------------------------------------------



// 12개 질문 다 한후 결과페이지로 (endPoint==qIdx)
function goResult(){
  qna.style.WebkitAnimation = "fadeOut 1s";
  qna.style.animation = "fadeOut 1s";
  setTimeout(() => {
    result.style.WebkitAnimation = "fadeIn 1s";
    result.style.animation = "fadeIn 1s";
    setTimeout(() => {
      qna.style.display = "none";
      result.style.display = "block"
    }, 450)})
    setResult();
}



//-----------------------------------------------------------------------------------------------------------------------------------



//결과에 나오는 여행지 밸류 계산하여 indexOf로 제일 첫번째 여행지 를 리턴
function calResult(){
  console.log(select);
  var result = select.indexOf(Math.max(...select));
  return result;
}




//-----------------------------------------------------------------------------------------------------------------------------------




//결과페이지
function setResult(){
  let point = calResult(); //point를 위에서 받은 여행지 숫자로 받아줌
  const resultName = document.querySelector('.resultname');
  resultName.innerHTML = infoList[point].name;

  var resultImg = document.createElement('img');
  const imgDiv = document.querySelector('#resultImg');
  var imgURL = 'resources/img/image-' + point + '.jpg'; //여행지 이미지 이름을 정해줬기때문에 결과에 맞게 보여줄수있음
  resultImg.src = imgURL;
  resultImg.alt = point;
  resultImg.classList.add('img-fluid');
  imgDiv.appendChild(resultImg);

  const resultDesc = document.querySelector('.resultDesc');
  resultDesc.innerHTML = infoList[point].desc;
}





