<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_user extends CI_Model {

    public function __construct()
    {
        parent::__construct();
		$this->load->database();
    }
    
    public function login_process($user_details,$user_social_details,$social_table){
        try{
            $check_user = $this->db->select('id as user_id')->get_where('user',array('username' => $user_details['username']));
            if($check_user->num_rows()>0){
                $user_id = $check_user->result_array()[0]['user_id'];
                $username = $user_details['username'];
                unset($user_details['username']);
                $this->db->trans_start();
                $this->db->where('id',$user_id)->update('user',$user_details);
                $this->db->where('user_id',$user_id)->update($social_table,$user_social_details);
                $this->db->trans_complete();

                if($this->db->trans_status()===true){
                    $result = array('status' => true);
                    $result['message'] = 'Logged in Successfully';
                }
                else{
                    throw new Exception("can not log in at this moment! Please try again later");
                }
            }
            else{
                $this->db->trans_start();
                $this->db->insert('user',$user_details);
                $user_id = $this->db->insert_id();
                $user_social_details['user_id'] = $user_id;
                $this->db->insert($social_table,$user_social_details);
                $this->db->trans_complete();

                if($this->db->trans_status()===true){
                    $result = array('status' => true);
                    $result['message'] = 'Logged in Successfully';
                }
                else{
                    throw new Exception("can not log in at this moment! Please try again later");
                }
            }
        }catch(Exception $e){
            $result = array('status' => false);
            $result['message'] = $e->getMessage();
        }

        return $result;
    }
}
