

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <style>

            body{
                margin-top:20px;
                background:#f5f5f5;
            }
            /**
             * Panels
             */
            /*** General styles ***/
            .panel {
                box-shadow: none;
            }
            .panel-heading {
                border-bottom: 0;
            }
            .panel-title {
                font-size: 17px;
            }
            .panel-title > small {
                font-size: .75em;
                color: #999999;
            }
            .panel-body *:first-child {
                margin-top: 0;
            }
            .panel-footer {
                border-top: 0;
            }

            .panel-default > .panel-heading {
                color: #333333;
                background-color: transparent;
                border-color: rgba(0, 0, 0, 0.07);
            }

            form label {
                color: #999999;
                font-weight: 400;
            }

            .form-horizontal .form-group {
                margin-left: -15px;
                margin-right: -15px;
            }
            @media (min-width: 768px) {
                .form-horizontal .control-label {
                    text-align: right;
                    margin-bottom: 0;
                    padding-top: 7px;
                }
            }

            .profile__contact-info-icon {
                float: left;
                font-size: 18px;
                color: #999999;
            }
            .profile__contact-info-body {
                overflow: hidden;
                padding-left: 20px;
                color: #999999;
            }
            .profile-avatar {
                width: 200px;
                position: relative;
                margin: 0px auto;
                margin-top: 196px;
                border: 4px solid #f3f3f3;
            }
        </style>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <div class="container bootstrap snippets bootdeys">
            <div style="display: flex;
                 justify-content: center;" class="row">
                <div class="col-xs-8 col-sm-6">
                    <form class="form-horizontal" action="edit-danhmuc" method="post">
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                <a class="navbar-brand" href="index"><b>Book<Span class="text-warning">Store</Span></b></a>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">Thông tin danh mục</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">ID danh mục</label>
                                    <div class="col-sm-10">
                                        <input name="idcheck" value="${requestScope.idcheck}" readonly="" type="hidden" class="form-control">
                                        <input name="id" value="${requestScope.ct.id}" readonly="" type="text" class="form-control">
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Tên danh mục</label>
                                    <div class="col-sm-10">
                                        <input name="tenloai" required="" value="${requestScope.ct.tenloai}" type="text" class="form-control">
                                    </div>
                                </div>

                                <c:if test="${sessionScope.notifi != ''}">
                                    <div class="form-group">
                                        <center><h4 style="color: red">${sessionScope.notifi}</h4></center>
                                    </div>
                                </c:if>
                                <% session.removeAttribute("notifi");%>
                                <div class="form-group">
                                    <div class="col-sm-10 col-sm-offset-2">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        
                                        <c:if test="${requestScope.idcheck != 'add'}">
                                            <button type="button" onclick="dodelete('${requestScope.acc.id}')" class="btn btn-danger">Delete</button>
                                        </c:if>

                                        <button type="reset" class="btn btn-default"><a href="tbl-danhmuc">Cancel</a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        function dodelete(id) {
            let text = "Chắc chắn xóa người dùng này?";
            if (confirm(text) == true) {
                window.location = ("delete?action=user&id=" + id);
            }
        }
    </script>
</html>
