<%-- 
    Document   : footer
    Created on : Feb 22, 2023, 3:11:02 PM
    Author     : ThinkPad X1 G4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,500,300,700);

            * {
                font-family: Open Sans;
            }

            .footer-distributed{
                background: #54b4d3;
                box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
                box-sizing: border-box;
                width: 100%;
                text-align: left;
                font: bold 16px sans-serif;
                padding: 55px 50px;
            }

            .footer-distributed .footer-left,
            .footer-distributed .footer-center,
            .footer-distributed .footer-right{
                display: inline-block;
                vertical-align: top;
            }

            /* Footer left */

            .footer-distributed .footer-left{
                width: 40%;
            }

            /* The company logo */

            .footer-distributed h3{
                color:  #ffffff;
                font: normal 36px 'Open Sans', cursive;
                margin: 0;
            }

            .footer-distributed h3 span{
                color:  lightseagreen;
            }

            /* Footer links */

            .footer-distributed .footer-links{
                color:  #ffffff;
                margin: 20px 0 12px;
                padding: 0;
            }

            .footer-distributed .footer-links a{
                display:inline-block;
                line-height: 1.8;
                font-weight:400;
                text-decoration: none;
                color:  inherit;
            }

            .footer-distributed .footer-company-name{
                color:  #222;
                font-size: 14px;
                font-weight: normal;
                margin: 0;
            }

            /* Footer Center */

            .footer-distributed .footer-center{
                width: 35%;
            }

            .footer-distributed .footer-center i{
                background-color:  #33383b;
                color: #ffffff;
                font-size: 25px;
                width: 38px;
                height: 38px;
                border-radius: 50%;
                text-align: center;
                line-height: 42px;
                margin: 10px 15px;
                vertical-align: middle;
            }

            .footer-distributed .footer-center i.fa-envelope{
                font-size: 17px;
                line-height: 38px;
            }

            .footer-distributed .footer-center p{
                display: inline-block;
                color: #ffffff;
                font-weight:400;
                vertical-align: middle;
                margin:0;
            }

            .footer-distributed .footer-center p span{
                display:block;
                font-weight: normal;
                font-size:14px;
                line-height:2;
            }

            .footer-distributed .footer-center p a{
                color:  lightseagreen;
                text-decoration: none;
                ;
            }

            .footer-distributed .footer-links a:before {
                content: "|";
                font-weight:300;
                font-size: 20px;
                left: 0;
                color: #fff;
                display: inline-block;
                padding-right: 5px;
            }

            .footer-distributed .footer-links .link-1:before {
                content: none;
            }

            /* Footer Right */

            .footer-distributed .footer-right{
                width: 20%;
            }

            .footer-distributed .footer-company-about{
                line-height: 20px;
                color:  #92999f;
                font-size: 13px;
                font-weight: normal;
                margin: 0;
            }

            .footer-distributed .footer-company-about span{
                display: block;
                color:  #ffffff;
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .footer-distributed .footer-icons{
                margin-top: 25px;
            }

            .footer-distributed .footer-icons a{
                display: inline-block;
                width: 35px;
                height: 35px;
                cursor: pointer;
                background-color:  #33383b;
                border-radius: 2px;

                font-size: 20px;
                color: #ffffff;
                text-align: center;
                line-height: 35px;

                margin-right: 3px;
                margin-bottom: 5px;
            }

            /* If you don't want the footer to be responsive, remove these media queries */

            @media (max-width: 880px) {

                .footer-distributed{
                    font: bold 14px sans-serif;
                }

                .footer-distributed .footer-left,
                .footer-distributed .footer-center,
                .footer-distributed .footer-right{
                    display: block;
                    width: 100%;
                    margin-bottom: 40px;
                    text-align: center;
                }

                .footer-distributed .footer-center i{
                    margin-left: 0;
                }

            }

        </style>
    </head>
    <body>
        <footer class="footer-distributed">

            <div class="footer-left">

                <a class="fs-2 text-black" href="index"><b>Book<Span class="text-warning">Store</Span></b></a>

                <p class="footer-links">
                    <a href="#" class="link-1">Home</a>

                    <a href="#">Blog</a>

                    <a href="#">Pricing</a>

                    <a href="#">About</a>

                    <a href="#">Faq</a>

                    <a href="#">Contact</a>
                </p>

                <p class="footer-company-name">Company Name © 2015</p>
            </div>

            <div class="footer-center">

                <div>
                    <i class="fa fa-map-marker"></i>
                    <p><span>444 S. Cedros Ave</span> Solana Beach, California</p>
                </div>

                <div>
                    <i class="fa fa-phone"></i>
                    <p>+1.555.555.5555</p>
                </div>

                <div>
                    <i class="fa fa-envelope"></i>
                    <p><a href="mailto:support@company.com">support@company.com</a></p>
                </div>

            </div>

            <div class="footer-right">

                <p class="footer-company-about">
                    <span>About the company</span>
                    Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
                </p>

                <div class="footer-icons">

                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-youtube"></i></a>

                </div>

            </div>

        </footer>
    </body>
</html>