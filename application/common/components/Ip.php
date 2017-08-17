<?php

namespace app\common\components;

class Ip
{
    private static $_url = [
        //{"code":0,"data":{"country":"\u4e2d\u56fd","country_id":"CN","area":"\u534e\u5357","area_id":"800000","region":"\u6d77\u5357\u7701","region_id":"460000","city":"\u6d77\u53e3\u5e02","city_id":"460100","county":"","county_id":"-1","isp":"\u8054\u901a","isp_id":"100026","ip":"150.255.178.185"}}
        'http://ip.taobao.com/service/getIpInfo.php?ip=',
        //var remote_ip_info = {“ret”:1,”start”:”59.37.164.179″,”end”:”59.37.165.17″,”country”:”\u4e2d\u56fd”,”province”:”\u5e7f\u4e1c”,”city”:”\u6c5f\u95e8″,”district”:””,”isp”:”\u7535\u4fe1″,”type”:””,”desc”:””};
        'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=',
        //var lo="北京市", lc="朝阳区"; var localAddress={city:"朝阳区", province:"北京市"};
        'http://ip.ws.126.net/ipquery?ip=',
        //var remote_ip_info = {"ret":1,"start":"59.40.0.0","end":"59.40.255.255","country":"\u4e2d\u56fd","province":"\u5e7f\u4e1c","city":"\u6df1\u5733","district":"","isp":"\u7535\u4fe1","type":"","desc":""};
        'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=',
    ];

    public static function get($ip=null){

    }
}