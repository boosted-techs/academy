<?php
class Test extends Controller {
    function __construct()
    {
        parent::__construct();
        $this->model("Test_model");
    }

    function index() {
        $this->smarty->assign("name", "Joel");
        $this->smarty->assign("users_data", $this->model->Test_model->get_users());
        $this->smarty->display("test.tpl");
    }

    function save() {
        $response = $this->model->Test_model->save_user();
        //print_r($response);
        $this->redirect('/?status=' . $response['status'] . '&message=' . str_replace(" ", "%20", $response['message']));
    }
}