<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Free extends CI_Controller {

	public function index()
	{
		$this->load->view('free');
	}

    /**
     * 获取微信授权
     */
	public function auth(){
	    $this->session->set_userdata('wechatOpenId', 'da1234');
        redirect('/recharge');
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */