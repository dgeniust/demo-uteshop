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
    <link rel="stylesheet" href="/frontend/css/edit-product.css">
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
.form-fill-info{
    width: 100%;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}
.left-form {
    width: 55%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    padding: 0 20px;
}
.right-form {
    width: 45%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding-right: 10px;
}
.form-fill-info{
    width: 100%;
    display: flex;
    flex-direction: column;
}
.main-form{
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}
.left h2 {
    font-size: 20px;
    font-weight: 600;
    color: black;
    margin-left: 20px;
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
    width: 50%;
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
/* upload image  */
.upload-container {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    max-width: 400px;
    max-height: 400px;
    width: 400px;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.upload-label {
    display: inline-block;
    padding: 12px 25px;
    background-color: #007BFF;
    color: white;
    font-size: 18px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.upload-label:hover {
    background-color: #0056b3;
}

input[type="file"] {
    display: none; /* Hide the default file input */
}

.preview-container {
    margin-top: 20px;
}

#image-preview {
    max-width: 200px;

    max-height: 300px;
    border-radius: 5px;
    object-fit: cover;
}

.hidden {
    display: none;
}
/* upload imgae */
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
                    <a href="home">Back To Home</a>
                </button>
            </div>
            <div class="main">
                <div class="header-main-title">
                    <h1>Edit the product</h1>
                    <p>Please check the product's infomation carefully before submit this</p>
                </div>
                <div class="fill-info">
                    <div class="left">
                        <h2>Thông tin sản phẩm</h2>
                        <form action="http://localhost:8080/DAWEBB/admin/product/update" class="form-fill-info" method="POST" enctype="multipart/form-data">
                            <div class="main-form">
                                <div class="left-form">
                                    <div class="info-user">
                                        <span>ID Sản phẩm</span>
                                        <input type="text" name="productid" value="${id}" required>
                                    </div>
                                    <div class="info-user">
                                        <span>Tên</span>
                                        <input type="text" name="productname" value="${name}" required>
                                    </div>
                                    <div class="info-user">
                                        <span>Giá thành</span>
                                        <input type="text" name="productprice" value="${price}" required>
                                    </div>
                                    <div class="info-user">
                                        <span>Số lượng</span>
                                        <input type="text"name="productamount" value="${amount}" required>
                                    </div>
                                    <div class="info-user">
                                        <span>Category ID</span>
                                        <input type="text" name="cateid" value ="${cateid}" required>
                                    </div>
                                </div>
                                <div class="right-form">
                                    <div class="upload-container">
                                        <label for="image-upload" class="upload-label">
                                            <span>Upload Image</span>
                                            <input type="file" id="image-upload" name="Images" accept="image/*">
                                        </label>
                                        <div class="preview-container">
                                            <img id="image-preview" src="${img}" alt="Image preview">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-confirm-info">
                                <input type="submit" value="Submit">
                            </div>
                            
                        </form>
                        
                        
                    </div>
                    <div class="right">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        document.getElementById("image-upload").addEventListener("change", function (event) {
            const file = event.target.files[0];
            const preview = document.getElementById("image-preview");
        
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    preview.src = e.target.result;
                    preview.classList.remove("hidden");
                };
                reader.readAsDataURL(file);
            } else {
                preview.classList.add("hidden");
            }
        });
    </script>
</body>
</html>