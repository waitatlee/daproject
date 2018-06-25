<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Free extends CI_Controller {

	public function index(){
		$this->load->view('free');
	}

    /**
     * 获取微信授权
     */
	public function auth(){
	    //$this->load->model('Access_token_model');
        //$accessToken = $this->Access_token_model->get();
        //echo $accessToken;die;
        redirect('/free/form');
    }

    /**
     * 获取用户的openId(获取一次就好了,存放在会话里)
     */
    public function get_open_id(){
        if($this->input->get('code')){
            $code = $this->input->get('code');
            $authUrl = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.APP_ID.'&secret='.APP_SECRET.'&code='.$code.'&grant_type=authorization_code';
            $authInfo = Tools::stringToArray(Tools::curlGet($authUrl));
            if(isset($authInfo['openid'])){
                $this->session->set_userdata('wechatOpenId', $authInfo['openid']);
                redirect('/free/form');
            }else{
                Tools::fail('微信授权失败');
            }
        }else{
            $redirectUrl = urlencode(BASE_URL.'free/get_open_id');
            $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.APP_ID.'&redirect_uri='.$redirectUrl.'&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';
            redirect($url);
        }

    }

    /**
     * 显示提交手机号的表单
     */
    public function form(){
	    if(empty($this->session->userdata('wechatOpenId'))){
	        if(IS_TEST){
                $this->session->set_userdata('wechatOpenId', 'oAbCtuAezvgGFVJjPIh0xNALHSQE');
                redirect('/free/form');
            }else{
                redirect('/free/get_open_id');
            }
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
        $this->load->library(['wechat']);
        $this->load->model(['Mobile_area_model', 'Free_cost_user_model', 'Access_token_model']);
        $accessToken = $this->Access_token_model->get();
        $mobile = $this->input->post('mobile');
        $wechat = new Wechat();
        if(!$wechat->isSubscribe($this->session->userdata('wechatOpenId'), $accessToken)){
            Tools::fail('请先关注天羽通讯公众号才能参加免费话费抽奖活动');
        }
        if(!Tools::isMobile($mobile)){
            Tools::fail('手机格式错误');
        }
        $area = $this->Mobile_area_model->get($mobile);
        if(empty($area)){
            Tools::fail('您的手机号归属地无法识别,若是广东移动用户,请留言给公众号管理员处理');
        }
        if($area['province'] != '广东' || $area['tel_company'] != '中国移动'){
            Tools::fail('本活动仅限广东移动用户参与');
        }
        $res = $this->Free_cost_user_model->add([
            'mobile' => $mobile
        ]);
        Tools::reply($res);
    }
}

/* End of file free.php */
/* Location: ./application/controllers/free.php */