

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhà sách ONLINE</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            #btn-back-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                display: none;
            }
            /*            .card:hover{
                            box-shadow:rgba(0, 0, 0, 0.35) 0px 5px 15px;
                            transform: translateY(-20px);
                        }
                        .card{
                            transition: 0.6s;
                        }*/
            .bloc_left_price {
                color: #c01508;
                text-align: center;
                font-weight: bold;
                font-size: 150%;
            }
            .category_block li:hover {
                background-color: #007bff;
            }
            .category_block li:hover a {
                color: #ffffff;
            }
            .category_block li a {
                color: #343a40;
            }
            .add_to_cart_block .price {
                color: #c01508;
                text-align: center;
                font-weight: bold;
                font-size: 200%;
                margin-bottom: 0;
            }
            .add_to_cart_block .price_discounted {
                color: #343a40;
                text-align: center;
                text-decoration: line-through;
                font-size: 140%;
            }
            .product_rassurance {
                padding: 10px;
                margin-top: 15px;
                background: #ffffff;
                border: 1px solid #6c757d;
                color: #6c757d;
            }
            .product_rassurance .list-inline {
                margin-bottom: 0;
                text-transform: uppercase;
                text-align: center;
            }
            .product_rassurance .list-inline li:hover {
                color: #343a40;
            }
            .reviews_product .fa-star {
                color: gold;
            }
            .pagination {
                margin-top: 20px;
            }
            #sticky{
                position: sticky;
                top:10%;
            }
            .active{
                background-color: #007bff;
            }
        </style>
    </head>
    <body id="page-top">
        <%@include file="/pages/navbar.jsp" %>


        <section id="mySlide" class="my-2">
            <div class="container">
                <div class="slide">
                    <a href="#">
                        <div id="carouselBasicExample" class="carousel slide carousel-fade" data-mdb-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="img/banner/banner1.webp" class="d-block w-100"
                                         alt="Sunset Over the City" />
                                </div>
                                <div class="carousel-item">
                                    <img src="img/banner/banner2.webp" class="d-block w-100" alt="Canyon at Nigh" />
                                </div>
                                <div class="carousel-item">
                                    <img src="img/banner/banner3.webp" class="d-block w-100"
                                         alt="Cliff Above a Stormy Sea" />
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-mdb-target="#carouselBasicExample"
                                    data-mdb-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-mdb-target="#carouselBasicExample"
                                    data-mdb-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </a>
                </div>
            </div>
        </section>

        <div style="margin-top:3%" class="container">
            <h3 class="text-center mb-5">SÁCH MỚI</h3>
            <div class="row">
                <div class="col">
                    <div class="row">
                        <c:forEach items="${sessionScope.newbook}" var="book">
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


            <!--sách bán chạy-->
            <h3 class="text-center mb-5">SÁCH BÁN CHẠY</h3>
            <div class="row">
                <div class="col">
                    <div class="row">
                        <c:forEach items="${sessionScope.banchay}" var="book">
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
        <!-- Back to top button -->
        <button
            type="button"
            class="btn btn-danger btn-floating btn-lg"
            id="btn-back-to-top"
            >
            <i class="fas fa-arrow-up"></i>
        </button>

        <%@include file="/pages/footer.jsp" %>

        <script>
            let mybutton = document.getElementById("btn-back-to-top");

// When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (
                        document.body.scrollTop > 20 ||
                        document.documentElement.scrollTop > 20
                        ) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }
// When the user clicks on the button, scroll to the top of the document
            mybutton.addEventListener("click", backToTop);

            function backToTop() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    </body>
</html>
