<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Wechat extends CI_Controller {
    /**
     * 微信授权回调函数
     */
	public function callback(){
	    if(empty($this->session->userdata('wechatOpenId'))){
            redirect('/free/auth');
        }else{
	        $data['wechatOpenId'] = $this->session->userdata('wechatOpenId');
            $this->load->view('recharge', $data);
        }
	}
}

/* End of file recharge.php */
/* Location: ./application/controllers/recharge.php */