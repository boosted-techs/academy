{extends file="index.tpl"}
{block name="meta"}
    {foreach $course item=program name=list}
    <title>{$program.program}</title>
    <meta name="author" content="Boosted Technologies">
    <meta name="keywords" content="{$program.program}, Boo Academy, Boosted Academy, Cheap information technology schools in Uganda, Short courses, Short courses in Uganda, Boo, Boo store, Boosted Store, Boosted Technologies, DevMate, Tumusiime, Rickie Ashan Tumusiime, boo.store, booo.store, Boosted Technologies Uganda, Ugandan online store, Online boo, Booo store, Betty Happy"/>
    <meta name="description" content="{$program.audience}">
    <meta name="contact" content="office[at]boostedtechs[dot]com" />
    <meta name="author" content="DevMate <https://devmate.boostedtechs.com>" />
    <meta name="copyright" content="Boosted Technologies" />
    <meta Name="rating" content="General"/>
    <meta property="og:site_name" content="Boosted Academy ">
    <meta property="og:description" content="Practical course outline, professional programs in computer science and information technology, employment for the best students!">
    <meta property="og:image" content="//{$smarty.server.SERVER_NAME}/assets/images/programs/{$program.photos}">
    <PageMap>
        <DataObject type="thumbnail">
            <Attribute name="src" value="//{$smarty.server.SERVER_NAME}/assets/images/programs/{$program.photos}"/>
            <Attribute name="width" value="100"/>
        </DataObject>
    </PageMap>
    {/foreach}
{/block}
{block name="body"}
    <!-- inner page banner -->
    {foreach $course item=program name=list}
        <div id="inner_banner" class="section inner_banner_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="full">
                            <div class="title-holder">
                                <div class="title-holder-cell text-left">
                                    <h1 class="page-title">Programs</h1>
                                    <ol class="breadcrumb">
                                        <li><a href="//{$smarty.server.SERVER_NAME}">Home</a></li>
                                        <li class="active">{$program.program}</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end inner page banner -->
        <!-- section -->
        <div class="section padding_layout_1 blog_list">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 mx-auto">
                        <h1 class="p-4">{$program.program}</h1>
                        <div class="full">
                                <div class="blog_section">
                                    <div class="blog_feature_img"> <img class="img-responsive" src="//{$smarty.server.SERVER_NAME}/assets/images/programs/{$program.photos}" alt="#"> </div>
                                    <div class="blog_feature_cantant">
                                        <p class="blog_head">{$program.program}</p>
                                        <p>
                                            <b>Audience:</b> {$program.audience}
                                        </p>
                                        <div>{$program.description}</div>
                                        <h5>Requirements</h5>
                                        <div>
                                            {$program.requirements}
                                        </div>
                                        <div class="col-md-12 p-2">
                                            <!-- AddToAny BEGIN -->
                                            <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                                                <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                                                <a class="a2a_button_facebook"></a>
                                                <a class="a2a_button_whatsapp"></a>
                                                <a class="a2a_button_twitter"></a>
                                                <a class="a2a_button_email"></a>
                                                <a class="a2a_button_telegram"></a>
                                                <a class="a2a_button_linkedin"></a>
                                            </div>
                                            <script>
                                                var a2a_config = a2a_config || {};
                                                a2a_config.onclick = 1;
                                                a2a_config.num_services = 4;
                                            </script>
                                            <script async src="https://static.addtoany.com/menu/page.js"></script>
                                            <!-- AddToAny END -->
                                        </div>
                                        <p>
                                            {if $user_info}<a class="btn main_bt" href="//{$smarty.server.SERVER_NAME}/dashboard">DASHBOARD</a>{else}<a class="btn main_bt" href="{$domain.auth}/app/{$key}?i=5&redirect={$domain.redirect}">APPLY NOW</a> {/if}
                                        </p>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/foreach}
    <!-- end section -->
{/block}