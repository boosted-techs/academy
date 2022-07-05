<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2021-01-28
 * Time: 12:40
 */

class Checkout extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Payments_model");
        $this->model("Courses_model");
    }

    function payment_progress() {
        //print_r($this->input->get());
        $resp = $this->input->get("resp");
        if ($resp) {
            $resp = json_decode($resp);
            //print_r($resp);
            $status = $resp->status;
            if ($status == "success")
                $status = "successful";
            $tx_ref = $resp->data->txRef;
            $transaction_id = $resp->data->id;
            $mobile_login = "intent://booo.store?directLink=true&status=". $status ."&tx_ref=" . $tx_ref . "&transaction_id=" . $transaction_id . "#Intent;scheme=booostore;package=booo.store;end";
            //$mobile_login = 2;
            //echo $mobile_login;
            echo("<script type=\"text/javascript\"> window.location='" . $mobile_login . "'; </script>");
            die();
        }
        $status = $this->input->get("status");
        $tx_ref = $this->input->get("tx_ref");
        $transaction_id = $this->input->get("transaction_id");
        $key = $this->model->Payments_model->get_payment_keys();
        //echo $status;
        //echo "<br/>".$tx_ref;
        //echo "<br/>".$transaction_id;
        if ($status == "successful") {
            //echo "<br/>3";
            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://api.flutterwave.com/v3/transactions/" . $transaction_id . "/verify",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array(
                    "Content-Type: application/json",
                    "Authorization:" . $key['test_secret_key']
                ),
            ));

            $response = curl_exec($curl);

            curl_close($curl);
            $response_array = json_decode($response);
            $response_ref = $response_array->data->tx_ref;
            $response_status = $response_array->status;
            $response_amount = $response_array->data->charged_amount;
            $response_currency = $response_array->data->currency;
            /*
             * Before we can continue, lets make sure the ref id in the url matches with curl response
             */

            if (strcmp($response_ref, $tx_ref) == 0)
                $this->model->Payments_model->confirm_payment($response, $response_ref, $response_status, $response_amount, $response_currency);
        }
        $this->redirect("//" . $this->server->server_name . "/applications");
    }

    function send_welcome_mail() {
        $this->model("User_model");
        $this->model("Mail_model");
        $data = $this->model->User_model->send_welcome_mail();
        if (empty($data))
            return false;

        //$courses =  $this->model->Courses_model->get_course_outlines(true);
        foreach ($data as $item) {
            $this->model->User_model->update_users_welcome_mail($item['id']);
            $message = "
                    <img src='https://academy.boostedtechs.com/assets/images/it_service/slider_1.jpg' style='width:100%; padding:0 !important;'>
                    
                    <h4 style='font-size:18px'>CONGRATS ON YOUR FIRST STEPS</h4>
                                            <h4 style='color:#4d4d4d'>Hello <b> " .$item['names'] . ",</b></h4>
                                           <p>
                    Congratulations on taking the first steps toward personal development, career growth, and a brighter future! 
                    </p>
                    <p>
                    At Boosted Academy, we assure quality, flexibility and support.<br/><br/> Our programs of study are designed to equip our learners with practical skills to solve real time problems.
                    </p>
                        <hr>
                      
                        <h4>It is simple and safer to apply and get started. click here to <a href='//" . $this->server->server_name ."/applications/'>apply</a><br/><br/></h4>
                        <h4>Here are some of the amazing programs awaiting for</h4>";

            $this->smarty->assign("message", $message);
            $message = $this->smarty->fetch("mail_templates/subscription.tpl");

            //echo $message;
            $this->model->Mail_model->send_mail($item['email'], $message, "Welcome to Boosted Academy");
        }
    }

    function send_payment_mails() {
        $this->model("Mail_model");
        $data = $this->model->Payments_model->Get_pending_confirmation_orders();
        if (empty($data))
            return false;
        foreach ($data as $item) {
            $this->model->Payments_model->payment_confirmation_mail_sent($item['id'], $item['application']);
            $message = "<h4 style='font-size:18px'>Received Payment</h4>
                        <h4 style='color:#4d4d4d'>Hello <b> " .$item['names'] . ", your payment was successful and has been received by Boosted Academy.</b></h4>
                        <h1>UGX " . number_format($item['amount']) . "</h1>
                        <hr>
                        <table style='width: 95%; margin: auto; background: #f2f2f2; padding: 10px'>
                        <tr>
                        <td style='text-align: left'>Amount</td><td style='text-align: right'>" .  number_format($item['amount']) . " </td>
                     
                        </tr>
                                                
                        </table>
                        <h4>For details, login into your account <a href='//" . $this->server->server_name ."/applications'>here</a><br/><br/>THANK YOU FOR CHOOSING BOOSTED ACADEMY</h4>";
            $this->smarty->assign("message", $message);
            $message = $this->smarty->fetch("mail_templates/subscription.tpl");
            //echo $message;
            $this->model->Mail_model->send_mail($item['email'], $message, "Payment Receipt", "receipts@booo.store");

            $message = "<h4 style='font-size:18px'>Received Payment</h4>
                        <h4 style='color:#4d4d4d'>Hello <b> " .$item['names'] . ", Your application has been received.</b></h4>
                        <p>We thank you for applying at Boosted Academy. We are to contact you as soon as short listing is done.</p>   
                        <h4>For details, login into your account <a href='//" . $this->server->server_name ."/applications'>here</a><br/><br/>THANK YOU FOR CHOOSING BOOSTED ACADEMY</h4>";
            $this->smarty->assign("message", $message);
            $message = $this->smarty->fetch("mail_templates/subscription.tpl");
            //echo $message;
            $this->model->Mail_model->send_mail($item['email'], $message, "Application Received");

        }
        return true;
    }

}