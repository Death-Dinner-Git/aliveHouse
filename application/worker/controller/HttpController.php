<?php

namespace app\worker\controller;

use app\worker\controller\WorkerController;

class HttpController extends WorkerController
{
    // 创建一个Worker监听8080端口，使用http协议通讯
    protected $socket = 'http://127.0.0.1:8080';

    /**
     * 收到信息
     * @param \Workerman\Connection\TcpConnection $connection
     * @param $data
     */
    public function onMessage($connection, $data)
    {
        // 向浏览器发送hello world
        $connection->send('hello world');
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
     * 当客户端的连接发生错误时，如果设置了$onError回调，则运行
     * 错误一般为客户端断开连接导致数据发送失败、服务端的发送缓冲区满导致发送失败等
     * 具体错误码及错误详情会以参数的形式传递给回调，参见手册
     * @param $connection
     * @param $code
     * @param $msg
     * @var callback
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

    /**
     * 当连接的发送缓冲区满时，onBufferFull回调，则执行
     * @var callback
     * @param $worker
     */
    public function onBufferFull($worker)
    {

    }

    /**
     * 当链接的发送缓冲区被清空时，如果设置了onBufferDrain回调，则执行
     * @var callback
     * @param $worker
     */
    public function onBufferDrain($worker)
    {

    }

    /**
     * 当前进程退出时（由于平滑重启或者服务停止导致），如果设置了此回调，则运行
     * @var callback
     * @param $worker
     */
    public function onWorkerStop($worker)
    {

    }

    /**
     * 当收到reload命令时的回调函数
     * @var callback
     * @param $worker
     */
    public function onWorkerReload($worker)
    {

    }

}
