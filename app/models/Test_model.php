<?php

class Test_model extends model
{
    function __construct()
    {
        parent::__construct();
    }

    function save_user() {
        //print_r($_POST);
        $names = $this->input->post("names");
        $email = $this->input->post("email");
        $password = $this->input->post("password");
        //echo $name;
        $password_hash = hash("sha256", $password);
        $this->db->where("email", $email);
        $id = $this->db->getValue("users", "id");
        if (! $id) {
            $data = [
                "names" => $names,
                "email" => $email,
                "password" => $password,
                "password_hash" => $password_hash
            ];
            $this->db->insert("users", $data);
            return array("status" => "2", "message" => 'Account creation successful');

        } else
            return array("status" => "1", "message" => 'User exists');

    }

    function get_users() {
        $this->db->orderBy("names", "asc");
        return $this->db->get("users", null,"id, names, email, password, password_hash, date_in");
    }

}