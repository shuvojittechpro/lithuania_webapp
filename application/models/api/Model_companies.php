<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_companies extends CI_Model {

    public function __construct()
    {
        parent::__construct();
		$this->load->database();
    }
    
    public function get_companies_by_sabcat($subcats,$latitude,$longitude,$user_id,$search_text = ""){
        try{
            $this->db->select('');
            $where_concat = "";
            if($search_text != ""){
               $where_concat = " AND title LIKE '%$search_text%'";
            }
            $query = $this->db->query("SELECT id,title,address,latitude,longitude, CONCAT('".base_url()."uploads/',logo) as logo FROM companies WHERE `sub_category_id` IN (".$subcats.")".$where_concat);
            if($query->num_rows()>0){
                $res_details = $query->result_array();
                foreach($res_details as $items) {

                    $query_connect = $this->db->select('request_status')->get_where('connect_request',array('user_id' => $user_id, 'company_id' => $items['id']));
                    if($query_connect->num_rows()>0){
                        $connect_status = $query_connect->result_array()[0]['request_status']=='Y'?'true':'pending';
                    }
                    else{
                        $connect_status = 'false';
                    }


                    $comp_details[] = array(
                                            'id' => $items['id'],
                                            'title' => $items['title'],
                                            'address' => $items['address'],
                                            'latitude' => $items['latitude'],
                                            'longitude' => $items['longitude'],
                                            'logo' => $items['logo'],
                                            'distance' => distance_by_latlong($latitude,$longitude,$items['latitude'],$items['longitude'],'MT'),
                                            'connect_status' => $connect_status
                    );
                }
                usort($comp_details, array($this,'sort_byorder'));
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

    private function sort_byorder($a, $b) {
        return $a['distance'] - $b['distance'];
    }

    public function get_company_byid($company_id,$user_id){
        try{
            $query = $this->db->select("id, title, CONCAT('".base_url()."uploads/',logo) as logo, address, phone, mobile, email_address, company_description, rating, latitude, longitude")->get_where('companies',array('id' => $company_id));
            if($query->num_rows()>0){
                $result = array('status' => true);
                $result['record'] = $query->result_array()[0];
                $query_skill = $this->db->select("skill_sets.title as title,
                                                  CONCAT('".base_url()."uploads/',skill_sets.logo) as logo")
                                        ->join('skill_sets','skill_sets.id = company_skillset.skill_id','right')   
                                        ->get_where('company_skillset',array('company_skillset.comp_id' => $company_id));
                if($query_skill->num_rows()>0){
                    $result['record']['skill_set_details'] = $query_skill->result_array();
                }    
                
                $query_gallery = $this->db->select("CONCAT('".base_url()."uploads/',image) as image")
                                          ->get_where('companies_gallery',array('comp_id' => $company_id));
                if($query_gallery->num_rows()>0){
                    $result['record']['gallery_details'] = $query_gallery->result_array();
                }

                $query_connect = $this->db->select('request_status')->get_where('connect_request',array('user_id' => $user_id, 'company_id' => $company_id));
                if($query_connect->num_rows()>0){
                    $result['record']['connect_status'] = $query_connect->result_array()[0]['request_status']=='Y'?'true':'pending';
                }
                else{
                    $result['record']['connect_status'] = 'false';
                }
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
