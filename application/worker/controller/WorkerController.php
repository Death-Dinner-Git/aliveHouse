<?php

namespace app\worker\controller;

use think\worker\Server;

class WorkerController extends Server
{
    protected $socket = 'websocket://www.alivehouse.com:2346';

    /**
     * 收到信息
     * @param $connection
     * @param $data
     */
    public function onMessage($connection, $data)
    {
        $connection->send('我收到你的信息了');
    }

    /**
     * 当连接建立时触发的回调函数
     * @param $connection
     */
    public function onConnect($connection)
    {

    }

    /**
     * 当连接断开时触发的回调函数
     * @param $connection
     */
    public function onClose($connection)
    {

    }

    /**
     * 当客户端的连接上发生错误时触发
     * @param $connection
     * @param $code
     * @param $msg
     */
    public function onError($connection, $code, $msg)
    {
        echo "error $code $msg\n";
    }

    /**
     * 每个进程启动
     * @param $worker
     */
    public function onWorkerStart($worker)
    {

    }
}

/*

php server.php
打开chrome浏览器，先打开push.app域名下的网页（js跨域不能通讯），按F12打开调试控制台，在Console一栏输入(或者把下面代码放入到html页面用js运行)

ws = new WebSocket("ws://push.app:2346");
ws.onopen = function() {
    alert("连接成功");
    ws.send('tom');
    alert("给服务端发送一个字符串：tom");
};
ws.onmessage = function(e) {
    alert("收到服务端的消息：" + e.data);
};
继续测试

ws.send('保持连接，发第二次信息，查看服务器回应');

 */
