<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_companies extends CI_Model {

    public function __construct()
    {
        parent::__construct();
		$this->load->database();
    }
    
    public function get_companies_by_sabcat($subcats,$latitude,$longitude,$search_text = ""){
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
                    $comp_details[] = array(
                                            'id' => $items['id'],
                                            'title' => $items['title'],
                                            'address' => $items['address'],
                                            'latitude' => $items['latitude'],
                                            'longitude' => $items['longitude'],
                                            'logo' => $items['logo'],
                                            'distance' => distance_by_latlong($latitude,$longitude,$items['latitude'],$items['longitude'],'MT')
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
}
