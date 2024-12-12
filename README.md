# H1 Đồ án lập trình web , XÂY DỰNG WEBSITE BÁN HÀNG UTESHOP DÙNG SERVLET VÀ JSP/JSTL, BOOTSTRAP, JPA,SQL SERVER, DECORATOR SITEMESH, JWT
About:
Mã số sinh viên : 22110129, 22110153, 22110219

Công nghệ sử dụng cho đồ án:-
Front-End Development:
HTML
CSS
Javascript/jQuery
BootStrap
Decorator sitemesh
JWT
Back-End Development:
Java 22
JPA (Java Persistence API)
Servlet
JSP/JSTL (JavaServer Pages)
Database:
SQL Server 2019
Xem chi tiết database trong fileword báo cáo
Software and Tools
Spring tools
Tomcat 10.1
SQL Server Management Studio 2019
Bussiness :
Thanh toán bằng cổng vnpay, môi trường sandbox thử nghiệm
Jar files used :
Xem file pom.xml trong dự án



CHƯƠNG 3: THIẾT KẾ GIAO DIỆN
GIAO DIỆN PHÍA NGƯỜI MUA

Để truy cập vào trang quản lý của hàng, tài khoản user phải đăng kí trước
![Alt text](https://github.com/user-attachments/assets/56c00078-e689-4fef-a632-6048f4679c0e)

Sau khi đăng ký có thể đăng nhập
![Alt text](https://github.com/user-attachments/assets/64d42b04-07fd-4b11-a00a-520d5508936a)

Trang chủ 
![Alt text](https://github.com/user-attachments/assets/4704ab65-cf28-4f33-a82e-4de173b2b5a7)
![Alt text](https://github.com/user-attachments/assets/ee07d9de-6346-4d86-b38f-b0e4ad3cc1b6)
![Alt text](https://github.com/user-attachments/assets/49b5220d-e324-43ce-b4e5-f77b233c3b14)

Người mua có thể thay đổi thông tin cá nhân hay hình nền ở đây
![Alt text](https://github.com/user-attachments/assets/867edafe-bbcb-4609-a976-f9e716bc759b)

Xem danh sách sản phẩm 
![Alt text](https://github.com/user-attachments/assets/e5ca2dd5-8b9c-451b-9c47-969958bc47b3)

Chi tiết sản phẩm
![Alt text](https://github.com/user-attachments/assets/a38ab739-e292-411b-a1c0-1dbae7fa8342)

Người mua có thể chọn đánh giá và để lại bình luận
![Alt text](https://github.com/user-attachments/assets/ddf4cba1-3255-4413-8986-eb4986d2662c)

Sau khi bấm mua người mua sẽ được chuyển đến trang xác nhận lại

![Alt text](https://github.com/user-attachments/assets/46c3e6b1-69a0-4c9c-b230-5fac19b7fe91)

Sau khi xác nhận sẽ được chuyển đến trang thanh toán
![Alt text](https://github.com/user-attachments/assets/c222f613-9473-43f7-bef7-b0b24fabd6d1)

Thanh toán được kết nối qua API sandbox của vnpay, ở đây bạn có thể lựa chọn nhiều loại thanh toán khác nhau như QR, Bank, Thẻ tín dụng….
Thanh toán thất bại
![Alt text](https://github.com/user-attachments/assets/d15bba08-4253-4cca-9b77-6ab02287b1f7)

Thành công
![Alt text](https://github.com/user-attachments/assets/519d140a-f750-4881-a372-0224f4216351)


Api controller của vnpay






