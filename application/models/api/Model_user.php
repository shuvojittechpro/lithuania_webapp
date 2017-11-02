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
                    $result['data']['user_id'] = $user_id;
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
                    $result['data']['user_id'] = $user_id;
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

    public function get_business_user_by_company($company_id,$select_fields = "*"){
        return $this->db->select($select_fields)->get_where('companies',array('id' => $company_id))->result_array()[0][$select_fields];
    }

    public function add_connect_request($data){
        try{
            $this->db->trans_start();
            $this->db->insert('connect_request',$data);
            $this->db->trans_complete();

            if($this->db->trans_status() === true){
                $result =  array('status' => true);
                $result['message'] = 'Request for connection recorded succefully';
            }
            else {
                throw new Exception("Error Processing Request");
            }
        }catch(Exception $e){
            $result =  array('status' => false);
            $result['message'] = $e->getMessage();
        }

        return $result;
    }

    public function get_profile_details($user_id){
        try{
            $query = $this->db->select('username,social_id,postedTime,social_type')->get_where('user',array('id' => $user_id));
            if($query->num_rows()>0){
                $record = $query->result_array()[0];
                if($record['social_type'] == 'F'){
                    $alias_table_name = "user_facebook_details";
                }
                elseif($record['social_type'] == 'G'){
                    $alias_table_name = "user_google_details";
                }
                $query_details = $this->db->select('full_name,email_address,image_url')->get_where($alias_table_name,array('user_id' => $user_id));
                $social_details = $query_details->result_array()[0];
                $result = array('status' => true);

                $positive_connect_count = $this->db->select('id')->get_where('connect_request',array('user_id' => $user_id, 'request_status' => 'Y'))->num_rows();
                
                $pending_connect_count = $this->db->select('id')->get_where('connect_request',array('user_id' => $user_id, 'request_status' => 'N'))->num_rows();

                $result['record'] = array(
                                        'id' => $user_id,
                                        'username' => $record['username'],
                                        'social_id' => $record['social_id'],
                                        'full_name' => $social_details['full_name'],
                                        'email_address' => $social_details['email_address'],
                                        'image_url' => $social_details['image_url'],
                                        'joining_date' => date('d-m-Y',$record['postedTime']),
                                        'connect_count' => $positive_connect_count,
                                        'pending_count' => $pending_connect_count
                                    );
            }
            else{
                throw new Exception("No Record Found");
            }
        }catch(Exception $e){
            $result = array('status' => false);
            $result['message'] = $e->getMessage();
        }

        return $result;
    }

    public function get_all_connections($user_id,$latitude,$longitude){
        try{
            $query_connect_details = $this->db->select('company_id,user_id,request_status')
                                              ->order_by('postedTime','desc')
                                              ->get_where('connect_request',array('user_id' => $user_id));
            if($query_connect_details->num_rows()>0){
                $connect_details = $query_connect_details->result_array();
                foreach ($connect_details as $connect_detais) {
                    $query = $this->db->query("SELECT id,title,address, CONCAT('".base_url()."uploads/',logo) as logo,latitude, longitude,rating FROM companies WHERE `id` = ".$connect_detais['company_id']." ");
                    
                        $res_details = $query->result_array()[0];
                        $comp_details[] = array(
                                                'user_id' => $connect_detais['user_id'],
                                                'company_id' => $connect_detais['company_id'],
                                                'title' => $res_details['title'],
                                                'address' => $res_details['address'],
                                                'logo' => $res_details['logo'],
                                                'rating' => $res_details['rating'],
                                                'connect_status' => $connect_detais['request_status']=='Y'?'3':'2',
                                                'latitude' => $res_details['latitude'],
                                                'longitude' => $res_details['longitude'],
                                                'distance' => distance_by_latlong($latitude,$longitude,$res_details['latitude'],$res_details['longitude'],'MT')
                                              );
                }
                $result = array('status' => true);
                $result['record'] = $comp_details;
            }
            else{
                throw new Exception("No record found");
            }
        }catch(Exception $e){
            $result = array('status' => false);
            $result['message'] = $e->getMessage();
        }

        return $result;
    }
}
