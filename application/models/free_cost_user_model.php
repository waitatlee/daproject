<?php
/**
 * 免费话费活动用户
 * Auth: waitatlee@163.com
 * Created: 2018/6/21 11:14
 */
class Free_cost_user_model extends CI_Model{
    /**
     * 手机号
     * @var string
     */
    var $mobile = '';
    /**
     * 创建时间
     * @var int
     */
    var $create_at = 0;
    /**
     * 更新时间
     * @var int
     */
    var $update_at = 0;
    /**
     * 状态,枚举值
     * @var int 0:未充值|1:已充值
     */
    var $status = 0;
    /**
     * 用户IP地址,整型
     * @var string
     */
    var $ip = '';
    /**
     * 逻辑删除标记
     * @var int 0:正常|1:已删除
     */
    var $del = 0;
    public function __construct(){
        parent::__construct();
    }

    /**
     * 查询某个手机号的记录
     * @param $mobile string 要查询的手机号
     * @return array
     */
    public function get($mobile){
        $query = $this->db->query('SELECT * FROM dp_free_cost_user WHERE mobile = '.$mobile.' LIMIT 1');
        return $query->row_array();
    }

    /**
     * 增加一条记录
     * @param $data
     * @return array
     */
    public function add($data){
        $record = $this->get($data['mobile']);
        if(count($record) > 0){
            return Tools::getFailArr('该手机号已参与过此活动,不能重复参与');
        }
        $this->mobile = $data['mobile'];
        $this->create_at = time();
        $this->ip = Tools::getIp();
        $isSuccess = $this->db->insert('dp_free_cost_user', $this);
        return $isSuccess?Tools::getSuccessArr('领取成功,请等待话费到账'):Tools::getFailArr('操作失败,可能是网络错误,请重试!');
    }
}