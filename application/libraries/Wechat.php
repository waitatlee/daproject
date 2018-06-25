<?php
/**
 * 微信开放平台接口方法更新
 * User: waitatlee@163.com
 * Date: 2018/6/25
 * Time: 10:32
 */

class Wechat{
    /**
     * 判断某个openId的用户是否关注了公众号
     * @param $openId 用户微信openId
     * @param $accessToken 实时有效令牌
     * @return boolean
     */
    public function isSubscribe($openId, $accessToken){
        $url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=$accessToken&openid=$openId&lang=zh_CN";
        $userInfo = Tools::stringToArray(Tools::curlGet($url));
        return isset($userInfo['subscribe']) && $userInfo['subscribe'] == 1;
    }
}