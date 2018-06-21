<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/21
 * Time: 0:14
 */

class Tools{
    /**
     * 获取当前用户的IP地址
     */
    public static function getIp(){
        if(isset($_SERVER)){//判断服务器是否允许$_SERVER
            if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
                $clientIp = $_SERVER['HTTP_X_FORWARDED_FOR'];
            }elseif(isset($_SERVER['HTTP_CLIENT_IP'])) {
                $clientIp = $_SERVER['HTTP_CLIENT_IP'];
            }else{
                $clientIp = $_SERVER['REMOTE_ADDR'];
            }
        }else{//不允许就使用getenv获取
            if(getenv("HTTP_X_FORWARDED_FOR")){
                $clientIp = getenv( "HTTP_X_FORWARDED_FOR");
            }elseif(getenv("HTTP_CLIENT_IP")) {
                $clientIp = getenv("HTTP_CLIENT_IP");
            }else{
                $clientIp = getenv("REMOTE_ADDR");
            }
        }
        return $clientIp;
    }
    /**
     * 是否符合手机号格式
     * @param $mobile
     * @return boolean
     */
    public static function isMobile($mobile){
        return preg_match('/^[1][3,4,5,7,8][0-9]{9}$/', $mobile);
    }
    /**
     * 将数据格式化为JSON输出
     * @param $data string|array 输出数据
     * @param $isExit boolean 输出后是否终止执行
     * @return json
     */
    public static function reply($data, $isExit = true){
        if(!is_array($data)){
            echo 'reply方法不接受非数组参数,请检查';
        }
        echo json_encode($data);
        if($isExit){
            exit;
        }
    }

    /**
     * 输出执行成功信息
     * @param $data string|array 需输出的数据
     * @param $isExit boolean 输出后是否结束进程
     * @return json
     */
    public static function success($data, $isExit = true){
        self::reply(self::getSuccessArr($data), $isExit);
    }
    /**
     * 输出执行失败信息
     * @param $data string|array 需输出的数据
     * @param $isExit boolean 输出后是否结束进程
     * @return json
     */
    public static function fail($data, $isExit = true){
        self::reply(self::getFailArr($data), $isExit);
    }

    /**
     * 获取成功信息数组
     * @param $data
     * @return array
     */
    public static function getSuccessArr($data){
        $outputData = ['success' => true];
        if(is_string($data)){
            $outputData['msg'] = $data;
        }else if(is_array($data)){
            $outputData += $data;
        }
        return $outputData;
    }
    /**
     * 获取失败信息数组
     * @param $data
     * @return array
     */
    public static function getFailArr($data){
        $outputData = ['success' => false];
        if(is_string($data)){
            $outputData['msg'] = $data;
        }else if(is_array($data)){
            $outputData += $data;
        }
        return $outputData;
    }
}