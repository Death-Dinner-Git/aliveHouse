<?php

namespace app\manage\validate;

use app\common\validate\Validate;

class ContactValidate extends Validate
{

    /**
     * @var array
     */
    protected $rule = [
        'is_delete|标签','require|in:0,1',
        'contact|联系方式','require',
    ];

    /**
     * @var array
     */
    protected $message = [
        'is_delete.require'  =>  ':attribute 不能为空',
        'is_delete.in'  =>  ':attribute 无效',
    ];

    /**
     * @var array
     */
    protected $scene = [
        'create'   =>  ['is_delete','contact'],
        'update'  =>  [],
        'save'  =>  [],
        'not'  =>  [],
    ];

}