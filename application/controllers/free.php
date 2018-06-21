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
	        $this->load->helper('form');
	        $data['isSubscribe'] = true;
            $this->load->view('free_form.php', $data);
        }
    }

    /**
     * 提交手机验证请求
     *
     * @access public
     * @return string
     */
    public function handle(){
        $this->load->library('form_validation');
        $this->load->model('Mobile_area_model');
        $this->load->model('Free_cost_user_model');
        $mobile = $this->input->post('mobile');
        if(!Tools::isMobile($mobile)){
            Tools::fail('手机格式错误');
        }
        $area = $this->Mobile_area_model->get($mobile);
        if(empty($area)){
            Tools::fail('您的手机号归属地无法识别,若是广东移动用户,请留言给公众号管理员处理');
        }
        if($area['province'] != '广东' || $area['tel_company'] == '中国移动'){
            Tools::fail('本活动仅限广东移动用户参与');
        }
        $res = $this->Free_cost_user_model->add([
            'mobile' => $mobile
        ]);
        Tools::reply($res);
    }

    /**
     * 校验手机号
     * @param $mobile string 手机号码
     * @return mixed
     */
    public function mobile_check($mobile){

    }
}

/* End of file free.php */
/* Location: ./application/controllers/free.php */