

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

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Thống kê doanh thu cửa hàng</h1>
                        </div>

                        Từ
                        <input type="date" id="date-input1" required />
                        đến
                        <input type="date" id="date-input2" required />
                        <button id="submit">Submit</button>

                        <!--                        Từ
                                                <select name="year" id="year" size="1"></select>
                        
                                                <select name="month" id="month" size="1"></select>
                        
                                                <select name="day" id="day" size="1">
                                                    <option value=" " selected="selected">-- Day --</option>
                                                </select>
                                                Tới
                                                <select name="year2" id="year2" size="1"></select>
                        
                                                <select name="month2" id="month2" size="1"></select>
                        
                                                <select name="day2" id="day2" size="1">
                                                    <option value=" " selected="selected">-- Day --</option>
                                                </select>
                                                <a href=""  class="btn btn-outline-secondary">Tổng doanh thu</a>-->
                        <div class="mt-3">
                            Doanh thu của cửa hàng: <fmt:formatNumber pattern="###,###" value="${requestScope.doanhthu}"/>₫
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

        <script>


            $('#submit').on('click', function () {
                var date1 = $('#date-input1').val();
                var date2 = $('#date-input2').val();

                if (date1 > date2 || date1 == date2) {
                    alert("Ngày không hợp lệ");
                } else {
                    var date = date1 + "/" + date2;
                    window.location = "doanhthu?date=" + date;
                }
            });
        </script>

        <script>
            $(function () {
                //Năm tự động điền vào select
                var seYear = $('#year');
                var date = new Date();
                var cur = date.getFullYear();

                seYear.append('<option value="">-- Year --</option>');
                for (i = cur; i >= 1900; i--) {
                    seYear.append('<option value="' + i + '">' + i + '</option>');
                }
                ;

                //Tháng tự động điền vào select
                var seMonth = $('#month');
                var date = new Date();

                var month = new Array();
                month[1] = "January";
                month[2] = "February";
                month[3] = "March";
                month[4] = "April";
                month[5] = "May";
                month[6] = "June";
                month[7] = "July";
                month[8] = "August";
                month[9] = "September";
                month[10] = "October";
                month[11] = "November";
                month[12] = "December";

                seMonth.append('<option value="">-- Month --</option>');
                for (i = 12; i > 0; i--) {
                    seMonth.append('<option value="' + i + '">' + month[i] + '</option>');
                }
                ;

                //Ngày tự động điền vào select
                function dayList(month, year) {
                    var day = new Date(year, month, 0);
                    return day.getDate();
                }

                $('#year, #month').change(function () {
                    //Đoạn code lấy id không viết bằng jQuery để phù hợp với đoạn code bên dưới
                    var y = document.getElementById('year');
                    var m = document.getElementById('month');
                    var d = document.getElementById('day');

                    var year = y.options[y.selectedIndex].value;
                    var month = m.options[m.selectedIndex].value;
                    var day = d.options[d.selectedIndex].value;
                    if (day == ' ') {
                        var days = (year == ' ' || month == ' ') ? 31 : dayList(month, year);
                        d.options.length = 0;
                        d.options[d.options.length] = new Option('-- Day --', ' ');
                        for (var i = 1; i <= days; i++)
                            d.options[d.options.length] = new Option(i, i);
                    }
                });
            });


            $(function () {
                //Năm tự động điền vào select
                var seYear = $('#year2');
                var date = new Date();
                var cur = date.getFullYear();

                seYear.append('<option value="">-- Year --</option>');
                for (i = cur; i >= 1900; i--) {
                    seYear.append('<option value="' + i + '">' + i + '</option>');
                }
                ;

                //Tháng tự động điền vào select
                var seMonth = $('#month2');
                var date = new Date();

                var month = new Array();
                month[1] = "January";
                month[2] = "February";
                month[3] = "March";
                month[4] = "April";
                month[5] = "May";
                month[6] = "June";
                month[7] = "July";
                month[8] = "August";
                month[9] = "September";
                month[10] = "October";
                month[11] = "November";
                month[12] = "December";

                seMonth.append('<option value="">-- Month --</option>');
                for (i = 12; i > 0; i--) {
                    seMonth.append('<option value="' + i + '">' + month[i] + '</option>');
                }
                ;

                //Ngày tự động điền vào select
                function dayList(month, year) {
                    var day = new Date(year, month, 0);
                    return day.getDate();
                }

                $('#year2, #month2').change(function () {
                    //Đoạn code lấy id không viết bằng jQuery để phù hợp với đoạn code bên dưới
                    var y = document.getElementById('year2');
                    var m = document.getElementById('month2');
                    var d = document.getElementById('day2');

                    var year = y.options[y.selectedIndex].value;
                    var month = m.options[m.selectedIndex].value;
                    var day = d.options[d.selectedIndex].value;
                    if (day == ' ') {
                        var days = (year == ' ' || month == ' ') ? 31 : dayList(month, year);
                        d.options.length = 0;
                        d.options[d.options.length] = new Option('-- Day --', ' ');
                        for (var i = 1; i <= days; i++)
                            d.options[d.options.length] = new Option(i, i);
                    }
                });
            });
        </script>

    </body>

</html>