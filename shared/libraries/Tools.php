<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
// ------------------------------------------------------------------------

/**
 * 工具类
 *
 * 本类修改自CodeIgniter Config Class!
 *
 * @package     DiliCMS
 * @subpackage  Libraries
 * @category    Libraries
 * @author      ExpressionEngine Dev Team(Jeongee 修改)
 * @link        http://www.dilicms.com
 */
class Tools{
	/**
     * 构造函数
     *
     * @access  public
     * @return  void
     */
	public function __construct(){
        $this->_ci = &get_instance();
    }
    /**
     * 判断是否测试环境
     * @return bool
     */
    public static function isDebug(){
        return in_array(ENVIRONMENT, [
            'development', 'testing'
        ]);
    }
}

/* End of file Tools.php */
/* Location: ./shared/libraries/Tools.php */
