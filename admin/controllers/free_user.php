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
class FreeUser extends Admin_Controller{

    public function __construct(){
        parent::__construct();
        $this->load->model('free_cost_user_model');
    }

    // ---------------------------------------------------------------------------------------------------

    /**
     * 显示免费活动用户列表
     */
    public function list(){
        $this->_check_permit();
        $list = $this->Free_cose_user_model->selectList();
        return;
    }
}