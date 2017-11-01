<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';

class User extends REST_Controller {

	protected $salt = 'lithuania';

	public function __construct()
    {
        parent::__construct();
		$this->load->model('api/model_user');
    }

	public function login_post(){
		$user_details = array(
							'username' => $this->post('username'),
							'password' => md5($this->salt.'123456'),
							'social_type' => $this->post('social_type'),
							'social_id' => $this->post('social_id'),
							'user_type' => $this->post('user_type'),
							'postedTime' => time()
						);
		
		$user_social_details = array(
									'full_name' => $this->post('full_name'),
									'email_address' => $this->post('email_address'),
									'image_url' => $this->post('image_url'),
									'postedTime' => time()
								);				
		if($this->post('social_type') == 'F'){
			$social_table = "user_facebook_details";
		}
		elseif($this->post('social_type') == 'G'){
			$social_table = "user_google_details";
		}				
		
		$result = $this->model_user->login_process($user_details,$user_social_details,$social_table);
		if($result['status'] === true){
			$this->set_response(array(
							'status' => true,
							'code' => '200',
							'message' => $result['message'],
							'data' => $result['data']
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

	public function request_connect_post(){
		$data['user_id'] = $this->post('user_id');
		$data['company_id'] = $this->post('company_id');
		$data['business_user_id'] = $this->model_user->get_business_user_by_company($data['company_id'],'user_id');
		$data['request_status'] = 'N';
		$data['postedTime'] = time();
		$result = $this->model_user->add_connect_request($data);
		if($result['status'] === true){
			$this->set_response(array(
							'status' => true,
							'code' => '200',
							'message' => $result['message']
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

	public function profile_post(){
		$user_id = $this->post('user_id');
		$result = $this->model_user->get_profile_details($user_id);
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

	public function get_connections_post(){
		$user_id = $this->post('user_id');
		$latitude = $this->post('latitude');
		$longitude = $this->post('longitude');
		$result = $this->model_user->get_all_connections($user_id,$latitude,$longitude);
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
