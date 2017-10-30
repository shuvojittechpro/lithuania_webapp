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
							'password' => $this->salt.'123456',
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
}
