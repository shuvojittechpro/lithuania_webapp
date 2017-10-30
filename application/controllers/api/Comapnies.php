<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';

class Comapnies extends REST_Controller {

	protected $salt = 'lithuania';

	public function __construct()
    {
        parent::__construct();
		$this->load->model('api/model_companies');
    }

	public function alllist_post(){
		/* $subcats = $this->post('subcats'); */
		$ids = $this->post('subcats');
		$ids_arr = explode(',',$ids);
		$subcats = "";
		foreach($ids_arr as $id){
			$subcats .= "'".$id."',";
		}
		$subcats = rtrim($subcats,',');

		$latitude = $this->post('latitude');
		$longitude = $this->post('longitude');
		$search_text = $this->post('search_text');

		$result = $this->model_companies->get_companies_by_sabcat($subcats,$latitude,$longitude,$search_text);
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
