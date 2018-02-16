<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/02/2018
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>LifeStyle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS
    ================================================== -->
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://image-lifestyle.000webhostapp.com/css/bootstrap.css">
    <link rel="stylesheet" href="https://image-lifestyle.000webhostapp.com/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="https://image-lifestyle.000webhostapp.com/css/prettyPhoto.css" />
    <link rel="stylesheet" href="https://image-lifestyle.000webhostapp.com/css/flexslider.css" />
    <link rel="stylesheet" href="https://image-lifestyle.000webhostapp.com/css/custom-styles.css">

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="https://image-lifestyle.000webhostapp.com/css/style-ie.css"/>
    <![endif]-->

    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="https://image-lifestyle.000webhostapp.com/images/favicon.ico">
    <link rel="apple-touch-icon" href="https://image-lifestyle.000webhostapp.com/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="https://image-lifestyle.000webhostapp.com/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="https://image-lifestyle.000webhostapp.com/images/apple-touch-icon-114x114.png">

    <!-- JS
    ================================================== -->
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
    <script src="https://image-lifestyle.000webhostapp.com/js/bootstrap.js"></script>
    <script src="https://image-lifestyle.000webhostapp.com/js/jquery.prettyPhoto.js"></script>
    <script src="https://image-lifestyle.000webhostapp.com/js/jquery.flexslider.js"></script>
    <script src="https://image-lifestyle.000webhostapp.com/js/jquery.custom.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#btn-blog-next").click(function () {
                $('#blogCarousel').carousel('next')
            });
            $("#btn-blog-prev").click(function () {
                $('#blogCarousel').carousel('prev')
            });

            $("#btn-client-next").click(function () {
                $('#clientCarousel').carousel('next')
            });
            $("#btn-client-prev").click(function () {
                $('#clientCarousel').carousel('prev')
            });

        });

        $(window).load(function(){

            $('.flexslider').flexslider({
                animation: "slide",
                slideshow: true,
                start: function(slider){
                    $('body').removeClass('loading');
                }
            });
        });

    </script>

</head>
