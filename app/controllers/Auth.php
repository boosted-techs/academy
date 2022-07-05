<?php
/**
 * Created by PhpStorm.
 * User: Rickie
 * Date: 2020-10-04
 * Time: 17:02
 */

class Auth extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Api_keys");
        $this->model("Api_model");
        $this->model("User_model");
    }

    function index() {
        $auth = $this->input->get("auth");
        $key = $this->input->get("key");
        $local_key = $this->session->data("local_key");
        if (strcmp($key, $local_key) == 0) {
            $data = $this->model->Api_model->validate_session($auth, $this->model->User_model->active_domain());
            $data = json_decode($data);
            if(! empty($data)) {
                if ($data->status == true) {
                    if ($this->model->User_model->update_user_data($data->data, $auth)) {
                        $this->cookie->set("auth", $auth);
                        $this->redirect("//" . $this->server->server_name . "/dashboard?account_creation=success");
                    }
                }}
        }
        else
            $this->redirect("//" . $this->server->server_name);
    }
}