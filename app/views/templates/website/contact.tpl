{extends file="index.tpl"}
{block name="meta"}
    <title>Contact us: Boosted Academy</title>
    <meta name="author" content="Boosted Technologies">
    <meta name="keywords" content="Boo Academy, Boosted Academy, Cheap information technology schools in Uganda, Short courses, Short courses in Uganda, Boo, Boo store, Boosted Store, Boosted Technologies, DevMate, Tumusiime, Rickie Ashan Tumusiime, boo.store, booo.store, Boosted Technologies Uganda, Ugandan online store, Online boo, Booo store, Betty Happy"/>
    <meta name="description" content="Practical course outline, professional programs in computer science and information technology, employment for the best students!">
    <meta name="contact" content="office[at]boostedtechs[dot]com" />
    <meta name="author" content="DevMate <https://devmate.boostedtechs.com>" />
    <meta name="copyright" content="Boosted Technologies" />
    <meta Name="rating" content="General"/>
    <meta property="og:site_name" content="Boosted Academy ">
    <meta property="og:description" content="Practical course outline, professional programs in computer science and information technology, employment for the best students!">
    <meta property="og:image" content="//{$smarty.server.SERVER_NAME}/assets/images/thumb.png">
    <PageMap>
        <DataObject type="thumbnail">
            <Attribute name="src" value="//{$smarty.server.SERVER_NAME}/assets/images/thumb.png"/>
            <Attribute name="width" value="100"/>
        </DataObject>
    </PageMap>
{/block}
{block name="body"}
    <div id="inner_banner" class="section inner_banner_section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <div class="title-holder">
                            <div class="title-holder-cell text-left">
                                <h1 class="page-title">Contact</h1>
                                <ol class="breadcrumb">
                                    <li><a href="//{$smarty.server.SERVER_NAME}">Home</a></li>
                                    <li class="active">Contact</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end inner page banner -->
    <div class="section padding_layout_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-xs-12"></div>
                <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="full">
                            <div class="contact_information">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 adress_cont">
                                    <div class="information_bottom text_align_center">
                                        <div class="icon_bottom"> <i class="fa fa-road" aria-hidden="true"></i> </div>
                                        <div class="info_cont">
                                            <h4>Offices</h4>
                                            <p>Buziga - Makindye Division</p>
                                            <p>Kampala Uganda</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 adress_cont">
                                    <div class="information_bottom text_align_center">
                                        <div class="icon_bottom"> <i class="fa fa-user" aria-hidden="true"></i> </div>
                                        <div class="info_cont">
                                            <h4>+256 759800742, +256 703 903990</h4>
                                            <p>Mon-Fri 8:30am-5:30pm</p>
                                            <p>Sat 10:30am-3:30pm</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 adress_cont">
                                    <div class="information_bottom text_align_center">
                                        <div class="icon_bottom"> <i class="fa fa-envelope" aria-hidden="true"></i> </div>
                                        <div class="info_cont">
                                            <h4>office@boostedtecs.com</h4>
                                            <p>24/7 online support</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 contant_form">
                                <h4>GET IN TOUCH</h4>
                                <p>Our goal is to provide the best service and to answer all of your questions in a timely manner.</p>
                                <div class="form_section">
                                    <form class="form_contant" action="//{$smarty.server.SERVER_NAME}send/contact">
                                        <fieldset>
                                            <div class="row">
                                                <div class="field col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <input class="field_custom" placeholder="Websire URL" type="text" required />
                                                </div>
                                                <div class="field col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <input class="field_custom" placeholder="Your name" type="text" required />
                                                </div>
                                                <div class="field col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <input class="field_custom" placeholder="Email adress" type="email" required />
                                                </div>
                                                <div class="field col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <input class="field_custom" placeholder="Phone number" type="text" required />
                                                </div>
                                                <div class="field col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <textarea class="field_custom" placeholder="Messager" required ></textarea>
                                                </div>
                                                <div class="center"><a class="btn main_bt" href="#">SUBMIT NOW</a></div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}