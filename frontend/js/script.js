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

