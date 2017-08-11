<?php

namespace app\worker\controller;

use app\worker\controller\WorkerController;

class ChatController extends WorkerController
{
    protected $socket    = 'text://127.0.0.1:2347';

    /**
     * 只启动1个进程，这样方便客户端之间传输数据
     * @var int
     */
    protected $processes = 4;

    /**
     * 收到信息，当客户端发送消息过来时，转发给所有人
     * @param $connection
     * @param $data
     */
    public function onMessage($connection, $data)
    {
        global $text_worker;
        foreach($text_worker->connections as $conn)
        {
            $conn->send("user[{$connection->uid}] said: $data");
        }
    }

    /**
     * 当连接建立时触发的回调函数
     * 当客户端连上来时分配uid，并保存连接，并通知所有客户端
     * @param $connection
     */
    public function onConnect($connection)
    {
        global $text_worker, $global_uid;
        // 为这个链接分配一个uid
        $connection->uid = ++$global_uid;
    }

    /**
     * 当连接断开时触发的回调函数
     * 当客户端断开时，广播给所有客户端
     * @param $connection
     */
    public function onClose($connection)
    {
        global $text_worker;
        foreach($text_worker->connections as $conn)
        {
            $conn->send("user[{$connection->uid}] logout");
        }
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


    protected function init()
    {

    }

}
