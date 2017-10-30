<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_preference extends CI_Model {

    public function __construct()
    {
        parent::__construct();
		$this->load->database();
    }
    
    public function get_preferences(){
        try{
            $query = $this->db->select('id,title')->get('preference');
            if($query->num_rows()>0){
                $result = array('status' => true);
                $result['record'] = $query->result_array();
            }
            else{
                throw new Exception("No record Found");
            }
        }catch(Exception $e){
            $result = array('status' => false);
            $result['message'] = $e->getMessage();
        }

        return $result;
    }
    
    public function get_catby_pref($prefID){
        try{
            $query = $this->db->select('id,preference_id,title, CONCAT("'.base_url().'uploads/",image) as image')->where_in('preference_id',$prefID)->get_where('category',array('preference_id' => $prefID));
            if($query->num_rows()>0){
                $result = array('status' => true);
                $result['record'] = $query->result_array();
            }
            else{
                throw new Exception("No record Found");
            }
        }catch(Exception $e){
            $result = array('status' => false);
            $result['message'] = $e->getMessage();
        }

        return $result;
    }
    
    public function get_subcatby_pref($cat_id){
        try{
            $query = $this->db->query('SELECT id,category_id,title, CONCAT("'.base_url().'uploads/",image) as image
            FROM `sub_category`
            WHERE `category_id` IN ('.$cat_id.')');
            if($query->num_rows()>0){
                $result = array('status' => true);
                $result['record'] = $query->result_array();
            }
            else{
                throw new Exception("No record Found");
            }
        }catch(Exception $e){
            $result = array('status' => false);
            $result['message'] = $e->getMessage();
        }

        return $result;
    }
}
