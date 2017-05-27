<?php

namespace app\common\components\rbac;

use app\common\components\rbac\DbManager;

class AuthManager extends DbManager
{
    /**
     * @var \app\common\components\rbac\AuthManager
     */
    private static $_instance = null;

    /**
     * Memory cache of assignments
     * @var array
     */
    private $_assignments = [];
    private $_childrenList;
    private $_roleName;

    public static function getInstance(){
        if (self::$_instance === null) {
            self::$_instance = new AuthManager();
        }
        return self::$_instance;
    }

    /**
     * @inheritdoc
     */
    public function getAssignments($userId)
    {
        if (!isset($this->_assignments[$userId])) {
            $this->_assignments[$userId] = parent::getAssignments($userId);
        }
        return $this->_assignments[$userId];
    }

    /**
     * @inheritdoc
     */
    public function getRoleName($userId)
    {
        if (!isset($this->_assignments[$userId])) {
            $this->_assignments[$userId] = parent::getAssignments($userId);
        }
        foreach ($this->_assignments[$userId] as $key=>$value){
            if (is_object($value)){
                if (property_exists($value,'roleName')){
                    $this->_roleName = $value->roleName;
                }
            }
        }
        return $this->_roleName;
    }

    /**
     * @inheritdoc
     */
    protected function getChildrenList()
    {
        if ($this->_childrenList === null) {
            $this->_childrenList = parent::getChildrenList();
        }
        return $this->_childrenList;
    }
}
