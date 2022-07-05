<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2020-11-28
 * Time: 20:53
 */

class Payments_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function create_invoice($user) {
        $temporary_id = $this->cookie->read("temporary_id");

        $program = $this->input->post("program");
        $intake = $this->input->post("intake") . "-" . date("Y");
        $description = $this->xss_clean($this->input->post("description"));

        $this->db->where("user", $user);
        $this->db->where("program", $program);
        $this->db->where("intake", $intake);
        $this->db->where("status", 3, "<");
        if ($this->db->getValue("applications", "id"))
            return false;

        $application = $this->db->insert("applications", array("user" => $user, "program" => $program, "intake" => $intake, "date_applied" => date("Y-m-d")));

        if (! empty($this->input->post("program"))) {
            $invoice_amount = $this->get_application_fees();

            if ($invoice_amount < 1000)
                return false;

            $order = $this->db->insert("orders",
                array("user" => $user,
                    "amount" => $invoice_amount,
                    "description" => $description,
                    "temporary_id" => $temporary_id,
                    "application" => $application,
                    "date_created" => date("Y-m-d H:i:s"))
            );

            $hash = hash("md5", time()) . "_ref_" . $order . "_" . $user ."_". $temporary_id;

            $this->db->insert("order_keys", array("order" => $order,
                "order_ref" => $hash,
                "user" => $user,
                "temporary_id" => $temporary_id,
                "date_created" => date("Y-m-d h:i:s")));
            return $hash;
        }
        return false;
    }

    function confirm_payment($response_json, $response_ref, $response_status, $response_amount, $response_currency) {
        $response_ref = str_replace("\"", "", $response_ref);

        $this->db->where("order_ref", $response_ref);
        $data = $this->db->getOne("order_keys", null, "id, order, order_ref, user, temporary_id");
        if (empty($data))
            return false;

        /*
         * Lets validate the sent data with the database data
         */
        $payment_status = 0;
        if (strcmp($response_ref, $data['order_ref']) == 0
            and
            strcmp($response_status, "success") == 0
            and
            strcmp($response_currency, "UGX") == 0)
            /*
             * If our validation is right, then lets update the order and the user has successfully completed the payment prococess
             */
            $payment_status = 1;

        /*
         * Lets update the key table
         */
        $this->db->where("order_ref", $response_ref);
        $this->db->update("order_keys", array("response_data" => $response_json));

        /*
         * Lets update the orders table
         */
        $this->db->where("id", $data['order']);
        $this->db->update("orders", array("payment_confirmation" => $payment_status, "order_state" => 1));
    }

    function get_payment_keys() {
        $data = $this->db->getOne("payment_keys", "production, testing, secret_key, testing_key, encryption");
        return array("production_public_key" => $data['production'],
            "test_public_key" => $data['testing'],
            "production_secret_key" => $data['secret_key'],
            "test_secret_key" => $data['testing_key'],
            "encryption" => $data['encryption']);
    }

    function get_application_fees() {
        $this->db->orderBy("id", "desc");
        return $this->db->getValue("application_fees", "fees");
    }

    function Get_pending_confirmation_orders() {
        $this->db->where("payment_confirmation", 1);
        $this->db->where("orders.mail", 0);
        $this->db->join("basic_info", "basic_info.user = orders.user");
        return $this->db->get("orders", null, array("orders.id, application, amount, orders.date_created, names, email, (select email from addresses where user = orders.user) as alt_email"));
    }

    function payment_confirmation_mail_sent($order, $program) {
        $this->db->where("id", $order);
        $this->db->update("orders", array("mail" => 1));
        $this->db->where("id", $program);
        $this->db->update("applications", array("admission_fee" => 1, "status" => 1));
    }
}