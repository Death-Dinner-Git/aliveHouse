<?php
namespace app\manage\model;

use app\common\model\Menu as BaseMenu;

/**
 * @description TThis is the model class for table "wf_menu".  菜单模型
 * @author Sir Fu
 *
 * @property integer $id
 * @property string $name
 * @property integer $parent
 * @property string $route
 * @property integer $order
 * @property string $type
 * @property string $data
 *
 */
class Menu extends BaseMenu
{

}
