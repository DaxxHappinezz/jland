'use strict';

// Header 영역 높이 구하기
const header = document.querySelector('.header');
const headerHeight = header.getBoundingClientRect().height;
document.addEventListener('scroll', () => {

    if (headerHeight < window.scrollY) {
        console.log("test");
    }
});

// top 도달 시 Arrow up 버튼 숨기기
const arrowUp = document.querySelector('.arrow-up');
document.addEventListener('scroll', () => {
    if (window.scrollY > 100) {
        arrowUp.style.opacity = 1;
    } else {
        arrowUp.style.opacity = 0;
    }
});

// Cartegory 클릭 시 해당 Product 출력
const categories = document.querySelector('.categories');
const products = document.querySelectorAll('.product');
categories.addEventListener('click', (event) => {
    const filter = event.target.dataset.category;

    if (filter == null) {
        return;
    }
    handleActiveSelection(event.target);
    filterProducts(filter);
});

function handleActiveSelection(target) {
    const active = document.querySelector('.category--selected');
    active.classList.remove('category--selected');
    target.classList.add('category--selected');
}

function filterProducts(filter) {
    products.forEach(product => {
        console.log(product.dataset.category);
        if (filter === 'all' || filter === product.dataset.category) {
            product.style.display = 'block';
        } else {
            product.style.display = 'none';
        }
    })
};