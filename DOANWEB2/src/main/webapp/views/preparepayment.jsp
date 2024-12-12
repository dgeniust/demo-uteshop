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
    <link rel="stylesheet" href="/frontend/css/payment-info-user.css">
    <!-- Font AWESOME -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<style>

@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Playwrite+HR+Lijeva:wght@100..400&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300..900;1,300..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100..900&display=swap');


:root {
  --color-primary-blue: #024CAA;
  --color-primary-light-gray: #E4E0E1;
  --color-primary-light-blue: #006BFF;
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
  font-family: "Roboto Slab", serif;
  display: flex;
    justify-content: center;
    align-items: center;
    background-color: #F4F6FF;
}
ul {
  list-style: none;
}
a{
  text-decoration: none;
}

.main-content {
  display: flex;
  width: 1000px;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.container {
    width: 1000px;
    height: 650px;
    border: 1px solid black;
    background-color: white;
    border-radius: 10px;
}
.header {
    width: 100%;
    height: 8%;
    border-bottom: 1px solid black;
    display: flex;
    align-items: center;
    justify-content: center;

}
.back-to-landing-page{
    width: 100%;
    height: 8%;
    display: flex;
    align-items: center;
    justify-content: space-around;
    border-bottom: 1px solid black;
    flex-direction: row;
}
.nav-logo {
    display: flex;
    flex-direction: row;
    align-items: center;
    width: 70%;
    padding-left: 40px;
}
.nav-logo h1 {
    font-family: var(--font-logo);
    font-size: 34px;
    color: black;
    font-weight: 600;
    margin-left: 10px;
}
.back-btn {
    width: 30%;
    display: flex;
    gap: 10px;
    align-items: center;
    justify-content: flex-end;
    padding: 10px 20px;
    border: none;
    background: white;
    color: #9AA6B2;
}
.back-btn p {
    font-size: 20px;
    font-weight: 700;
    font-family: 'Lora', sans-serif;
    font-style: italic;
}
.back-btn:hover p{
    text-decoration: underline;
    color: #7b8a99;
}


.process-element{
    display: flex;
    align-items: center;
    padding: 0 10px;
    gap: 10px;
}
.number-header{
    width: 30px;
    height: 30px;
    border-radius: 50%;
    color: black;
    background-color: #dfe6e9;
    display: flex;
    align-items: center;
    justify-content: center;
    border: none;
}
.active{
    background-color: #006BFF;
    color: white
}


.main {
    height: 90%;
    width: 100%;
}
.header-main-title{
    padding-top: 10px;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.header-main-title h1{
    font-size: 25px;
    font-weight: 600;
    color: black;
}
.header-main-title p{
    font-size: 15px;
    font-weight: 500;
    color: #636e72;
}
.fill-info{
    width: 100%;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}
.left {
    width: 55%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    padding: 20px;
}
.right {
    width: 45%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding-right: 10px;
}
.left h2 {
    font-size: 20px;
    font-weight: 600;
    color: black;
}
.info-user{
    display: flex;
    justify-content: center;
    flex-direction: column;
    padding: 5px;
}
.info-user span {
    font-size: 15px;
    font-weight: 500;
    color: #636e72;
}
.info-user input {
    width: 90%;
    height: 30px;
    border: 1px solid #dfe6e9;
    border-radius: 5px;
    padding: 5px;
    margin-top: 5px;
}
.btn-confirm-info{
    width: 100%;
    padding-top: 10px;
    display: flex;
}
.btn-confirm-info input {
    width: 90%;
    height: 30px;
    border: none;
    background-color: var(--color-primary-light-blue);
    color: white;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
}
.header-right{
    display: flex;
    flex-direction: row;
    width: 100%;
    justify-content: space-between;
    padding-bottom: 10px;
}
.header-right h2 {
    font-size: 20px;
    font-weight: 600;
    color: black;
}
.box-product-buy{
    width: 100%;
    height: auto;
    display: flex;
    flex-direction: column;
    border: 1px solid black;
    border-radius: 10px;
}
.detail-product-buy {
    display: flex;
    flex-direction: row;
    padding: 5px;
    border-bottom: 1px solid var(--color-primary-light-gray);
    width: 100%;
}
.left-detail-product-buy{
    display: flex;
    flex-direction: row;
    width: 100%;
}
.last-price {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}
.info-product-buy{
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.img-product-buy img {
    width: 80px;
    height: 80px;
    border-radius: 5px;
    object-fit: cover;
    padding-right: 5px;
}
.number-buy button {
    width: 30px;
    height: 30px;
    border: none;
    border-radius: 50%;
    background-color: rgb(98, 91, 91);
    color: white;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
}
.btn-confirm-product{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    gap: 10px;
}
.btn-confirm-product button {
    width: 100px;
    height: 30px;
    border: none;
    background-color: var(--color-primary-light-blue);
    color: white;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
}
.btn-confirm-product button:hover {
    background-color: #0056b3;
}
.btn-confirm-product input {
    width: 100%;
    height: 30px;
    border: 1px solid var(--color-primary-light-gray);
    padding: 5px;
}
</style>
    <section class="main-content">
        <div class="container">
            <div class="back-to-landing-page">
                <a href="" class="nav-logo">
                    <img src="<c:url value='/views/img/logo.png'/>" alt="" width="40px" height="40px">
                    <h1>Gundam Garden</h1>
                </a>
                <button class="back-btn">
                    <i class="fa-solid fa-arrow-left"></i>
                    <p>Back To Home</p>
                </button>
            </div>
            <div class="header">
                <div class="process-element">
                    <button class="number-header active">1</button>
                    <p>Personal Details</p>
                    <hr width="100px">
                </div>
                <div class="process-element">
                    <button class="number-header">2</button>
                    <p>Payment</p>
                    <hr width="100px">
                </div>
                <div class="process-element">
                    <button class="number-header">3</button>
                    <p>Complete</p>
                    <hr width="100px">
                </div>
            </div>
            <div class="main">
                <div class="header-main-title">
                    <h1>Payment Information</h1>
                    <p>Please check your infomation carefully before starting the payment process</p>
                </div>
                <div class="fill-info">
                    <div class="left">
                        <h2>Thông tin khách hàng</h2>
                        <form action="preparepayment/pay" class="form-fill-info" method="POST">
                            <div class="info-user">
                                <span>Họ Tên</span>
                                <input type="text" placeholder="VD: Nguyễn Văn A" name="fullname" disabled value="${fullname}">
                            </div>
                            
                            <div class="info-user">
                                <span>Địa chỉ</span>
                                <input type="text" placeholder="Nhập địa chỉ của bạn" name="address" value="${address}" disabled required>
                            </div>
                            <div class="info-user">
                                <span>Điện thoại</span>
                                <input type="text" placeholder="Nhập số điện thoại của bạn" name="phone" value="${phone}" disabled required>
                            </div>
                            <div class="info-user">
                                <span>Email</span>
                                <input type="email" placeholder="example@gmail.com" name="email"value="${email}" disabled required>
                            	<input type="text" hidden="true" placeholder="" name="lastprice"value="${lastprice}">
                            </div>
                            <div class="btn-confirm-info">
                                <input type="submit" value="Submit">
                            </div>
                        </form>
                        
                        
                    </div>
                    <div class="right">
                        <div class="header-right">
                            <h2>Giỏ hàng</h2>
                            <div class="number-buy">
                                <button class="show-number-buy">2</button>
                            </div>
                        </div>
                        <div class="box-product-buy">
                            <div class="detail-product-buy">
                                <div class="left-detail-product-buy">
                                    <div class="img-product-buy">
                                        <img src="<c:url value='/views/img/s1.jpg'/>" alt="">
                                    </div>
                                    <div class="info-product-buy">
                                        <h3>Tên sản phẩm: ${productname}</h3>
                                        <p>Giá: ${productprice}</p>
                                        <p>Số lượng: ${productamount}</p>
                                    </div>
                                </div>
                                <div class="last-price">
                                    <p>Giá cuối ${lastprice}"</p>
                                </div>
                            </div>
                            
                        </div>
                        <div class="btn-confirm-product">
                            <input type="text" placeholder="Mã giảm giá" id="" name="discount">
                            <button>Áp dụng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>