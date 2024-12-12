function menuToggle() {
  const toggleMenu = document.querySelector(".menu-user");
  toggleMenu.classList.toggle("active");
}

let btn_appear = document.getElementById('btn-user-action') 
let profile_user = document.getElementById('profile-user')
let username=""
function checkLogin(){
  if(username ==""){
    btn_appear.style.display = 'flex'
    profile_user.style.display = 'none'
  }
  else{
    btn_appear.style.display = 'none'
    profile_user.style.display = 'block'
  }
}
checkLogin()

// let list = document.querySelector('.img-product .list')
// let items = document.querySelectorAll('.img-product .list .item')
// let dots = document.querySelectorAll('.img-product .dots li')
// let prev = document.getElementById('prev')
// let next = document.getElementById('next')
// let dot_img = document.querySelectorAll('.show-img-product .show-img')
// let active = 0
// let lengthItems = items.length - 1
// for (let i = 0; i < items.length; i++) {
//   if(i == 0)
//     items[i].style.display = 'block'
//   else
//     items[i].style.display = 'none'
// }
// for (let i = 0; i < dot_img.length; i++) {
//   if(i == 0)
//     dot_img[i].style.opacity = 1;
//   else
//     dot_img[i].style.opacity = 0.33;
// }
// next.onclick = function(){
//   if(active +1 > lengthItems){
//     active = 0
//   } else {
//     active += 1
//   }
//   reloadSlider()
// }
// prev.onclick = function(){
//   if(active -1 < 0){
//     active = lengthItems
//   } else {
//     active -= 1
//   }
//   reloadSlider()
// }
// function ShowImg(n){
//   active = n -1
//   reloadSlider()
// }
// function reloadSlider(){
//   let checkLeft = items[active].offsetLeft;
//   list.style.left = -checkLeft + 'px';

//   let lastActiveDot = document.querySelector('.img-product .dots li.active')
//   lastActiveDot.classList.remove('active')
//   dots[active].classList.add('active')

//   for(var i = 0; i < items.length ; i++){
//     items[i].style.display = 'none'
//   }
//   items[active].style.display = 'block'

//   for (i = 0; i < dot_img.length; i++) {
//     dot_img[i].style.opacity = 0.33;
//   }
//   dot_img[active].style.opacity = 1;

// }

// dots.forEach((li, index) => {
//   li.addEventListener('click',function(){
//     active = index
//     reloadSlider();
//   }
// )})

// (function () {
//   const quantityContainer = document.querySelector(".quantity");
//   const minusBtn = quantityContainer.querySelector(".minus");
//   const plusBtn = quantityContainer.querySelector(".plus");
//   const inputBox = quantityContainer.querySelector(".input-box");

//   updateButtonStates();

//   quantityContainer.addEventListener("click", handleButtonClick);
//   inputBox.addEventListener("input", handleQuantityChange);

//   function updateButtonStates() {
//     const value = parseInt(inputBox.value);
//     minusBtn.disabled = value <= 1;
//     plusBtn.disabled = value >= parseInt(inputBox.max);
//   }

//   function handleButtonClick(event) {
//     if (event.target.classList.contains("minus")) {
//       decreaseValue();
//     } else if (event.target.classList.contains("plus")) {
//       increaseValue();
//     }
//   }

//   function decreaseValue() {
//     let value = parseInt(inputBox.value);
//     value = isNaN(value) ? 1 : Math.max(value - 1, 1);
//     inputBox.value = value;
//     updateButtonStates();
//     handleQuantityChange();
//   }

//   function increaseValue() {
//     let value = parseInt(inputBox.value);
//     value = isNaN(value) ? 1 : Math.min(value + 1, parseInt(inputBox.max));
//     inputBox.value = value;
//     updateButtonStates();
//     handleQuantityChange();
//   }

//   function handleQuantityChange() {
//     let value = parseInt(inputBox.value);
//     value = isNaN(value) ? 1 : value;

//     // Execute your code here based on the updated quantity value
//     console.log("Quantity changed:", value);
//   }
// })();

 
let main_content_shop = document.getElementById('main-content-shop')
async function loadProduct() {
  const response = await fetch('../html/test.json');
  const products = await response.json();
  products.forEach(function(product) {
    console.log("Product:", product);
    const card = document.createElement("div");
    card.classList.add("card");
    // Create the card-img-content container
    const cardImgContent = document.createElement('div');
    cardImgContent.classList.add('card-img-content');

    // Create the image element
    const cardImg = document.createElement('img');
    cardImg.src = product.productImage;
    cardImg.alt = '';
    cardImg.classList.add('card-img');

    // Append the image to the card-img-content
    cardImgContent.appendChild(cardImg);

    // Create the card-info container
    const cardInfo = document.createElement('div');
    cardInfo.classList.add('card-info');

    // Create the title paragraph
    const title = document.createElement('p');
    title.classList.add('text-title');
    title.textContent = product.productName;

    // Append the title to the card-info
    cardInfo.appendChild(title);

    // Create the card-footer container
    const cardFooter = document.createElement('div');
    cardFooter.classList.add('card-footer');

    // Create the price span
    const price = document.createElement('span');
    price.classList.add('text-title');
    price.textContent = product.productPrice;

    // Create the card-button container
    const cardButton = document.createElement('div');
    cardButton.classList.add('card-button');

    // Create the SVG icon
    const svgIcon = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
    svgIcon.classList.add('svg-icon');
    svgIcon.setAttribute('viewBox', '0 0 20 20');

    // Create the path elements inside the SVG
    const path1 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    path1.setAttribute('d', 'M17.72,5.011H8.026c-0.271,0-0.49,0.219-0.49,0.489c0,0.271,0.219,0.489,0.49,0.489h8.962l-1.979,4.773H6.763L4.935,5.343C4.926,5.316,4.897,5.309,4.884,5.286c-0.011-0.024,0-0.051-0.017-0.074C4.833,5.166,4.025,4.081,2.33,3.908C2.068,3.883,1.822,4.075,1.795,4.344C1.767,4.612,1.962,4.853,2.231,4.88c1.143,0.118,1.703,0.738,1.808,0.866l1.91,5.661c0.066,0.199,0.252,0.333,0.463,0.333h8.924c0.116,0,0.22-0.053,0.308-0.128c0.027-0.023,0.042-0.048,0.063-0.076c0.026-0.034,0.063-0.058,0.08-0.099l2.384-5.75c0.062-0.151,0.046-0.323-0.045-0.458C18.036,5.092,17.883,5.011,17.72,5.011z');
    const path2 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    path2.setAttribute('d', 'M8.251,12.386c-1.023,0-1.856,0.834-1.856,1.856s0.833,1.853,1.856,1.853c1.021,0,1.853-0.83,1.853-1.853S9.273,12.386,8.251,12.386z M8.251,15.116c-0.484,0-0.877-0.393-0.877-0.874c0-0.484,0.394-0.878,0.877-0.878c0.482,0,0.875,0.394,0.875,0.878C9.126,14.724,8.733,15.116,8.251,15.116z');
    const path3 = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    path3.setAttribute('d', 'M13.972,12.386c-1.022,0-1.855,0.834-1.855,1.856s0.833,1.853,1.855,1.853s1.854-0.83,1.854-1.853S14.994,12.386,13.972,12.386z M13.972,15.116c-0.484,0-0.878-0.393-0.878-0.874c0-0.484,0.394-0.878,0.878-0.878c0.482,0,0.875,0.394,0.875,0.878C14.847,14.724,14.454,15.116,13.972,15.116z');

    // Append paths to the SVG
    svgIcon.appendChild(path1);
    svgIcon.appendChild(path2);
    svgIcon.appendChild(path3);

    // Append the SVG to the card-button
    cardButton.appendChild(svgIcon);

    // Append the price and card-button to the card-footer
    cardFooter.appendChild(price);
    cardFooter.appendChild(cardButton);

    // Append all sections to the card
    card.appendChild(cardImgContent);
    card.appendChild(cardInfo);
    card.appendChild(cardFooter);

    // Finally, append the card to the body or any container you want
    main_content_shop.appendChild(card);
  })
}
loadProduct()

