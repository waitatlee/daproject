<?php
/**
 * 免费话费活动用户
 * Auth: waitatlee@163.com
 * Created: 2018/6/26 17:54
 */
class Free_cost_user_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }
    /**
     * 获取用户列表
     * @param $option 选项
     * @param $page int 页码
     * @param $length int 每页显示数量
     * @return array 二维数组,包含total和list属性
     */
    public function selectList($option, $page = 0, $length = 0){
        $conditionSql = ' ';
        $splitPageSql = ' ';
        if(isset($option['mobile']) && !empty($option['mobile'])){
            $conditionSql .= 'WHERE mobile='.$option['mobile'];
        }
        if($page > 0 && $length > 0){
            $start = ($page - 1)*$length;
            $splitPageSql = ' LIMIT '.$start.','.$length;
        }
        $publicSql = 'SELECT * FROM dp_free_cost_user';
        $list = $this->db->query($publicSql.$conditionSql.$splitPageSql)->result_array();
        $total = $this->db->query($publicSql.$conditionSql)->num_rows();
        return [
            'total' => $total,
            'list' => $list
        ];
    }
}