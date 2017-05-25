<?php

/* @var $this yii\web\View */

use yii\widgets\Breadcrumbs;
use common\widgets\Alert;


!isset($this -> title) ? $this->title = 'You Tee Fit' : '';
?>


<div class="content-body">

    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r4_counter db_box">
                <a href="#"
                   title="查看待处理订单：包括待捡货、待发货、待售后审核、待售后处理的订单">
                    <i class="pull-left fa fa-thumbs-up icon-md icon-rounded icon-primary"></i>
                </a>

                <div class="stats">
                    <h4><strong>4</strong></h4>
                    <span>待处理信息</span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r4_counter db_box">
                <a href="#"
                   title="查看新品上架：最近一周上架的商品">
                    <i class="pull-left fa fa-shopping-cart icon-md icon-rounded icon-success"></i>
                </a>
                <div class="stats">
                    <h4><strong>0</strong></h4>
                    <span>新赛事出没</span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r4_counter db_box">
                <i class="pull-left fa fa-dollar icon-md icon-rounded icon-primary"></i>

                <div class="stats">
                    <h4><b>$</b><strong>0</strong></h4>
                    <span>今日浏览量</span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r4_counter db_box">
                <a href="#"
                   title="查看新用户：今天新注册的用户">
                    <i class="pull-left fa fa-users icon-md icon-rounded icon-success"></i>
                </a>

                <div class="stats">
                    <h4><strong>0</strong></h4>
                    <span>活跃参与量</span>
                </div>
            </div>
        </div>
    </div>
    <!-- End .row -->
    <div class="row">

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r1_graph1 db_box">
                <span class="bold">0.06</span>
                <span class="pull-right"><small>服务器(负载)</small></span>

                <div class="clearfix"></div>
                <span class="db_dynamicbar">Loading...
                    <canvas
                        style="display: inline-block; width: 197px; max-height: 40px; vertical-align: top;"></canvas>
                </span>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r1_graph2 db_box">
                <span class="bold">0</span>
                <span class="pull-right"><small>在线用户数</small></span>

                <div class="clearfix"></div>
                <span class="db_linesparkline">Loading...
                    <canvas
                        style="display: inline-block; width: 197px; max-height: 40px; vertical-align: top;"></canvas>
                </span>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r1_graph1 db_box hidden-xs">
                <span class="bold">0/0 <small></small></span>
                <span class="pull-right"><small>奖品流动</small></span>

                <div class="clearfix"></div>
                <span class="db_compositebar">loading
                    <canvas
                        style="display: inline-block; width: 197px; max-height: 40px; vertical-align: top;"></canvas>
                </span>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="r1_graph2 db_box">
                <span class="bold">0</span>
                <span class="pull-right"><small>参加活动的用户数</small></span>

                <div class="clearfix"></div>
                <span class="db_linesparkline">Loading...
                    <canvas
                        style="display: inline-block; width: 197px; max-height: 40px; vertical-align: top;"></canvas>
                </span>
            </div>
        </div>

    </div>
    <!-- End .row -->

</div>
