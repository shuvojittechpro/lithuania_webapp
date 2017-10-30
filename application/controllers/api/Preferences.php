<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';

class Preferences extends REST_Controller {

	protected $salt = 'lithuania';

	public function __construct()
    {
        parent::__construct();
		$this->load->model('api/model_preference');
    }

	public function main_get(){
		$result = $this->model_preference->get_preferences();
		if($result['status'] === true){
			$this->set_response(array(
							'status' => true,
							'code' => '200',
							'data' => $result['record']
						), REST_Controller::HTTP_OK,true);
		}
		else{
			$this->set_response(array(
							'status' => false,
							'code' => '400',
							'message' => $result['message']
						), REST_Controller::HTTP_BAD_REQUEST,false);
		}
	}
	
	public function category_post(){
		$prefID = $this->post('pref_id');
		
		$result = $this->model_preference->get_catby_pref($prefID);
		if($result['status'] === true){
			$this->set_response(array(
							'status' => true,
							'code' => '200',
							'data' => $result['record']
						), REST_Controller::HTTP_OK,true);
		}
		else{
			$this->set_response(array(
							'status' => false,
							'code' => '400',
							'message' => $result['message']
						), REST_Controller::HTTP_BAD_REQUEST,false);
		}
	}
	
	public function subcategory_post(){
		$ids = $this->post('cat_id');
		$ids_arr = explode(',',$ids);
		$cat_id = "";
		foreach($ids_arr as $id){
			$cat_id .= "'".$id."',";
		}
		$cat_id = rtrim($cat_id,',');

		$result = $this->model_preference->get_subcatby_pref($cat_id);
		if($result['status'] === true){
			$this->set_response(array(
							'status' => true,
							'code' => '200',
							'data' => $result['record']
						), REST_Controller::HTTP_OK,true);
		}
		else{
			$this->set_response(array(
							'status' => false,
							'code' => '400',
							'message' => $result['message']
						), REST_Controller::HTTP_BAD_REQUEST,false);
		}
	}
}
