<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fail Pay 😥</title>
    <link rel="stylesheet" href="/frontend/css/payment-fail.css">
</head>
<body>
<style>

@import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
body{
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}

.success {
    background: #ff4757;
    width: 400px;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 20px;
}
.content h1 {
    font-family: "Pacifico", cursive;
    font-size: 30px;
    color: #fff;
    margin: 0;
    font-weight: 700;
    text-align: center;
    text-transform: uppercase;
}
.btn-sc button{
    background: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 20px;
    font-weight: 700;
    cursor: pointer;
    margin-top: 20px;
    transition: all 0.3s;
}
.btn-sc button a{
    text-decoration: none;
    color: black;
}
.btn-sc button:hover{
    background: #f1f1f1;
}
.loader {
    position: relative;
    width: 110px;
    height: 30px;
    background: #fff;
    border-radius: 100px;
  }
  
  .loader::before {
    content: '';
    position: absolute;
    top: -20px;
    left: 10px;
    width: 30px;
    height: 30px;
    background: #fff;
    border-radius: 50%;
    box-shadow: 40px 0 0 20px #fff;
  }
  
  .snow {
    position: relative;
    display: flex;
    z-index: 1;
  }
  
  .snow span {
    position: relative;
    width: 3px;
    height: 3px;
    background: #fff;
    margin: 0 2px;
    border-radius: 50%;
    animation: snowing 5s linear infinite;
    animation-duration: calc(15s / var(--i));
    transform-origin: bottom;
  }
  
  @keyframes snowing {
    0% {
      transform: translateY(0px);
    }
  
    70% {
      transform: translateY(100px) scale(1);
    }
  
    100% {
      transform: translateY(100px) scale(0);
    }
  }
</style>
    <div class="success">
        <div class="svg-success">
            <div class="loader">
                <div class="snow">
                    <span style="--i:11"></span>
                    <span style="--i:12"></span>
                    <span style="--i:15"></span>
                    <span style="--i:17"></span>
                    <span style="--i:18"></span>
                    <span style="--i:13"></span>
                    <span style="--i:14"></span>
                    <span style="--i:19"></span>
                    <span style="--i:20"></span>
                    <span style="--i:10"></span>
                    <span style="--i:18"></span>
                    <span style="--i:13"></span>
                    <span style="--i:14"></span>
                    <span style="--i:19"></span>
                    <span style="--i:20"></span>
                    <span style="--i:10"></span>
                    <span style="--i:18"></span>
                    <span style="--i:13"></span>
                    <span style="--i:14"></span>
                    <span style="--i:19"></span>
                    <span style="--i:20"></span>
                    <span style="--i:10"></span>
                </div>
            </div>
        </div>
        <div class="content">
            <h1>Fail!</h1>
        </div>
        <div class="btn-sc">
            <button><a href="http://localhost:8080/DAWEBB/home">Back Home</a></button>
        </div>
    </div>
</body>
</html>