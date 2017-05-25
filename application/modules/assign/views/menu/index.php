<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use backend\modules\assign\components\MenuHelper;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $searchModel backend\modules\assign\models\searches\MenuSearch */

$this->title = Yii::t('rbac-admin', 'Menus');
$this->params['breadcrumbs'][] = $this->title;

$this->registerCssFile("@web/plugins/jstree/themes/default/style.css");
$this->registerJsFile('@web/plugins/jstree/jstree.js', ['depends' => 'backend\assets\AppAsset']);

$this->registerJs("
      jQuery(document).ready(function() {
      });
    
/*
 *  jsTree
 */

    $('#treedata_q').keyup(function () {
        setTimeout(function () {
            var v = $('#treedata_q').val();
            $('#jstree_treedata').jstree(true).search(v);
        }, 250);
    });

$('#jstree_treedata').jstree({
        'core': {
            \"multiple\" : true, // 允许多选
            'animation' : true,
            \"check_callback\": true,
            \"themes\": {
                \"variant\": 'large'
            },
            'strings' : {
                'Loading ...' : 'Please wait ... 加载中……'
            },
            'data': {
                \"url\": \"//www.youteefit.cc/back/index.php?r=manager/menu/index\",
                \"dataType\": \"json\" ,// needed only if you do not supply JSON headers
                'data': function(node) {
                    return {
                        'id': node.id
                    };
                }
            }
        },
        \"plugins\": [\"lang\",\"checkbox\", \"contextmenu\", \"dnd\", \"search\", \"sort\", \"state\", \"types\", \"unique\", \"wholerow\",\"themes\", \"html_data\", \"ui\"],
        'expand_selected_onload' : true, //选中项蓝色底显示
        \"rules\":
        {
            \"draggable\" : \"all\"  //这个设置可以使得节点进行拖动操作
        },
        \"types\": {
            \"#\": {
                \"icon\": \"fa fa-star\",
                \"max_children\": 1,
                \"max_depth\": 4,
                \"valid_children\": [\"root\"]
            },
            \"root\": {
                \"icon\": \"fa fa-star\",
                \"valid_children\": [\"default\"]
            },
            \"default\": {
                \"icon\": \"fa fa-star\",
                \"valid_children\": [\"default\", \"file\"]
            },
            \"file\": {
                \"icon\": \"fa fa-star\",
                \"valid_children\": []
            }
        },
        \"ui\": {
            \"select_limit\": 1
        },
        \"checkbox\": {
            // 去除checkbox插件的默认效果
            \"tie_selection\" : false,
            \"keep_selected_style\" : false,
            \"whole_node\" : false,
            \"cascade\": \"\", \"three_state\": false
        },
        \"contextmenu\":{
            \"items\":{
                \"create\":null,
                \"rename\":null,
                \"remove\":null,
                \"ccp\":null,
                \"删除\":{
                    \"label\":\"删除\",
                    \"action\":function(data){
                        var inst = jQuery.jstree.reference(data.reference),
                            obj = inst.get_node(data.reference);
                        if(confirm(\"确定要删除此项？删除后不可恢复。\")){
                            jQuery.get(\"/back/index.php?r=manager/menu/remove?id=\"+obj.id,function(dat){
                                if(dat == 1){
                                    $(\"#\"+obj.a_attr.id).parent().remove();
                                    alert(\"删除成功！\");
                                    jQuery(\"#jstree_treedata\").jstree(\"refresh\");
                                }else{
                                    alert(\"删除失败！\");
                                    $(\"#\"+obj.a_attr.id).parent().remove();
                                }
                            });
                        }
                    }
                },
                \"重命名\":{
                    \"label\":\"重命名\",
                    \"action\":function(data){
                        var inst = jQuery.jstree.reference(data.reference),
                            obj = inst.get_node(data.reference);
                        dialog.show({\"title\":\"编辑“\"+obj.text+\"”菜单\",url:\"/back/index.php?r=manager/menu/rename?id=\"+obj.id,height:280,width:400});
                    }
                }
            }
        }
    });

    $('#jstree_treedata').on(\"changed.jstree\", function (e, data) {
        var _ch = data.selected;
    });
    $('#jstree_treedata').on(\"changed.jstree\", function (e, data) {
        var _ch = data.selected;
    });
    $('#jstree_treedata').on(\"changed.jstree\", function (e, data) {
        var _ch = data.selected;
    });
    $('#jstree_treedata').bind(\"activate_node.jstree\", function (e, data) {
        // 处理代码
        // 获取当前节点
        var currentNode = data.node;
        // console.log(currentNode);
    });
    $(\"#jstree_treedata\").bind(\"dblclick.jstree\", function (e, data) {
        var currentNode = e.target;
        // console.log(currentNode);
    });
    
");

?>


<section class="menu-index">

    <!-- BEGIN PAGE CONTENT-->

    <section class="menu-tree" style="border: 1px solid #d4d4d4">
        <header class="panel_header" style="background-color: #d4d4d4;border-bottom:2px solid #1ec7e6; ">
            <h2 class="title pull-left" style="padding-left: 20px;"><?= Html::encode('菜单列表') ?></h2>
            <div class="actions panel_actions pull-right">
                <i class="box_toggle fa fa-chevron-down"></i>
                <i class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></i>
                <i class="box_close fa fa-times"></i>
            </div>
        </header>
        <div class="content-body" style="padding: 5px;">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <!-- start -->

                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <?= Html::a('<i class="fa fa-plus"></i> '.Yii::t('rbac-admin', 'Create Menu'), ['create'], ['class' => 'btn btn-success', 'style' => 'margin-bottom:5px;']) ?>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <button type="button" class="btn btn-warning" onclick="treedata_rename();" style="margin-bottom:5px;"><i class="fa fa-pencil"></i> Rename </button>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <button type="button" class="btn btn-danger" onclick="treedata_delete();" style="margin-bottom:5px;"><i class="fa fa-remove"></i> Delete </button>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 pull-right">
                            <input type="text" value="" id="treedata_q" placeholder="Search" class="form-control"/>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <div id="jstree_treedata" class="treedata" style="min-height:200px;padding: 15px;font-size: 20px;">

                            </div>
                        </div>
                    </div>

                    <!-- end -->

                </div>
            </div>
        </div>
    </section>

    <!-- END PAGE CONTENT-->
</section>
<script type="text/javascript">

    function treedata_rename() {
        var _active = $('#jstree_treedata  a.jstree-clicked');
        var _data = prompt("请输入新名称!");
    }
    function treedata_delete() {
        var _active = $('#jstree_treedata  a.jstree-clicked');
        if(confirm("确定要删除此项？删除后不可恢复。")){
            jQuery.get("url",function(dat){
                if(true){
                    _active.parent().remove();
                    alert("删除成功！");
                    jQuery("#jstree_treedata").jstree("refresh");
                }else{
                    alert("删除失败！");
                    _active.parent().remove();
                }
            });
        }
    }

</script>
