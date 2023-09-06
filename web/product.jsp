

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v17.0" nonce="DEmmJMtH"></script>
</head>
<body>
    <%@include file="/pages/navbar.jsp" %>

    <form action="add" method="post">
        <section class="py-5">

            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">

                    <div class="col-md-6">

                        <center class="the ">
                            <div class="badge bg-dark text-white position-absolute" style="margin: 1%;">-${book.giamgia}%</div>
                            <img class="card-img-top mb-5 mb-md-0" src="${book.img}" alt="..." style="
                                 height: 8%;
                                 width: 70%;">
                        </center>
                    </div>

                    <div class="col-md-6">

                        <div class="small mb-1">MÃ DƠN HÀNG: ${book.id} </div>
                        <h1 style="font-size: 2rem;" class="display-5 fw-bolder">${book.tensach}</h1>
                        <hr>
                        <div class="fs-5 mb-2">
                            <span class="text-decoration-line-through fs-6 text-secondary"><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</span>
                            <span style="color: red;"><fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫</span>
                            <span class="ms-2">(Bạn đã tiết kiệm được <fmt:formatNumber pattern="###,###" value="${book.giaban-(book.giaban - book.giaban*book.giamgia/100)}"/>₫)</span>
                        </div>
                        <p class="lead">Tác giả: <a href="#" style="color: red;font-weight: 500;"> ${book.tacgia}</a></p>
                        <p class="lead">Định dạng: ${book.dinhdang}</p>
                        <p class="lead">Trọng lượng: <fmt:formatNumber pattern="###,###" value="${book.trongluong}"/> gram</p>
                        <p class="lead">Thể loại: <a href="#" style="color: red; font-weight: 500;"> ${book.category.tenloai}</a></p>
                        <p class="lead">Đã bán: <a href="#" style="color: red; font-weight: 500;"> ${book.daban}</a></p>
                        <div class="d-flex">
                            <input type="hidden" class="text-center" readonly name="bookid" value="${book.id}"/>
                            <input name="soluong" class="form-control text-center me-3" id="inputQuantity" min="1" pattern="[-+]?[0-99]" type="number" value="1" style="max-width: 5rem" />
                            <c:if test="${book.soluong > 2&&book.stt==5}">
                                <input value="Thêm vào giỏ hàng"  class="btn btn-outline-dark flex-shrink-0" type="submit"/>
                            </c:if>
                            <c:if test="${book.soluong <=2||book.stt==4}">
                                <input value="Tạm hết hàng"  class="btn btn-outline-dark flex-shrink-0" disabled="disabled" type="submit"/>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card border border-secondary p-4 mt-5">
                        <div class="row">
                            <div class="fb-comments" data-href="https://www.facebook.com/plugins/post.php" data-width="100%" data-numposts="5"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
    <!-- Related items section-->
    <section class="py-5 bg-light">
        <div class="container px-lg-5 mt-5">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <h3 class="text-center mb-5">SÁCH CÙNG THỂ LOẠI</h3>
                        <c:forEach items="${requestScope.cungloai}" var="book">
                            <div style="margin-bottom: 5%;" class="col-6 col-md-4 col-lg-3">
                                <a href="product?id=${book.id}">
                                    <div class="card border border-secondary h-100">
                                        <!-- Sale badge-->
                                        <c:if test="${book.soluong <=2}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Hết hàng</div>
                                        </c:if>
                                        <c:if test="${book.stt ==3}">
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left:  0.5rem">Đặt trước</div>
                                        </c:if>
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${book.giamgia}%</div>
                                        <!-- Product image-->
                                        <img style="height: 260px; object-fit: scale-down" class="card-img-top" src="${book.img}" alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 style="display: -webkit-box;
                                                    -webkit-line-clamp: 2;
                                                    -webkit-box-orient: vertical;
                                                    overflow: hidden;" class="fw-bolder">${book.tensach}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</span>
                                                <fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫
                                                <div>${book.luotxem} lượt xem</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<%@include file="/pages/footer.jsp" %>
</body>
</html>
