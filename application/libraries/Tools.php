<?php
/**
 * 常用工具类
 * User: waitatlee@163.com
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

    /**
     * 使用curl模拟进行get请求
     * @param $url string 网址
     * @return mixed
     */
    public static function curlGet($url){
        $oCurl = curl_init();
        if(stripos($url,"https://") !== FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($oCurl, CURLOPT_TIMEOUT, 3);//设置3秒超时
        curl_setopt($oCurl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
        curl_setopt($oCurl, CURLOPT_HTTPHEADER, array("Expect: "));
        curl_setopt($oCurl, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4); //强制使用IPV4协议解析域名
        //增加代理
        //curl_setopt($oCurl, CURLOPT_PROXY, HTTP_PROXY_IP_PORT);
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        if(intval($aStatus["http_code"]) == 200){
            return $sContent;
        }else{
            return false;
        }
    }
    /**
     * 将一个字符串转变成数组
     * @param string $string 字符串
     * @return array
     */
    public static function stringToArray($string){
        if(\is_string($string) && !empty($string)){
            return \json_decode($string, true);
        }else{
            return [];
        }
    }
}