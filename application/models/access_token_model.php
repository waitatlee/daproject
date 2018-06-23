<?php
/**
 * 微信AccessToken管理类
 * Auth: waitatlee@163.com
 * Created: 2018/6/23 12:12
 */
class Access_token_model extends CI_Model{
    /**
     * token值
     * @var string
     */
    var $value = '';
    /**
     * 失效时间
     * @var string
     */
    var $expire_time = '';
    /**
     * 创建时间
     * @var string
     */
    var $create_at = '';
    public function __construct(){
        parent::__construct();
    }

    /**
     * 查询某个手机号的归属地信息(通过手机号的前七位)
     * @return string
     */
    public function get(){
        $nowTime = time();
        $query = $this->db->query('SELECT * FROM dp_access_token WHERE expire_time > '.$nowTime.' LIMIT 1');
        $row = $query->row_array();
        if(count($row) > 0){//查询到说明当前存在有效的access_token,直接返回即可
            $accessToken = $row['value'];
        }else{
            $accessToken = $this->getFromWechat();
        }
        return $accessToken;
    }

    /**
     * 从微信服务器申请access_token
     */
    private function getFromWechat(){
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.APP_ID.'&secret='.APP_SECRET;
        $accessTokenInfo = Tools::stringToArray(Tools::curlGet($url));
        if(isset($accessTokenInfo['access_token'])){
            $nowTime = time();
            $this->create_at = $nowTime;
            $this->value = $accessTokenInfo['access_token'];
            $this->expire_time = $nowTime+$accessTokenInfo['expires_in'];
            $this->db->insert('dp_access_token', $this);
        }
        return empty($this->value)?'':$this->value;
    }
}