<?php

namespace app\worker\controller;

use app\worker\controller\WorkerController;

class PushController extends WorkerController
{
    // 创建一个Worker监听8080端口，使用http协议通讯
    protected $socket = 'http://127.0.0.1:8080';

    /*
     *  注意这里进程数必须设置为1，否则会报端口占用错误
     *  (php 7可以设置进程数大于1，前提是$inner_text_worker->reusePort=true)
     */
    protected $processes = 1;


    /**
     * 收到信息
     * @param \Workerman\Connection\TcpConnection $connection
     * // 当有客户端发来消息时执行的回调函数
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
    public function onConnect($connection,$data)
    {
        global $worker;
        // 判断当前客户端是否已经验证,既是否设置了uid
        if(!isset($connection->uid))
        {
            // 没验证的话把第一个包当做uid（这里为了方便演示，没做真正的验证）
            $connection->uid = $data;
            /* 保存uid到connection的映射，这样可以方便的通过uid查找connection，
             * 实现针对特定uid推送数据
             */
            $worker->uidConnections[$connection->uid] = $connection;
            return;
        }
    }

    /**
     * 当连接断开时触发的回调函数
     * @param $connection
     */
    public function onClose($connection)
    {
        global $worker;
        if(isset($connection->uid))
        {
            // 连接断开时删除映射
            unset($worker->uidConnections[$connection->uid]);
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
     *
     * @param $worker
     */
    public function onWorkerStart($worker)
    {
        // worker进程启动后创建一个text Worker以便打开一个内部通讯端口

        // 新增加一个属性，用来保存uid到connection的映射
        $worker->uidConnections = array();
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

    /**
     * 向所有验证的用户推送数据
     * @param $message
     */
    public function broadcast($message)
    {
        global $worker;
        foreach($worker->uidConnections as $connection)
        {
            $connection->send($message);
        }
    }

    /**
     * 针对uid推送数据
     * @param $uid
     * @param $message
     * @return bool
     */
    public function sendMessageByUid($uid, $message)
    {
        global $worker;
        if(isset($worker->uidConnections[$uid]))
        {
            $connection = $worker->uidConnections[$uid];
            $connection->send($message);
            return true;
        }
        return false;
    }

    /**
     * 账号：root 密码：Qiche!@#123 47.94.105.213
     */
    protected function init()
    {

    }

}
