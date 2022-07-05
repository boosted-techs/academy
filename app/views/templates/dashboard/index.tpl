<!doctype html>
<html lang="en">
<head>
    <title>BA Dashboard {if $user_info} - {$user_info.0.names}{/if}</title>
    <link rel="icon" href="//{$smarty.server.SERVER_NAME}/assets/images/fevicon/favicon.ico" type="image/ico" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- Material Kit CSS -->
    <link href="//{$smarty.server.SERVER_NAME}/assets/dashboard/assets/css/material-dashboard.css" rel="stylesheet" />
    <style>
        .dashboard-overlay{
            display: none;
            position: fixed;
            width: 100%;
            height: 100vh;
            background: rgba(0, 0, 254, 0.6);
            z-index: 9999;
        }
        .over-lay-content {
            height: 70vh; overflow-y: auto;
        }

        .shadow {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .shadow-sm {
            box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.2), 0 4px 18px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
</head>
<body>
    <div class="wrapper ">
        <div class="dashboard-overlay">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div class="card-header">
                            <button class="btn btn-light rounded-0 float-right" onclick="$('.dashboard-overlay').fadeOut('slow')">X</button>
                            <div class="header">

                            </div>
                        </div>
                            <div class="card-body over-lay-content">
                            </div>
                        <div class="card-footer">
                            <button class="btn btn-light rounded-0 float-right" onclick="$('.dashboard-overlay').fadeOut('slow')">X</button>
                        </div>

                    </div>
                </div>

        </div>
        <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/dashboard/assets/img/sidebar-1.jpg">
            <!--
            Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

            Tip 2: you can also add an image using data-image tag
        -->
            <div class="logo">
                {if  $user_info}
                    <a href="//{$smarty.server.SERVER_NAME}/dashboard" class="simple-text logo-mini">
                        <img src="{$user_info.0.image}" alt="" class="w-25"/>
                    </a>

                {else}
                    <a href="//{$smarty.server.SERVER_NAME}" class="simple-text logo-mini">
                        <img src="//{$smarty.server.SERVER_NAME}/assets/images/logos/logo.png" alt="" class="w-100"/>
                    </a>
                {/if}
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    {if $user_info}
                        <li class="nav-item active  ">
                            <a class="nav-link" href="//{$smarty.server.SERVER_NAME}/dashboard">
                                <i class="material-icons">dashboard</i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="//{$smarty.server.SERVER_NAME}/applications">
                                <i class="material-icons">article</i>
                                <p>Applications</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="//{$smarty.server.SERVER_NAME}/bio">
                                <i class="material-icons">account_circle</i>
                                <p>Profile</p>
                            </a>
                        </li>
                        {if $user_info.0.role == 1}
                            <li class="nav-item">
                                <a class="nav-link" href="//{$smarty.server.SERVER_NAME}/users">
                                    <i class="material-icons">family_restroom</i>
                                    <p>Users</p>
                                </a>
                            </li>
                        {/if}
                        <li class="nav-item">
                            <a class="nav-link" href="//{$smarty.server.SERVER_NAME}/programs">
                                <i class="material-icons">apps</i>
                                <p>Programs</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="//{$smarty.server.SERVER_NAME}">
                                <i class="material-icons">home</i>
                                <p>Website</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="//{$smarty.server.SERVER_NAME}?out=true">
                                <i class="material-icons">login</i>
                                <p>LOGOUT</p>
                            </a>
                        </li>
                    {else}
                        <li class="nav-item">
                            <a class="nav-link" href="//{$smarty.server.SERVER_NAME}?out=true">
                                <i class="material-icons">login</i>
                                <p>Login</p>
                            </a>
                        </li>
                    {/if}
                    <!-- your sidebar here -->
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-absolute fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href="javascript:;"><span class="text-truncate">Dashboard {if $user_info} - {$user_info.0.names}{/if}</span></a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                    </button>
                    {*<div class="collapse navbar-collapse justify-content-end">*}
                        {*<ul class="navbar-nav">*}
                            {*<li class="nav-item">*}
                                {*<a class="nav-link" href="javascript:;">*}
                                    {*<i class="material-icons">notifications</i> Notifications*}
                                    {**}
                                {*</a>*}
                            {*</li>*}
                            {*<!-- your navbar here -->*}
                        {*</ul>*}
                    {*</div>*}
                </div>
            </nav>
            <!-- End Navbar -->

            <div class="content">
                <div class="container-fluid">
                    <!-- your content here -->
                    <div class="col-md-10 bg-white p-4 mx-auto">
                        {if $user_info}
                            <div class="col-md-4 mx-auto text-center">
                                <img src="//{$smarty.server.SERVER_NAME}/assets/images/logos/logo.png" alt="" style="width:150px"/>
                            </div>
                            {block name="body"}{/block}
                        {else}
                            <div class="text-center">
                                <img src="//{$smarty.server.SERVER_NAME}/assets/images/logos/logo.png" alt="" style="width:50%"/>
                            </div>
                            <div class="alert alert-danger text-center">
                                <h5>You are not logged in</h5>
                                <a href="{$domain.auth}/app/{$key}?i=5&redirect={$domain.redirect}"><button class="btn btn-white">LOGIN</button></a>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="float-left">
                        <ul>
                            <li>
                                <a href="">

                                </a>
                            </li>
                        </ul>
                    </nav>
                    <div class="copyright float-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>, made with <i class="material-icons">favorite</i> by
                        <a href="https://www.boostedtechs.com" target="_blank">Boosted Technologies</a>.
                    </div>
                    <!-- your footer here -->
                </div>
            </footer>
        </div>
    </div>
    <div class="fixed-plugin">
        <div class="dropdown show-dropdown">
            <a href="#" data-toggle="dropdown">
                <i class="fa fa-cog fa-2x"> </i>
            </a>
            <ul class="dropdown-menu">
                <li class="header-title"> Sidebar Filters</li>
                <li class="adjustments-line">
                    <a href="javascript:void(0)" class="switch-trigger active-color">
                        <div class="badge-colors ml-auto mr-auto">
                            <span class="badge filter badge-purple" data-color="purple"></span>
                            <span class="badge filter badge-azure" data-color="azure"></span>
                            <span class="badge filter badge-green" data-color="green"></span>
                            <span class="badge filter badge-warning" data-color="orange"></span>
                            <span class="badge filter badge-danger" data-color="danger"></span>
                            <span class="badge filter badge-rose active" data-color="rose"></span>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </li>
                <!--            <li class="header-title">Images</li>-->
                <!--            <li class="active">-->
                <!--                <a class="img-holder switch-trigger" href="javascript:void(0)">-->
                <!--                    <img src="assets/img/sidebar-1.jpg" alt="">-->
                <!--                </a>-->
                <!--            </li>-->
                <!--            <li class="button-container">-->
                <!--                <a href="" target="_blank" class="btn btn-primary btn-block">Free Download</a>-->
                <!--            </li>-->
                <!---->
                <!--            <li class="button-container">-->
                <!--                <a href="" target="_blank" class="btn btn-default btn-block">-->
                <!--                   -->
                <!--                </a>-->
                {*<!--            </li>-->*}
                {*<li class="header-title">INVITE PEOPLE</li>*}
                {*<li class="button-container text-center">*}
                    {*<button id="twitter" class="btn btn-round btn-twitter"><i class="fa fa-twitter"></i> &middot; 45</button>*}
                    {*<button id="facebook" class="btn btn-round btn-facebook"><i class="fa fa-facebook-f"></i> &middot; 50</button>*}
                    {*<br>*}
                    {*<br>*}
                {*</li>*}
            </ul>
        </div>
    </div>
    <script src="assets/dashboard/assets/js/core/jquery.min.js"></script>
    <script src="assets/dashboard/assets/js/core/popper.min.js"></script>
    <script src="assets/dashboard/assets/js/core/bootstrap-material-design.min.js"></script>
    <script src="assets/dashboard/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!-- Plugin for the momentJs  -->
    <script src="assets/dashboard/assets/js/plugins/moment.min.js"></script>
    <!--  Plugin for Sweet Alert -->
    <script src="assets/dashboard/assets/js/plugins/sweetalert2.js"></script>
    <!-- Forms Validations Plugin -->
    <script src="assets/dashboard/assets/js/plugins/jquery.validate.min.js"></script>
    <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
    <script src="assets/dashboard/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
    <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
    <script src="assets/dashboard/assets/js/plugins/bootstrap-selectpicker.js"></script>
    <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
    <script src="assets/dashboard/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
    <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
    <script src="assets/dashboard/assets/js/plugins/jquery.dataTables.min.js"></script>
    <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
    <script src="assets/dashboard/assets/js/plugins/bootstrap-tagsinput.js"></script>
    <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
    <script src="assets/dashboard/assets/js/plugins/jasny-bootstrap.min.js"></script>
    <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
    <script src="assets/dashboard/assets/js/plugins/fullcalendar.min.js"></script>
    <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
    <script src="assets/dashboard/assets/js/plugins/jquery-jvectormap.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="assets/dashboard/assets/js/plugins/nouislider.min.js"></script>
    <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
    <!-- Library for adding dinamically elements -->
    <script src="assets/dashboard/assets/js/plugins/arrive.min.js"></script>
    <!--  Google Maps Plugin    -->
    <!--<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>-->
    <!-- Chartist JS -->
    <script src="assets/dashboard/assets/js/plugins/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="assets/dashboard/assets/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="assets/dashboard/assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
    <!-- Material Dashboard DEMO methods, don't include it in your project! -->
    <script src="assets/dashboard/assets/demo/demo.js"></script>
    <script>
        {literal}
            var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
            (function(){
                var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
                s1.async=true;
                s1.src='https://embed.tawk.to/5fc4ece0a1d54c18d8eed211/default';
                s1.charset='UTF-8';
                s1.setAttribute('crossorigin','*');
                s0.parentNode.insertBefore(s1,s0);
            })();
        {/literal}
        $(document).ready(function() {
            $().ready(function() {
                $sidebar = $('.sidebar');

                $sidebar_img_container = $sidebar.find('.sidebar-background');

                $full_page = $('.full-page');

                $sidebar_responsive = $('body > .navbar-collapse');

                window_width = $(window).width();

                fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

                if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                    if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                        $('.fixed-plugin .dropdown').addClass('open');
                    }

                }

                $('.fixed-plugin a').click(function(event) {
                    // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                    if ($(this).hasClass('switch-trigger')) {
                        if (event.stopPropagation) {
                            event.stopPropagation();
                        } else if (window.event) {
                            window.event.cancelBubble = true;
                        }
                    }
                });

                $('.fixed-plugin .active-color span').click(function() {
                    $full_page_background = $('.full-page-background');

                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');

                    var new_color = $(this).data('color');

                    if ($sidebar.length != 0) {
                        $sidebar.attr('data-color', new_color);
                    }

                    if ($full_page.length != 0) {
                        $full_page.attr('filter-color', new_color);
                    }

                    if ($sidebar_responsive.length != 0) {
                        $sidebar_responsive.attr('data-color', new_color);
                    }
                });

                $('.fixed-plugin .background-color .badge').click(function() {
                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');

                    var new_color = $(this).data('background-color');

                    if ($sidebar.length != 0) {
                        $sidebar.attr('data-background-color', new_color);
                    }
                });

                $('.fixed-plugin .img-holder').click(function() {
                    $full_page_background = $('.full-page-background');

                    $(this).parent('li').siblings().removeClass('active');
                    $(this).parent('li').addClass('active');


                    var new_image = $(this).find("img").attr('src');

                    if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                        $sidebar_img_container.fadeOut('fast', function() {
                            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                            $sidebar_img_container.fadeIn('fast');
                        });
                    }

                    if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                        $full_page_background.fadeOut('fast', function() {
                            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                            $full_page_background.fadeIn('fast');
                        });
                    }

                    if ($('.switch-sidebar-image input:checked').length == 0) {
                        var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                    }

                    if ($sidebar_responsive.length != 0) {
                        $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                    }
                });

                $('.switch-sidebar-image input').change(function() {
                    $full_page_background = $('.full-page-background');

                    $input = $(this);

                    if ($input.is(':checked')) {
                        if ($sidebar_img_container.length != 0) {
                            $sidebar_img_container.fadeIn('fast');
                            $sidebar.attr('data-image', '#');
                        }

                        if ($full_page_background.length != 0) {
                            $full_page_background.fadeIn('fast');
                            $full_page.attr('data-image', '#');
                        }

                        background_image = true;
                    } else {
                        if ($sidebar_img_container.length != 0) {
                            $sidebar.removeAttr('data-image');
                            $sidebar_img_container.fadeOut('fast');
                        }

                        if ($full_page_background.length != 0) {
                            $full_page.removeAttr('data-image', '#');
                            $full_page_background.fadeOut('fast');
                        }

                        background_image = false;
                    }
                });

                $('.switch-sidebar-mini input').change(function() {
                    $body = $('body');

                    $input = $(this);

                    if (md.misc.sidebar_mini_active == true) {
                        $('body').removeClass('sidebar-mini');
                        md.misc.sidebar_mini_active = false;

                        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                    } else {

                        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                        setTimeout(function() {
                            $('body').addClass('sidebar-mini');

                            md.misc.sidebar_mini_active = true;
                        }, 300);
                    }

                    // we simulate the window Resize so the charts will get updated in realtime.
                    var simulateWindowResize = setInterval(function() {
                        window.dispatchEvent(new Event('resize'));
                    }, 180);

                    // we stop the simulation of Window Resize after the animations are completed
                    setTimeout(function() {
                        clearInterval(simulateWindowResize);
                    }, 1000);

                });
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            // Javascript method's body can be found in assets/js/demos.js
            md.initDashboardPageCharts();
        });
    </script>
    {block name="scripts"}{/block}
</body>

