function menuToggle() {
  const toggleMenu = document.querySelector(".menu-user");
  toggleMenu.classList.toggle("active");
}

let list = document.querySelector('.img-product .list')
let items = document.querySelectorAll('.img-product .list .item')
let dots = document.querySelectorAll('.img-product .dots li')
let prev = document.getElementById('prev')
let next = document.getElementById('next')
let dot_img = document.querySelectorAll('.show-img-product .show-img')
let active = 0
let lengthItems = items.length - 1
for (let i = 0; i < items.length; i++) {
  if(i == 0)
    items[i].style.display = 'block'
  else
    items[i].style.display = 'none'
}
for (let i = 0; i < dot_img.length; i++) {
  if(i == 0)
    dot_img[i].style.opacity = 1;
  else
    dot_img[i].style.opacity = 0.33;
}
next.onclick = function(){
  if(active +1 > lengthItems){
    active = 0
  } else {
    active += 1
  }
  reloadSlider()
}
prev.onclick = function(){
  if(active -1 < 0){
    active = lengthItems
  } else {
    active -= 1
  }
  reloadSlider()
}
function ShowImg(n){
  active = n -1
  reloadSlider()
}
function reloadSlider(){
  let checkLeft = items[active].offsetLeft;
  list.style.left = -checkLeft + 'px';

  let lastActiveDot = document.querySelector('.img-product .dots li.active')
  lastActiveDot.classList.remove('active')
  dots[active].classList.add('active')

  for(var i = 0; i < items.length ; i++){
    items[i].style.display = 'none'
  }
  items[active].style.display = 'block'

  for (i = 0; i < dot_img.length; i++) {
    dot_img[i].style.opacity = 0.33;
  }
  dot_img[active].style.opacity = 1;

}

dots.forEach((li, index) => {
  li.addEventListener('click',function(){
    active = index
    reloadSlider();
  }
)})

(function () {
  const quantityContainer = document.querySelector(".quantity");
  const minusBtn = quantityContainer.querySelector(".minus");
  const plusBtn = quantityContainer.querySelector(".plus");
  const inputBox = quantityContainer.querySelector(".input-box");

  updateButtonStates();

  quantityContainer.addEventListener("click", handleButtonClick);
  inputBox.addEventListener("input", handleQuantityChange);

  function updateButtonStates() {
    const value = parseInt(inputBox.value);
    minusBtn.disabled = value <= 1;
    plusBtn.disabled = value >= parseInt(inputBox.max);
  }

  function handleButtonClick(event) {
    if (event.target.classList.contains("minus")) {
      decreaseValue();
    } else if (event.target.classList.contains("plus")) {
      increaseValue();
    }
  }

  function decreaseValue() {
    let value = parseInt(inputBox.value);
    value = isNaN(value) ? 1 : Math.max(value - 1, 1);
    inputBox.value = value;
    updateButtonStates();
    handleQuantityChange();
  }

  function increaseValue() {
    let value = parseInt(inputBox.value);
    value = isNaN(value) ? 1 : Math.min(value + 1, parseInt(inputBox.max));
    inputBox.value = value;
    updateButtonStates();
    handleQuantityChange();
  }

  function handleQuantityChange() {
    let value = parseInt(inputBox.value);
    value = isNaN(value) ? 1 : value;

    // Execute your code here based on the updated quantity value
    console.log("Quantity changed:", value);
  }
})();

