<?php

//Less define our simple routes in this file to help us map to the exact methods in our project

$route['']                                                  =               "Home/index";

/*
 * Static url slags
 */
$route['about-us']                                          =               "Home/about_us";
$route['applications']                                      =               "Dashboard/applications";
//$route['apply']                                             =               "Dashboard/apply";
$route['apply']                                             =               "Home/apply";
$route['auth']                                              =               "Auth/index";
$route['bio']                                               =               "Dashboard/profile";
$route['contact-us']                                        =               "Home/contact_us";
$route['dashboard']                                         =               "Dashboard/index";
$route['enroll']                                            =               "Dashboard/enroll";
$route['payment_progress']                                  =               "Checkout/payment_progress";
$route['programs']                                          =               "Home/programs";
$route['profile/update']                                    =               "Dashboard/update_address";
$route['users']                                             =               "Dashboard/users_list";

$route['apply/app/(:any)']                                  =               "Home/apply/$1";

/*
 * Cron jobs
 */
$route['cron/successful_payments']                          =               "Checkout/send_payment_mails";
$route['cron/welcome_mail']                                 =               "Checkout/send_welcome_mail";

/*
 * Dynamic url slags
 */

$route['program/(:any)']                                    =               "Home/program/$1";

