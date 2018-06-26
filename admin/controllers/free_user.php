<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
// ------------------------------------------------------------------------

/**
 * 免费话费用户管理类
 *
 * @package     DiliCMS
 * @subpackage  Controllers
 * @category    Controllers
 * @author      waitatlee@163.com
 * @link        http://www.dilicms.com
 */
class Free_user extends Admin_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('Free_cost_user_model');
    }

    // ---------------------------------------------------------------------------------------------------

    /**
     * 显示免费活动用户列表
     */
    public function list(){
        $this->_check_permit();
        $mobile = $this->input->post('mobile');
        $condition = [];
        if(!empty($mobile)){
            $condition = ['mobile' => $mobile];
        }
        $page = $this->input->post('page');
        $length = $this->input->post('length');
        $statusEnum = [0 => '未充值', 1 => '已充值'];
        $res = $this->Free_cost_user_model->selectList($condition, $page, $length);
        $this->_template('free_user_list.php', [
            'list' => $res['list'],
            'total' => $res['total'],
            'statusEnum' => $statusEnum,
            'bread' => make_bread([])
        ]);
        return;
    }
}