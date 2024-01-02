// 원페이지 스크롤 
window.onload = () => {
  const Slider = function(pages, pagination) {
    let slides = [],
        btns = [],
        count = 0,
        current = 0,
        touchstart = 0,
        animation_state = false;

    const init = () => {
      slides = pages.children;
      count = slides.length;
      for(let i = 0; i < count; i++) {
        slides[i].style.bottom = -(i * 100) + '%';
        let btn = document.createElement('li');
        btn.dataset.slide = i;
        btn.addEventListener('click', btnClick)
        btns.push(btn);
        pagination.appendChild(btn);
      }
      btns[0].classList.add('active');
    }

    const gotoNum = (index) => {
      if((index != current) && !animation_state) {
        animation_state = true;
        setTimeout(() => animation_state = false, 500);
        btns[current].classList.remove('active');
        current = index;
        btns[current].classList.add('active');
        for(let i = 0; i < count; i++) {
          slides[i].style.bottom = (current - i) * 100 + '%';
        }
      }
    }

    const gotoNext = () => current < count - 1 ? gotoNum(current + 1) : false;
    const gotoPrev = () => current > 0 ? gotoNum(current - 1) : false;
    const btnClick = (e) => gotoNum(parseInt(e.target.dataset.slide));
    pages.ontouchstart = (e) => touchstart = e.touches[0].screenY;
    pages.ontouchend = (e) => touchstart < e.changedTouches[0].screenY ? gotoPrev() : gotoNext();
    pages.onmousewheel = pages.onwheel = (e) => e.deltaY < 0 ? gotoPrev() : gotoNext();

    init();
  }

  let pages = document.querySelector('.pages');
  let pagination = document.querySelector('.pagination');
  let slider = new Slider(pages, pagination)
}


// 버튼
const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");
const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

fistForm.addEventListener("submit", (e) => e.preventDefault());
secondForm.addEventListener("submit", (e) => e.preventDefault());



