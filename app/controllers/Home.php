<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-09-22
 * Time: 12:39
 */

class Home extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
        $this->model("Courses_model");
    }

    function index() {
        if (! empty($this->input->get("out"))) {
            $this->cookie->destroy();
            $this->redirect("//" . $this->server->server_name);
        }

        $key = $this->model->Api_keys->generate_keys();
        $this->smarty->assign("courses", $this->model->Courses_model->get_course_outlines(true));
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->display("website/home.tpl");
    }

    function programs() {
        $key = $this->model->Api_keys->generate_keys();
        $this->smarty->assign("courses", $this->model->Courses_model->get_course_outlines(true));
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", true);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->display("website/programs.tpl");
    }

    function program($program) {
        $key = $this->model->Api_keys->generate_keys();
        $this->smarty->assign("courses", $this->model->Courses_model->get_course_outlines(true));
        $this->smarty->assign("course", $this->model->Courses_model->get_course_outlines(true, $program));
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", true);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->display("website/program.tpl");
    }

    function about_us() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("courses", $this->model->Courses_model->get_course_outlines(true));
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", true);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->display("website/about.tpl");
    }

    function contact_us() {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->smarty->assign("courses", $this->model->Courses_model->get_course_outlines(true));
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", true);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->display("website/contact.tpl");
    }

    function apply($apply =  false) {
        $key = $this->model->Api_keys->generate_keys();
        $id = $this->model->User_model->is_logged_in();
        $this->session->set_user_data("key", $key);
        $this->smarty->assign("key", $key);
        $this->smarty->assign("page", true);
        $this->smarty->assign("domain", $this->model->User_model->active_domain());
        $this->smarty->assign("courses", $this->model->Courses_model->get_course_outlines(true));
        $this->smarty->assign("user_info", $this->model->User_model->get_user_profile($id));
        $this->smarty->display("website/apply.tpl");
    }

}