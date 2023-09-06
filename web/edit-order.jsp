

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Tables</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <style>

        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="pages-admin/navbar.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="pages-admin/topbar.jsp" %>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
<!--                    <div class="container-fluid">

                         Page Heading 
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Thông tin đơn hàng</h1>
                        </div>

                         DataTales Example 
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <h2>Đơn hàng: ${requestScope.order.ID}</h2>
                                    <small>Ngày: ${requestScope.order.thoigian}</small>
                                    <table style="margin-top: 1%;" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Đơn giá</th>
                                                <th>Số lượng</th>
                                                <th>Tổng</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th style="font-weight: bold" colspan="3">Tổng tiền</th>
                                                <th><fmt:formatNumber pattern="###,###" value="${requestScope.order.total}"/>đ</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach items="${requestScope.listdetail}" var="detail">
                                                <tr>
                                                    <td style="color: #d51c24">${detail.tensach}</td>
                                                    <td><fmt:formatNumber pattern="###,###" value="${detail.giaban}"/>đ</td>
                                                    <td>${detail.soluong}</td>
                                                    <td><fmt:formatNumber pattern="###,###" value="${detail.thanhtien}"/>đ</td>
                                                </tr>
                                            </c:forEach>

                                            <tr>
                                                <td colspan="3">Phí ship</td>
                                                <td><fmt:formatNumber pattern="###,###" value="${requestScope.order.phiship}"/>đ</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">Tạm tính</td>
                                                <td><fmt:formatNumber pattern="###,###" value="${requestScope.order.totalFirst}"/>đ</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">Giảm giá</td>
                                                <td>${requestScope.order.giamgia}%</td>
                                            </tr>
                                            <tr>
                                                <td >Trạng thái</td>
                                                <td colspan="3">${requestScope.order.status.mota}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>-->

                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Đơn hàng</h1>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <h2>Đơn hàng: ${requestScope.order.ID}</h2>
                                    <small>Ngày: ${requestScope.order.thoigian}</small>
                                    <table style="margin-top: 1%;" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Đơn giá</th>
                                                <th>Số lượng</th>
                                                <th>Tổng</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th style="font-weight: bold" colspan="3">Tổng tiền</th>
                                                <th><fmt:formatNumber pattern="###,###" value="${requestScope.order.total}"/>đ</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach items="${requestScope.listdetail}" var="detail">
                                                <tr>
                                                    <td style="color: #d51c24">${detail.tensach}</td>
                                                    <td><fmt:formatNumber pattern="###,###" value="${detail.giaban}"/>đ</td>
                                                    <td>${detail.soluong}</td>
                                                    <td><fmt:formatNumber pattern="###,###" value="${detail.thanhtien}"/>đ</td>
                                                </tr>
                                            </c:forEach>

                                            <tr>
                                                <td colspan="3">Phí ship</td>
                                                <td><fmt:formatNumber pattern="###,###" value="${requestScope.order.phiship}"/>đ</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">Tạm tính</td>
                                                <td><fmt:formatNumber pattern="###,###" value="${requestScope.order.totalFirst}"/>đ</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">Giảm giá</td>
                                                <td>${requestScope.order.giamgia}%</td>
                                            </tr>
                                            <tr>
                                                <td >Trạng thái</td>
                                                <td colspan="3">${requestScope.order.status.mota}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>

    </body>

</html>