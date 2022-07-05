<?php
/**
 * Created by PhpStorm.
 * User: welcome
 * Date: 2021-01-27
 * Time: 16:21
 */

class Courses_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    function get_course_outlines($status = false, $program = false) {
        if ($status)
            $this->db->where("active", 1);

        if ($program)
            $this->db->where("url", $program);
        return $this->db->get("programs", null, "id, photos, program, description, category, audience, requirements, url");
    }

    function get_user_applications($user, $admin = false) {
        if (! $admin)
            $this->db->where("applications.user", $user);
        $this->db->join("programs", "programs.id = applications.program", "left");
        $this->db->join("orders", "orders.application = applications.id", "left");
        $this->db->join("basic_info", "basic_info.user = applications.user");
        $this->db->pageLimit = 100;
        $this->db->orderBy("applications.id", "desc");
        return $this->db->paginate("applications", 1, "names, 
        url, programs.program,
        applications.user, 
        applications.status, 
        applications.date_applied, 
        applications.admission_fee, 
        basic_info.image, 
        order_state, 
        payment_confirmation, 
        orders.description, 
        intake");
    }

}