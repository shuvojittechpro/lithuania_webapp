<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	protected $salt = 'lithuania';

	public function __construct()
    {
        parent::__construct();
		/* $this->load->model('model_home'); */
    }

	public function index()
	{
		$this->load->view('dashboard');
	}
}
