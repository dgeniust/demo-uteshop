<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/views/img/logo.png'/>">
    <!-- Link css -->
    <!-- <link rel="stylesheet" href="/frontend/css/shop.css"> -->
    <!-- Font AWESOME -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<style>
/* Import font Montserrat, Poppins, Kanit */
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Playwrite+HR+Lijeva:wght@100..400&display=swap');

:root {
    --color-primary-blue: #024CAA;
    --color-primary-light-gray: #E4E0E1;
    --font-primary: 'Poppins', sans-serif;
    --font-logo: 'Kanit', sans-serif;
    --color-dark-1 : #1E1E1E;
    --color-dark-2 : #6d6d6d;
  }
  
  * { 
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  body {
    font-style: 16px;
    font-family: var(--font-primary);
  }
  ul {
    list-style: none;
  }
  a{
    text-decoration: none;
  }
  .container { 
    max-width: 1920px;
    margin: 0 auto;
    padding: 0 15px;
  }
  /* nav */
  .nav {
    position: fixed;
    width: 100%;
    height: 70px;
    background-color: var(--color-primary-light-gray);
    box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
    z-index: 10;
  }
  .nav-container {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .nav-left {
    display: flex;
    align-items: center;
  }
  .nav-logo {
    display: flex;
    flex-direction: row;
    align-items: center;
  
  }
  .nav-logo h1 {
    font-family: var(--font-logo);
    font-size: 34px;
    color: black;
    font-weight: 600;
    margin-right: 200px;
    margin-left: 10px;
  }
  .nav-list {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin-left: 30px;
  }
  .nav-item {
    margin: 0px 6px;
  }
  .nav-link {
    font-family: 'Kanit', sans-serif;
    padding: 7px 10px;
    color: black;
    font-weight: 500;
    font-size: 20px;
  }
  .nav-link:hover {
    color: var(--color-primary-blue);
  }
  /* .active { 
    color: var(--color-primary-2);
  } */
  .nav-right{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
  }
  .nav-right-icon {
    display: flex;
    align-items: center;
    justify-content: space-around;
    margin-right: 50px;
    gap: 20px;
  }
  .btn {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
  }
  /* Profile User */
  .action-user {
    z-index: 2;
  }
  
  .action-user .profile {
    position: relative;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
    cursor: pointer;
  }
  
  .action-user .profile img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .action-user .menu-user {
    position: absolute;
    right: 50px;
    padding: 10px 20px;
    background: #fff;
    width: 200px;
    box-sizing: 0 5px 25px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    transition: 0.5s;
    visibility: hidden;
    opacity: 0;
    border: 1px solid var(--color-primary-blue);
  }
  
  .action-user .menu-user.active {
    top: 60px;
    visibility: visible;
    opacity: 1;
  }
  
  .action-user .menu-user::before {
    content: "";
    position: absolute;
    top: -5px;
    right: 28px;
    width: 20px;
    height: 20px;
    background: #fff;
    transform: rotate(45deg);
  }
  
  .action-user .menu-user h3 {
    width: 100%;
    text-align: center;
    font-size: 18px;
    padding: 20px 0;
    font-weight: 500;
    color: #555;
    line-height: 1.5em;
  }
  
  .action-user .menu-user h3 span {
    font-size: 14px;
    color: #cecece;
    font-weight: 300;
  }
  
  .action-user .menu-user ul li {
    list-style: none;
    padding: 16px;
    border-top: 1px solid rgba(0, 0, 0, 0.05);
    display: flex;
    align-items: center;
  }
  
  .action-user .menu-user ul li svg {
    max-width: 20px;
    margin-right: 10px;
    opacity: 0.5;
    transition: 0.5s;
  }
  
  .action-user .menu-user ul li:hover img {
    opacity: 1;
  }
  
  .action-user .menu-user ul li a {
    display: inline-block;
    text-decoration: none;
    color: #555;
    font-weight: 500;
    transition: 0.5s;
  }
  
  .action-user .menu-user ul li:hover a {
    color: #ff5d94;
  }
  .menu-user ul li svg {
    width: 20px;
  }
  /*End profile user*/
  /* test */
  
  .btn button {
    position: relative;
    padding: 8px;
    border-radius: 7px;
    border: 1px solid rgb(61, 106, 255);
    font-size: 12px;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 2px;
    background: transparent;
    color: #fff;
    overflow: hidden;
    box-shadow: 0 0 0 0 transparent;
    -webkit-transition: all 0.2s ease-in;
    -moz-transition: all 0.2s ease-in;
    transition: all 0.2s ease-in;
  }
  .text-btn { 
    font-family: 'Montserrat', sans-serif;
    color: black;
  }
  
  .btn button:hover {
    background: rgb(61, 106, 255);
    box-shadow: 0 0 30px 5px rgba(0, 142, 236, 0.815);
    -webkit-transition: all 0.2s ease-out;
    -moz-transition: all 0.2s ease-out;
    transition: all 0.2s ease-out;
  }
  
  .btn button:hover::before {
    -webkit-animation: sh02 0.5s 0s linear;
    -moz-animation: sh02 0.5s 0s linear;
    animation: sh02 0.5s 0s linear;
  }
  
  .btn button::before {
    content: '';
    display: block;
    width: 0px;
    height: 86%;
    position: absolute;
    top: 7%;
    left: 0%;
    opacity: 0;
    background: #fff;
    box-shadow: 0 0 50px 30px #fff;
    -webkit-transform: skewX(-20deg);
    -moz-transform: skewX(-20deg);
    -ms-transform: skewX(-20deg);
    -o-transform: skewX(-20deg);
    transform: skewX(-20deg);
  }
  
  @keyframes sh02 {
    from {
      opacity: 0;
      left: 0%;
    }
  
    50% {
      opacity: 1;
    }
  
    to {
      opacity: 0;
      left: 100%;
    }
  }
  
  .btn button:active {
    box-shadow: 0 0 0 0 transparent;
    -webkit-transition: box-shadow 0.2s ease-in;
    -moz-transition: box-shadow 0.2s ease-in;
    transition: box-shadow 0.2s ease-in;
  }
  
  
  /* Dropdown shop */
  .menu-shop {
    font-size: 16px;
    line-height: 1.6;
    color: #000000;
    width: fit-content;
    display: flex;
    list-style: none;
  }
  
  .menu-shop a {
    text-decoration: none;
    color: inherit;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
  }
  
  .menu-shop .link-shop {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    padding: 12px 36px;
    border-radius: 16px;
    overflow: hidden;
    transition: all 0.48s cubic-bezier(0.23, 1, 0.32, 1);
  }
  
  .menu-shop .link-shop::after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    transform: scaleX(0);
    transform-origin: left;
    transition: transform 0.48s cubic-bezier(0.23, 1, 0.32, 1);
  }
  
  .menu-shop .link-shop svg {
    width: 14px;
    height: 14px;
    fill: #000000;
    transition: all 0.48s cubic-bezier(0.23, 1, 0.32, 1);
  }
  
  .menu-shop .item-shop {
    position: relative;
  }
  
  .menu-shop .item-shop .submenu-shop {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: absolute;
    top: 100%;
    border-radius: 0 0 16px 16px;
    left: 0;
    width: 250px;
    overflow: hidden;
    border: 1px solid #cccccc;
    opacity: 0;
    visibility: hidden;
    transform: translateY(-12px);
    transition: all 0.48s cubic-bezier(0.23, 1, 0.32, 1);
    z-index: 1;
    pointer-events: none;
    list-style: none;
  }
  
  .menu-shop .item-shop:hover .submenu-shop {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
    pointer-events: auto;
    border-top: transparent;
    background-color: #f1f1f1;
  }
  
  .menu-shop .item-shop:hover .link-shop {
    /* color: #ffffff; */
    border-radius: 16px 16px 0 0;
  }
  
  .menu-shop .item-shop:hover .link-shop::after {
    transform: scaleX(1);
    transform-origin: right;
  }
  
  .menu-shop .item-shop:hover .link-shop svg {
    /* fill: #ffffff; */
    transform: rotate(-180deg);
    fill: var(--color-primary-blue);
  }
  
  .submenu-shop .submenu-item-shop {
    width: 100%;
    transition: all 0.48s cubic-bezier(0.23, 1, 0.32, 1);
  }
  
  .submenu-shop .submenu-link-shop {
    display: block;
    padding: 12px 24px;
    width: 100%;
    position: relative;
    text-align: center;
    align-items: center;
    transition: all 0.48s cubic-bezier(0.23, 1, 0.32, 1);
  }
  
  .submenu-shop .submenu-item-shop:last-child .submenu-link-shop {
    border-bottom: none;
  }
  
  .submenu-shop .submenu-link-shop::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    transform: scaleX(0);
    width: 100%;
    height: 100%;
    background-color: var(--color-primary-blue);
    z-index: -1;
    transform-origin: left;
    transition: transform 0.48s cubic-bezier(0.23, 1, 0.32, 1);
  }
  
  .submenu-shop .submenu-link-shop:hover:before {
    transform: scaleX(1);
    transform-origin: right;
  }
  
  .submenu-shop .submenu-link-shop:hover {
    color: #ffffff;
  }
  /* END HEADER */


.section-1 {
    border: 1px solid black; 
    width: 100%;
    height: 45vh;
    background-image: url(<c:url value='/views/img/bg-shop-1.jpg'/>);
    background-repeat: no-repeat;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;

}
.header-s1{
    font-family: 'Poppins', sans-serif;
    color: white;
}
.header-s1 h1{
    font-size: 40px;
    font-weight: 700;
}
.header-s1 p{
    font-size: 20px;
}
.section-2 {
    width: 100%;
    height: auto;
    background-color: var(--color-primary-light-gray);
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}

/* Card Shop */
.main-content-shop {
    width: 100%;
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 20px;
    justify-items: center; /* Centers items horizontally */
    align-items: center;
}
.card {
    width: 230px;
    height: 300px;
    padding: .8em;
    background: #f5f5f5;
    position: relative;
    overflow: visible;
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
    align-items: center;
    justify-content: center;
}
   
.card-img-content {
    background-color: #ffcaa6;
    height: 80%;
    width: 100%;
    border-radius: .5rem;
    transition: .3s ease;
    position: relative;
}
.card-img-content img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: .5rem;
}
   
.card-info {
    padding-top: 5px;
}
   
svg {
    width: 20px;
    height: 20px;
}
   
.card-footer {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 5px;
    border-top: 1px solid #ddd;
}
   
   /*Text*/
.text-title {
    font-weight: 500;
    font-size: 15px;
    line-height: 1.5;
}
   

   /*Button*/
.card-button {
    border: 1px solid #252525;
    display: flex;
    padding: .3em;
    cursor: pointer;
    border-radius: 50px;
    transition: .3s ease-in-out;
}
   
   /*Hover*/

.card:hover {
    width: 240px;
    height: 310px;
}

.card-img-content:hover {
    transform: translateY(-25%);
    box-shadow: rgba(226, 196, 63, 0.25) 0px 13px 47px -5px, rgba(180, 71, 71, 0.3) 0px 8px 16px -8px;
}
.card-button:hover {
    border: 1px solid #ffcaa6;
    background-color: #ffcaa6;
}
   
/* End Card Shop */
</style>
    <section class="section-1">
        <div class="header-s1">
            <div class="section-1-content">
                <h1>#stayhome</h1>
                <p>Save more with coupons & up to 50% off!</p>
            </div>
        </div>
    </section>
    <section class="section-2">
        <div class="main-content-shop" id="main-content-shop">
		<c:forEach items="${listProduct}" var="pro">
			<div class="card">
				  <div class="card-img-content">
				      <img src="${pro.productImage }" alt="" class="card-img">
				  </div>
				  <div class="card-info">
				      <p class="text-title">${pro.productName }</p>
				  </div>
				  <div class="card-footer">
				  <span class="text-title">${pro.productPrice }</span>
				  <div class="card-button">
				      <svg class="svg-icon" viewBox="0 0 20 20">
				      <path d="M17.72,5.011H8.026c-0.271,0-0.49,0.219-0.49,0.489c0,0.271,0.219,0.489,0.49,0.489h8.962l-1.979,4.773H6.763L4.935,5.343C4.926,5.316,4.897,5.309,4.884,5.286c-0.011-0.024,0-0.051-0.017-0.074C4.833,5.166,4.025,4.081,2.33,3.908C2.068,3.883,1.822,4.075,1.795,4.344C1.767,4.612,1.962,4.853,2.231,4.88c1.143,0.118,1.703,0.738,1.808,0.866l1.91,5.661c0.066,0.199,0.252,0.333,0.463,0.333h8.924c0.116,0,0.22-0.053,0.308-0.128c0.027-0.023,0.042-0.048,0.063-0.076c0.026-0.034,0.063-0.058,0.08-0.099l2.384-5.75c0.062-0.151,0.046-0.323-0.045-0.458C18.036,5.092,17.883,5.011,17.72,5.011z"></path>
				      <path d="M8.251,12.386c-1.023,0-1.856,0.834-1.856,1.856s0.833,1.853,1.856,1.853c1.021,0,1.853-0.83,1.853-1.853S9.273,12.386,8.251,12.386z M8.251,15.116c-0.484,0-0.877-0.393-0.877-0.874c0-0.484,0.394-0.878,0.877-0.878c0.482,0,0.875,0.394,0.875,0.878C9.126,14.724,8.733,15.116,8.251,15.116z"></path>
				      <path d="M13.972,12.386c-1.022,0-1.855,0.834-1.855,1.856s0.833,1.853,1.855,1.853s1.854-0.83,1.854-1.853S14.994,12.386,13.972,12.386z M13.972,15.116c-0.484,0-0.878-0.393-0.878-0.874c0-0.484,0.394-0.878,0.878-0.878c0.482,0,0.875,0.394,0.875,0.878C14.847,14.724,14.454,15.116,13.972,15.116z"></path>
				      </svg>
				  </div>
				  </div>
				</div> 
		</c:forEach>
            
        </div>
    </section>
    <script>
    let main_content_shop = document.getElementById('main-content-shop')
	async function loadProduct() {
	  const response = await fetch("http://localhost:8080/DAWEBB/api/product");
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

	    /* const href = document.createElement("a");
	    href.href = "product/details?id=" + product.productId;
	    card.appendChild(href) */
	    
		card.addEventListener("click", function() {
	    	window.location.href = "product/details?id=" + product.productId;
	    });
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
		  
	/* const toggleMenu = document.querySelector(".menu-user");
		  toggleMenu.classList.toggle("active");
    
    function menuToggle() {
    	} */

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
    	/* next.onclick = function(){
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
    	} */
    	/* function ShowImg(n){
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
    	})(); */

    	
    	
    	
    </script>
</body>
</html>