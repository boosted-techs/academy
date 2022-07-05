<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2021-01-26
 * Time: 12:50
 */

class Dashboard extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Courses_model");
        $this->model("Payments_model");
    }

    function index() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $address = $this->model->User_model->get_addresses($id);
        if (empty($address['country'])) {
            $this->smarty->assign("country_list", $this->model->User_model->get_countries());
            $this->smarty->assign("district_list", $this->model->User_model->get_districts());
        }
        $this->smarty->assign("addresses", $address);
        $this->smarty->display("dashboard/home.tpl");
    }

    function profile() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("country_list", $this->model->User_model->get_countries());
        $this->smarty->assign("district_list", $this->model->User_model->get_districts());
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
        $this->smarty->display("dashboard/address.tpl");
    }

    function update_address() {
        $id = $this->model->User_model->is_logged_in();
        $this->model->User_model->update_address($id);
        $this->redirect($this->server->http_refer);
    }

    function applications() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $profile =  $this->model->User_model->get_user_profile($id);
        $admin = $profile[0]['role'] == 1 ? true : false;
        $this->smarty->assign("user_info", $profile);
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
        $this->smarty->assign("fees", $this->model->Payments_model->get_application_fees());
        $this->smarty->assign("public_key", $this->model->Payments_model->get_payment_keys()['test_public_key']);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("applications", $this->model->Courses_model->get_user_applications($id, $admin));
        $this->smarty->display("dashboard/applications.tpl");
    }

    function apply() {
        $id = $this->model->User_model->is_logged_in();
        if (! $id)
            exit;
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->assign("courses", $this->model->Courses_model->get_course_outlines(true));
        $this->smarty->assign("dates", array("date" => (int)date("d"), "month" => (int)date("m"), "minutes" => (int)date('i'), "hours" => (int)date('h'), "year" => (int)date("Y")));
        $this->smarty->assign("country_list", $this->model->User_model->get_countries());
        $this->smarty->assign("district_list", $this->model->User_model->get_districts());
        $this->smarty->assign("fees", $this->model->Payments_model->get_application_fees());
        $this->smarty->assign("addresses", $this->model->User_model->get_addresses($id));
        echo $this->smarty->fetch("dashboard/apply.tpl");
    }

    function enroll() {
        $id = $this->model->User_model->is_logged_in();
        if (! $id)
            exit;
        //print_r($this->input->post());
        echo  json_encode($this->model->Payments_model->create_invoice($id));
    }

    function users_list() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $profile = $this->model->User_model->get_user_profile($id);
        if ($profile[0]['role'] != 1)
            exit;
        $this->smarty->assign("user_info", $profile);
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("users", $this->model->User_model->get_users());
        $this->smarty->display("dashboard/users.tpl");
    }

}