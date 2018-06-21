<?php
/**
 * 手机号归属地查询类
 * Auth: waitatlee@163.com
 * Created: 2018/6/21 11:14
 */
class Mobile_area_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    /**
     * 查询某个手机号的归属地信息(通过手机号的前七位)
     * @param $mobile string 要查询的手机号
     * @return array
     */
    public function get($mobile){
        if(!Tools::isMobile($mobile)){
            return [];
        }
        $prefix = substr($mobile, 0, 7);
        $query = $this->db->query('SELECT * FROM mobile_area WHERE prefix = '.$prefix.' LIMIT 1');
        $row = $query->row_array();
        if(count($row) > 0){
            return $row;
        }
        return [];
    }
}