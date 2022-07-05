<?php
/**
 * Created by PhpStorm.
 * User: Rickie
 * Date: 2020-08-23
 * Time: 08:46
 */

class User_model extends Model
{

    function __construct()
    {
        parent::__construct();
    }

    function update_user_data($data, $token) {
        if (empty($data))
            return false;
        $this->db->where("user", $data->user);
        $value = $this->db->getValue("basic_info", "user");
        if (empty($value)) {
            $this->db->insert("basic_info",
                array("user" => $data->user,
                    "names" => $data->names,
                    "email" => $data->email,
                    "image" => $data->image,
                    "country" => $data->country,
                    "dob" => $data->dob,
                    "theme" => $data->theme,
                    "gender" => $data->gender,
                    "continent" => $data->continent,
                    "city" => $data->city));
        } else {
            $this->db->where("user", $data->user);
            $this->db->update("basic_info", array( "names" => $data->names,
                "email" => $data->email,
                "image" => $data->image,
                "country" => $data->country,
                "dob" => $data->dob,
                "theme" => $data->theme,
                "gender" => $data->gender,
                "continent" => $data->continent,
                "city" => $data->city));
        }
        $this->db->insert("access_keys", array("access_key" => $token, "user" => $data->user, "date_added" => date("Y-m-d")));

        $temporary_id = $this->cookie->read("temporary_id");
        if (! empty($temporary_id)) {
            $this->db->where("temporary_id", $temporary_id);
            $this->db->update("orders", array("user" => $data->user));

            $this->db->where("temporary_id", $temporary_id);
            $this->db->update("order_keys", array("user" => $data->user));

            $this->db->where("temporary_id", $temporary_id);
            $this->db->update("affiliate_transactions", array("user" => $data->user));
            /*
             * We got data from the user when not logged in. There is a possibility that the user has an account from another device. So we check. if so, we update the existing data or insert a fresh copy
             */
            $this->db->where("temporary_id", $temporary_id);
            $addresses = $this->db->getOne("addresses", "district, village, country, phone_no, box_no, company, email, street, temporary_id");
            if (! empty($addresses)) {
                $this->db->where("user", $data->user);
                $user_address = $this->db->getValue("addresses", "id");
                if ($user_address) {
                    $this->db->where("user", $data->user);
                    $this->db->update("addresses", $addresses);

                    $this->db->where("user", null);
                    $this->db->where("temporary_id", $temporary_id);
                    $this->db->delete("addresses");
                } else {
                    $this->db->where("temporary_id", $temporary_id);
                    $this->db->update("addresses", array("user" => $data->user));
                }

            }
            $this->cookie->destroy("temporary_id");
        }
        return true;
    }

    function create_username($user) {
        $this->db->where("user", $user);
        $username = $this->db->get("basic_info", null, "username, names");
        if (! empty($username[0]['username']))
            return true;
        //print_r($username);
        $username = $this->check_url_for_duplicates(
            strtolower(
                $this->remove_special_chars(
                    $this->remove_none_utf_char($username[0]['names'])
                )
            ), "basic_info", "username"
        );
        $this->db->where("user", $user);
        $this->db->update("basic_info", array("username" => $username));
        return true;
    }

    function is_logged_in() {
        /*
         * If the user has a temporary id set, lets not destroy cookies but preserve them till when the temporary id is destroyed on user login
         */
        if (isset($this->cookie->cookie->temporary_id))
            return false;

        /*
         * To manage affiliate data without having to change much on how the software works,
         * lets save the affiliate id in a session if at all no the user is not logged in.
         * Our primary target is not to use the session but the cookie. But since it is possible that an order
         * is made without having to log in, then the referer should get his/her commission.
         * We do this by temporary keeping the affiliate id in a session. When the user logs in, then a cookie is recreated
         */
        if (isset($this->cookie->cookie->affiliate) and ! isset($this->cookie->cookie->auth))
            $this->session->set_user_data("affiliate", $this->cookie->cookie->affiliate);

        if (! isset($this->cookie->cookie->auth)) {
            $this->cookie->destroy();
            return false;
        }
        else {
            $this->db->where("access_key", $this->cookie->cookie->auth);
            $data = $this->db->getValue("access_keys", "user");
            if (empty($data)) {
                $this->cookie->destroy();
                return false;
            }
            else {
                if (! empty($this->session->data("affiliate"))) {
                    $this->cookie->set("affiliate", $this->session->data("affiliate"));
                    $this->session->remove_data("affiliate");
                }
                return $data;
            }
        }
    }

    function get_user_profile($user) {
        if (! $user)
            return false;
        $this->create_username($user);
        $this->db->where("user", $user);
        return $this->db->get("basic_info", 1, "boo_cash, supplier, username, role, user as id, id as user_id, email, names, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age, image, country, dob, theme, gender, continent, city");
    }

    function active_domain() {
        $this->model("Api_model");
        return $this->model->Api_model->get_active_domain();
    }

    function get_users($user = false) {
        $limit = 100;
        $start = 0;
        //$this->db->where("user", $id, "!=");
        if ($user)
            $this->db->where("user", $user);
        $this->db->where("username is not null");
        $this->db->orderBy("id", "desc");
        return $this->db->get("basic_info", array($start, $limit), "username, role, user as id, id as user_id, email, names, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age, image, country, dob, theme, gender, continent, city");
    }

    function get_user_id_by_username($user) {
        if (! $user)
            return false;
        $this->db->where("username", $user);
        return $this->db->getValue("basic_info", "user");
    }

    function get_username_by_id($user) {
        if (! $user)
            return false;
        $this->db->where("user", $user);
        return $this->db->getValue("basic_info", "names");

    }

    function get_user_email_by_id($user) {
        if (! $user)
            return false;
        $this->db->where("user", $user);
        return $this->db->getValue("basic_info", "email");
    }

    function get_addresses($user) {
        $temporary_id = $this->cookie->read("temporary_id"); // for users who has not signed in but updated their shipping address to shop
//        echo $temporary_id; die();
        if (! $user and empty($temporary_id))
            return false;

        if (! empty($user)) {
            /*
             * This only works when there is user session created
             */
            $this->db->where("user", $user);
            $address = $this->db->getValue("addresses", "id");
            if (empty($address))
                $this->db->insert("addresses", array("user" => $user));
        }

        if ($temporary_id)
            $this->db->where("temporary_id", $temporary_id);
        else
            $this->db->where("user", $user);
        $data = $this->db->getOne("addresses", "(select delivery_amount from districts where id = addresses.district) as delivery, user, district, village, country, phone_no, box_no, email, street, company, mothers_name, fathers_name, mothers_contact, fathers_contact, highest_level, recent_school_attended");
        return $data;
    }

    function get_countries() {
        return $this->db->get("countries", null, "id, country, status");
    }

    function get_districts($country = false) {
        if ($country)
            $this->db->where("country", $country);
        $this->db->orderBy("district", "Asc");
        return $this->db->get("districts", null, "id, country, district, status, region");
    }

    function update_address($user) {
        if (! $user)
            if (empty ($this->session->data("final_cart")))
                return false;

        $company = $this->xss_clean($this->input->post("company"));
        $country = $this->xss_clean($this->input->post("country"));
        $street = $this->xss_clean($this->input->post("street"));
        $town = $this->xss_clean($this->input->post("town"));
        $district = $this->xss_clean($this->input->post("district"));
        $phone = $this->xss_clean($this->input->post("phone"));
        $box = $this->xss_clean($this->input->post("box"));
        $email = $this->xss_clean($this->input->post("email"));

        $mothers_name = $this->xss_clean($this->input->post("mothers_name"));
        $mothers_contact = $this->xss_clean($this->input->post("mothers_contact"));
        $fathers_name = $this->xss_clean($this->input->post("fathers_name"));
        $fathers_contact = $this->xss_clean($this->input->post("fathers_contact"));
        $highest_level = $this->xss_clean($this->input->post("highest_level"));
        $recent_school = $this->xss_clean($this->input->post("recent_school"));
        print_r($this->input->post());
        //die();
        if (empty($email))
            return false;

        if (! $user) {
            //$this->cookie->destroy("temporary_id");
            $temporary_id = $this->cookie->read("temporary_id");
            if (empty($temporary_id)) {
                $id = $this->db->insert("addresses", array("district" => $district,
                    "village" => $town,
                    "country" => $country,
                    "phone_no" => $phone,
                    "box_no" => $box,
                    "company" => $company,
                    "email" => $email,
                    "street" => $street,
                    "mothers_name" => $mothers_name,
                    "fathers_name" => $fathers_name,
                    "mothers_contact" => $mothers_contact,
                    "fathers_contact" => $fathers_contact,
                    "highest_level" => $highest_level,
                    "recent_school_attended" => $recent_school
                ));
                $this->cookie->set("temporary_id", $id);
                $this->db->where("id", $id);
                $this->db->update("addresses", array("temporary_id" => $id));

            } else {
                $this->db->where("temporary_id", $temporary_id);
                $this->db->update("addresses",
                    array("district" => $district,
                        "village" => $town,
                        "country" => $country,
                        "phone_no" => $phone,
                        "box_no" => $box,
                        "company" => $company,
                        "email" => $email,
                        "street" => $street,
                        "mothers_name" => $mothers_name,
                        "fathers_name" => $fathers_name,
                        "mothers_contact" => $mothers_contact,
                        "fathers_contact" => $fathers_contact,
                        "highest_level" => $highest_level,
                        "recent_school_attended" => $recent_school));
            }
        }
        else {

            $this->db->where("user", $user);
            $this->db->update("addresses",
                array("district" => $district,
                    "village" => $town,
                    "country" => $country,
                    "phone_no" => $phone,
                    "box_no" => $box,
                    "company" => $company,
                    "email" => $email,
                    "street" => $street,
                    "mothers_name" => $mothers_name,
                    "fathers_name" => $fathers_name,
                    "mothers_contact" => $mothers_contact,
                    "fathers_contact" => $fathers_contact,
                    "highest_level" => $highest_level,
                    "recent_school_attended" => $recent_school));
        }
        return true;
    }

    function subscribe($email) {
        $this->db->where("email", $email);
        $id = $this->db->getOne("mail_subscription", "id");
        if ($id)
            return "You are already in the subscription list";
        $this->db->insert("mail_subscription", array("email" => $email));

        $this->mail->mail->setFrom("no-reply@boostedtechs.com", "Boo Store");
        $this->mail->mail->addAddress($email);
        $this->mail->mail->isHTML(true);
        $this->mail->mail->Subject = "Mail Subscription";
        $message = "<h2>Hello,</h2><h3>You have been successfully added to our mailing list. Continue shopping with Boo store</h3>";
        $this->smarty->assign("message", $message);
        $message = $this->smarty->fetch("mail_templates/subscription.tpl");
        $this->mail->mail->Body = $message;
        $this->mail->mail->send();
        return "You have successfully joined BOO's mailing list";
    }

    function send_welcome_mail() {
        $this->db->where("mail", 0);
        return $this->db->get("basic_info", null, "names, email, id");
    }

    function update_users_welcome_mail($user) {
        $this->db->where("id", $user);
        $this->db->update("basic_info", array("mail" => 1));
    }

    function get_user_list($user, $user_id = false, $affiliate = false) {
        if (! $user)
            return false;
        if ($user_id)
            $this->db->where("user", $user_id);
        if ($affiliate)
            $this->db->where("boo_cash", 1);
        $page = $this->input->get("page") ? $this->input->get("page") : 1;
        $this->db->orderBy("id", "desc");
        $this->db->orderBy("role", "desc");
        $data = $this->db->paginate("basic_info", $page,
            array("user",
            "names",
            "image",
            "country",
            "TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age",
            "mail",
            "gender",
            "email",
            "role",
            "supplier",
            "boo_cash",
            "username",
            "continent",
            "(select id from supplier_requests where user = basic_info.user) as supplier_application",
            "(select count(id) from orders where orders.user = basic_info.user) as orders,
            (select count(id) from orders where orders.user = basic_info.user and payment_confirmation = 1) as placed_orders
            "));
        return $data;
    }
}