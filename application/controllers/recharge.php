<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Recharge extends CI_Controller {
	public function index(){
	    if(empty($this->session->userdata('wechatOpenId'))){
            redirect('/free/auth');
        }else{
	        $data['wechatOpenId'] = $this->session->userdata('wechatOpenId');
            $this->load->view('recharge', $data);
        }
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */