<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Free extends CI_Controller {

	public function index(){
		$this->load->view('free');
	}

    /**
     * 获取微信授权
     */
	public function auth(){
	    $this->session->set_userdata('wechatOpenId', 'da1234');
        redirect('/free/form');
    }
    /**
     * 显示提交手机号的表单
     */
    public function form(){
	    if(empty($this->session->userdata('wechatOpenId'))){
            redirect('/free/auth');
        }else{
	        $data['isSubscribe'] = true;
            $this->load->view('free_form.php', $data);
        }
    }

    /**
     * 提交手机验证请求
     */
    public function _handle_post(){
        $this->load->library('form_validation');
        $this->form_validation->set_rules('mobile', "手机号码", 'required|callback_mobile_check');
        $this->_message('提交成功');
    }

    /**
     * 校验手机号
     * @param $mobile
     * @return int
     */
    function mobile_check($mobile){
        $isMobile = preg_match('/^[1][3,4,5,7,8][0-9]{9}$/', $mobile);
        if(!$isMobile){
            $this->form_validation->set_message('mobile', '手机号码格式错误');
        }
    }
}

/* End of file free.php */
/* Location: ./application/controllers/free.php */