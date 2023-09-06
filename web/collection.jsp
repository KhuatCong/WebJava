<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhà sách ĐB</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
              rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>-->
        <style>
            #btn-back-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                display: none;
            }
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
        </style>
    </head>

    <body>
        <%@include file="/pages/navbar.jsp" %>


        <!--        <header class="bg-dark py-5">
        <div id="carouselExampleIndicators" class="carousel slide" data-mdb-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="2"
                        aria-label="Slide 3"></button>
                <button type="button" data-mdb-target="#carouselExampleIndicators" data-mdb-slide-to="3"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/banner/ms_banner_img2.webp" class="d-block w-100"
                         alt="Hội chứng tuổi thanh xuân - tập 9" />
                </div>
                <div class="carousel-item">
                    <img src="img/banner/ms_banner_img3.webp" class="d-block w-100" alt="Camera" />
                </div>
                <div class="carousel-item">
                    <img src="img/banner/ms_banner_img4.webp" class="d-block w-100"
                         alt="Học viện siêu anh hùng - Tập 31" />
                </div>
                <div class="carousel-item">
                    <img src="img/banner/ms_banner_img5.webp" class="d-block w-100"
                         alt="Học viện siêu anh hùng - Tập 31" />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleIndicators"
                    data-mdb-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleIndicators"
                    data-mdb-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </header>-->

        <div style="margin-top:5%" class="container">
            <div class="row">
                <div class="col-12 col-sm-3">

                    <div class="card">
                        <form action="searchbookhome?type=all" method="post" class="d-flex input-group w-auto mb-3">
                            <input
                                oninput="searchByName(this)"
                                type="search"
                                class="form-control"
                                placeholder="Tìm kiếm"
                                aria-label="Search"
                                name="txtSearch"
                                />

                        </form>
                        <article class="card-group-item border border-secondary">
                            <header class="card-header bg-danger">
                                <h5 class="title text-light">Thể loại </h5>
                            </header>
                            <div class="filter-content">
                                <div class="card-body">
                                    <form action="category" method="post">
                                        <c:forEach items="${sessionScope.listCategory}" var="c">
                                            <label class="form-check mb-2">
                                                <a href="category?id=${c.id}" class="form-check-label text-black">
                                                    <i class="fa-solid fa-book me-2"></i>${c.tenloai}
                                                </a>
                                            </label>
                                        </c:forEach>

                                    </form>

                                </div> <!-- card-body.// -->
                            </div>
                        </article> <!-- card-group-item.// -->

                        <!--                        <article class="card-group-item border border-secondary">
                                                    <header class="card-header bg-danger">
                                                        <h5 class="title text-light">Chọn giá </h5>
                                                    </header>
                                                    <div class="filter-content">
                                                        <div class="card-body">
                                                            <label class="form-check">
                                                                <input class="form-check-input" type="radio" name="exampleRadio"
                                                                       value="">
                                                                <span class="form-check-label">
                                                                    Nhỏ hơn 10,000₫
                                                                </span>
                                                            </label>
                                                            <label class="form-check">
                                                                <input class="form-check-input" type="radio" name="exampleRadio"
                                                                       value="">
                                                                <span class="form-check-label">
                                                                    Từ 10,000₫ - 20,000₫
                                                                </span>
                                                            </label>
                                                            <label class="form-check">
                                                                <input class="form-check-input" type="radio" name="exampleRadio"
                                                                       value="">
                                                                <span class="form-check-label">
                                                                    Từ 20,000₫ - 30,000₫
                                                                </span>
                                                            </label>
                                                            <label class="form-check">
                                                                <input class="form-check-input" type="radio" name="exampleRadio"
                                                                       value="">
                                                                <span class="form-check-label">
                                                                    Từ 30,000₫ - 40,000₫
                                                                </span>
                                                            </label>
                                                            <label class="form-check">
                                                                <input class="form-check-input" type="radio" name="exampleRadio"
                                                                       value="">
                                                                <span class="form-check-label">
                                                                    Từ 40,000₫ - 50,000₫
                                                                </span>
                                                            </label>
                                                            <label class="form-check">
                                                                <input class="form-check-input" type="radio" name="exampleRadio"
                                                                       value="">
                                                                <span class="form-check-label">
                                                                    Lớn hơn 50,000₫
                                                                </span>
                                                            </label>
                                                        </div>  card-body.// 
                                                    </div>
                                                </article> -->
                        <!-- card-group-item.// -->
                    </div> <!-- card.// -->
                </div>

                <div class="col">
                    <div class="row">
                        <h3 class="ml-5 mb-3">
                            ${sessionScope.ct.tenloai}
                        </h3>
                        <label class="mb-2" for="cars">Sắp xếp theo:</label>
                        <!--                        <form class="mb-2" action="load?act" method="post">
                                                    <select id="sx" name="sapxep">
                                                        <option value="1" selected>Mới nhất</option>
                                                        <option value="2">Bán chạy nhất</option>
                                                        <option value="3">Giá giảm dần</option>
                                                        <option value="4">Giá tăng dần</option>
                                                    </select>
                                                </form>-->
                        <div class="mb-2">
                            <c:if test="${sessionScope.ct.id == 10}">
                                <a href="load?action=new&type=all"  class="btn btn-outline-secondary">Mới nhất</a>
                                <a href="load?action=most&type=all" class="btn btn-outline-secondary">Bán chạy nhất</a>
                                <a href="load?action=asc&type=all" class="btn btn-outline-secondary">Giá tăng dần</a>
                                <a href="load?action=desc&type=all" class="btn btn-outline-secondary">Giá giảm dần</a>
                            </c:if>
                            <c:if test="${sessionScope.ct.id != 10}">
                                <a href="load?id=${sessionScope.ct.id}&action=new&type=ctid"  class="btn btn-outline-secondary">Mới nhất</a>
                                <a href="load?id=${sessionScope.ct.id}&action=most&type=ctid" class="btn btn-outline-secondary">Bán chạy nhất</a>
                                <a href="load?id=${sessionScope.ct.id}&action=asc&type=ctid" class="btn btn-outline-secondary">Giá tăng dần</a>
                                <a href="load?id=${sessionScope.ct.id}&action=desc&type=ctid" class="btn btn-outline-secondary">Giá giảm dần</a>
                            </c:if>
                        </div>

                        <hr>
                    </div>

                    <div id="content" class="row">
                        <h3>Tìm thấy ${sessionScope.listBook.size()} sản phẩm</h3>
                        <c:forEach items="${sessionScope.listBook}" var="book">
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

                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${book.giaban}"/>₫</span>
                                                <fmt:formatNumber pattern="###,###" value="${book.giaban - book.giaban*book.giamgia/100}"/>₫

                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>

                        <!--                                    <div class="col-12">
                                                                <nav aria-label="...">
                                                                    <ul class="pagination">
                                                                        <li class="page-item disabled">
                                                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                                        </li>
                        <c:forEach begin="1" end="${sessionScope.endP}" var="o">
                            <li class="page-item ${tagIndex == o ? " active":""}"><a
                                    class="page-link" href="paging?index=${o}">${o}</a></li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>-->
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


            //Ajax sắp xếp
            $(document).ready(function () {
                $("#sx").change(function () {
                    var id = $("#sx").val();
                    alert(id);
                });
            });

            $.ajax({
                url: "",
                type: "get", //send it through get method
                data: {
                    ajaxid: 4,
                    UserID: UserID,
                    EmailAddress: EmailAddress
                },
                success: function (response) {
                    //Do Something
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });

        </script>
    </body>

</html>