<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link rel="stylesheet" href="/frontend/css/signin.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

</head>
<body>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100..900&display=swap');

* {
  margin: 0;
  border: border-box;
  font-family: "Montserrat";
}
body {
  background-image: url(<c:url value='/views/img/japan-bg.jpg'/>);
  background-size: cover;
  /* backdrop-filter: blur(5px); */
  /* background-position-y: 50%; */
}
.container { 
  display: grid;
  grid-template-columns:  repeat(2, 1fr);
  place-items: center;
  /* display: flex;
  justify-content: space-around; */
  align-items: center;
  height: 100vh;
}
.container-form {
  border: 1px solid black;
  width: 400px;
  height: 520px;
  display: flex;
  justify-content: center;
  border-radius: 4px;
  background-color: white;
}

.flex-column {
  margin-top: 20px;
}
.text-container h1 {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}
.inputForm {
  border: 1.5px solid #ecedec;
  border-radius: 10px;
  height: 40px;
  width: 320px;
  display: flex;
  align-items: center;
  padding: 5px;
  transition: 0.2s ease-in-out;
  justify-content: space-around;
}
input { 
  width: 260px;
  margin-left: 10px;
  padding: 10px;
  border-radius: 5px;
  /* border: 1px solid rgba(211, 211, 211, 0.433); */
  outline: none;
  border: none;
  font-style: 12px;
}
.input:focus {
  outline: none;
  /* background-color: gray; */
  background-color: #FEF9F2;
}
.inputForm:hover {
  border: 1.5px solid gray;
}
.inputForm:focus-within {
  border: 1.5px solid gray;
}
label {
  font-size: 14px;
  font-weight: bold;
}
.btn-container { 
  margin-top: 20px;
}
/* BUTTON SIGN UP */
.btn {
  border: none;
  width: 330px;
  height: 40px;
  border-radius: 3em;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 12px;
  background: #1C1A1C;
  cursor: pointer;
  transition: all 450ms ease-in-out;
}

.sparkle {
  fill: #AAAAAA;
  transition: all 800ms ease;
}

.text {
  font-weight: 600;
  color: #AAAAAA;
  font-size: medium;
}

.btn:hover {
  background: linear-gradient(0deg,#A47CF3,#683FEA);
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.4),
  inset 0px -4px 0px 0px rgba(0, 0, 0, 0.2),
  0px 0px 0px 4px rgba(255, 255, 255, 0.2),
  0px 0px 180px 0px #9917FF;
  transform: translateY(-2px);
}

.btn:hover .text {
  color: white;
}

.btn:hover .sparkle {
  fill: white;
  transform: scale(1.2);
} 
/* END BUTTON SIGN UP */
.login-form {
  margin-top: 10px;
}
.login-form a {
  text-decoration: none;
  color: #1C1A1C;
  font-weight: bold;
}
.login-form a:hover {
  color: #273c75;
  text-decoration: underline;
}
.or{
  margin-top: 20px;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}
.line{
  width: 150px;
  height: 0.5px;
  background-color: gray;
  margin: 0 auto;
}
.other{
  margin-top: 20px;
  display: flex;
  justify-content: space-around;
}
.social-media {
  display: flex;
  justify-content: space-around;
  margin-top: 10px;
}
.social-media a {
  text-decoration: none;
  color: black;
  font-weight: bold;
}
/* SOCIAL ICON START */
/* From Uiverse.io by david-mohseni */ 
.wrapper {
  display: inline-flex;
  list-style: none;
  height: 120px;
  width: 100%;
  /* padding-top: 40px; */
  font-family: "Poppins", sans-serif;
  justify-content: center;
}

.wrapper .icon {
  position: relative;
  background: #fff;
  border-radius: 50%;
  margin: 10px;
  width: 50px;
  height: 50px;
  font-size: 18px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: all 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.wrapper .tooltip {
  position: absolute;
  top: 0;
  font-size: 14px;
  background: #fff;
  color: #fff;
  padding: 5px 8px;
  border-radius: 5px;
  box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
  opacity: 0;
  pointer-events: none;
  transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.wrapper .tooltip::before {
  position: absolute;
  content: "";
  height: 8px;
  width: 8px;
  background: #fff;
  bottom: -3px;
  left: 50%;
  transform: translate(-50%) rotate(45deg);
  transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.wrapper .icon:hover .tooltip {
  top: -45px;
  opacity: 1;
  visibility: visible;
  pointer-events: auto;
}

.wrapper .icon:hover span,
.wrapper .icon:hover .tooltip {
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.1);
}

.wrapper .google:hover,
.wrapper .google:hover .tooltip,
.wrapper .google:hover .tooltip::before {
  background: #9EDF9C;
  color: white;
}

.wrapper .facebook:hover,
.wrapper .facebook:hover .tooltip,
.wrapper .facebook:hover .tooltip::before {
  background: #1877f2;
  color: #fff;
}

.wrapper .twitter:hover,
.wrapper .twitter:hover .tooltip,
.wrapper .twitter:hover .tooltip::before {
  background: #1da1f2;
  color: #fff;
}

.wrapper .instagram:hover,
.wrapper .instagram:hover .tooltip,
.wrapper .instagram:hover .tooltip::before {
  background: #e4405f;
  color: #fff;
}


/* SOCIAL ICON END */
.container-slogan {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.container-slogan p {
  font-size: 25px;
  font-weight: bold;
  font-family: 'Noto Sans Japanese';
  color: white;
}
	
</style>
    <div class="signup-container">
        <div class="container">
            <div class="container-image" >
                <div class="container-slogan">
                    <!-- <h1>Welcome to UTEShop</h1> -->
                    <p data-aos="fade-right"
                    data-aos-easing="linear"
                    data-aos-duration="1500" >ベトナム</p>
                </div>
                <img src="<c:url value='/views/img/bg-japan-signin.png'/>" alt="" width="600px" height="600px" 
                    data-aos="fade-down"
                    data-aos-easing="linear"
                    data-aos-duration="1500" >
            </div>
            <div class="container-form" 
                data-aos="fade-left"
                data-aos-easing="linear"
                data-aos-duration="1500"   
                >
                <form action="login" class="form" method="Post">
                    <div class="text-container">
                        <h1>Sign In</h1>
                    </div>
                    <div class="input-container">
                        <!-- <div class="flex-column">
                            <label>Your Fullname</label>
                        </div>
                            <div class="inputForm">
                              <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z" stroke="#000000" stroke-width="1.9440000000000002" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M12 14C8.13401 14 5 17.134 5 21H19C19 17.134 15.866 14 12 14Z" stroke="#000000" stroke-width="1.9440000000000002" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>      
                              <input placeholder="Nguyễn Văn A" class="input input-name" type="text">
                            </div> -->
                        <div class="flex-column">
                            <label>Your Username </label>
                        </div>
                        <div class="inputForm">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" viewBox="0 0 32 32" height="20"><g data-name="Layer 3" id="Layer_3"><path d="m30.853 13.87a15 15 0 0 0 -29.729 4.082 15.1 15.1 0 0 0 12.876 12.918 15.6 15.6 0 0 0 2.016.13 14.85 14.85 0 0 0 7.715-2.145 1 1 0 1 0 -1.031-1.711 13.007 13.007 0 1 1 5.458-6.529 2.149 2.149 0 0 1 -4.158-.759v-10.856a1 1 0 0 0 -2 0v1.726a8 8 0 1 0 .2 10.325 4.135 4.135 0 0 0 7.83.274 15.2 15.2 0 0 0 .823-7.455zm-14.853 8.13a6 6 0 1 1 6-6 6.006 6.006 0 0 1 -6 6z"></path></g></svg>
                            <input placeholder="" class="input" type="text" name="username">
                        </div>
                        <div class="flex-column">
                            <label>Your Password </label>
                        </div>
                        <div class="inputForm">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" viewBox="-64 0 512 512" height="20"><path d="m336 512h-288c-26.453125 0-48-21.523438-48-48v-224c0-26.476562 21.546875-48 48-48h288c26.453125 0 48 21.523438 48 48v224c0 26.476562-21.546875 48-48 48zm-288-288c-8.8125 0-16 7.167969-16 16v224c0 8.832031 7.1875 16 16 16h288c8.8125 0 16-7.167969 16-16v-224c0-8.832031-7.1875-16-16-16zm0 0"></path><path d="m304 224c-8.832031 0-16-7.167969-16-16v-80c0-52.929688-43.070312-96-96-96s-96 43.070312-96 96v80c0 8.832031-7.167969 16-16 16s-16-7.167969-16-16v-80c0-70.59375 57.40625-128 128-128s128 57.40625 128 128v80c0 8.832031-7.167969 16-16 16zm0 0"></path></svg>        
                            <input placeholder="Enter your Password" class="input" type="password" name="password">
                        </div>
                    </div>
                    <div class="btn-container">
                        <button class="btn">
                            <svg height="24" width="24" fill="#FFFFFF" viewBox="0 0 24 24" data-name="Layer 1" id="Layer_1" class="sparkle">
                                <path d="M10,21.236,6.755,14.745.264,11.5,6.755,8.255,10,1.764l3.245,6.491L19.736,11.5l-6.491,3.245ZM18,21l1.5,3L21,21l3-1.5L21,18l-1.5-3L18,18l-3,1.5ZM19.333,4.667,20.5,7l1.167-2.333L24,3.5,21.667,2.333,20.5,0,19.333,2.333,17,3.5Z"></path>
                            </svg>
                            <span class="text">Sign In</span>
                        </button>
                        <div class="login-form">
                            <span>Don't have an account?</span>
                            <a href="register">Sign Up!</a>
                        </div>
                        <div class="or">
                            <div class="line"></div>
                            <span>or</span>
                            <div class="line"></div>
                        </div>
                        <span class="other">Sign in with your social</span>
                        </div>
                        <div class="show-error-msg"><p class="msg-text" style="color: ${color}">${msg}</p></div>
                </form>
            </div>
        </div>
    </div>
    <script src="/frontend/js/script.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>