<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Green Garden</title>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="<c:url value='/views/img/logo.png'/>">
<!-- Link css -->
<link rel="stylesheet" href="/frontend/css/detail-products.css">
<!-- Font AWESOME -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
	integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<style>
/* Import font Montserrat, Poppins, Kanit */
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Playwrite+HR+Lijeva:wght@100..400&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap')
	;

:root {
	--color-primary-blue: #024CAA;
	--color-primary-light-gray: #E4E0E1;
	--font-primary: 'Poppins', sans-serif;
	--font-logo: 'Kanit', sans-serif;
	--color-dark-1: #1E1E1E;
	--color-dark-2: #6d6d6d;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-style: 16px;
	font-family: 'Rubik', sans-serif;
}

ul {
	list-style: none;
}

a {
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
.nav-right {
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

@
keyframes sh02 {from { opacity:0;
	left: 0%;
}

50
%
{
opacity
:
1;
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

/* Detail products */
.section-1 {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.back-home-btn {
	margin-top: 80px;
}

.back-btn {
	width: 100%;
	display: flex;
	gap: 10px;
	align-items: center;
	justify-content: flex-start;
	padding: 10px 20px;
	border: none;
	background: white;
	color: #9AA6B2;
	margin-right: 1200px;
}

.back-btn p {
	font-size: 20px;
	font-weight: 700;
	font-family: 'Lora', sans-serif;
	font-style: italic;
}

.back-btn:hover p {
	text-decoration: underline;
	color: #7b8a99;
}

.product-s1 {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.left-s1 {
	width: 57%;
	height: 100%;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.right-s1 {
	width: 43%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	position: relative;
}

.left-img-s1 {
	width: 100%;
	height: fit-content;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: row;
}

.img-product {
	width: 400px;
	height: 500px;
	margin: 15px;
	position: relative;
}

.list {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	display: flex;
	width: max-content;
	transition: 1s;
}

.list img {
	width: 400px;
	height: 100%;
	cursor: pointer;
	object-fit: cover;
	border-radius: 10px;
}

.button {
	position: absolute;
	top: 45%;
	left: 5%;
	width: 90%;
	display: flex;
	justify-content: space-between;
}

.button button {
	width: 50px;
	height: 50px;
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	cursor: pointer;
	font-size: 20px;
	font-weight: 600;
	border-radius: 50%;
}

.dots {
	position: absolute;
	bottom: 10px;
	color: #fff;
	left: 0;
	width: 100%;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
}

.dots li {
	list-style: none;
	width: 10px;
	height: 10px;
	background-color: #fff;
	margin: 20px;
	border-radius: 20px;
	transition: 1s;
}

.dots li.active {
	width: 30px;
}

.show-img-product {
	display: grid;
	grid-template-columns: 200px 200px;
	grid-template-rows: 200px 200px;
	gap: 5px;
}

.show-img-product img {
	width: 200px;
	height: 200px;
	object-fit: cover;
	cursor: pointer;
	border-radius: 10px;
}

/* Right Detail product */
.review-product-s1 {
	width: 600px;
	height: fit-content;
	position: relative;
	display: flex;
	justify-content: center;
	flex-direction: column;
	padding: 10px;
	border-radius: 12px;
	background-color: #f7f6f6;
}

.review-product-s1 h3 {
	font-size: 20px;
	font-weight: 500;
	color: #000;
	margin-bottom: 5px;
}

.review-product-s1 p {
	font-size: 15px;
	font-weight: 400;
	color: #2e2e2e;
	margin-bottom: 5px;
}

.btn-review {
	width: fit-content;
	height: fit-content;
	padding: 8px 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	flex-direction: row;
	border-radius: 20px;
	gap: 60px;
	background-color: white;
}

.btn-review span {
	font-weight: 600;
}

.buying {
	width: 600px;
	height: 500px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: flex-start;
	font-family: "Rubik", sans-serif;
	max-height: fit-content;
}

.title {
	margin-right: 350px;
	margin-bottom: 10px;
}

.title h1 {
	font-size: 25px;
	font-weight: 500;
}

.status {
	padding: 15px 0 5px 0;
	display: flex;
	align-items: center;
	justify-content: space-around;
	gap: 10px;
	width: 100%;
}

.status ul {
	list-style-type: disc;
}

.availabe-items li::marker {
	color: #006BFF;
	font-size: 25px;
}

.waiting-items li::marker {
	color: yellow;
	font-size: 25px;
}

.closed-items li::marker {
	color: red;
	font-size: 25px;
}

.star {
	display: flex;
	align-items: center;
	gap: 5px;
	flex-direction: row;
	padding: 5px 0;
}

.radio-content {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	flex-direction: row;
}

.radio {
	display: flex;
	justify-content: center;
	gap: 10px;
	flex-direction: row-reverse;
}

.radio>input {
	position: absolute;
	appearance: none;
}

.radio>label {
	cursor: pointer;
	font-size: 15px;
	position: relative;
	display: inline-block;
	transition: transform 0.3s ease;
}

.radio>label>svg {
	fill: #666;
	transition: fill 0.3s ease;
}

.radio>label::before, .radio>label::after {
	content: "";
	position: absolute;
	width: 6px;
	height: 6px;
	background-color: #ff9e0b;
	border-radius: 50%;
	opacity: 0;
	transform: scale(0);
	transition: transform 0.4s ease, opacity 0.4s ease;
	animation: particle-explosion 1s ease-out;
}

.radio>label::before {
	top: -15px;
	left: 50%;
	transform: translateX(-50%) scale(0);
}

.radio>label::after {
	bottom: -15px;
	left: 50%;
	transform: translateX(-50%) scale(0);
}

.radio>label:hover::before, .radio>label:hover::after {
	opacity: 1;
	transform: translateX(-50%) scale(1.5);
}

.radio>label:hover {
	transform: scale(1.2);
	animation: pulse 0.6s infinite alternate;
}

.radio>label:hover>svg, .radio>label:hover ~ label>svg {
	fill: #ff9e0b;
	filter: drop-shadow(0 0 15px rgba(255, 158, 11, 0.9));
	animation: shimmer 1s ease infinite alternate;
}

.radio>input:checked+label>svg, .radio>input:checked+label ~ label>svg {
	fill: #ff9e0b;
	filter: drop-shadow(0 0 15px rgba(255, 158, 11, 0.9));
	animation: pulse 0.8s infinite alternate;
}

@
keyframes pulse { 0% {
	transform: scale(1);
}

100
%
{
transform
:
scale(
1.1
);
}
}
@
keyframes particle-explosion { 0% {
	opacity: 0;
	transform: scale(0.5);
}

50
%
{
opacity
:
1;
transform
:
scale(
1.2
);
}
100
%
{
opacity
:
0;
transform
:
scale(
0.5
);
}
}
@
keyframes shimmer { 0% {
	filter: drop-shadow(0 0 10px rgba(255, 158, 11, 0.5));
}

100
%
{
filter
:
drop-shadow(
0
0
20px
rgba(
255
,
158
,
11
,
1
)
);
}
}
.radio>input:checked+label:hover>svg, .radio>input:checked+label:hover 
	~ label>svg {
	fill: #e58e09;
}

.radio>label:hover>svg, .radio>label:hover ~ label>svg {
	fill: #ff9e0b;
}

.radio input:checked ~ label svg {
	fill: #ffa723;
}

.price {
	padding: 20px 0;
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%;
}

.price .real-price {
	font-size: 25px;
	font-weight: 600;
	text-decoration: line-through;
	color: var(--color-primary-light-gray);
}

.price .discount-price {
	font-size: 25px;
	font-weight: 600;
	color: black;
}

.description ul li {
	padding: 5px 0;
	list-style: outside;
	margin-left: 20px;
}

* {
	box-sizing: border-box;
}

.quantity {
	display: flex;
	border: 2px solid var(--color-primary-light-gray);
	border-radius: 4px;
	overflow: hidden;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 100px;
}

.quantity button {
	background-color: #006BFF;
	color: #fff;
	border: none;
	cursor: pointer;
	font-size: 20px;
	width: 30px;
	height: auto;
	text-align: center;
	transition: background-color 0.2s;
}

.quantity button:hover {
	background-color: #2980b9;
}

.input-box {
	width: 40px;
	text-align: center;
	border: none;
	padding: 8px 10px;
	font-size: 16px;
	outline: none;
}

/* Hide the number input spin buttons */
.input-box::-webkit-inner-spin-button, .input-box::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.input-box[type="number"] {
	-moz-appearance: textfield;
}

/* .price-product{
  display: flex;
  align-items: center;
  gap: 20px;
  flex-direction: row;
  padding: 10px 0;
  padding-bottom: 10px;
} */
.btn-buy {
	padding: 20px 0;
	width: 100%;
}

.btn-buy-product {
	width: 100%;
	font-size: 15px;
	font-weight: 600;
	padding: 10px 40px;
	text-transform: uppercase;
	background-color: #006BFF;
	color: #fff;
	border: none;
	border-radius: 5px;
}

.code-product {
	padding: 10px 0;
}
/* Social share icon */
.social-share-product {
	padding: 10px 0;
}

.example-2 {
	display: flex;
	align-items: center;
}

.example-2 .icon-content {
	/* margin: 0 10px; */
	padding-right: 5px;
	position: relative;
}

.example-2 .icon-content .tooltip {
	position: absolute;
	top: -30px;
	left: 50%;
	transform: translateX(-50%);
	color: #fff;
	padding: 6px 10px;
	border-radius: 5px;
	opacity: 0;
	visibility: hidden;
	font-size: 14px;
	transition: all 0.3s ease;
}

.example-2 .icon-content:hover .tooltip {
	opacity: 1;
	visibility: visible;
	top: -50px;
}

.example-2 .icon-content a {
	position: relative;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	color: #4d4d4d;
	background-color: #fff;
	transition: all 0.3s ease-in-out;
}

.example-2 .icon-content a:hover {
	box-shadow: 3px 2px 45px 0px rgb(0 0 0/ 12%);
}

.example-2 .icon-content a svg {
	position: relative;
	z-index: 1;
	width: 20px;
	height: 20px;
}

.example-2 .icon-content a:hover {
	color: white;
}

.example-2 .icon-content a .filled {
	position: absolute;
	top: auto;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 0;
	background-color: #000;
	transition: all 0.2s ease-in-out;
}

.example-2 .icon-content a:hover .filled {
	height: 100%;
}

.example-2 .icon-content a[data-social="spotify"] .filled, .example-2 .icon-content a[data-social="spotify"] 
	~ .tooltip {
	background-color: #006BFF;
}

.example-2 .icon-content a[data-social="pinterest"] .filled, .example-2 .icon-content a[data-social="pinterest"] 
	~ .tooltip {
	background-color: #bd081c;
}

.example-2 .icon-content a[data-social="dribbble"] .filled, .example-2 .icon-content a[data-social="dribbble"] 
	~ .tooltip {
	background-color: #1DA1F2;
}

.example-2 .icon-content a[data-social="telegram"] .filled, .example-2 .icon-content a[data-social="telegram"] 
	~ .tooltip {
	background-color: #0088cc;
}

/* End Social share icon */
/* End Detail products */

/* Section 2 */
.section-2 {
	width: 80%;
	height: auto;
	display: flex;
	flex-direction: column;
	margin: auto;
}

.section-2 h1 {
	font-size: 30px;
	font-weight: 600;
	color: #000;
	padding: 20px;
}

.review-cmt {
	width: 100%;
	display: flex;
	flex-direction: row;
	padding: 10px;
	background-color: #ecf0f1;
	margin-top: 5px;
	border-radius: 15px;
}

.left-review {
	width: 40%;
	display: flex;
	flex-direction: row;
	padding: 10px 20px;
}

.left-review .img-user-review img {
	width: 40px;
	height: 40px;
	border: none;
	border-radius: 50%;
}

.info-user-review {
	display: flex;
	flex-direction: column;
	margin-left: 5px;
}

.info-user-review p {
	font-size: 15px;
	color: #000;
}

.right-review {
	width: 60%;
	padding: 10px 20px;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.comment-review {
	width: 80%;
}
/* 
Comment Review */
.product-review {
	width: 100%;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	margin: 0 auto;
}

.comment-section {
	margin-bottom: 20px;
	text-align: center;
}

.comment-section textarea {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	resize: vertical;
}

.comment-section button {
	background-color: #28a745;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
}

.comment-section button:hover {
	background-color: #218838;
}

#reviews-list {
	margin-top: 30px;
}

.review {
	background-color: #f1f1f1;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.header-product-review {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.header-product-review h2 {
	padding: 0 0 20px 0;
}
/* Comment Review  */

/* Section 2 */
</style>
	<section class="section-1">
		<div class="back-home-btn">
			<button class="back-btn">
				<i class="fa-solid fa-arrow-left"></i>
				<p>Back To Home</p>
			</button>
		</div>
		<div class="product-s1">
			<div class="left-s1">
				<div class="title">
					<h1>${name}</h1>
				</div>
				<div class="left-img-s1">
					<div class="img-product">
						<div class="list">
							<div class="item">
								<img src="${Images }" alt="">
							</div>

						</div>
						<div class="button">
							<button id="prev">
								<i class="fas fa-chevron-left"></i>
							</button>
							<button id="next">
								<i class="fas fa-chevron-right"></i>
							</button>
						</div>
						<ul class="dots">
							<li class="active"></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="right-s1">
				<div class="review-product-s1">
					<h3>Read Expert Reviews</h3>
					<p>Let's read what the experts have to say about this product
						so you can make the right recommendation</p>
					<button class="btn-review">
						<span>Read More</span> <i class="fa-solid fa-arrow-right"></i>
					</button>
				</div>
				<div class="buying">
					<!-- <div class="rating-number">
                        <div class="star">
                            <div class="radio">
                            <input id="rating-5" type="radio" name="rating" value="5" />
                            <label for="rating-5" title="5 stars">
                                <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                ></path>
                                </svg>
                            </label>
    
                            <input id="rating-4" type="radio" name="rating" value="4" />
                            <label for="rating-4" title="4 stars">
                                <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                ></path>
                                </svg>
                            </label>
    
                            <input id="rating-3" type="radio" name="rating" value="3" />
                            <label for="rating-3" title="3 stars">
                                <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                ></path>
                                </svg>
                            </label>
    
                            <input id="rating-2" type="radio" name="rating" value="2" />
                            <label for="rating-2" title="2 stars">
                                <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                ></path>
                                </svg>
                            </label>
    
                            <input id="rating-1" type="radio" name="rating" value="1" />
                            <label for="rating-1" title="1 star">
                                <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                                ></path>
                                </svg>
                            </label>
                            </div>
                            <div class="radio-content">
                                <p>(đánh giá)</p>
                                <div class="number-of-selling">| 26 đã bán</div>
                            </div>
                        </div>
                    </div> -->
					<div class="status">
						<ul class="availabe-items">
							<li>${amount}items available</li>
						</ul>
						<ul class="waiting-items">
							<li>waiting line</li>
						</ul>
						<ul class="closed-items">
							<li>out of stock</li>
						</ul>
					</div>
					<div class="price">
						<span class="real-price" style="display: none;">1.500.000
							VND</span> <span class="discount-price">${price}</span>

						<div class="quantity">
							<button class="minus" aria-label="Decrease">&minus;</button>
							<input type="number" class="input-box" value="1" min="1" max="10">
							<button class="plus" aria-label="Increase">&plus;</button>
						</div>
					</div>
					<form action="details/pay" method="POST" >
					<input type="text" hidden="true" name ="pid" value="${id}">
					<input type="text" hidden="true" name ="pprice" value="${price}">
					<input type="text" hidden="true" name ="pamount" value="1">
					<div class="btn-buy">
						<button class="btn-buy-product">Mua ngay</button>
					</div>
					</form>
					
					<br>
					<hr width="150px">
					<hr width="150px">
					<div class="social-share-product">
						<ul class="example-2">
							<li class="icon-content"><a data-social="spotify"
								aria-label="Spotify" href="https://www.spotify.com/">
									<div class="filled"></div> <svg width="64px" height="64px"
										viewBox="-5 0 20 20" version="1.1"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff">
										<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
										<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
											stroke-linejoin="round"></g>
										<g id="SVGRepo_iconCarrier"> <title>facebook [#ffffff]</title> <desc>Created with Sketch.</desc> <defs> </defs> <g
											id="Page-1" stroke="none" stroke-width="1" fill="none"
											fill-rule="evenodd"> <g id="Dribbble-Light-Preview"
											transform="translate(-385.000000, -7399.000000)"
											fill="currentColor"> <g id="icons"
											transform="translate(56.000000, 160.000000)"> <path
											d="M335.821282,7259 L335.821282,7250 L338.553693,7250 L339,7246 L335.821282,7246 L335.821282,7244.052 C335.821282,7243.022 335.847593,7242 337.286884,7242 L338.744689,7242 L338.744689,7239.14 C338.744689,7239.097 337.492497,7239 336.225687,7239 C333.580004,7239 331.923407,7240.657 331.923407,7243.7 L331.923407,7246 L329,7246 L329,7250 L331.923407,7250 L331.923407,7259 L335.821282,7259 Z"
											id="facebook-[#ffffff]"> </path> </g> </g> </g> </g></svg>
							</a>
								<div class="tooltip">Facebook</div></li>
							<li class="icon-content"><a data-social="pinterest"
								aria-label="Pinterest" href="https://www.pinterest.com/">
									<div class="filled"></div> <svg xml:space="preserve"
										viewBox="0 0 100 100" version="1.1">
                                <path fill="currentColor"
											d="M83,17.8C74.5,8.9,63.4,4.3,50,4.1C37.7,4.2,26.8,8.6,17.9,17.3C8.9,26,4.3,37,4.1,50c0,0,0,0,0,0c0,9.1,2.5,17.4,7.4,24.9  c4.9,7.4,11.6,13.2,20.1,17.1c0.3,0.1,0.7,0.1,1-0.1c0.3-0.2,0.5-0.5,0.5-0.8l0-4.9c0.1-2.1,0.7-5.3,1.7-9.5c1-4,1.7-6.7,1.9-7.6  c0.7-3,1.7-7.2,3-12.6c0.1-0.2,0-0.5-0.1-0.7c-0.4-0.8-1-2.6-1.5-6.6c0.1-2.7,0.8-5.2,2.1-7.3c1.2-2,3.1-3.1,5.7-3.5  c2,0.1,4.7,0.8,5.1,5.9c-0.1,1.8-0.8,4.5-1.9,8.1c-1.2,3.8-1.9,6.3-2.1,7.6c-0.7,2.5-0.2,4.8,1.5,6.8c1.6,1.9,3.8,2.9,6.5,3.1  c4.3-0.1,8.1-2.6,11.2-7.5c1.7-3,2.9-6.3,3.5-9.7c0.7-3.4,0.7-7.1,0-10.8c-0.7-3.8-2.2-7.1-4.5-9.8c0,0-0.1-0.1-0.1-0.1  c-4.3-3.7-9.5-5.3-15.6-5c-6,0.4-11.3,2.6-15.9,6.6c-2.9,3.2-4.8,7.1-5.7,11.6c-0.9,4.6,0,9.1,2.6,13.3c0.3,0.5,0.5,0.8,0.6,1  c0,0.3,0,1-0.5,2.8c-0.5,1.8-0.9,2.2-0.9,2.2c0,0-0.1,0-0.1,0.1c0,0-0.2,0-0.4-0.1c-2.2-1-3.9-2.4-5.2-4.2c-1.3-1.9-2.1-4-2.5-6.3  c-0.3-2.5-0.4-5-0.3-7.5c0.2-2.5,0.7-5.1,1.4-7.7c3-6.9,8.5-11.9,16.3-14.8c7.8-2.9,16-3.2,24.3-0.8c6.5,2.8,11,7.4,13.6,13.7  c2.5,6.4,2.8,13.4,0.8,20.8c-2.2,7.1-6.4,12.4-12.1,15.7c-5.6,2.8-10.8,3-15.7,0.7c-1.8-1.1-3.1-2.3-3.9-3.5c-0.2-0.3-0.6-0.5-1-0.5  c-0.4,0.1-0.7,0.3-0.8,0.7c-0.7,2.7-1.3,4.7-1.6,6.2c-1.4,5.4-2.6,9.2-3.4,11c-0.8,1.6-1.6,3.1-2.4,4.3c-0.2,0.3-0.2,0.6-0.1,0.9  s0.3,0.5,0.6,0.6c4.3,1.3,8.7,2,13,2c12.4-0.1,23.2-4.6,32.1-13.4C91.1,73.9,95.8,62.9,96,50C95.9,37.5,91.5,26.7,83,17.8z"></path>
                            </svg>
							</a>
								<div class="tooltip">Pinterest</div></li>
							<li class="icon-content"><a data-social="dribbble"
								aria-label="Dribbble" href="https://dribbble.com/">
									<div class="filled"></div> <svg width="64px" height="64px"
										viewBox="0 -2 20 20" version="1.1"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000">
										<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
										<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
											stroke-linejoin="round"></g>
										<g id="SVGRepo_iconCarrier"> <title>twitter [#154]</title> <desc>Created with Sketch.</desc> <defs> </defs> <g
											id="Page-1" stroke="none" stroke-width="1" fill="none"
											fill-rule="evenodd"> <g id="Dribbble-Light-Preview"
											transform="translate(-60.000000, -7521.000000)"
											fill="currentColor"> <g id="icons"
											transform="translate(56.000000, 160.000000)"> <path
											d="M10.29,7377 C17.837,7377 21.965,7370.84365 21.965,7365.50546 C21.965,7365.33021 21.965,7365.15595 21.953,7364.98267 C22.756,7364.41163 23.449,7363.70276 24,7362.8915 C23.252,7363.21837 22.457,7363.433 21.644,7363.52751 C22.5,7363.02244 23.141,7362.2289 23.448,7361.2926 C22.642,7361.76321 21.761,7362.095 20.842,7362.27321 C19.288,7360.64674 16.689,7360.56798 15.036,7362.09796 C13.971,7363.08447 13.518,7364.55538 13.849,7365.95835 C10.55,7365.79492 7.476,7364.261 5.392,7361.73762 C4.303,7363.58363 4.86,7365.94457 6.663,7367.12996 C6.01,7367.11125 5.371,7366.93797 4.8,7366.62489 L4.8,7366.67608 C4.801,7368.5989 6.178,7370.2549 8.092,7370.63591 C7.488,7370.79836 6.854,7370.82199 6.24,7370.70483 C6.777,7372.35099 8.318,7373.47829 10.073,7373.51078 C8.62,7374.63513 6.825,7375.24554 4.977,7375.24358 C4.651,7375.24259 4.325,7375.22388 4,7375.18549 C5.877,7376.37088 8.06,7377 10.29,7376.99705"
											id="twitter-[#154]"> </path> </g> </g> </g> </g></svg>
							</a>
								<div class="tooltip">Twitter</div></li>
							<li class="icon-content"><a data-social="telegram"
								aria-label="Telegram" href="https://telegram.org/">
									<div class="filled"></div> <svg viewBox="0 0 100 100"
										version="1.1">
                                <path fill="currentColor"
											d="M95,9.9c-1.3-1.1-3.4-1.2-7-0.1c0,0,0,0,0,0c-2.5,0.8-24.7,9.2-44.3,17.3c-17.6,7.3-31.9,13.7-33.6,14.5  c-1.9,0.6-6,2.4-6.2,5.2c-0.1,1.8,1.4,3.4,4.3,4.7c3.1,1.6,16.8,6.2,19.7,7.1c1,3.4,6.9,23.3,7.2,24.5c0.4,1.8,1.6,2.8,2.2,3.2  c0.1,0.1,0.3,0.3,0.5,0.4c0.3,0.2,0.7,0.3,1.2,0.3c0.7,0,1.5-0.3,2.2-0.8c3.7-3,10.1-9.7,11.9-11.6c7.9,6.2,16.5,13.1,17.3,13.9  c0,0,0.1,0.1,0.1,0.1c1.9,1.6,3.9,2.5,5.7,2.5c0.6,0,1.2-0.1,1.8-0.3c2.1-0.7,3.6-2.7,4.1-5.4c0-0.1,0.1-0.5,0.3-1.2  c3.4-14.8,6.1-27.8,8.3-38.7c2.1-10.7,3.8-21.2,4.8-26.8c0.2-1.4,0.4-2.5,0.5-3.2C96.3,13.5,96.5,11.2,95,9.9z M30,58.3l47.7-31.6  c0.1-0.1,0.3-0.2,0.4-0.3c0,0,0,0,0,0c0.1,0,0.1-0.1,0.2-0.1c0.1,0,0.1,0,0.2-0.1c-0.1,0.1-0.2,0.4-0.4,0.6L66,38.1  c-8.4,7.7-19.4,17.8-26.7,24.4c0,0,0,0,0,0.1c0,0-0.1,0.1-0.1,0.1c0,0,0,0.1-0.1,0.1c0,0.1,0,0.1-0.1,0.2c0,0,0,0.1,0,0.1  c0,0,0,0,0,0.1c-0.5,5.6-1.4,15.2-1.8,19.5c0,0,0,0,0-0.1C36.8,81.4,31.2,62.3,30,58.3z"></path>
                            </svg>
							</a>
								<div class="tooltip">Telegram</div></li>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section-2" id= "section-2">
		<h1>Reviews</h1>
		<!-- <div class="review-cmt">
            <div class="left-review">
                <div class="img-user-review">
                    <img src="../img/ntd.png" alt="">
                </div>
                <div class="info-user-review">
                    <p>Nguyễn Thành Đạt</p>
                    <div class="star">
                        <div class="radio">
                        <input id="rating-5" type="radio" name="rating" value="5" />
                        <label for="rating-5" title="5 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-4" type="radio" name="rating" value="4" />
                        <label for="rating-4" title="4 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-3" type="radio" name="rating" value="3" />
                        <label for="rating-3" title="3 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-2" type="radio" name="rating" value="2" />
                        <label for="rating-2" title="2 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-1" type="radio" name="rating" value="1" />
                        <label for="rating-1" title="1 star">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="right-review">
                <div class="date-review">
                    <p>12-12-2024</p>
                </div>
                <div class="comment-review">
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sit vero ducimus nemo accusantium tenetur atque numquam possimus voluptatem dicta? Laudantium accusamus quasi expedita omnis quibusdam quia cupiditate pariatur provident. Assumenda!</p>
                </div>
            </div> 
        </div>
        <div class="review-cmt"> -->
		<!-- <div class="left-review">
                <div class="img-user-review">
                    <img src="../img/ntd.png" alt="">
                </div>
                <div class="info-user-review">
                    <p>Nguyễn Thành Đạt</p>
                    <div class="star">
                        <div class="radio">
                        <input id="rating-5" type="radio" name="rating" value="5" />
                        <label for="rating-5" title="5 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-4" type="radio" name="rating" value="4" />
                        <label for="rating-4" title="4 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-3" type="radio" name="rating" value="3" />
                        <label for="rating-3" title="3 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-2" type="radio" name="rating" value="2" />
                        <label for="rating-2" title="2 stars">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>

                        <input id="rating-1" type="radio" name="rating" value="1" />
                        <label for="rating-1" title="1 star">
                            <svg viewBox="0 0 576 512" height="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"
                            ></path>
                            </svg>
                        </label>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="right-review">
                <div class="date-review">
                    <p>12-12-2024</p>
                </div>
                <div class="comment-review">
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sit vero ducimus nemo accusantium tenetur atque numquam possimus voluptatem dicta? Laudantium accusamus quasi expedita omnis quibusdam quia cupiditate pariatur provident. Assumenda!</p>
                </div>
            </div> 
        </div>
 -->
		<!-- Comment Reivewer -->
		<div class="product-review">
			<div class="header-product-review">
				<h2>Leave a review about this Product</h2>

				<!-- Rating Section -->
				<form method="post" action="details/addcmt" class="form-review">
					<div class="star">
						<div class="radio">
							<input id="rating-5" type="radio" name="rating" value="5" /> <label
								for="rating-5" title="5 stars"> <svg
									viewBox="0 0 576 512" height="1em"
									xmlns="http://www.w3.org/2000/svg">
		                    <path
										d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
		                    </svg>
							</label> <input id="rating-4" type="radio" name="rating" value="4" /> <label
								for="rating-4" title="4 stars"> <svg
									viewBox="0 0 576 512" height="1em"
									xmlns="http://www.w3.org/2000/svg">
		                    <path
										d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
		                    </svg>
							</label> <input id="rating-3" type="radio" name="rating" value="3" /> <label
								for="rating-3" title="3 stars"> <svg
									viewBox="0 0 576 512" height="1em"
									xmlns="http://www.w3.org/2000/svg">
		                    <path
										d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
		                    </svg>
							</label> <input id="rating-2" type="radio" name="rating" value="2" /> <label
								for="rating-2" title="2 stars"> <svg
									viewBox="0 0 576 512" height="1em"
									xmlns="http://www.w3.org/2000/svg">
		                    <path
										d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
		                    </svg>
							</label> <input id="rating-1" type="radio" name="rating" value="1" /> <label
								for="rating-1" title="1 star"> <svg
									viewBox="0 0 576 512" height="1em"
									xmlns="http://www.w3.org/2000/svg">
		                    <path
										d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
		                    </svg>
							</label>
						</div>
					</div>
					<input value="${id}" style="display: none" name="id"> <input
						style="display: none" name="starvalue">
					<!-- Comment Section -->
					<div class="comment-section">
						<textarea id="comment" placeholder="Leave a comment..." rows="4"
							name="newcomment"></textarea>
						<button type="submit">Submit Review</button>
					</div>
				</form>

				<!-- Display Submitted Reviews -->
				<div id="reviews-list">
					<h3>Submitted Reviews</h3>
				</div>
			</div>

			<!-- Comment Reviewer -->
	</section>
	<script>
    let section_cmt = document.getElementById("section-2")
   async function loadComment(){
            <!-- const response = await fetch(`http://localhost:8080/DAWEBB/api/product/rating?id=${id}`); -->
            const response = await fetch("http://localhost:8080/DAWEBB/api/product/rating?id="+${id});

              const comments = await response.json();
              console.log("run load comment"+response)
              comments.forEach(function(comment) {
                  console.log("Comments:", comment);
                // Creating the review container
                  const reviewContainer = document.createElement('div');
                  reviewContainer.classList.add('review-cmt');
    
                  // Creating the left part of the review
                  const leftReview = document.createElement('div');
                  leftReview.classList.add('left-review');
    
                  // Creating the image container for the user
                  const imgUserReview = document.createElement('div');
                  imgUserReview.classList.add('img-user-review');
                  const userImage = document.createElement('img');
                  userImage.src = comment.img;
                  userImage.alt = '';
                  imgUserReview.appendChild(userImage);
    
                  // Creating the user info container
                  const infoUserReview = document.createElement('div');
                  infoUserReview.classList.add('info-user-review');
                  const userName = document.createElement('p');
                  userName.textContent = comment.user;
                  infoUserReview.appendChild(userName);
    
                  // Creating the star rating container
                  const star = document.createElement('div');
                  star.classList.add('star-rating-count'); 
                  star.id = 'star-rating-count';
                  for (let i = 1; i <= 5; i++) {
                	  const starg = document.createElement('span');
                      starg.classList.add('fa', 'fa-star');
                      
                      // If the current star index is less than or equal to the rating, add the 'checked' class
                      if (i <= comment.ratingValue) {
                          starg.classList.add('checked');
                      }

                      star.appendChild(starg); // Append the star to the container
                  }
    
                  /* const countStar = generateStars(comment.ratingValue)
                  star.appendChild(countStar); */
    
                  // Append the user info and star rating to the left review section
                  infoUserReview.appendChild(star);
                  leftReview.appendChild(imgUserReview);
                  leftReview.appendChild(infoUserReview);
    
                  // Creating the right part of the review
                  const rightReview = document.createElement('div');
                  rightReview.classList.add('right-review');
    
                  // Creating the date review container
                  const dateReview = document.createElement('div');
                  dateReview.classList.add('date-review');
                  const dateText = document.createElement('p');
                  dateText.textContent = comment.ratingDate;
                  dateReview.appendChild(dateText);
    				
                  // Creating the comment review container
                  const commentReview = document.createElement('div');
                  commentReview.classList.add('comment-review');
                  const commentText = document.createElement('p');
                  commentText.textContent = comment.ratingComment;
                  commentReview.appendChild(commentText);
    
                  // Append the date and comment review to the right review section
                  rightReview.appendChild(dateReview);
                  rightReview.appendChild(commentReview);
    
                  // Append both left and right review to the main review container
                  reviewContainer.appendChild(leftReview);
                  reviewContainer.appendChild(rightReview);
    
                  // Add a horizontal line between the two sections
                  const hr = document.createElement('hr');
                  reviewContainer.appendChild(hr);

    		  // Append the entire review container to the body (or any other container in the DOM)
    		  section_cmt.appendChild(reviewContainer);

    	  })}


// Call the function to load comments
loadComment();
    	  
    	  
 
    	  
    	  function generateStars(rating) {
              const container = document.crateElementById('div');
              container.innerHTML = ''; // Clear previous stars
              
              // Loop to create 5 stars
              for (let i = 1; i <= 5; i++) {
                  const star = document.createElement('span');
                  star.classList.add('fa', 'fa-star');
                  
                  // If the current star index is less than or equal to the rating, add the 'checked' class
                  if (i <= rating) {
                      star.classList.add('checked');
                  }

                  container.appendChild(star); // Append the star to the container
              }
          }
    	  /* document.querySelector('form-review').addEventListener('submit', function(event) {
    		    // Prevent the form from submitting until we handle the rating
    		    event.preventDefault();

    		    // Get the selected star rating value
    		    const selectedRating = document.querySelector('input[name="rating"]:checked');

    		    // Check if a rating has been selected
    		    if (selectedRating) {
    		        // Get the value of the selected rating (1, 2, 3, 4, or 5)
    		        const ratingValue = selectedRating.value;

    		        // Optionally, you can get the comment as well
    		        const comment = document.querySelector('textarea[name="newcomment"]').value;

    		        // Log the values (you can send them via AJAX or append them to the form data)
    		        console.log('Selected Rating:', ratingValue);
    		        console.log('Comment:', comment);

    		        // You can now submit the form using JavaScript (for example, via AJAX)
    		        // Here's an example using `fetch` to submit the form data including the rating and comment

    		        const formData = new FormData(this);
    		        formData.append('rating', ratingValue); // Append the rating value to the form data

    		        fetch(this.action, {
    		            method: this.method,
    		            body: formData
    		        })
    		        .then(response => response.json())
    		        .then(data => {
    		            console.log('Form submitted successfully', data);
    		            // Optionally, handle successful form submission here
    		        })
    		        .catch(error => {
    		            console.error('Error submitting form:', error);
    		        });
    		    } else {
    		        alert('Please select a star rating before submitting!');
    		    }
    		}); */
    	  

    
    </script>
</body>
</html>