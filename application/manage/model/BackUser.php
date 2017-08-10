<?php

namespace app\manage\model;

use app\common\model\BackUser as BaseBackUser;
use app\manage\validate\BackUserValidate;

use app\common\model\AuthAssignment;
use app\common\model\AuthItem;
use app\manage\model\Ban;
use app\manage\model\Department;
use app\manage\model\BackUserLog;
use app\manage\model\Contact;
use app\manage\model\ContactRead;
use app\manage\model\Service;
use app\manage\model\DeleteLog;
use app\manage\model\Download;
use app\manage\model\ClientServer;
use app\manage\model\Hot;
use app\manage\model\HouseHostServer;
use app\manage\model\Notice;
use app\manage\model\NoticeRead;
use app\manage\model\Opinion;
use app\manage\model\OpinionRead;
use app\manage\model\Slider;
use app\manage\model\DealOrder;
use app\manage\model\Upload;

use app\manage\model\Identity;


/**
 * This is the model class for table "{{%back_user}}".
 *
 * @property integer $id
 * @property integer $is_delete
 * @property string $code
 * @property integer $department_id
 * @property string $phone
 * @property integer $phone_verified
 * @property string $email
 * @property integer $email_verified
 * @property string $username
 * @property string $password
 * @property string $nickname
 * @property string $service_name
 * @property string $real_name
 * @property string $head_url
 * @property string $sex
 * @property string $signature
 * @property string $birthday
 * @property integer $height
 * @property integer $weight
 * @property string $token
 * @property string $auth_key
 * @property string $password_reset_token
 * @property string $password_reset_code
 * @property integer $status
 * @property string $ip
 * @property string $reg_ip
 * @property string $reg_type
 * @property string $registered_at
 * @property string $logined_at
 * @property string $updated_at
 *
 * @property AuthAssignment[] $AuthAssignments
 * @property AuthItem[] $itemNames
 * @property Ban[] $Bans
 * @property AuthItem[] $itemNames0
 * @property Department $department
 * @property BackUserLog[] $backUserLogs
 * @property Contact[] $contacts
 * @property ContactRead[] $contactReads
 * @property Service[] $customerServices
 * @property DeleteLog[] $deleteLogs
 * @property Download[] $downloads
 * @property ClientServer[] $clientServers
 * @property Hot[] $hots
 * @property HouseHostServer[] $houseHostServers
 * @property Notice[] $notices
 * @property NoticeRead[] $noticeReads
 * @property Opinion[] $opinions
 * @property OpinionRead[] $opinionReads
 * @property Slider[] $sliders
 * @property DealOrder[] $takeOrders
 * @property Upload[] $uploads
 */
class BackUser extends BaseBackUser
{

    /**
     * @return Object|\think\Validate
     */
    public static function getValidate(){
        return BackUserValidate::load();
    }

    /**
     * @param $data
     * @param string $scene
     * @return bool
     */
    public static function check($data,$scene = ''){
        $validate = self::getValidate();

        //设定场景
        if (is_string($scene) && $scene !== ''){
            $validate->scene($scene);
        }

        return $validate->check($data);
    }
}
