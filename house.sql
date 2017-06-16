-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 192.168.5.250:3306
-- Generation Time: 2017-06-15 08:37:42
-- 服务器版本： 5.5.28-log
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wofang`
--

-- --------------------------------------------------------

--
-- 表的结构 `wf_about`
--

CREATE TABLE IF NOT EXISTS `wf_about` (
  `ids` enum('talent','notices','contact','credit','about') NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_access`
--

CREATE TABLE IF NOT EXISTS `wf_access` (
  `roleId` int(11) NOT NULL,
  `nodeId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_access_node`
--
CREATE TABLE IF NOT EXISTS `wf_access_node` (
`name` varchar(50)
,`roleId` int(11)
,`nodeId` int(11)
,`title` varchar(100)
,`nodeName` varchar(50)
,`roleNavId` int(11)
,`status` tinyint(1)
,`nodeStatus` tinyint(1)
,`nodepId` int(11)
,`pId` int(11)
,`nodeSort` int(11)
,`sort` int(11)
,`isMenu` tinyint(1)
,`roleNodeId` int(11)
,`id` int(11)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_admin_collect`
--

CREATE TABLE IF NOT EXISTS `wf_admin_collect` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1二手房源、2出租房、3求购求租 、4分销客户',
  `createId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ads`
--

CREATE TABLE IF NOT EXISTS `wf_ads` (
  `id` int(11) unsigned NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `categoryId` smallint(4) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `urls` varchar(1000) NOT NULL,
  `siteId` char(30) NOT NULL DEFAULT '' COMMENT '网站列表id',
  `isAdv` tinyint(1) NOT NULL DEFAULT '2',
  `offtim` int(11) NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `clickNum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `showProvince` varchar(200) NOT NULL DEFAULT ',all,',
  `orders` tinyint(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ads_category`
--

CREATE TABLE IF NOT EXISTS `wf_ads_category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `adsw` int(4) NOT NULL DEFAULT '0',
  `adsh` int(4) NOT NULL DEFAULT '0',
  `mtop` int(4) NOT NULL DEFAULT '0',
  `orders` smallint(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `tpl` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agency_area`
--

CREATE TABLE IF NOT EXISTS `wf_agency_area` (
  `AreaID` char(32) DEFAULT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(20) DEFAULT NULL,
  `AreaNo` varchar(10) DEFAULT NULL,
  `AreaName` varchar(20) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agency_estate`
--

CREATE TABLE IF NOT EXISTS `wf_agency_estate` (
  `EstateID` char(32) DEFAULT NULL,
  `EstateName` varchar(50) DEFAULT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(10) DEFAULT NULL,
  `AreaID` char(32) DEFAULT NULL,
  `Spell` varchar(20) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PropertyUsage` varchar(20) DEFAULT NULL,
  `PropertyType` varchar(20) DEFAULT NULL,
  `CompleteYear` varchar(10) DEFAULT NULL,
  `DevCompany` varchar(50) DEFAULT NULL,
  `MgtCompany` varchar(50) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `MgtPrice` float DEFAULT NULL,
  `Remark` longtext,
  `LandNo` varchar(50) DEFAULT NULL,
  `LandGrade` varchar(20) DEFAULT NULL,
  `FrameWork` varchar(20) DEFAULT NULL,
  `MgtTel` varchar(50) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `Environment` longtext,
  `Transportation` longtext,
  `Education` longtext,
  `Business` longtext,
  `Entertainment` longtext,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Doc1` varchar(100) DEFAULT NULL,
  `Doc2` varchar(100) DEFAULT NULL,
  `Doc3` varchar(100) DEFAULT NULL,
  `Link1` varchar(100) DEFAULT NULL,
  `Link2` varchar(100) DEFAULT NULL,
  `Link3` varchar(100) DEFAULT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `DevTel` varchar(50) DEFAULT NULL,
  `Room` smallint(6) DEFAULT NULL,
  `Square` double DEFAULT NULL,
  `EstateNameE` varchar(100) DEFAULT NULL,
  `AddressE` varchar(200) DEFAULT NULL,
  `MapID` varchar(32) DEFAULT NULL,
  `CoX` int(11) DEFAULT NULL,
  `CoY` int(11) DEFAULT NULL,
  `RoomRule` int(11) DEFAULT NULL,
  `BuildingRule` tinyint(4) DEFAULT NULL,
  `RoomRuleEx` varchar(10) DEFAULT NULL,
  `Surface` varchar(10) DEFAULT NULL,
  `OwnYear` varchar(6) DEFAULT NULL,
  `EstateNameA` varchar(25) DEFAULT NULL,
  `FlagLocked` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agency_inquiry`
--

CREATE TABLE IF NOT EXISTS `wf_agency_inquiry` (
  `InquiryID` char(32) NOT NULL,
  `CustName` varchar(50) DEFAULT NULL,
  `CustTel` varchar(255) DEFAULT NULL,
  `Contact` varchar(50) DEFAULT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(50) DEFAULT NULL,
  `AreaID` char(32) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Floor` varchar(20) DEFAULT NULL,
  `Trade` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `CountF` varchar(3) DEFAULT NULL,
  `CountT` char(1) DEFAULT NULL,
  `CountW` char(1) DEFAULT NULL,
  `CountY` char(1) DEFAULT NULL,
  `PropertyUsage` varchar(20) DEFAULT NULL,
  `PropertyType` varchar(20) DEFAULT NULL,
  `PropertyDirection` varchar(20) DEFAULT NULL,
  `PropertyDecoration` varchar(50) DEFAULT NULL,
  `PropertyCommission` varchar(20) DEFAULT NULL,
  `TrustDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DeptID` char(32) DEFAULT NULL,
  `EmpID` char(32) DEFAULT NULL,
  `Remark` longtext,
  `RegPerson` varchar(20) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModPerson` varchar(20) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FlagPrivate` tinyint(4) DEFAULT NULL,
  `FlagRecommand` tinyint(4) DEFAULT NULL,
  `CustTitle` varchar(30) DEFAULT NULL,
  `CustAddress` varchar(50) DEFAULT NULL,
  `SquareMin` double DEFAULT NULL,
  `SquareMax` double DEFAULT NULL,
  `PriceMin` float DEFAULT NULL,
  `PriceMax` float DEFAULT NULL,
  `LastFollowDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CustType` varchar(20) DEFAULT NULL,
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `InquiryNo` varchar(20) DEFAULT NULL,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PropertyBuy` varchar(20) DEFAULT NULL,
  `CustGrade` varchar(20) DEFAULT NULL,
  `InquirySource` varchar(10) DEFAULT NULL,
  `PropertyFloor` varchar(50) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Country` varchar(10) DEFAULT NULL,
  `CustMobile` varchar(80) DEFAULT NULL,
  `Usage` varchar(50) DEFAULT NULL,
  `CustOccupy` varchar(10) DEFAULT NULL,
  `CustIntent` varchar(10) DEFAULT NULL,
  `CustPeriod` varchar(10) DEFAULT NULL,
  `InquiryTrust` varchar(20) DEFAULT NULL,
  `isAdd` tinyint(1) unsigned DEFAULT '0',
  `belongId` int(10) unsigned DEFAULT '0',
  `belongName` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agency_property`
--

CREATE TABLE IF NOT EXISTS `wf_agency_property` (
  `PropertyID` char(32) NOT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(10) DEFAULT NULL,
  `EstateID` char(32) DEFAULT NULL,
  `EstateName` varchar(255) DEFAULT '',
  `RoomNo` varchar(50) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Trade` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `CountF` varchar(2) DEFAULT NULL,
  `CountT` char(1) DEFAULT NULL,
  `CountW` char(1) DEFAULT NULL,
  `CountY` char(1) DEFAULT NULL,
  `FlagRecommand` tinyint(4) DEFAULT NULL,
  `PropertyUsage` varchar(20) DEFAULT NULL,
  `PropertyType` varchar(20) DEFAULT NULL,
  `PropertyDirection` varchar(20) DEFAULT NULL,
  `PropertyLook` varchar(20) DEFAULT NULL,
  `PropertyBuy` varchar(20) DEFAULT NULL,
  `PropertyCommission` varchar(20) DEFAULT NULL,
  `PropertySource` varchar(20) DEFAULT NULL,
  `Square` double DEFAULT NULL,
  `PriceUnit` float DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `PriceBase` float DEFAULT NULL,
  `RentPriceUnit` float DEFAULT NULL,
  `RentPrice` float DEFAULT NULL,
  `MgtPrice` float DEFAULT NULL,
  `TrustDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeptID` char(32) DEFAULT NULL,
  `EmpID` char(32) DEFAULT NULL,
  `PropertyDecoration` varchar(20) DEFAULT NULL,
  `PropertyFloor` varchar(32) DEFAULT NULL,
  `Remark` longtext,
  `RegPerson` varchar(20) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModPerson` varchar(20) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PropertyTrust` varchar(20) DEFAULT NULL,
  `KeyNo` varchar(10) DEFAULT NULL,
  `CompleteYear` varchar(10) DEFAULT NULL,
  `PropertyOccupy` varchar(20) DEFAULT NULL,
  `PropertyOwn` varchar(20) DEFAULT NULL,
  `SquareUse` double DEFAULT NULL,
  `LastFollowDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `OwnerName` varchar(50) DEFAULT NULL,
  `OwnerTel` varchar(255) DEFAULT NULL,
  `ContactName` varchar(50) DEFAULT NULL,
  `PropertyFurniture` varchar(20) DEFAULT NULL,
  `PropertyNo` varchar(20) DEFAULT NULL,
  `PriceLine` double DEFAULT NULL,
  `RentPriceLine` double DEFAULT NULL,
  `BuildNo` varchar(50) DEFAULT NULL,
  `PropertyCertificate` varchar(20) DEFAULT NULL,
  `PropertyElectric` varchar(20) DEFAULT NULL,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FloorAll` int(11) DEFAULT NULL,
  `HandOverDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UnitName` varchar(10) DEFAULT NULL,
  `RentUnitName` varchar(10) DEFAULT NULL,
  `PhotoCount` int(11) DEFAULT NULL,
  `Usage1` double DEFAULT NULL,
  `Usage2` double DEFAULT NULL,
  `TrustNo` varchar(20) DEFAULT NULL,
  `PropertyTax` varchar(20) DEFAULT NULL,
  `OwnerMobile` varchar(80) DEFAULT NULL,
  `Country` varchar(10) DEFAULT NULL,
  `DeptID1` char(32) DEFAULT NULL,
  `EmpID2` char(32) DEFAULT NULL,
  `DeptID2` char(32) DEFAULT NULL,
  `EmpID1` char(32) DEFAULT NULL,
  `Usage` varchar(50) DEFAULT NULL,
  `BusDatas` longtext,
  `Privy` smallint(6) DEFAULT NULL,
  `FlagWeb` tinyint(4) DEFAULT NULL,
  `Word` varchar(50) DEFAULT NULL,
  `IDCard` varchar(30) DEFAULT NULL,
  `isAdd` tinyint(1) unsigned DEFAULT '0',
  `belongId` int(10) unsigned DEFAULT NULL,
  `belongName` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent`
--

CREATE TABLE IF NOT EXISTS `wf_agent` (
  `id` smallint(8) NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所在公司id',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `passwd` varchar(36) NOT NULL DEFAULT '',
  `comeFrom` varchar(50) NOT NULL DEFAULT '' COMMENT '来客渠道',
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `idCard` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL,
  `abutment` varchar(50) NOT NULL DEFAULT '',
  `abutTel` varchar(20) NOT NULL DEFAULT '',
  `companyInfo` varchar(255) NOT NULL DEFAULT '',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `county` int(11) NOT NULL DEFAULT '0',
  `regTime` int(11) NOT NULL DEFAULT '0',
  `regWay` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1网站添加 2后台添加',
  `address` varchar(100) NOT NULL DEFAULT '',
  `agreement` tinyint(1) NOT NULL DEFAULT '1',
  `joinState` tinyint(1) NOT NULL DEFAULT '2',
  `joinWay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：个人，2：公司',
  `startTim` int(11) NOT NULL DEFAULT '0',
  `endTim` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '1、删除；2未审核；5已审核',
  `message` varchar(1000) NOT NULL DEFAULT '',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `belongUser` varchar(50) NOT NULL DEFAULT '',
  `belongUserId` int(11) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `changeClient` tinyint(1) NOT NULL DEFAULT '0',
  `intype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0代理商申请，1渠道部开发',
  `changedAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次转移时间',
  `contactInfo` varchar(100) NOT NULL DEFAULT '',
  `loginCnt` int(6) unsigned NOT NULL DEFAULT '0',
  `loginTime` int(6) unsigned NOT NULL DEFAULT '0',
  `isHouse` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否房产',
  `checkId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `checkName` varchar(20) NOT NULL DEFAULT '',
  `checkAt` int(10) unsigned NOT NULL DEFAULT '0',
  `lastVisitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `servePoint` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '服务点',
  `staffSize` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '人员规模',
  `car` varchar(50) NOT NULL DEFAULT '' COMMENT '车辆',
  `area` varchar(100) NOT NULL DEFAULT '' COMMENT '主推区域',
  `rating` tinyint(1) NOT NULL DEFAULT '0' COMMENT '级别评定',
  `delBy` varchar(30) NOT NULL DEFAULT '' COMMENT '删除人',
  `delId` varchar(20) NOT NULL DEFAULT '' COMMENT 'type:id    type:1后台id,2代理商id',
  `delAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_building_concern`
--

CREATE TABLE IF NOT EXISTS `wf_agent_building_concern` (
  `id` int(11) unsigned NOT NULL,
  `agentId` int(11) unsigned NOT NULL DEFAULT '0',
  `buildingId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关注楼盘',
  `title` varchar(150) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_card`
--

CREATE TABLE IF NOT EXISTS `wf_agent_card` (
  `id` int(11) NOT NULL,
  `agentId` int(11) NOT NULL DEFAULT '0',
  `cardNumber` varchar(32) NOT NULL DEFAULT '',
  `cardName` varchar(20) NOT NULL DEFAULT '',
  `cardType` tinyint(2) NOT NULL DEFAULT '1',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_channel`
--

CREATE TABLE IF NOT EXISTS `wf_agent_channel` (
  `channelId` char(25) NOT NULL DEFAULT '',
  `agentId` int(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_dealbuilding`
--

CREATE TABLE IF NOT EXISTS `wf_agent_dealbuilding` (
  `id` int(6) unsigned NOT NULL,
  `dealId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '成交明细id',
  `clientId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `commission` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '佣金总额',
  `preferencePrice` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '反优惠',
  `preference` varchar(200) NOT NULL DEFAULT '' COMMENT '反优惠说明',
  `deductionPrice` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '扣减金额',
  `deduction` varchar(200) NOT NULL DEFAULT '' COMMENT '扣减备注',
  `accounted` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '应结算佣金',
  `dealNotes` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `isBack` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否结佣：1未结佣，2部分结佣，3全部结佣',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '是否审核，5：未审核，6：已审核',
  `reportId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '报备ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_message`
--

CREATE TABLE IF NOT EXISTS `wf_agent_message` (
  `messageId` int(11) unsigned NOT NULL DEFAULT '0',
  `agentId` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_point`
--

CREATE TABLE IF NOT EXISTS `wf_agent_point` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `clientPoint` varchar(500) NOT NULL DEFAULT '',
  `pointAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_purpose`
--

CREATE TABLE IF NOT EXISTS `wf_agent_purpose` (
  `id` int(11) unsigned NOT NULL,
  `agentId` int(11) unsigned NOT NULL DEFAULT '0',
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `tel` char(11) NOT NULL DEFAULT '',
  `name` varchar(25) NOT NULL DEFAULT '',
  `updatedAt` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '5：未读，6：已读'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_shop`
--

CREATE TABLE IF NOT EXISTS `wf_agent_shop` (
  `agentId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '代理商id',
  `buildingId` varchar(1000) NOT NULL DEFAULT '' COMMENT '楼盘id集合',
  `time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_user`
--

CREATE TABLE IF NOT EXISTS `wf_agent_user` (
  `id` mediumint(8) unsigned NOT NULL,
  `agentId` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `station` varchar(50) NOT NULL DEFAULT '',
  `tel` char(15) NOT NULL DEFAULT '',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '1、删除；2未审核；5已审核'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_visit`
--

CREATE TABLE IF NOT EXISTS `wf_agent_visit` (
  `id` int(11) unsigned NOT NULL,
  `agentId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代理商id',
  `visitId` int(10) NOT NULL DEFAULT '0',
  `visitName` varchar(50) NOT NULL DEFAULT '',
  `visitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(100) NOT NULL DEFAULT '' COMMENT '回访地点',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '回访内容',
  `cate` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '2:催办佣金、3:物料支持、4:项目推送、5:拜访邀约、6:投诉建议、7:确认申诉、1:其他',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '回访类型：1置业回访2客服回访',
  `status` tinyint(4) NOT NULL DEFAULT '5',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_agent_wuliao`
--

CREATE TABLE IF NOT EXISTS `wf_agent_wuliao` (
  `id` smallint(5) unsigned NOT NULL,
  `agentId` mediumint(9) NOT NULL,
  `agentName` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '物料类型,支持多选。1,2,3',
  `copies` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '份数',
  `hopeAt` int(10) NOT NULL DEFAULT '0' COMMENT '期望时间',
  `arrivedAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '送达时间',
  `notes` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `shenheAt` int(10) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `shenheBy` varchar(32) NOT NULL DEFAULT '' COMMENT '审核人',
  `shenheId` mediumint(8) NOT NULL DEFAULT '0' COMMENT '审核人Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '3待审核/4已审核/6已送达',
  `statusList` varchar(1000) NOT NULL DEFAULT '' COMMENT 'statusJson数据 (未更新到正式)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_anchang_building`
--

CREATE TABLE IF NOT EXISTS `wf_anchang_building` (
  `id` int(11) NOT NULL,
  `buildingId` int(6) unsigned NOT NULL DEFAULT '0',
  `building` varchar(150) NOT NULL DEFAULT '',
  `floors` tinyint(2) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '1退场'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_anchang_fixhouse`
--

CREATE TABLE IF NOT EXISTS `wf_anchang_fixhouse` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `saleStatus` tinyint(1) NOT NULL DEFAULT '0',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `buildingName` varchar(50) NOT NULL DEFAULT '',
  `onFloor` int(11) NOT NULL DEFAULT '0',
  `suiteNum` int(11) NOT NULL DEFAULT '0',
  `suiteName` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_anchang_guestbook`
--

CREATE TABLE IF NOT EXISTS `wf_anchang_guestbook` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `address` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1:不知道哪里添加的2：建议；3：投诉',
  `isAnchang` tinyint(1) NOT NULL DEFAULT '0',
  `complainedId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '被投诉人id（案场置业人员id）',
  `complainedName` varchar(50) NOT NULL DEFAULT '' COMMENT '被投诉人（案场置业人员）',
  `complainId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '房盟经纪人id（投诉人）',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `visitAt` int(11) NOT NULL DEFAULT '0',
  `visitBy` varchar(20) NOT NULL DEFAULT '',
  `visitType` varchar(20) NOT NULL DEFAULT '',
  `visitById` int(11) NOT NULL DEFAULT '0',
  `isVisit` tinyint(1) NOT NULL DEFAULT '1',
  `visitCont` varchar(500) NOT NULL DEFAULT '' COMMENT '回访内容',
  `addFrom` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1:网站，2:app'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_anchang_house`
--

CREATE TABLE IF NOT EXISTS `wf_anchang_house` (
  `id` int(11) NOT NULL,
  `suiteNum` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(20) NOT NULL DEFAULT '',
  `setInside` varchar(20) NOT NULL DEFAULT '',
  `room` tinyint(1) NOT NULL DEFAULT '0',
  `hall` tinyint(1) NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0',
  `toilet` tinyint(1) NOT NULL,
  `veranda` tinyint(1) NOT NULL DEFAULT '0',
  `eachPrice` varchar(9) NOT NULL DEFAULT '',
  `price` varchar(11) NOT NULL DEFAULT '',
  `sellStatus` tinyint(1) NOT NULL DEFAULT '0',
  `onFloor` int(11) NOT NULL DEFAULT '0',
  `topic` int(11) NOT NULL DEFAULT '0',
  `building` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `suiteName` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_anchang_patch`
--

CREATE TABLE IF NOT EXISTS `wf_anchang_patch` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `jobType` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_anchang_signed`
--

CREATE TABLE IF NOT EXISTS `wf_anchang_signed` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `area` float(11,0) NOT NULL DEFAULT '0',
  `prices` varchar(11) NOT NULL DEFAULT '',
  `discount` varchar(11) NOT NULL DEFAULT '',
  `discountPrice` varchar(11) NOT NULL DEFAULT '',
  `inPrice` varchar(11) NOT NULL DEFAULT '',
  `payType` tinyint(1) NOT NULL DEFAULT '0',
  `remark` text NOT NULL,
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `houseId` int(11) NOT NULL,
  `isPass` tinyint(1) NOT NULL DEFAULT '0',
  `passAt` int(11) NOT NULL DEFAULT '0',
  `passBy` varchar(20) NOT NULL DEFAULT '',
  `sellStatus` tinyint(1) NOT NULL DEFAULT '0',
  `signedAt` int(11) NOT NULL DEFAULT '0',
  `buyAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_anchang_sure`
--

CREATE TABLE IF NOT EXISTS `wf_anchang_sure` (
  `id` int(11) unsigned NOT NULL,
  `reportId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '报备Id',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `buildingName` varchar(50) NOT NULL DEFAULT '',
  `sureDate` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '5',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_app_access`
--

CREATE TABLE IF NOT EXISTS `wf_app_access` (
  `roleId` int(11) NOT NULL,
  `nodeId` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_app_channel`
--

CREATE TABLE IF NOT EXISTS `wf_app_channel` (
  `channelId` char(25) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '3android 4apple',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_app_manage`
--

CREATE TABLE IF NOT EXISTS `wf_app_manage` (
  `id` int(6) unsigned NOT NULL,
  `appid` varchar(100) NOT NULL DEFAULT '' COMMENT 'app类型',
  `title` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1安卓，2苹果',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_app_next_role`
--
CREATE TABLE IF NOT EXISTS `wf_app_next_role` (
`name` varchar(50)
,`title` varchar(100)
,`pId` int(11)
,`roleNavId` int(11)
,`status` tinyint(1)
,`sort` int(11)
,`id` int(11)
,`roleId` int(11)
,`navStatus` tinyint(1)
,`navSort` int(11)
,`navName` varchar(50)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_app_role_nav`
--

CREATE TABLE IF NOT EXISTS `wf_app_role_nav` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `byname` varchar(20) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wf_app_role_node`
--

CREATE TABLE IF NOT EXISTS `wf_app_role_node` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `pId` int(11) NOT NULL DEFAULT '0',
  `pTitle` varchar(50) NOT NULL DEFAULT '',
  `roleNavId` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wf_app_version`
--

CREATE TABLE IF NOT EXISTS `wf_app_version` (
  `id` int(6) unsigned NOT NULL,
  `appid` int(6) unsigned NOT NULL,
  `version` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `content` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_asks`
--

CREATE TABLE IF NOT EXISTS `wf_asks` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `replys` mediumint(4) unsigned NOT NULL DEFAULT '0',
  `cateId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subcateid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `currentId` int(11) unsigned NOT NULL DEFAULT '0',
  `currentName` varchar(50) NOT NULL DEFAULT '',
  `currentType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1楼盘、2店铺、3小区',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '6推荐',
  `isolve` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '1最佳答案',
  `picstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1有图',
  `ip` char(15) NOT NULL DEFAULT '',
  `ipadress` varchar(20) NOT NULL,
  `clicks` int(6) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `uname` varchar(30) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `trueName` varchar(20) NOT NULL DEFAULT '',
  `userTel` varchar(11) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_asks_go`
--

CREATE TABLE IF NOT EXISTS `wf_asks_go` (
  `id` int(11) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(2000) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_asks_hotwords`
--

CREATE TABLE IF NOT EXISTS `wf_asks_hotwords` (
  `id` int(11) unsigned NOT NULL,
  `cateId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subcateid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `hots` int(11) unsigned NOT NULL DEFAULT '0',
  `curDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_asks_keywords`
--

CREATE TABLE IF NOT EXISTS `wf_asks_keywords` (
  `id` int(11) NOT NULL,
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `showTim` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_asks_reply`
--

CREATE TABLE IF NOT EXISTS `wf_asks_reply` (
  `id` int(10) unsigned NOT NULL,
  `askid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `supports` int(6) unsigned NOT NULL DEFAULT '0',
  `opposes` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '2未审核 5正常 6最佳答案',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `uname` varchar(30) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ask_buy_content`
--

CREATE TABLE IF NOT EXISTS `wf_ask_buy_content` (
  `fid` int(11) NOT NULL,
  `introduction` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ask_hire_content`
--

CREATE TABLE IF NOT EXISTS `wf_ask_hire_content` (
  `fid` int(11) unsigned NOT NULL,
  `introduction` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ask_to_buy`
--

CREATE TABLE IF NOT EXISTS `wf_ask_to_buy` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `city` int(11) unsigned NOT NULL,
  `county` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `room` tinyint(1) NOT NULL,
  `hall` tinyint(1) NOT NULL,
  `kitchen` tinyint(1) NOT NULL,
  `toilet` tinyint(1) NOT NULL,
  `veranda` tinyint(1) NOT NULL,
  `buildAreaL` float NOT NULL,
  `buildAreaM` float NOT NULL,
  `priceL` float NOT NULL,
  `priceM` float NOT NULL,
  `contact` varchar(255) NOT NULL DEFAULT '',
  `tel` char(11) NOT NULL DEFAULT '',
  `isagent` tinyint(1) NOT NULL,
  `userStatus` tinyint(1) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `buildingTimeL` int(4) NOT NULL,
  `buildingTimeM` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ask_to_hire`
--

CREATE TABLE IF NOT EXISTS `wf_ask_to_hire` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `city` int(11) NOT NULL,
  `county` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `room` tinyint(1) NOT NULL,
  `hall` tinyint(1) NOT NULL,
  `kitchen` tinyint(1) NOT NULL,
  `toilet` tinyint(1) NOT NULL,
  `veranda` tinyint(1) NOT NULL,
  `buildAreaL` float NOT NULL,
  `buildAreaM` float NOT NULL,
  `priceL` float NOT NULL,
  `priceM` float NOT NULL,
  `contact` varchar(20) NOT NULL DEFAULT '',
  `tel` char(11) NOT NULL,
  `isagent` tinyint(1) NOT NULL,
  `userStatus` tinyint(1) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `createdId` int(11) unsigned NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `buildingTimeL` int(11) NOT NULL,
  `buildingTimeM` int(11) NOT NULL,
  `hireType` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_audit_visit`
--

CREATE TABLE IF NOT EXISTS `wf_audit_visit` (
  `id` int(6) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '回访类型',
  `audioName` varchar(40) NOT NULL DEFAULT '' COMMENT '音频名称',
  `dataId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '关联数据id',
  `relateId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '关联人员id',
  `tel` varchar(32) NOT NULL DEFAULT '' COMMENT '电话',
  `relateName` varchar(25) NOT NULL DEFAULT '' COMMENT '管理人员名字',
  `url` varchar(60) NOT NULL DEFAULT '' COMMENT '链接',
  `createdBy` varchar(25) NOT NULL DEFAULT '' COMMENT '录入人',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `createdAt` int(6) unsigned NOT NULL COMMENT '录入时间',
  `lastVisitId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '最后添加纪录人id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '状态,5：正常，6：不需要提醒'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_audit_visit_content`
--

CREATE TABLE IF NOT EXISTS `wf_audit_visit_content` (
  `id` int(6) unsigned NOT NULL,
  `visitId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '稽查回访id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '回访类型1:客服回访,2:销售反馈',
  `content` varchar(250) NOT NULL DEFAULT '' COMMENT '稽查记录',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '关联URL',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '添加人Id',
  `createdBy` varchar(25) NOT NULL DEFAULT '' COMMENT '添加人',
  `createdAt` int(6) unsigned NOT NULL COMMENT '添加时间',
  `updatedBy` varchar(25) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_audit_visit_img`
--

CREATE TABLE IF NOT EXISTS `wf_audit_visit_img` (
  `id` int(10) unsigned NOT NULL,
  `auditId` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '状态',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_base_prebuilding`
--
CREATE TABLE IF NOT EXISTS `wf_base_prebuilding` (
`buildingId` int(11)
,`title` varchar(50)
,`clientId` int(11)
,`contact` varchar(50)
,`tel` varchar(50)
,`seeStatus` tinyint(1)
,`seeDate` int(11)
,`content` varchar(500)
,`updatedBy` varchar(20)
,`updatedAt` int(11)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`status` tinyint(1)
,`province` int(6) unsigned
,`city` int(6) unsigned
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_bigcode`
--

CREATE TABLE IF NOT EXISTS `wf_bigcode` (
  `id` tinyint(3) unsigned NOT NULL,
  `bigCode` varchar(20) NOT NULL DEFAULT '' COMMENT '400号码',
  `api_key` varchar(500) NOT NULL,
  `api_secret` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '登录名',
  `pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `for400sessionid` varchar(100) NOT NULL DEFAULT '' COMMENT '登录的sessionId',
  `for400sessionkey` varchar(100) NOT NULL DEFAULT '' COMMENT '登录的sessionkey',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_bug`
--

CREATE TABLE IF NOT EXISTS `wf_bug` (
  `id` int(6) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1、bug，2、新功能',
  `content` text NOT NULL,
  `wordsrc` varchar(50) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '0' COMMENT '分配人',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '分配时间',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `productBy` varchar(50) NOT NULL DEFAULT '',
  `productId` int(6) unsigned NOT NULL DEFAULT '0',
  `techBy` varchar(50) NOT NULL DEFAULT '',
  `techId` int(6) unsigned NOT NULL DEFAULT '0',
  `beginTime` int(6) unsigned NOT NULL DEFAULT '0',
  `forecastTime` int(6) unsigned NOT NULL DEFAULT '0',
  `finishTime` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_around`
--

CREATE TABLE IF NOT EXISTS `wf_building_around` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(150) NOT NULL DEFAULT '',
  `X` int(11) NOT NULL DEFAULT '0',
  `Y` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(150) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBY` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_base`
--

CREATE TABLE IF NOT EXISTS `wf_building_base` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `titlePinyin` varchar(300) NOT NULL DEFAULT '',
  `icon` varchar(128) NOT NULL DEFAULT '',
  `type` varchar(150) NOT NULL DEFAULT '',
  `feature` varchar(150) NOT NULL DEFAULT '',
  `province` int(6) unsigned NOT NULL DEFAULT '0',
  `city` int(6) unsigned NOT NULL DEFAULT '0',
  `netSubcity` tinyint(1) NOT NULL DEFAULT '0',
  `subcity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1海口东，2海口西',
  `county` int(6) unsigned NOT NULL DEFAULT '0',
  `zone` varchar(50) NOT NULL DEFAULT '',
  `lat` double(10,0) NOT NULL,
  `lng` double(10,0) NOT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `startTime` int(11) NOT NULL DEFAULT '0',
  `startByname` varchar(30) NOT NULL DEFAULT '',
  `joinTime` int(11) NOT NULL DEFAULT '0',
  `joinByname` varchar(30) NOT NULL DEFAULT '',
  `adTitle` varchar(150) NOT NULL DEFAULT '',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `decoration` varchar(150) NOT NULL DEFAULT '',
  `buildingNum` varchar(50) NOT NULL DEFAULT '0',
  `houseNum` varchar(50) NOT NULL DEFAULT '0',
  `parkingNum` varchar(20) NOT NULL DEFAULT '0',
  `recommendRoom` varchar(50) NOT NULL,
  `room` varchar(60) NOT NULL DEFAULT '',
  `sellerId` int(6) unsigned NOT NULL DEFAULT '0',
  `sellerId2` int(6) NOT NULL,
  `sellerName` varchar(50) NOT NULL DEFAULT '',
  `sellerName2` varchar(20) NOT NULL DEFAULT '',
  `sellerId3` int(6) NOT NULL,
  `sellerName3` varchar(20) NOT NULL DEFAULT '',
  `sellerTel` varchar(20) NOT NULL DEFAULT '',
  `boundAt` int(6) unsigned NOT NULL DEFAULT '0',
  `weightByname` int(6) unsigned NOT NULL DEFAULT '0',
  `weightScore` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `fieldScore` int(6) unsigned NOT NULL,
  `youhui` tinyint(1) NOT NULL DEFAULT '2',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `patent` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'netArea'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_bbs`
--
CREATE TABLE IF NOT EXISTS `wf_building_bbs` (
`cooperateStatus` tinyint(4) unsigned
,`rebateType` tinyint(4) unsigned
,`rebate` varchar(255)
,`contractStart` int(11)
,`contractEnd` int(11)
,`lastHouse` int(11)
,`loanBank` varchar(50)
,`mortgageRatio` int(11)
,`repayTime` varchar(50)
,`houseAge` varchar(100)
,`certificate` varchar(200)
,`remark` varchar(10239)
,`title` varchar(150)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`updatedBy` varchar(20)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`county` int(6) unsigned
,`saleStatus` tinyint(4) unsigned
,`sellerId` int(6) unsigned
,`sellerName` varchar(50)
,`weightByname` int(6) unsigned
,`weightScore` int(6) unsigned
,`buildingStatus` tinyint(4) unsigned
,`id` int(11) unsigned
,`businessBuildingId` int(11) unsigned
,`buildingArea` float(11,0)
,`houseArea` float(11,0)
,`buildingType` varchar(100)
,`FAR` float
,`greeningRate` float
,`poolRate` varchar(100)
,`builders` varchar(50)
,`structure` varchar(255)
,`wall` varchar(255)
,`developer` varchar(50)
,`investor` varchar(50)
,`agent` varchar(50)
,`manager` varchar(20)
,`managerTel` varchar(50)
,`contacter` varchar(50)
,`contacterTel` varchar(50)
,`fax` varchar(50)
,`saleTel` varchar(50)
,`saleAddress` varchar(50)
,`website` varchar(50)
,`licence` varchar(255)
,`propertyName` varchar(100)
,`propertyFee` varchar(50)
,`heatingWay` varchar(100)
,`waterWay` varchar(100)
,`naturalgasWay` varchar(100)
,`priceAvg` int(6) unsigned
,`priceSum` varchar(150)
,`priceSumType` varchar(100)
,`qiXian` tinyint(4) unsigned
,`status` tinyint(4)
,`updatedAt` int(11)
,`icon` varchar(128)
,`type` varchar(150)
,`feature` varchar(150)
,`zone` varchar(50)
,`address` varchar(100)
,`startTime` int(11)
,`adTitle` varchar(150)
,`reason` varchar(255)
,`joinTime` int(11)
,`decoration` varchar(150)
,`buildingNum` varchar(50)
,`houseNum` varchar(50)
,`parkingNum` varchar(20)
,`recommendRoom` varchar(50)
,`room` varchar(60)
,`sellerTel` varchar(20)
,`boundAt` int(6) unsigned
,`fieldScore` int(6) unsigned
,`youhui` tinyint(1)
,`gift` tinyint(1) unsigned
,`details` text
,`introduction` mediumtext
,`startByname` varchar(30)
,`joinByname` varchar(30)
,`layerPoor` varchar(128)
,`priceMin` int(6)
,`priceMax` int(6) unsigned
,`seeNotes` mediumtext
,`rebateNote` varchar(1000)
,`yesNote` varchar(1000)
,`contacters` text
,`patent` int(4) unsigned
,`reporters` tinytext
,`clientNotes` varchar(1000)
,`commissionNote` varchar(255)
,`payProgress` tinyint(1) unsigned
,`integrity` tinyint(1) unsigned
,`breachContract` varchar(1000)
,`cooperateType` tinyint(1)
,`firstParty` tinyint(1) unsigned
,`mainReport` tinyint(1) unsigned
,`sellerName2` varchar(20)
,`sellerName3` varchar(20)
,`sellerId2` int(6)
,`sellerId3` int(6)
,`prompt` mediumtext
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_br`
--
CREATE TABLE IF NOT EXISTS `wf_building_br` (
`id` int(11)
,`buildingId` int(11)
,`name` varchar(50)
,`room` int(11)
,`office` int(11)
,`bathroom` int(11)
,`kitchen` int(11)
,`balcony` int(11)
,`isDouble` tinyint(4)
,`image` varchar(128)
,`buildArea` varchar(100)
,`useArea` float
,`areaSum` float
,`introduction` varchar(50)
,`weightByname` int(11)
,`weightScore` int(11)
,`updatedBy` varchar(20)
,`updatedAt` int(11)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`status` tinyint(4)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`county` int(6) unsigned
,`title` varchar(150)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_bround`
--
CREATE TABLE IF NOT EXISTS `wf_building_bround` (
`id` int(11) unsigned
,`title` varchar(150)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`sellerId` int(6) unsigned
,`sellerName` varchar(50)
,`sellerTel` varchar(20)
,`cooperateStatus` tinyint(4) unsigned
,`rebateType` tinyint(4) unsigned
,`rebate` varchar(255)
,`contractStart` int(11)
,`contractEnd` int(11)
,`boundAt` int(6) unsigned
,`status` tinyint(4) unsigned
,`county` int(6) unsigned
,`roleId` int(4)
,`saleStatus` tinyint(4) unsigned
,`subcity` tinyint(1) unsigned
,`sellerName2` varchar(20)
,`sellerId2` int(6)
,`sellerId3` int(6)
,`sellerName3` varchar(20)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_browsed`
--

CREATE TABLE IF NOT EXISTS `wf_building_browsed` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `Ip` varchar(15) NOT NULL DEFAULT '',
  `num` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_bsbi`
--
CREATE TABLE IF NOT EXISTS `wf_building_bsbi` (
`id` int(11) unsigned
,`title` varchar(150)
,`icon` varchar(128)
,`type` varchar(150)
,`feature` varchar(150)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`address` varchar(100)
,`status` tinyint(4) unsigned
,`weightByname` int(6) unsigned
,`priceMax` int(6) unsigned
,`priceMin` int(6)
,`priceAvg` int(6) unsigned
,`saleStatus` tinyint(4) unsigned
,`cooperateStatus` tinyint(4) unsigned
,`weightScore` int(6) unsigned
,`subway` varchar(1000)
,`bus` varchar(1000)
,`other` varchar(1000)
,`startTime` int(11)
,`youhuiDesc` varchar(100)
,`titlePinyin` varchar(300)
,`sellerTel` varchar(20)
,`startByname` varchar(30)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_bsi`
--
CREATE TABLE IF NOT EXISTS `wf_building_bsi` (
`id` int(11) unsigned
,`title` varchar(150)
,`icon` varchar(128)
,`type` varchar(150)
,`feature` varchar(150)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`county` int(6) unsigned
,`zone` varchar(50)
,`address` varchar(100)
,`startTime` int(11)
,`adTitle` varchar(150)
,`joinTime` int(11)
,`decoration` varchar(150)
,`buildingNum` varchar(50)
,`houseNum` varchar(50)
,`parkingNum` varchar(20)
,`weightByname` int(6) unsigned
,`weightScore` int(6) unsigned
,`status` tinyint(4) unsigned
,`priceAvg` int(6) unsigned
,`priceMin` int(6)
,`priceMax` int(6) unsigned
,`priceSum` varchar(150)
,`priceSumType` varchar(100)
,`qiXian` tinyint(4) unsigned
,`areaMax` int(100)
,`areaMin` int(100)
,`greeningRate` float
,`FAR` float
,`buildingType` varchar(100)
,`wall` varchar(255)
,`structure` varchar(255)
,`builders` varchar(50)
,`investor` varchar(50)
,`developer` varchar(50)
,`commentNum` int(11)
,`concernNum` int(11)
,`tuanNum` int(11)
,`optionalNum` int(11)
,`newsNum` int(11)
,`dynamicNum` int(11)
,`roomNum` int(11)
,`picNum` int(11)
,`videoNum` int(11)
,`smsNum` int(11)
,`emailNum` int(11)
,`clickNum` int(11)
,`sellerTel` varchar(20)
,`sellerId` int(6) unsigned
,`sellerName` varchar(50)
,`boundAt` int(6) unsigned
,`updatedAt` int(6) unsigned
,`createdAt` int(6) unsigned
,`saleStatus` tinyint(4) unsigned
,`houseArea` float(11,0)
,`contacter` varchar(50)
,`contacterTel` varchar(50)
,`fax` varchar(50)
,`gift` tinyint(1) unsigned
,`joinByname` varchar(30)
,`startByname` varchar(30)
,`recommendRoom` varchar(50)
,`cooperateStatus` tinyint(4) unsigned
,`mapLng` varchar(20)
,`mapLat` varchar(20)
,`titlePinyin` varchar(300)
,`patent` int(4) unsigned
,`subcity` tinyint(1) unsigned
,`netSubcity` tinyint(1)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_business`
--

CREATE TABLE IF NOT EXISTS `wf_building_business` (
  `buildingId` int(11) unsigned NOT NULL,
  `cooperateType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '合作类型',
  `cooperateStatus` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `rebateTypeNote` varchar(255) NOT NULL DEFAULT '' COMMENT '主推说明',
  `rebateType` tinyint(4) unsigned NOT NULL DEFAULT '2' COMMENT '返利类型改为是否主推',
  `rebate` varchar(255) NOT NULL DEFAULT '',
  `rebateNote` varchar(1000) NOT NULL DEFAULT '' COMMENT '返点备注',
  `agentRebate` varchar(255) NOT NULL DEFAULT '' COMMENT '代理商返点',
  `agentRebateNote` varchar(1000) NOT NULL DEFAULT '' COMMENT '代理商返点备注',
  `seeAward` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '带看奖',
  `seeAwardNote` varchar(255) NOT NULL DEFAULT '' COMMENT '带看将备注',
  `dealAward` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '个人成交奖',
  `dealAwardNote` varchar(255) NOT NULL DEFAULT '' COMMENT '个人成交奖备注',
  `fenseeAward` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分销带看奖',
  `fenseeAwardNote` varchar(255) NOT NULL DEFAULT '' COMMENT '分销个人带看奖备注',
  `fendealAward` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分销个人成交奖',
  `fendealAwardNote` varchar(255) NOT NULL DEFAULT '' COMMENT '分销个人成交奖备注',
  `sureBill` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '确认单',
  `sureBillNote` varchar(255) NOT NULL DEFAULT '' COMMENT '确认单说明',
  `shopSell` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺销售',
  `shopSellNote` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺销售说明',
  `yesNote` varchar(1000) NOT NULL DEFAULT '' COMMENT '推盘建议',
  `contacters` text NOT NULL COMMENT '项目对接人',
  `reporters` tinytext NOT NULL COMMENT '信息报备人',
  `vips` tinytext NOT NULL COMMENT '重要对接人',
  `contractStart` int(11) NOT NULL DEFAULT '0',
  `contractEnd` int(11) NOT NULL DEFAULT '0',
  `lastHouse` int(11) NOT NULL DEFAULT '0',
  `loanBank` varchar(50) NOT NULL DEFAULT '',
  `mortgageRatio` int(11) NOT NULL DEFAULT '0',
  `repayTime` varchar(50) NOT NULL DEFAULT '',
  `houseAge` varchar(100) NOT NULL DEFAULT '',
  `certificate` varchar(200) NOT NULL DEFAULT '',
  `seeNotes` mediumtext NOT NULL,
  `prompt` mediumtext NOT NULL COMMENT '注意事项',
  `clientNotes` varchar(1000) NOT NULL DEFAULT '',
  `remark` varchar(10239) NOT NULL DEFAULT '',
  `commissionNote` varchar(255) NOT NULL DEFAULT '' COMMENT '结佣条件（结佣说明）',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `agentNotes` varchar(1000) NOT NULL DEFAULT '' COMMENT '开发商说明',
  `payProgress` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '结佣进度：1慢2一般3快',
  `payService` varchar(255) NOT NULL DEFAULT '',
  `payProgressNote` varchar(255) NOT NULL DEFAULT '' COMMENT '结佣进度说明',
  `dealBill` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有成交单1有2没',
  `dealBillNote` varchar(255) NOT NULL DEFAULT '' COMMENT '成交单据说明',
  `breachContract` varchar(1000) NOT NULL DEFAULT '' COMMENT '违约责任',
  `agent` varchar(30) NOT NULL DEFAULT '',
  `firstParty` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '合同甲方1开发商2 代理商',
  `integrity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '诚信度：1差2一般3好',
  `integrityNote` varchar(255) NOT NULL DEFAULT '' COMMENT '诚信度备注',
  `cooperDeveloper` varchar(255) NOT NULL DEFAULT '' COMMENT '招商合作开发商',
  `reportType` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1全号2隐号',
  `protectDate` tinyint(7) unsigned NOT NULL DEFAULT '30' COMMENT '看房保护期',
  `mainReport` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:我房后台，2：代理商,3:分销项目(2的x次幂，使用x&maiReport判断)',
  `schedule` varchar(100) NOT NULL COMMENT '合同进度',
  `settlementDate` varchar(255) NOT NULL COMMENT '结佣日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_cjvbs`
--
CREATE TABLE IF NOT EXISTS `wf_building_cjvbs` (
`id` int(11)
,`buildingId` int(11)
,`title` varchar(150)
,`clientId` int(11)
,`clientName` varchar(50)
,`seeStatus` tinyint(1)
,`content` varchar(255)
,`status` tinyint(1)
,`city` int(6) unsigned
,`sex` tinyint(1)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_comments`
--

CREATE TABLE IF NOT EXISTS `wf_building_comments` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL DEFAULT '',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `addTime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_concern`
--

CREATE TABLE IF NOT EXISTS `wf_building_concern` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1楼盘2二手房3租房4小区',
  `userId` int(11) NOT NULL DEFAULT '0',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `Ip` varchar(15) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_content`
--

CREATE TABLE IF NOT EXISTS `wf_building_content` (
  `buildingId` int(11) NOT NULL,
  `details` text NOT NULL,
  `introduction` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_count`
--

CREATE TABLE IF NOT EXISTS `wf_building_count` (
  `buildingId` int(11) NOT NULL,
  `commentNum` int(11) NOT NULL DEFAULT '0',
  `concernNum` int(11) NOT NULL DEFAULT '0',
  `tuanNum` int(11) NOT NULL DEFAULT '0',
  `optionalNum` int(11) NOT NULL DEFAULT '0',
  `newsNum` int(11) NOT NULL DEFAULT '0',
  `dynamicNum` int(11) NOT NULL DEFAULT '0',
  `roomNum` int(11) NOT NULL DEFAULT '0',
  `picNum` int(11) NOT NULL DEFAULT '0',
  `videoNum` int(11) NOT NULL DEFAULT '0',
  `smsNum` int(11) NOT NULL DEFAULT '0',
  `emailNum` int(11) NOT NULL DEFAULT '0',
  `clickNum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_count_date`
--

CREATE TABLE IF NOT EXISTS `wf_building_count_date` (
  `id` int(11) unsigned NOT NULL,
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(6) unsigned NOT NULL DEFAULT '0',
  `clickNum` int(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_demand`
--

CREATE TABLE IF NOT EXISTS `wf_building_demand` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `purpose` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(200) NOT NULL DEFAULT '',
  `love` varchar(50) NOT NULL DEFAULT '',
  `eachPrice` tinyint(1) NOT NULL DEFAULT '0',
  `totalPrice` tinyint(1) NOT NULL DEFAULT '0',
  `room` varchar(20) NOT NULL DEFAULT '',
  `area` tinyint(1) NOT NULL DEFAULT '0',
  `fitment` varchar(50) NOT NULL DEFAULT '',
  `buyNum` tinyint(2) NOT NULL DEFAULT '0',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `otherDemand` varchar(255) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL,
  `updatedAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_file`
--

CREATE TABLE IF NOT EXISTS `wf_building_file` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `path` varchar(150) NOT NULL DEFAULT '',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_gift`
--

CREATE TABLE IF NOT EXISTS `wf_building_gift` (
  `buildingId` int(11) NOT NULL,
  `isGift` tinyint(1) NOT NULL DEFAULT '2',
  `introductions` varchar(255) NOT NULL DEFAULT '',
  `isShow` tinyint(1) NOT NULL DEFAULT '1',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_ib`
--
CREATE TABLE IF NOT EXISTS `wf_building_ib` (
`id` int(11) unsigned
,`buildingId` int(10) unsigned
,`type` tinyint(1) unsigned
,`name` varchar(50)
,`introduction` varchar(150)
,`path` varchar(128)
,`click` int(4) unsigned
,`weightByname` int(4) unsigned
,`weightScore` int(4) unsigned
,`updatedBy` varchar(20)
,`updatedAt` int(6) unsigned
,`createdBy` varchar(20)
,`createdAt` int(6) unsigned
,`status` tinyint(4) unsigned
,`province` int(6) unsigned
,`city` int(6) unsigned
,`county` int(6) unsigned
,`title` varchar(150)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_img`
--

CREATE TABLE IF NOT EXISTS `wf_building_img` (
  `id` int(11) unsigned NOT NULL,
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `introduction` varchar(150) NOT NULL DEFAULT '',
  `path` varchar(128) NOT NULL DEFAULT '',
  `click` int(4) unsigned NOT NULL DEFAULT '0',
  `weightByname` int(4) unsigned NOT NULL DEFAULT '0',
  `weightScore` int(4) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `createdId` int(11) unsigned NOT NULL DEFAULT '0',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_imgcount`
--

CREATE TABLE IF NOT EXISTS `wf_building_imgcount` (
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `allimgNum` int(11) NOT NULL DEFAULT '0',
  `ybNum` int(11) NOT NULL DEFAULT '0',
  `xqNum` int(11) NOT NULL DEFAULT '0',
  `zbNum` int(11) NOT NULL DEFAULT '0',
  `ptNum` int(11) NOT NULL DEFAULT '0',
  `otherNum` int(11) NOT NULL DEFAULT '0',
  `hxNum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_info`
--

CREATE TABLE IF NOT EXISTS `wf_building_info` (
  `buildingId` int(11) NOT NULL,
  `buildingArea` float(11,0) NOT NULL DEFAULT '0',
  `houseArea` float(11,0) NOT NULL DEFAULT '0',
  `buildingType` varchar(100) NOT NULL DEFAULT '',
  `areaMax` int(100) NOT NULL DEFAULT '0',
  `areaMin` int(100) NOT NULL DEFAULT '0',
  `FAR` float NOT NULL DEFAULT '2',
  `greeningRate` float NOT NULL DEFAULT '2',
  `poolRate` varchar(100) NOT NULL DEFAULT '',
  `builders` varchar(50) NOT NULL DEFAULT '',
  `structure` varchar(255) NOT NULL DEFAULT '',
  `wall` varchar(255) NOT NULL DEFAULT '',
  `developer` varchar(50) NOT NULL DEFAULT '',
  `investor` varchar(50) NOT NULL DEFAULT '',
  `agent` varchar(50) NOT NULL DEFAULT '',
  `manager` varchar(20) NOT NULL DEFAULT '',
  `managerTel` varchar(50) NOT NULL DEFAULT '',
  `contacter` varchar(50) NOT NULL DEFAULT '',
  `contacterTel` varchar(50) NOT NULL DEFAULT '',
  `fax` varchar(50) NOT NULL DEFAULT '',
  `saleTel` varchar(50) NOT NULL DEFAULT '',
  `saleAddress` varchar(50) NOT NULL DEFAULT '',
  `website` varchar(50) NOT NULL DEFAULT '',
  `licence` varchar(255) NOT NULL DEFAULT '',
  `propertyName` varchar(100) NOT NULL DEFAULT '',
  `propertyFee` varchar(50) NOT NULL DEFAULT '',
  `heatingWay` varchar(100) NOT NULL DEFAULT '',
  `waterWay` varchar(100) NOT NULL DEFAULT '',
  `naturalgasWay` varchar(100) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `mapLng` varchar(20) NOT NULL DEFAULT '0',
  `mapLat` varchar(20) NOT NULL DEFAULT '0',
  `fitmentInfo` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_installation`
--

CREATE TABLE IF NOT EXISTS `wf_building_installation` (
  `id` int(11) unsigned NOT NULL,
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `community` varchar(1000) NOT NULL DEFAULT '',
  `subway` varchar(1000) NOT NULL DEFAULT '',
  `bus` varchar(1000) NOT NULL DEFAULT '',
  `other` varchar(1000) NOT NULL DEFAULT '',
  `peripheral` varchar(3000) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_installation_copy`
--

CREATE TABLE IF NOT EXISTS `wf_building_installation_copy` (
  `id` int(11) unsigned NOT NULL,
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `community` varchar(1000) NOT NULL DEFAULT '',
  `subway` varchar(1000) NOT NULL DEFAULT '',
  `bus` varchar(1000) NOT NULL DEFAULT '',
  `other` varchar(1000) NOT NULL DEFAULT '',
  `peripheral` varchar(3000) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_interaction`
--

CREATE TABLE IF NOT EXISTS `wf_building_interaction` (
  `id` int(11) unsigned NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `buildingId` int(11) DEFAULT NULL,
  `Ip` varchar(15) DEFAULT '',
  `createdAt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_log`
--

CREATE TABLE IF NOT EXISTS `wf_building_log` (
  `id` int(11) NOT NULL,
  `dataId` int(11) NOT NULL DEFAULT '0',
  `pId` int(11) NOT NULL DEFAULT '0',
  `log_module` varchar(40) NOT NULL DEFAULT '',
  `log_action` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `ip` varchar(16) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_map`
--

CREATE TABLE IF NOT EXISTS `wf_building_map` (
  `id` int(11) unsigned NOT NULL,
  `buildingId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '楼盘Id',
  `education` text NOT NULL,
  `cate` text NOT NULL,
  `life` text NOT NULL,
  `hospital` text NOT NULL,
  `shopping` text NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_mb`
--
CREATE TABLE IF NOT EXISTS `wf_building_mb` (
`id` int(11)
,`buildingId` int(11)
,`title` varchar(50)
,`type` tinyint(4)
,`releaseAt` int(11)
,`content` text
,`remark` varchar(150)
,`click` int(11)
,`emailNum` int(11)
,`SMSNum` int(11)
,`updatedBy` varchar(20)
,`updatedAt` int(11)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`status` tinyint(4) unsigned
,`province` int(6) unsigned
,`county` int(6) unsigned
,`city` int(6) unsigned
,`buildingTitle` varchar(150)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_message`
--

CREATE TABLE IF NOT EXISTS `wf_building_message` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `newsId` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `releaseAt` int(11) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `remark` varchar(150) NOT NULL DEFAULT '',
  `click` int(11) NOT NULL DEFAULT '0',
  `emailNum` int(11) NOT NULL DEFAULT '0',
  `SMSNum` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdId` int(11) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_news`
--

CREATE TABLE IF NOT EXISTS `wf_building_news` (
  `id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `sales_num` int(11) NOT NULL DEFAULT '0',
  `price_avg` varchar(11) NOT NULL DEFAULT '',
  `area` varchar(11) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `msDate` int(8) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_price`
--

CREATE TABLE IF NOT EXISTS `wf_building_price` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 最低价   2 最高价   3 均价',
  `changeTime` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(100) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_recommend`
--

CREATE TABLE IF NOT EXISTS `wf_building_recommend` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `buildingName` varchar(255) NOT NULL DEFAULT '' COMMENT '预看目的',
  `userId` int(11) NOT NULL DEFAULT '0',
  `getArrangeId` int(11) NOT NULL DEFAULT '0',
  `clientId` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL,
  `seeDate` int(11) NOT NULL DEFAULT '0' COMMENT '预看时间',
  `seeStatus` tinyint(1) NOT NULL DEFAULT '1',
  `prebuilding` tinyint(1) NOT NULL,
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '原来旧字段，现在被用来当备注',
  `recommendId` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1分销案场部门看房2二手房部门看新房3案场联动看房',
  `status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '4取消出车5正常6审核11删除',
  `userStatus` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL,
  `isConfirm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '修改使用成是否有看房单',
  `confirmAt` int(11) NOT NULL DEFAULT '0' COMMENT '确认单时间',
  `projectRewards` varchar(255) NOT NULL DEFAULT '' COMMENT '项目奖励',
  `fileType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文件类型',
  `fileReason` varchar(255) NOT NULL DEFAULT '' COMMENT '带看奖励原因及预计取回时间',
  `goaward` varchar(255) NOT NULL DEFAULT '' COMMENT '带看奖励',
  `awardBy` varchar(20) NOT NULL DEFAULT '' COMMENT '奖励回收人',
  `awardAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '奖励回收时间',
  `confirmBy` varchar(20) NOT NULL DEFAULT '' COMMENT '确认单人',
  `departureAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '出车时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_reported`
--

CREATE TABLE IF NOT EXISTS `wf_building_reported` (
  `id` int(6) unsigned NOT NULL,
  `buildingId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '楼盘id',
  `clientId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '报备备注',
  `seeDate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预计看房时间',
  `seeName` varchar(30) NOT NULL DEFAULT '' COMMENT '带看人',
  `seeNum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '带看人数',
  `seeTel` varchar(80) NOT NULL DEFAULT '' COMMENT '带看人电话 , 可储存多个。 用,分开',
  `createdAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '报备时间',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '报备人id',
  `userIdType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认0是渠道agent的ID，为1的话是roleUser的ID',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `from` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '来源 。 1:app,2:web',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '报备状态 1：无效客户，2:报备客户，3：初步确认，可带看，4：申请带看，5：确认带看(成交列表), 6:成交客户，7：确认成交  9：退房客户,10,带看无效  11删除  12 确认无效',
  `notes` text NOT NULL COMMENT '备注',
  `telStatus` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '1冲突 2疑似',
  `mainReport` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seeType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '带看类型：1:亲自带看，2地接带看'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_reported_status`
--

CREATE TABLE IF NOT EXISTS `wf_building_reported_status` (
  `id` int(6) unsigned NOT NULL,
  `reportId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '报备',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  `userIdType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '默认0是渠道agent的ID，为1的话是roleUser的ID',
  `createdBy` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `notes` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '操作等级',
  `isread` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0:已读，1：未读'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_room`
--

CREATE TABLE IF NOT EXISTS `wf_building_room` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `room` int(11) NOT NULL DEFAULT '0',
  `office` int(11) NOT NULL DEFAULT '0',
  `bathroom` int(11) NOT NULL DEFAULT '0',
  `kitchen` int(11) NOT NULL DEFAULT '0',
  `balcony` int(11) NOT NULL DEFAULT '0',
  `isDouble` tinyint(4) NOT NULL DEFAULT '0',
  `image` varchar(128) NOT NULL DEFAULT '',
  `buildArea` varchar(100) NOT NULL DEFAULT '',
  `useArea` float NOT NULL DEFAULT '0',
  `areaSum` float NOT NULL DEFAULT '0',
  `introduction` varchar(50) NOT NULL DEFAULT '',
  `weightByname` int(11) NOT NULL DEFAULT '0',
  `weightScore` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_sale`
--

CREATE TABLE IF NOT EXISTS `wf_building_sale` (
  `buildingId` int(11) unsigned NOT NULL,
  `priceMax` int(6) unsigned NOT NULL DEFAULT '0',
  `priceMin` int(6) NOT NULL DEFAULT '0',
  `priceAvg` int(6) unsigned NOT NULL DEFAULT '0',
  `priceSum` varchar(150) NOT NULL DEFAULT '',
  `priceSumType` varchar(100) NOT NULL DEFAULT '',
  `layerPoor` varchar(128) NOT NULL DEFAULT '',
  `priceRange` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `qiXian` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `youhuiDesc` varchar(100) NOT NULL DEFAULT '',
  `saleStatus` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '没有“未开盘”',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_setorder`
--

CREATE TABLE IF NOT EXISTS `wf_building_setorder` (
  `id` smallint(5) unsigned NOT NULL,
  `buildingId` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '楼盘Id',
  `type` tinyint(2) unsigned NOT NULL COMMENT '1:独代，2:热售 , 3:特色 。',
  `place` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '目前1代表 房盟首页',
  `orders` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_soap400`
--

CREATE TABLE IF NOT EXISTS `wf_building_soap400` (
  `buildingId` int(11) unsigned NOT NULL,
  `sellerId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT 'cn',
  `sellerName` varchar(20) NOT NULL DEFAULT '',
  `type` enum('5','7','8','9') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special`
--

CREATE TABLE IF NOT EXISTS `wf_building_special` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `buildingId` int(11) NOT NULL,
  `specialNumber` varchar(50) NOT NULL DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '100',
  `privilegeInfo` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `beforePrice` varchar(20) NOT NULL DEFAULT '0',
  `rebate` varchar(20) NOT NULL DEFAULT '',
  `rebatePrice` varchar(20) NOT NULL DEFAULT '0',
  `sparePrice` varchar(20) NOT NULL DEFAULT '0',
  `placePrice` varchar(20) NOT NULL DEFAULT '0',
  `numberMin` int(11) NOT NULL DEFAULT '0',
  `numberMax` int(11) NOT NULL DEFAULT '0',
  `virtualNum` int(11) NOT NULL DEFAULT '0',
  `beginTime` int(11) NOT NULL DEFAULT '0',
  `endTime` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_business`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_business` (
  `id` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `county` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `otherContact` varchar(50) NOT NULL DEFAULT '',
  `topic` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `sellPrice` varchar(20) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `remark` varchar(500) NOT NULL DEFAULT '',
  `auditStatus` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_feature`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_feature` (
  `id` int(11) NOT NULL,
  `specialId` int(11) NOT NULL,
  `featureInfo` varchar(200) NOT NULL DEFAULT '',
  `bgColors` varchar(20) NOT NULL DEFAULT '',
  `featureOrders` int(11) NOT NULL DEFAULT '100',
  `featureContent` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_img`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_img` (
  `id` int(11) unsigned NOT NULL,
  `specialId` int(11) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_info`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_info` (
  `id` int(11) NOT NULL,
  `specialId` int(11) NOT NULL,
  `content` text NOT NULL,
  `smsContent` varchar(1000) NOT NULL DEFAULT '',
  `seoKeys` varchar(1000) NOT NULL DEFAULT '',
  `seoContent` varchar(1000) NOT NULL DEFAULT '',
  `buildingInfo` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_join`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_join` (
  `id` int(11) NOT NULL,
  `specialId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `joinType` tinyint(1) NOT NULL DEFAULT '1',
  `joinTime` int(11) NOT NULL,
  `joinStatus` tinyint(1) NOT NULL DEFAULT '1',
  `placeTime` int(11) NOT NULL,
  `placeType` tinyint(1) NOT NULL DEFAULT '0',
  `placePrice` varchar(11) NOT NULL DEFAULT '',
  `payBank` tinyint(1) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_joinplace_count`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_joinplace_count` (
  `id` int(11) NOT NULL,
  `specialId` int(11) NOT NULL,
  `joinNum` int(11) NOT NULL DEFAULT '0',
  `placeNum` int(11) NOT NULL DEFAULT '0',
  `unplaceNum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_notice`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_notice` (
  `id` int(11) NOT NULL,
  `specialId` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_sendmobile`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_sendmobile` (
  `id` int(11) NOT NULL,
  `subscribeId` int(11) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_special_subscribe`
--

CREATE TABLE IF NOT EXISTS `wf_building_special_subscribe` (
  `id` int(11) NOT NULL,
  `tel` varchar(20) NOT NULL DEFAULT '',
  `sendNum` int(11) NOT NULL DEFAULT '0',
  `subTime` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_special_view`
--
CREATE TABLE IF NOT EXISTS `wf_building_special_view` (
`id` int(11)
,`title` varchar(100)
,`specialNumber` varchar(50)
,`orders` int(11)
,`beforePrice` varchar(20)
,`rebatePrice` varchar(20)
,`numberMin` int(11)
,`numberMax` int(11)
,`beginTime` int(11)
,`endTime` int(11)
,`status` tinyint(1)
,`createdAt` int(11)
,`createdBy` varchar(20)
,`createdId` int(11)
,`updatedAt` int(11)
,`updatedBy` varchar(20)
,`joinNum` int(11)
,`placeNum` int(11)
,`unplaceNum` int(11)
,`virtualNum` int(11)
,`buildingId` int(11)
,`saleTitle` varchar(100)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tags`
--

CREATE TABLE IF NOT EXISTS `wf_building_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `price` tinyint(4) NOT NULL DEFAULT '1',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `buildingSum` int(11) NOT NULL DEFAULT '0',
  `isClass` tinyint(1) NOT NULL DEFAULT '0',
  `isProvlist` tinyint(1) NOT NULL DEFAULT '0',
  `isCitylist` tinyint(1) NOT NULL DEFAULT '0',
  `isSort` int(11) NOT NULL DEFAULT '20'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_tagsvbs`
--
CREATE TABLE IF NOT EXISTS `wf_building_tagsvbs` (
`id` int(11)
,`name` varchar(100)
,`price` tinyint(4)
,`province` int(11)
,`city` int(11)
,`buildingSum` decimal(32,0)
,`isClass` tinyint(1)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tags_count`
--

CREATE TABLE IF NOT EXISTS `wf_building_tags_count` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `content` varchar(1500) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `buildingId` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `tuanNumber` varchar(50) NOT NULL DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '100',
  `privilegeInfo` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `beforePrice` varchar(20) NOT NULL DEFAULT '0',
  `rebate` varchar(20) NOT NULL DEFAULT '',
  `rebatePrice` varchar(20) NOT NULL DEFAULT '0',
  `sparePrice` varchar(20) NOT NULL DEFAULT '0',
  `placePrice` varchar(20) NOT NULL DEFAULT '0',
  `numberMin` int(11) NOT NULL DEFAULT '0',
  `numberMax` int(11) NOT NULL DEFAULT '0',
  `virtualNum` int(11) NOT NULL DEFAULT '0',
  `beginTime` int(11) NOT NULL DEFAULT '0',
  `endTime` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `categoryId` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_business`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_business` (
  `id` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `firmName` varchar(100) NOT NULL DEFAULT '',
  `buildingTitle` varchar(100) NOT NULL DEFAULT '',
  `beginTim` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `updatedId` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_feature`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_feature` (
  `id` int(11) NOT NULL,
  `tuanId` int(11) NOT NULL,
  `featureInfo` varchar(200) NOT NULL DEFAULT '',
  `bgColors` varchar(20) NOT NULL DEFAULT '',
  `featureOrders` int(11) NOT NULL DEFAULT '100',
  `featureContent` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_img`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_img` (
  `id` int(11) unsigned NOT NULL,
  `tuanId` int(11) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_info`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_info` (
  `id` int(11) NOT NULL,
  `tuanId` int(11) NOT NULL,
  `content` text NOT NULL,
  `smsContent` varchar(1000) NOT NULL DEFAULT '',
  `seoKeys` varchar(1000) NOT NULL DEFAULT '',
  `seoContent` varchar(1000) NOT NULL DEFAULT '',
  `buildingInfo` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_join`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_join` (
  `id` int(11) NOT NULL,
  `tuanId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `joinType` tinyint(1) NOT NULL DEFAULT '1',
  `joinTime` int(11) NOT NULL,
  `joinStatus` tinyint(1) NOT NULL DEFAULT '1',
  `placeTime` int(11) NOT NULL,
  `placeType` tinyint(1) NOT NULL DEFAULT '0',
  `placePrice` varchar(11) NOT NULL DEFAULT '',
  `payBank` tinyint(1) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `clientId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongUserId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongUserName` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_joinplace_count`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_joinplace_count` (
  `id` int(11) NOT NULL,
  `tuanId` int(11) NOT NULL,
  `joinNum` int(11) NOT NULL DEFAULT '0',
  `placeNum` int(11) NOT NULL DEFAULT '0',
  `unplaceNum` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_notice`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_notice` (
  `id` int(11) NOT NULL,
  `tuanId` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_sendmobile`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_sendmobile` (
  `id` int(11) NOT NULL,
  `subscribeId` int(11) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_subscribe`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_subscribe` (
  `id` int(11) NOT NULL,
  `tel` varchar(20) NOT NULL DEFAULT '',
  `sendNum` int(11) NOT NULL DEFAULT '0',
  `subTime` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_tuan_survey`
--

CREATE TABLE IF NOT EXISTS `wf_building_tuan_survey` (
  `id` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `clientName` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `preference` varchar(50) NOT NULL DEFAULT '',
  `buildingTitle` varchar(50) NOT NULL DEFAULT '',
  `fitment` varchar(50) NOT NULL DEFAULT '',
  `fitment1` varchar(50) NOT NULL,
  `roomType` varchar(50) NOT NULL DEFAULT '',
  `area` varchar(50) NOT NULL DEFAULT '',
  `area1` varchar(50) NOT NULL,
  `unitPrice` varchar(50) NOT NULL DEFAULT '',
  `unitPrice1` varchar(50) NOT NULL,
  `propertyNotes` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `updatedId` int(11) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_tuan_view`
--
CREATE TABLE IF NOT EXISTS `wf_building_tuan_view` (
`id` int(11)
,`title` varchar(100)
,`buildingTitle` varchar(150)
,`tuanNumber` varchar(50)
,`orders` int(11)
,`beforePrice` varchar(20)
,`rebatePrice` varchar(20)
,`numberMin` int(11)
,`numberMax` int(11)
,`beginTime` int(11)
,`endTime` int(11)
,`status` tinyint(1)
,`createdAt` int(11)
,`updatedAt` int(11)
,`updatedBy` varchar(20)
,`createdId` int(11)
,`createdBy` varchar(20)
,`joinNum` int(11)
,`placeNum` int(11)
,`virtualNum` int(11)
,`buildingId` int(11)
,`privilegeInfo` varchar(50)
,`icon` varchar(100)
,`categoryId` tinyint(1)
,`topic` varchar(100)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_update`
--

CREATE TABLE IF NOT EXISTS `wf_building_update` (
  `id` int(11) unsigned NOT NULL,
  `buildingId` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(100) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT ' 1删除 2审核 5正常（未审核）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_building_vb`
--
CREATE TABLE IF NOT EXISTS `wf_building_vb` (
`id` int(11)
,`buildingId` int(11)
,`type` varchar(50)
,`name` varchar(50)
,`introduction` varchar(150)
,`smallImg` varchar(128)
,`url` varchar(100)
,`click` int(11)
,`weightByname` int(11)
,`weightScore` int(11)
,`updatedBy` varchar(20)
,`updatedAt` int(11)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`status` tinyint(4)
,`province` int(6) unsigned
,`county` int(6) unsigned
,`city` int(6) unsigned
,`title` varchar(150)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_building_video`
--

CREATE TABLE IF NOT EXISTS `wf_building_video` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `introduction` varchar(150) NOT NULL DEFAULT '',
  `smallImg` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `click` int(11) NOT NULL DEFAULT '0',
  `weightByname` int(11) NOT NULL DEFAULT '0',
  `weightScore` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdId` int(11) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_buliding_purchase`
--

CREATE TABLE IF NOT EXISTS `wf_buliding_purchase` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL DEFAULT '',
  `purpose` tinyint(1) NOT NULL DEFAULT '0',
  `preference` tinyint(1) NOT NULL DEFAULT '0',
  `rooms` varchar(50) NOT NULL DEFAULT '',
  `area` tinyint(1) NOT NULL DEFAULT '0',
  `price` tinyint(1) NOT NULL DEFAULT '0',
  `fitment` tinyint(1) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_aclients`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_aclients` (
  `id` int(10) unsigned NOT NULL,
  `inclients` int(2) unsigned NOT NULL DEFAULT '0',
  `bargains` int(2) unsigned NOT NULL DEFAULT '0',
  `agentId` int(6) unsigned NOT NULL DEFAULT '0',
  `agentName` varchar(100) NOT NULL DEFAULT '',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_agents`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_agents` (
  `id` int(10) unsigned NOT NULL,
  `changes` int(6) unsigned NOT NULL DEFAULT '0',
  `develops` int(6) unsigned NOT NULL DEFAULT '0',
  `ways1` int(6) unsigned NOT NULL DEFAULT '0',
  `ways2` int(6) unsigned NOT NULL DEFAULT '0',
  `clients` int(2) unsigned NOT NULL DEFAULT '0',
  `arranges` int(2) unsigned NOT NULL DEFAULT '0',
  `visits` int(2) unsigned NOT NULL DEFAULT '0',
  `bargains` int(2) NOT NULL DEFAULT '0',
  `belongId` int(4) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(30) NOT NULL DEFAULT '',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_agentsa`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_agentsa` (
  `id` int(10) unsigned NOT NULL,
  `changes` int(6) unsigned NOT NULL DEFAULT '0',
  `develops` int(6) unsigned NOT NULL DEFAULT '0',
  `ways1` int(6) unsigned NOT NULL DEFAULT '0',
  `ways2` int(6) unsigned NOT NULL DEFAULT '0',
  `clients` int(2) unsigned NOT NULL DEFAULT '0',
  `arranges` int(2) unsigned NOT NULL DEFAULT '0',
  `visits` int(2) unsigned NOT NULL DEFAULT '0',
  `bargains` int(2) NOT NULL DEFAULT '0',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_areas`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_areas` (
  `id` int(10) unsigned NOT NULL,
  `pro_id` int(6) unsigned NOT NULL DEFAULT '0',
  `counts` int(4) unsigned NOT NULL DEFAULT '0',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(30) NOT NULL DEFAULT '',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_buildings`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_buildings` (
  `id` int(6) unsigned NOT NULL,
  `counts` int(2) unsigned NOT NULL DEFAULT '0',
  `buildingId` int(6) unsigned NOT NULL DEFAULT '0',
  `buildingName` varchar(100) NOT NULL DEFAULT '',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_citys`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_citys` (
  `id` int(10) unsigned NOT NULL,
  `counts` int(4) unsigned NOT NULL DEFAULT '0',
  `fcounts` int(4) unsigned NOT NULL DEFAULT '0',
  `cityid` int(6) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_cooperate`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_cooperate` (
  `id` int(10) unsigned NOT NULL,
  `cooper4` int(2) unsigned NOT NULL DEFAULT '0',
  `cooper5` int(2) unsigned NOT NULL DEFAULT '0',
  `cooper6` int(2) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_salestatus`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_salestatus` (
  `id` int(10) unsigned NOT NULL,
  `sale1` int(2) unsigned NOT NULL DEFAULT '0',
  `sale2` int(2) unsigned NOT NULL DEFAULT '0',
  `sale3` int(2) unsigned NOT NULL DEFAULT '0',
  `sale4` int(2) unsigned NOT NULL DEFAULT '0',
  `sale5` int(2) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_businesscount_tuan`
--

CREATE TABLE IF NOT EXISTS `wf_businesscount_tuan` (
  `id` int(6) unsigned NOT NULL,
  `onlines` int(2) unsigned NOT NULL DEFAULT '0',
  `adds` int(2) unsigned NOT NULL DEFAULT '0',
  `applys` int(2) unsigned NOT NULL DEFAULT '0',
  `clients` int(2) unsigned NOT NULL DEFAULT '0',
  `bargains` int(2) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL DEFAULT '0000-00-00',
  `timesType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0天、1月、2年'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_business_notice`
--

CREATE TABLE IF NOT EXISTS `wf_business_notice` (
  `id` int(11) NOT NULL,
  `depart` tinyint(2) NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_business_parameter`
--

CREATE TABLE IF NOT EXISTS `wf_business_parameter` (
  `id` int(11) NOT NULL,
  `subStr` varchar(250) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `range` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(500) NOT NULL DEFAULT '',
  `sort` int(3) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_business_remind`
--

CREATE TABLE IF NOT EXISTS `wf_business_remind` (
  `id` int(11) NOT NULL,
  `depart` tinyint(2) NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `reminder` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `timingAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_business_user`
--

CREATE TABLE IF NOT EXISTS `wf_business_user` (
  `id` int(11) NOT NULL,
  `remindId` int(11) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL DEFAULT '0',
  `isLook` tinyint(1) NOT NULL DEFAULT '2',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_building`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_building` (
  `id` int(5) NOT NULL,
  `name` varchar(15) NOT NULL,
  `city` varchar(5) NOT NULL,
  `price` int(9) NOT NULL,
  `href` varchar(150) NOT NULL,
  `lplx` varchar(30) NOT NULL DEFAULT '',
  `xmts` varchar(100) NOT NULL DEFAULT '',
  `ssqy` varchar(27) NOT NULL DEFAULT '',
  `bk` varchar(27) NOT NULL DEFAULT '',
  `wydz` varchar(150) NOT NULL DEFAULT '',
  `zxzk` varchar(50) NOT NULL DEFAULT '',
  `kprq` varchar(18) NOT NULL DEFAULT '',
  `rzrq` varchar(18) NOT NULL DEFAULT '',
  `lpjs` text NOT NULL,
  `zdmj` varchar(30) NOT NULL DEFAULT '',
  `jzmj` varchar(30) NOT NULL DEFAULT '',
  `rjl` varchar(10) NOT NULL DEFAULT '',
  `lhl` varchar(10) NOT NULL DEFAULT '',
  `hx` text NOT NULL,
  `cwxx` text NOT NULL,
  `jzxs` varchar(50) NOT NULL DEFAULT '',
  `homeImg` varchar(250) DEFAULT NULL,
  `lczk` text NOT NULL,
  `cqnx` varchar(10) NOT NULL DEFAULT '',
  `cjs` varchar(50) NOT NULL DEFAULT '',
  `jg` varchar(50) NOT NULL DEFAULT '',
  `wq` varchar(50) NOT NULL DEFAULT '',
  `gn` varchar(50) DEFAULT NULL,
  `gs` varchar(50) DEFAULT NULL,
  `gq` varchar(50) DEFAULT NULL,
  `kfs` varchar(50) NOT NULL DEFAULT '',
  `tzs` varchar(50) NOT NULL DEFAULT '',
  `dls` varchar(50) NOT NULL DEFAULT '',
  `ysxkz` varchar(30) NOT NULL DEFAULT '',
  `slcdh` varchar(50) NOT NULL DEFAULT '',
  `slcdz` varchar(150) NOT NULL DEFAULT '',
  `xszt` varchar(8) NOT NULL DEFAULT '',
  `price_max` int(9) NOT NULL DEFAULT '0',
  `price_min` int(9) NOT NULL DEFAULT '0',
  `price_aver` int(9) NOT NULL DEFAULT '0',
  `wyf` varchar(20) NOT NULL DEFAULT '',
  `zbpt` text NOT NULL,
  `xqpt` text NOT NULL,
  `qt` text NOT NULL,
  `images_href` varchar(250) DEFAULT NULL,
  `price_href` varchar(250) DEFAULT NULL,
  `news_href` varchar(250) DEFAULT NULL,
  `hxt_href` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_building_image`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_building_image` (
  `id` int(8) NOT NULL,
  `building` varchar(50) NOT NULL,
  `city` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tuku` varchar(30) DEFAULT NULL,
  `small` varchar(250) DEFAULT NULL,
  `href` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_building_img_queue`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_building_img_queue` (
  `id` int(11) NOT NULL COMMENT '楼盘ID',
  `name` varchar(15) NOT NULL DEFAULT '',
  `inName` varchar(15) NOT NULL DEFAULT '',
  `building` varchar(50) NOT NULL DEFAULT '',
  `href` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_building_news`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_building_news` (
  `id` int(8) NOT NULL,
  `building` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_building_prices`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_building_prices` (
  `id` int(8) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL,
  `aver` varchar(20) DEFAULT NULL,
  `max` varchar(20) DEFAULT NULL,
  `min` varchar(20) DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_building_task_queue`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_building_task_queue` (
  `id` int(8) NOT NULL,
  `name` varchar(15) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL,
  `href` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_building_tuku_queue`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_building_tuku_queue` (
  `id` int(8) NOT NULL,
  `name` varchar(15) NOT NULL,
  `href` varchar(250) NOT NULL,
  `building` varchar(50) NOT NULL,
  `city` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_huxingtu`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_huxingtu` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `city` varchar(5) NOT NULL,
  `small` varchar(250) DEFAULT NULL,
  `big` varchar(250) DEFAULT NULL,
  `building` varchar(30) NOT NULL,
  `href` varchar(100) NOT NULL,
  `homeImg` tinyint(1) NOT NULL DEFAULT '0',
  `bathroom` tinyint(2) DEFAULT NULL,
  `kitchen` tinyint(2) DEFAULT NULL,
  `balcony` tinyint(2) DEFAULT NULL,
  `buildArea` varchar(30) DEFAULT NULL,
  `useArea` varchar(30) DEFAULT NULL,
  `areaSum` varchar(30) DEFAULT NULL,
  `room` varchar(5) DEFAULT NULL,
  `office` varchar(5) DEFAULT NULL,
  `introduction` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_huxingtu_queue`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_huxingtu_queue` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(5) NOT NULL,
  `small` varchar(250) DEFAULT NULL,
  `building` varchar(30) NOT NULL,
  `href` varchar(100) NOT NULL,
  `homeImg` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_img`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_img` (
  `buildingId` int(11) NOT NULL COMMENT '楼盘ID',
  `huxingImg` varchar(250) NOT NULL,
  `allImg` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_queue`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_queue` (
  `id` int(5) NOT NULL,
  `name` varchar(15) NOT NULL,
  `city` varchar(5) NOT NULL,
  `price` int(9) NOT NULL,
  `change` int(1) NOT NULL,
  `href` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_caiji_setting`
--

CREATE TABLE IF NOT EXISTS `wf_caiji_setting` (
  `last_working` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `min_worktime_between` int(8) NOT NULL DEFAULT '0',
  `woker_name` varchar(15) NOT NULL DEFAULT 'wofang peter'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_carcity_costs`
--

CREATE TABLE IF NOT EXISTS `wf_carcity_costs` (
  `city` smallint(6) unsigned NOT NULL,
  `costs` tinyint(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_audit`
--

CREATE TABLE IF NOT EXISTS `wf_car_audit` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '稽查类型1:已出车2:取消出车3:自驾',
  `driverId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '司机Id',
  `driverName` varchar(20) NOT NULL DEFAULT '' COMMENT '司机姓名',
  `saleUserId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '销售Id',
  `saleUserName` varchar(20) NOT NULL DEFAULT '' COMMENT '销售人姓名',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '稽查链接',
  `notes` mediumtext NOT NULL COMMENT '稽查记录',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_cars`
--

CREATE TABLE IF NOT EXISTS `wf_car_cars` (
  `id` smallint(5) unsigned NOT NULL,
  `number` char(10) NOT NULL DEFAULT '' COMMENT '车牌号',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '归属城市',
  `seats` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '座位数',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '车类型',
  `mapLat` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '维度',
  `mapLng` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `mapLat2` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '维度',
  `mapLng2` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `imei` char(20) NOT NULL DEFAULT '' COMMENT 'imei值',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '行驶状态',
  `state2Time` char(30) NOT NULL DEFAULT '' COMMENT '静止的时间',
  `lastRess` varchar(100) NOT NULL DEFAULT '' COMMENT '最后的地址',
  `ori` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '车辆最后的方向',
  `address` varchar(255) NOT NULL DEFAULT '',
  `areaId` int(11) NOT NULL COMMENT '区域id',
  `areaName` varchar(50) NOT NULL COMMENT '区域名称',
  `driverId` int(11) NOT NULL COMMENT '司机id',
  `driverName` varchar(30) NOT NULL COMMENT '司机姓名',
  `brand` varchar(50) NOT NULL COMMENT '车辆品牌',
  `nature` tinyint(1) NOT NULL COMMENT '车辆性质',
  `category` int(5) NOT NULL COMMENT '车辆类别',
  `traffic` int(10) NOT NULL COMMENT '交强险到期时间',
  `business` int(10) NOT NULL COMMENT '商业险到期时间',
  `certificate` varchar(50) NOT NULL COMMENT '车辆登记证书号',
  `fuel` varchar(50) NOT NULL COMMENT '加油卡号',
  `buyTime` int(10) NOT NULL COMMENT '购车时间',
  `companyId` int(5) NOT NULL COMMENT '租车公司id',
  `staff` varchar(30) NOT NULL COMMENT '租用员工姓名',
  `useTime` int(10) NOT NULL COMMENT '租用时间',
  `ps` varchar(255) NOT NULL COMMENT '备注',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='04.28更新记录\r\n添加imei , state ,  lastRess . 修改mapLat2 , mapLng2';

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_company`
--

CREATE TABLE IF NOT EXISTS `wf_car_company` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '租车公司',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型1租车公司2车辆类别',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `udpated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_driver`
--

CREATE TABLE IF NOT EXISTS `wf_car_driver` (
  `id` mediumint(9) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '司机姓名',
  `tel` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` char(16) NOT NULL DEFAULT '' COMMENT '密码',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0',
  `county` smallint(6) unsigned NOT NULL DEFAULT '0',
  `license` char(2) NOT NULL DEFAULT '' COMMENT '驾照类型',
  `freeAt` time NOT NULL DEFAULT '00:00:00' COMMENT '空闲开始时间',
  `freeAt2` time NOT NULL DEFAULT '00:00:00' COMMENT '空闲结束时间',
  `mapLat` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '维度',
  `mapLng` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `favorGoods` smallint(5) unsigned NOT NULL DEFAULT '0',
  `favorMedi` smallint(5) unsigned NOT NULL DEFAULT '0',
  `favorBad` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) unsigned NOT NULL DEFAULT '0',
  `isopen` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1开启2关闭',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '6出车'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_favors`
--

CREATE TABLE IF NOT EXISTS `wf_car_favors` (
  `id` mediumint(8) unsigned NOT NULL,
  `driverId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `driverName` varchar(20) NOT NULL DEFAULT '',
  `favor` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1好评2中评3差评',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '评论',
  `userId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userName` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_fix`
--

CREATE TABLE IF NOT EXISTS `wf_car_fix` (
  `id` mediumint(8) unsigned NOT NULL,
  `city` smallint(6) NOT NULL,
  `carId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `carNum` varchar(30) NOT NULL DEFAULT '' COMMENT '车牌号',
  `cost` varchar(20) NOT NULL DEFAULT '' COMMENT '维修费用',
  `fixStation` varchar(50) NOT NULL DEFAULT '' COMMENT '维修店',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '维修类型',
  `item` varchar(80) NOT NULL DEFAULT '' COMMENT '维修项目',
  `reason` varchar(120) NOT NULL DEFAULT '' COMMENT '维护原因',
  `fixBelongId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '办理人',
  `fixBelongName` char(30) NOT NULL DEFAULT '' COMMENT '办理人名字',
  `beginAt` datetime NOT NULL,
  `endAt` datetime NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `createdId` int(10) NOT NULL,
  `updatedAt` int(10) NOT NULL,
  `updatedId` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_gps`
--

CREATE TABLE IF NOT EXISTS `wf_car_gps` (
  `id` int(10) unsigned NOT NULL,
  `orderId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mapLng` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `mapLat` decimal(12,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '维度',
  `createdAt` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_gps1`
--

CREATE TABLE IF NOT EXISTS `wf_car_gps1` (
  `id` int(10) unsigned NOT NULL,
  `carId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '车辆Id',
  `Lng` float(12,9) unsigned NOT NULL DEFAULT '0.000000000' COMMENT '经度',
  `Lat` float(12,9) unsigned NOT NULL DEFAULT '0.000000000' COMMENT '纬度',
  `Ori` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '方向角',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'gps记录时间',
  `address` varchar(150) NOT NULL DEFAULT '' COMMENT '地理位置',
  `state` tinyint(3) NOT NULL DEFAULT '0' COMMENT '行驶状态 1行驶 2静止',
  `state2Time` varchar(50) NOT NULL DEFAULT '' COMMENT '静止时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_order`
--

CREATE TABLE IF NOT EXISTS `wf_car_order` (
  `id` mediumint(8) unsigned NOT NULL,
  `driverId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '司机Id',
  `driverName` varchar(20) NOT NULL DEFAULT '' COMMENT '司机姓名',
  `userId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '置业顾问Id',
  `userName` varchar(20) NOT NULL DEFAULT '' COMMENT '顾问姓名',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `arrangeId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '看房安排Id',
  `carId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `carNumber` varchar(20) NOT NULL DEFAULT '' COMMENT '车牌号',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aimType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '目的地',
  `outAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出车时间',
  `orderAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间',
  `overAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `orderBuliding` varchar(255) NOT NULL DEFAULT '' COMMENT '预看楼盘',
  `signAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签到时间',
  `signOutAt` int(10) NOT NULL DEFAULT '0' COMMENT '司机收车时间',
  `startKm` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开始公里数',
  `endKm` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '结束公里数',
  `otherCost` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '其他费用',
  `totalCost` smallint(6) unsigned NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `type2` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 本店出车 2跨店出车',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '6发布预约、7发布出车'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_order_driver`
--

CREATE TABLE IF NOT EXISTS `wf_car_order_driver` (
  `id` mediumint(9) unsigned NOT NULL,
  `driverId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `driverName` varchar(20) NOT NULL DEFAULT '',
  `orderId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `orderAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_car_rental`
--

CREATE TABLE IF NOT EXISTS `wf_car_rental` (
  `id` int(11) unsigned NOT NULL,
  `city_id` int(6) NOT NULL COMMENT '城市id',
  `region_id` int(6) NOT NULL COMMENT '区域id',
  `name` varchar(100) NOT NULL COMMENT '渠道商名称',
  `contacts` varchar(30) NOT NULL COMMENT '渠道对接人',
  `position` varchar(30) NOT NULL COMMENT '职务',
  `tel` varchar(30) NOT NULL COMMENT '电话/手机',
  `type` varchar(50) NOT NULL COMMENT '车型',
  `seat` int(6) NOT NULL COMMENT '座位数量',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `unit` tinyint(1) unsigned NOT NULL COMMENT '单位：1天2周3月4季度5年',
  `insurance` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否含保险',
  `ps` varchar(255) NOT NULL COMMENT '备注',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租车渠道商表';

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_cate_ads`
--
CREATE TABLE IF NOT EXISTS `wf_cate_ads` (
`cateTitle` varchar(50)
,`adsw` int(4)
,`adsh` int(4)
,`cateStatus` tinyint(1)
,`id` int(11) unsigned
,`province` int(11)
,`city` int(11)
,`categoryId` smallint(4) unsigned
,`title` varchar(50)
,`pic` varchar(100)
,`type` tinyint(1)
,`urls` varchar(1000)
,`isAdv` tinyint(1)
,`offtim` int(11)
,`createdBy` varchar(50)
,`createdAt` int(11)
,`status` tinyint(1)
,`clickNum` mediumint(8) unsigned
,`showProvince` varchar(200)
,`orders` tinyint(4) unsigned
,`updatedBy` varchar(50)
,`updatedAt` int(11)
,`createdId` int(11)
,`tpl` text
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_city`
--

CREATE TABLE IF NOT EXISTS `wf_city` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `fename` varchar(2) NOT NULL DEFAULT '',
  `ename` varchar(40) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` int(3) NOT NULL DEFAULT '0',
  `map_x` varchar(50) NOT NULL DEFAULT '',
  `map_y` varchar(50) NOT NULL DEFAULT '',
  `map_z` varchar(5) NOT NULL DEFAULT '',
  `orders` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `istop` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `city_area` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_client_sms`
--

CREATE TABLE IF NOT EXISTS `wf_client_sms` (
  `id` mediumint(8) unsigned NOT NULL,
  `tel` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号码',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:发送 , 2:接收',
  `smsId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查询回复的id',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容',
  `currentId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `currentType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1分销、2二手、3租房',
  `belongUserId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `belongUser` varchar(30) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_code400`
--

CREATE TABLE IF NOT EXISTS `wf_code400` (
  `id` int(10) unsigned NOT NULL,
  `tel` char(32) NOT NULL DEFAULT '' COMMENT '电话号码',
  `extCode` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '400分号',
  `bigCode` varchar(12) NOT NULL DEFAULT '0' COMMENT '400总号',
  `telType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型，1手机，2座机',
  `type1` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '其他参数，作为后续备用',
  `createdAt` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_code400_white`
--

CREATE TABLE IF NOT EXISTS `wf_code400_white` (
  `id` mediumint(8) unsigned NOT NULL,
  `tel` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1手机，2座机',
  `belongId` int(10) unsigned NOT NULL,
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_addon`
--

CREATE TABLE IF NOT EXISTS `wf_common_addon` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sitename` varchar(255) NOT NULL DEFAULT '',
  `siteurl` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_admincp_cmenu`
--

CREATE TABLE IF NOT EXISTS `wf_common_admincp_cmenu` (
  `id` smallint(6) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL,
  `clicks` smallint(6) unsigned NOT NULL DEFAULT '1',
  `uid` mediumint(8) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_admincp_group`
--

CREATE TABLE IF NOT EXISTS `wf_common_admincp_group` (
  `cpgroupid` smallint(6) unsigned NOT NULL,
  `cpgroupname` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_admincp_member`
--

CREATE TABLE IF NOT EXISTS `wf_common_admincp_member` (
  `uid` int(10) unsigned NOT NULL,
  `cpgroupid` int(10) unsigned NOT NULL,
  `customperm` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_admincp_perm`
--

CREATE TABLE IF NOT EXISTS `wf_common_admincp_perm` (
  `cpgroupid` smallint(6) unsigned NOT NULL,
  `perm` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_admincp_session`
--

CREATE TABLE IF NOT EXISTS `wf_common_admincp_session` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `panel` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `errorcount` tinyint(1) NOT NULL DEFAULT '0',
  `storage` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_admingroup`
--

CREATE TABLE IF NOT EXISTS `wf_common_admingroup` (
  `admingid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowstickthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmodpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowdelpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowmassprune` tinyint(1) NOT NULL DEFAULT '0',
  `allowrefund` tinyint(1) NOT NULL DEFAULT '0',
  `allowcensorword` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewip` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanip` tinyint(1) NOT NULL DEFAULT '0',
  `allowedituser` tinyint(1) NOT NULL DEFAULT '0',
  `allowmoduser` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanvisituser` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostannounce` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewlog` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanpost` tinyint(1) NOT NULL DEFAULT '0',
  `supe_allowpushthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowhighlightthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowdigestthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowrecommendthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowbumpthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowclosethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmovethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowedittypethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowstampthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowstamplist` tinyint(1) NOT NULL DEFAULT '0',
  `allowcopythread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmergethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowsplitthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowrepairthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowwarnpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewreport` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditforum` tinyint(1) NOT NULL DEFAULT '0',
  `allowremovereward` tinyint(1) NOT NULL DEFAULT '0',
  `allowedittrade` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditactivity` tinyint(1) NOT NULL DEFAULT '0',
  `allowstickreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowmanagearticle` tinyint(1) NOT NULL DEFAULT '0',
  `allowaddtopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowmanagetopic` tinyint(1) NOT NULL DEFAULT '0',
  `allowdiy` tinyint(1) NOT NULL DEFAULT '0',
  `allowclearrecycle` tinyint(1) NOT NULL DEFAULT '0',
  `allowmanagetag` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditusertag` tinyint(1) NOT NULL DEFAULT '0',
  `managefeed` tinyint(1) NOT NULL DEFAULT '0',
  `managedoing` tinyint(1) NOT NULL DEFAULT '0',
  `manageshare` tinyint(1) NOT NULL DEFAULT '0',
  `manageblog` tinyint(1) NOT NULL DEFAULT '0',
  `managealbum` tinyint(1) NOT NULL DEFAULT '0',
  `managecomment` tinyint(1) NOT NULL DEFAULT '0',
  `managemagiclog` tinyint(1) NOT NULL DEFAULT '0',
  `managereport` tinyint(1) NOT NULL DEFAULT '0',
  `managehotuser` tinyint(1) NOT NULL DEFAULT '0',
  `managedefaultuser` tinyint(1) NOT NULL DEFAULT '0',
  `managevideophoto` tinyint(1) NOT NULL DEFAULT '0',
  `managemagic` tinyint(1) NOT NULL DEFAULT '0',
  `manageclick` tinyint(1) NOT NULL DEFAULT '0',
  `allowmanagecollection` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_adminnote`
--

CREATE TABLE IF NOT EXISTS `wf_common_adminnote` (
  `id` mediumint(8) unsigned NOT NULL,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `adminid` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_advertisement`
--

CREATE TABLE IF NOT EXISTS `wf_common_advertisement` (
  `advid` mediumint(8) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `targets` text NOT NULL,
  `parameters` text NOT NULL,
  `code` text NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_advertisement_custom`
--

CREATE TABLE IF NOT EXISTS `wf_common_advertisement_custom` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_banned`
--

CREATE TABLE IF NOT EXISTS `wf_common_banned` (
  `id` smallint(6) unsigned NOT NULL,
  `ip1` smallint(3) NOT NULL DEFAULT '0',
  `ip2` smallint(3) NOT NULL DEFAULT '0',
  `ip3` smallint(3) NOT NULL DEFAULT '0',
  `ip4` smallint(3) NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block`
--

CREATE TABLE IF NOT EXISTS `wf_common_block` (
  `bid` mediumint(8) unsigned NOT NULL,
  `blockclass` varchar(255) NOT NULL DEFAULT '0',
  `blocktype` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` text NOT NULL,
  `classname` varchar(255) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blockstyle` text NOT NULL,
  `picwidth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `picheight` smallint(6) unsigned NOT NULL DEFAULT '0',
  `target` varchar(255) NOT NULL DEFAULT '',
  `dateformat` varchar(255) NOT NULL DEFAULT '',
  `dateuformat` tinyint(1) NOT NULL DEFAULT '0',
  `script` varchar(255) NOT NULL DEFAULT '',
  `param` text NOT NULL,
  `shownum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `cachetime` int(10) NOT NULL DEFAULT '0',
  `cachetimerange` char(5) NOT NULL DEFAULT '',
  `punctualupdate` tinyint(1) NOT NULL DEFAULT '0',
  `hidedisplay` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `notinherited` tinyint(1) NOT NULL DEFAULT '0',
  `isblank` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block_favorite`
--

CREATE TABLE IF NOT EXISTS `wf_common_block_favorite` (
  `favid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block_item`
--

CREATE TABLE IF NOT EXISTS `wf_common_block_item` (
  `itemid` int(10) unsigned NOT NULL,
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(255) NOT NULL DEFAULT '',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(255) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `makethumb` tinyint(1) NOT NULL DEFAULT '0',
  `thumbpath` varchar(255) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `showstyle` text NOT NULL,
  `related` text NOT NULL,
  `fields` text NOT NULL,
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block_item_data`
--

CREATE TABLE IF NOT EXISTS `wf_common_block_item_data` (
  `dataid` int(10) unsigned NOT NULL,
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(255) NOT NULL DEFAULT '',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(255) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `makethumb` tinyint(1) NOT NULL DEFAULT '0',
  `summary` text NOT NULL,
  `showstyle` text NOT NULL,
  `related` text NOT NULL,
  `fields` text NOT NULL,
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `isverified` tinyint(1) NOT NULL DEFAULT '0',
  `verifiedtime` int(10) unsigned NOT NULL DEFAULT '0',
  `stickgrade` tinyint(2) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block_permission`
--

CREATE TABLE IF NOT EXISTS `wf_common_block_permission` (
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allowmanage` tinyint(1) NOT NULL DEFAULT '0',
  `allowrecommend` tinyint(1) NOT NULL DEFAULT '0',
  `needverify` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedtplname` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block_pic`
--

CREATE TABLE IF NOT EXISTS `wf_common_block_pic` (
  `picid` int(10) unsigned NOT NULL,
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemid` int(10) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(255) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block_style`
--

CREATE TABLE IF NOT EXISTS `wf_common_block_style` (
  `styleid` smallint(6) unsigned NOT NULL,
  `blockclass` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '',
  `getpic` tinyint(1) NOT NULL DEFAULT '0',
  `getsummary` tinyint(1) NOT NULL DEFAULT '0',
  `makethumb` tinyint(1) NOT NULL DEFAULT '0',
  `settarget` tinyint(1) NOT NULL DEFAULT '0',
  `fields` text NOT NULL,
  `moreurl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_block_xml`
--

CREATE TABLE IF NOT EXISTS `wf_common_block_xml` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `clientid` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `signtype` varchar(255) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_cache`
--

CREATE TABLE IF NOT EXISTS `wf_common_cache` (
  `cachekey` varchar(255) NOT NULL DEFAULT '',
  `cachevalue` mediumblob NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_card`
--

CREATE TABLE IF NOT EXISTS `wf_common_card` (
  `id` char(255) NOT NULL DEFAULT '',
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '1',
  `maketype` tinyint(1) NOT NULL DEFAULT '0',
  `makeruid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extcreditskey` tinyint(1) NOT NULL DEFAULT '0',
  `extcreditsval` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `cleardateline` int(10) unsigned NOT NULL DEFAULT '0',
  `useddateline` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_card_log`
--

CREATE TABLE IF NOT EXISTS `wf_common_card_log` (
  `id` smallint(6) NOT NULL,
  `uid` mediumint(8) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `cardrule` varchar(255) NOT NULL DEFAULT '',
  `info` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `description` mediumtext NOT NULL,
  `operation` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_card_type`
--

CREATE TABLE IF NOT EXISTS `wf_common_card_type` (
  `id` smallint(6) NOT NULL,
  `typename` char(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_connect_guest`
--

CREATE TABLE IF NOT EXISTS `wf_common_connect_guest` (
  `conopenid` char(32) NOT NULL DEFAULT '',
  `conuin` char(40) NOT NULL DEFAULT '',
  `conuinsecret` char(16) NOT NULL DEFAULT '',
  `conqqnick` char(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_credit_log`
--

CREATE TABLE IF NOT EXISTS `wf_common_credit_log` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `operation` char(3) NOT NULL DEFAULT '',
  `relatedid` int(10) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `extcredits1` int(10) NOT NULL,
  `extcredits2` int(10) NOT NULL,
  `extcredits3` int(10) NOT NULL,
  `extcredits4` int(10) NOT NULL,
  `extcredits5` int(10) NOT NULL,
  `extcredits6` int(10) NOT NULL,
  `extcredits7` int(10) NOT NULL,
  `extcredits8` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_credit_rule`
--

CREATE TABLE IF NOT EXISTS `wf_common_credit_rule` (
  `rid` mediumint(8) unsigned NOT NULL,
  `rulename` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(20) NOT NULL DEFAULT '',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0',
  `cycletime` int(10) NOT NULL DEFAULT '0',
  `rewardnum` tinyint(2) NOT NULL DEFAULT '1',
  `norepeat` tinyint(1) NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `extcredits6` int(10) NOT NULL DEFAULT '0',
  `extcredits7` int(10) NOT NULL DEFAULT '0',
  `extcredits8` int(10) NOT NULL DEFAULT '0',
  `fids` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_credit_rule_log`
--

CREATE TABLE IF NOT EXISTS `wf_common_credit_rule_log` (
  `clid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cyclenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `extcredits6` int(10) NOT NULL DEFAULT '0',
  `extcredits7` int(10) NOT NULL DEFAULT '0',
  `extcredits8` int(10) NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_credit_rule_log_field`
--

CREATE TABLE IF NOT EXISTS `wf_common_credit_rule_log_field` (
  `clid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `user` text NOT NULL,
  `app` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_cron`
--

CREATE TABLE IF NOT EXISTS `wf_common_cron` (
  `cronid` smallint(6) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_devicetoken`
--

CREATE TABLE IF NOT EXISTS `wf_common_devicetoken` (
  `uid` mediumint(8) unsigned NOT NULL,
  `token` char(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_district`
--

CREATE TABLE IF NOT EXISTS `wf_common_district` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `usetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_diy_data`
--

CREATE TABLE IF NOT EXISTS `wf_common_diy_data` (
  `targettplname` varchar(100) NOT NULL DEFAULT '',
  `tpldirectory` varchar(80) NOT NULL DEFAULT '',
  `primaltplname` varchar(255) NOT NULL DEFAULT '',
  `diycontent` mediumtext NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_domain`
--

CREATE TABLE IF NOT EXISTS `wf_common_domain` (
  `domain` char(30) NOT NULL DEFAULT '',
  `domainroot` char(60) NOT NULL DEFAULT '',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_failedlogin`
--

CREATE TABLE IF NOT EXISTS `wf_common_failedlogin` (
  `ip` char(15) NOT NULL DEFAULT '',
  `username` char(32) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_friendlink`
--

CREATE TABLE IF NOT EXISTS `wf_common_friendlink` (
  `id` smallint(6) unsigned NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_grouppm`
--

CREATE TABLE IF NOT EXISTS `wf_common_grouppm` (
  `id` smallint(6) unsigned NOT NULL,
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `numbers` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_invite`
--

CREATE TABLE IF NOT EXISTS `wf_common_invite` (
  `id` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `code` char(20) NOT NULL DEFAULT '',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `email` char(40) NOT NULL DEFAULT '',
  `inviteip` char(15) NOT NULL DEFAULT '',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `regdateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `orderid` char(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_magic`
--

CREATE TABLE IF NOT EXISTS `wf_common_magic` (
  `magicid` smallint(6) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `identifier` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `salevolume` smallint(6) unsigned NOT NULL DEFAULT '0',
  `supplytype` tinyint(1) NOT NULL DEFAULT '0',
  `supplynum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `useperoid` tinyint(1) NOT NULL DEFAULT '0',
  `usenum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `magicperm` text NOT NULL,
  `useevent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_magiclog`
--

CREATE TABLE IF NOT EXISTS `wf_common_magiclog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `targetid` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` char(6) DEFAULT NULL,
  `targetuid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_mailcron`
--

CREATE TABLE IF NOT EXISTS `wf_common_mailcron` (
  `cid` mediumint(8) unsigned NOT NULL,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_mailqueue`
--

CREATE TABLE IF NOT EXISTS `wf_common_mailqueue` (
  `qid` mediumint(8) unsigned NOT NULL,
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member`
--

CREATE TABLE IF NOT EXISTS `wf_common_member` (
  `uid` mediumint(8) unsigned NOT NULL,
  `email` char(40) NOT NULL DEFAULT '',
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `emailstatus` tinyint(1) NOT NULL DEFAULT '0',
  `avatarstatus` tinyint(1) NOT NULL DEFAULT '0',
  `videophotostatus` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `groupexpiry` int(10) unsigned NOT NULL DEFAULT '0',
  `extgroupids` char(20) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `credits` int(10) NOT NULL DEFAULT '0',
  `notifysound` tinyint(1) NOT NULL DEFAULT '0',
  `timeoffset` char(4) NOT NULL DEFAULT '',
  `newpm` smallint(6) unsigned NOT NULL DEFAULT '0',
  `newprompt` smallint(6) unsigned NOT NULL DEFAULT '0',
  `accessmasks` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincp` tinyint(1) NOT NULL DEFAULT '0',
  `onlyacceptfriendpm` tinyint(1) NOT NULL DEFAULT '0',
  `conisbind` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clickNum` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_action_log`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_action_log` (
  `id` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(5) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_archive`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_archive` (
  `uid` mediumint(8) unsigned NOT NULL,
  `email` char(40) NOT NULL DEFAULT '',
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `emailstatus` tinyint(1) NOT NULL DEFAULT '0',
  `avatarstatus` tinyint(1) NOT NULL DEFAULT '0',
  `videophotostatus` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `groupexpiry` int(10) unsigned NOT NULL DEFAULT '0',
  `extgroupids` char(20) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `credits` int(10) NOT NULL DEFAULT '0',
  `notifysound` tinyint(1) NOT NULL DEFAULT '0',
  `timeoffset` char(4) NOT NULL DEFAULT '',
  `newpm` smallint(6) unsigned NOT NULL DEFAULT '0',
  `newprompt` smallint(6) unsigned NOT NULL DEFAULT '0',
  `accessmasks` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincp` tinyint(1) NOT NULL DEFAULT '0',
  `onlyacceptfriendpm` tinyint(1) NOT NULL DEFAULT '0',
  `conisbind` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_connect`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_connect` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `conuin` char(40) NOT NULL DEFAULT '',
  `conuinsecret` char(16) NOT NULL DEFAULT '',
  `conopenid` char(32) NOT NULL DEFAULT '',
  `conisfeed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `conispublishfeed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `conispublisht` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `conisregister` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `conisqzoneavatar` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `conisqqshow` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_count`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_count` (
  `uid` mediumint(8) unsigned NOT NULL,
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `extcredits6` int(10) NOT NULL DEFAULT '0',
  `extcredits7` int(10) NOT NULL DEFAULT '0',
  `extcredits8` int(10) NOT NULL DEFAULT '0',
  `friends` smallint(6) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `digestposts` smallint(6) unsigned NOT NULL DEFAULT '0',
  `doings` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blogs` smallint(6) unsigned NOT NULL DEFAULT '0',
  `albums` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sharings` smallint(6) unsigned NOT NULL DEFAULT '0',
  `attachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `oltime` smallint(6) unsigned NOT NULL DEFAULT '0',
  `todayattachs` smallint(6) unsigned NOT NULL DEFAULT '0',
  `todayattachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `feeds` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `follower` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `following` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `newfollower` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_count_archive`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_count_archive` (
  `uid` mediumint(8) unsigned NOT NULL,
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `extcredits6` int(10) NOT NULL DEFAULT '0',
  `extcredits7` int(10) NOT NULL DEFAULT '0',
  `extcredits8` int(10) NOT NULL DEFAULT '0',
  `friends` smallint(6) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `digestposts` smallint(6) unsigned NOT NULL DEFAULT '0',
  `doings` smallint(6) unsigned NOT NULL DEFAULT '0',
  `blogs` smallint(6) unsigned NOT NULL DEFAULT '0',
  `albums` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sharings` smallint(6) unsigned NOT NULL DEFAULT '0',
  `attachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `oltime` smallint(6) unsigned NOT NULL DEFAULT '0',
  `todayattachs` smallint(6) unsigned NOT NULL DEFAULT '0',
  `todayattachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `feeds` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `follower` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `following` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `newfollower` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_crime`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_crime` (
  `cid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `operatorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `operator` varchar(15) NOT NULL,
  `action` tinyint(5) NOT NULL,
  `reason` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_field_forum`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_field_forum` (
  `uid` mediumint(8) unsigned NOT NULL,
  `publishfeed` tinyint(3) NOT NULL DEFAULT '0',
  `customshow` tinyint(1) unsigned NOT NULL DEFAULT '26',
  `customstatus` varchar(30) NOT NULL DEFAULT '',
  `medals` text NOT NULL,
  `sightml` text NOT NULL,
  `groupterms` text NOT NULL,
  `authstr` varchar(20) NOT NULL DEFAULT '',
  `groups` mediumtext NOT NULL,
  `attentiongroup` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_field_forum_archive`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_field_forum_archive` (
  `uid` mediumint(8) unsigned NOT NULL,
  `publishfeed` tinyint(3) NOT NULL DEFAULT '0',
  `customshow` tinyint(1) unsigned NOT NULL DEFAULT '26',
  `customstatus` varchar(30) NOT NULL DEFAULT '',
  `medals` text NOT NULL,
  `sightml` text NOT NULL,
  `groupterms` text NOT NULL,
  `authstr` varchar(20) NOT NULL DEFAULT '',
  `groups` mediumtext NOT NULL,
  `attentiongroup` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_field_home`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_field_home` (
  `uid` mediumint(8) unsigned NOT NULL,
  `videophoto` varchar(255) NOT NULL DEFAULT '',
  `spacename` varchar(255) NOT NULL DEFAULT '',
  `spacedescription` varchar(255) NOT NULL DEFAULT '',
  `domain` char(15) NOT NULL DEFAULT '',
  `addsize` int(10) unsigned NOT NULL DEFAULT '0',
  `addfriend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `menunum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL DEFAULT '',
  `spacecss` text NOT NULL,
  `blockposition` text NOT NULL,
  `recentnote` text NOT NULL,
  `spacenote` text NOT NULL,
  `privacy` text NOT NULL,
  `feedfriend` mediumtext NOT NULL,
  `acceptemail` text NOT NULL,
  `magicgift` text NOT NULL,
  `stickblogs` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_field_home_archive`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_field_home_archive` (
  `uid` mediumint(8) unsigned NOT NULL,
  `videophoto` varchar(255) NOT NULL DEFAULT '',
  `spacename` varchar(255) NOT NULL DEFAULT '',
  `spacedescription` varchar(255) NOT NULL DEFAULT '',
  `domain` char(15) NOT NULL DEFAULT '',
  `addsize` int(10) unsigned NOT NULL DEFAULT '0',
  `addfriend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `menunum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL DEFAULT '',
  `spacecss` text NOT NULL,
  `blockposition` text NOT NULL,
  `recentnote` text NOT NULL,
  `spacenote` text NOT NULL,
  `privacy` text NOT NULL,
  `feedfriend` mediumtext NOT NULL,
  `acceptemail` text NOT NULL,
  `magicgift` text NOT NULL,
  `stickblogs` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_grouppm`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_grouppm` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gpmid` smallint(6) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_log`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_log` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_magic`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_magic` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_medal`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_medal` (
  `uid` mediumint(8) unsigned NOT NULL,
  `medalid` smallint(6) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_profile`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_profile` (
  `uid` mediumint(8) unsigned NOT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birthyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `birthmonth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `constellation` varchar(255) NOT NULL DEFAULT '',
  `zodiac` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `idcardtype` varchar(255) NOT NULL DEFAULT '',
  `idcard` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(255) NOT NULL DEFAULT '',
  `nationality` varchar(255) NOT NULL DEFAULT '',
  `birthprovince` varchar(255) NOT NULL DEFAULT '',
  `birthcity` varchar(255) NOT NULL DEFAULT '',
  `birthdist` varchar(20) NOT NULL DEFAULT '',
  `birthcommunity` varchar(255) NOT NULL DEFAULT '',
  `resideprovince` varchar(255) NOT NULL DEFAULT '',
  `residecity` varchar(255) NOT NULL DEFAULT '',
  `residedist` varchar(20) NOT NULL DEFAULT '',
  `residecommunity` varchar(255) NOT NULL DEFAULT '',
  `residesuite` varchar(255) NOT NULL DEFAULT '',
  `graduateschool` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `education` varchar(255) NOT NULL DEFAULT '',
  `occupation` varchar(255) NOT NULL DEFAULT '',
  `position` varchar(255) NOT NULL DEFAULT '',
  `revenue` varchar(255) NOT NULL DEFAULT '',
  `affectivestatus` varchar(255) NOT NULL DEFAULT '',
  `lookingfor` varchar(255) NOT NULL DEFAULT '',
  `bloodtype` varchar(255) NOT NULL DEFAULT '',
  `height` varchar(255) NOT NULL DEFAULT '',
  `weight` varchar(255) NOT NULL DEFAULT '',
  `alipay` varchar(255) NOT NULL DEFAULT '',
  `icq` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(255) NOT NULL DEFAULT '',
  `yahoo` varchar(255) NOT NULL DEFAULT '',
  `msn` varchar(255) NOT NULL DEFAULT '',
  `taobao` varchar(255) NOT NULL DEFAULT '',
  `site` varchar(255) NOT NULL DEFAULT '',
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `field1` text NOT NULL,
  `field2` text NOT NULL,
  `field3` text NOT NULL,
  `field4` text NOT NULL,
  `field5` text NOT NULL,
  `field6` text NOT NULL,
  `field7` text NOT NULL,
  `field8` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_profile_archive`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_profile_archive` (
  `uid` mediumint(8) unsigned NOT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birthyear` smallint(6) unsigned NOT NULL DEFAULT '0',
  `birthmonth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `constellation` varchar(255) NOT NULL DEFAULT '',
  `zodiac` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `idcardtype` varchar(255) NOT NULL DEFAULT '',
  `idcard` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(255) NOT NULL DEFAULT '',
  `nationality` varchar(255) NOT NULL DEFAULT '',
  `birthprovince` varchar(255) NOT NULL DEFAULT '',
  `birthcity` varchar(255) NOT NULL DEFAULT '',
  `birthdist` varchar(20) NOT NULL DEFAULT '',
  `birthcommunity` varchar(255) NOT NULL DEFAULT '',
  `resideprovince` varchar(255) NOT NULL DEFAULT '',
  `residecity` varchar(255) NOT NULL DEFAULT '',
  `residedist` varchar(20) NOT NULL DEFAULT '',
  `residecommunity` varchar(255) NOT NULL DEFAULT '',
  `residesuite` varchar(255) NOT NULL DEFAULT '',
  `graduateschool` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `education` varchar(255) NOT NULL DEFAULT '',
  `occupation` varchar(255) NOT NULL DEFAULT '',
  `position` varchar(255) NOT NULL DEFAULT '',
  `revenue` varchar(255) NOT NULL DEFAULT '',
  `affectivestatus` varchar(255) NOT NULL DEFAULT '',
  `lookingfor` varchar(255) NOT NULL DEFAULT '',
  `bloodtype` varchar(255) NOT NULL DEFAULT '',
  `height` varchar(255) NOT NULL DEFAULT '',
  `weight` varchar(255) NOT NULL DEFAULT '',
  `alipay` varchar(255) NOT NULL DEFAULT '',
  `icq` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(255) NOT NULL DEFAULT '',
  `yahoo` varchar(255) NOT NULL DEFAULT '',
  `msn` varchar(255) NOT NULL DEFAULT '',
  `taobao` varchar(255) NOT NULL DEFAULT '',
  `site` varchar(255) NOT NULL DEFAULT '',
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `field1` text NOT NULL,
  `field2` text NOT NULL,
  `field3` text NOT NULL,
  `field4` text NOT NULL,
  `field5` text NOT NULL,
  `field6` text NOT NULL,
  `field7` text NOT NULL,
  `field8` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_profile_setting`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_profile_setting` (
  `fieldid` varchar(255) NOT NULL DEFAULT '',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `needverify` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `unchangeable` tinyint(1) NOT NULL DEFAULT '0',
  `showincard` tinyint(1) NOT NULL DEFAULT '0',
  `showinthread` tinyint(1) NOT NULL DEFAULT '0',
  `showinregister` tinyint(1) NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0',
  `formtype` varchar(255) NOT NULL,
  `size` smallint(6) unsigned NOT NULL DEFAULT '0',
  `choices` text NOT NULL,
  `validate` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_security`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_security` (
  `securityid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `fieldid` varchar(255) NOT NULL DEFAULT '',
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_status`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_status` (
  `uid` mediumint(8) unsigned NOT NULL,
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsendmail` int(10) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `buyercredit` smallint(6) NOT NULL DEFAULT '0',
  `sellercredit` smallint(6) NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `profileprogress` tinyint(2) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_status_archive`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_status_archive` (
  `uid` mediumint(8) unsigned NOT NULL,
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsendmail` int(10) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `buyercredit` smallint(6) NOT NULL DEFAULT '0',
  `sellercredit` smallint(6) NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `profileprogress` tinyint(2) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_stat_field`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_stat_field` (
  `optionid` mediumint(8) unsigned NOT NULL,
  `fieldid` varchar(255) NOT NULL DEFAULT '',
  `fieldvalue` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(255) NOT NULL DEFAULT '',
  `users` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_stat_fieldcache`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_stat_fieldcache` (
  `optionid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_stat_search`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_stat_search` (
  `optionid` mediumint(8) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `condition` text NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '',
  `users` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_stat_searchcache`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_stat_searchcache` (
  `optionid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_validate`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_validate` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `submitdate` int(10) unsigned NOT NULL DEFAULT '0',
  `moddate` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `submittimes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `remark` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_verify`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_verify` (
  `uid` mediumint(8) unsigned NOT NULL,
  `verify1` tinyint(1) NOT NULL DEFAULT '0',
  `verify2` tinyint(1) NOT NULL DEFAULT '0',
  `verify3` tinyint(1) NOT NULL DEFAULT '0',
  `verify4` tinyint(1) NOT NULL DEFAULT '0',
  `verify5` tinyint(1) NOT NULL DEFAULT '0',
  `verify6` tinyint(1) NOT NULL DEFAULT '0',
  `verify7` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_member_verify_info`
--

CREATE TABLE IF NOT EXISTS `wf_common_member_verify_info` (
  `vid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `verifytype` tinyint(1) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `field` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_common_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_myapp`
--

CREATE TABLE IF NOT EXISTS `wf_common_myapp` (
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userpanelarea` tinyint(1) NOT NULL DEFAULT '0',
  `canvastitle` varchar(60) NOT NULL DEFAULT '',
  `fullscreen` tinyint(1) NOT NULL DEFAULT '0',
  `displayuserpanel` tinyint(1) NOT NULL DEFAULT '0',
  `displaymethod` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `appstatus` tinyint(2) NOT NULL DEFAULT '0',
  `iconstatus` tinyint(2) NOT NULL DEFAULT '0',
  `icondowntime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_myinvite`
--

CREATE TABLE IF NOT EXISTS `wf_common_myinvite` (
  `id` mediumint(8) unsigned NOT NULL,
  `typename` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `myml` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_mytask`
--

CREATE TABLE IF NOT EXISTS `wf_common_mytask` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `taskid` smallint(6) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `csc` char(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_nav`
--

CREATE TABLE IF NOT EXISTS `wf_common_nav` (
  `id` smallint(6) unsigned NOT NULL,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL,
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `subtype` tinyint(1) NOT NULL DEFAULT '0',
  `subcols` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL,
  `subname` varchar(255) NOT NULL,
  `suburl` varchar(255) NOT NULL,
  `navtype` tinyint(1) NOT NULL DEFAULT '0',
  `logo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_onlinetime`
--

CREATE TABLE IF NOT EXISTS `wf_common_onlinetime` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `thismonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_patch`
--

CREATE TABLE IF NOT EXISTS `wf_common_patch` (
  `serial` varchar(10) NOT NULL DEFAULT '',
  `rule` text NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_plugin`
--

CREATE TABLE IF NOT EXISTS `wf_common_plugin` (
  `pluginid` smallint(6) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `identifier` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `datatables` varchar(255) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  `modules` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_pluginvar`
--

CREATE TABLE IF NOT EXISTS `wf_common_pluginvar` (
  `pluginvarid` mediumint(8) unsigned NOT NULL,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `extra` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_process`
--

CREATE TABLE IF NOT EXISTS `wf_common_process` (
  `processid` char(32) NOT NULL,
  `expiry` int(10) DEFAULT NULL,
  `extra` int(10) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_regip`
--

CREATE TABLE IF NOT EXISTS `wf_common_regip` (
  `ip` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `count` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_relatedlink`
--

CREATE TABLE IF NOT EXISTS `wf_common_relatedlink` (
  `id` smallint(6) unsigned NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `extent` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_report`
--

CREATE TABLE IF NOT EXISTS `wf_common_report` (
  `id` mediumint(8) unsigned NOT NULL,
  `urlkey` char(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '1',
  `opuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opname` varchar(15) NOT NULL DEFAULT '',
  `optime` int(10) unsigned NOT NULL DEFAULT '0',
  `opresult` varchar(255) NOT NULL DEFAULT '',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_searchindex`
--

CREATE TABLE IF NOT EXISTS `wf_common_searchindex` (
  `searchid` int(10) unsigned NOT NULL,
  `srchmod` tinyint(3) unsigned NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `searchstring` text NOT NULL,
  `useip` varchar(15) NOT NULL DEFAULT '',
  `uid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `threadsortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `ids` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_secquestion`
--

CREATE TABLE IF NOT EXISTS `wf_common_secquestion` (
  `id` smallint(6) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_session`
--

CREATE TABLE IF NOT EXISTS `wf_common_session` (
  `sid` char(6) NOT NULL DEFAULT '',
  `ip1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastolupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_setting`
--

CREATE TABLE IF NOT EXISTS `wf_common_setting` (
  `skey` varchar(255) NOT NULL DEFAULT '',
  `svalue` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_smiley`
--

CREATE TABLE IF NOT EXISTS `wf_common_smiley` (
  `id` smallint(6) unsigned NOT NULL,
  `typeid` smallint(6) unsigned NOT NULL,
  `displayorder` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('smiley','stamp','stamplist') NOT NULL DEFAULT 'smiley',
  `code` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_sphinxcounter`
--

CREATE TABLE IF NOT EXISTS `wf_common_sphinxcounter` (
  `indexid` tinyint(1) NOT NULL,
  `maxid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_stat`
--

CREATE TABLE IF NOT EXISTS `wf_common_stat` (
  `daytime` int(10) unsigned NOT NULL DEFAULT '0',
  `login` int(10) unsigned NOT NULL DEFAULT '0',
  `mobilelogin` int(10) unsigned NOT NULL DEFAULT '0',
  `connectlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `register` int(10) unsigned NOT NULL DEFAULT '0',
  `invite` int(10) unsigned NOT NULL DEFAULT '0',
  `appinvite` int(10) unsigned NOT NULL DEFAULT '0',
  `doing` int(10) unsigned NOT NULL DEFAULT '0',
  `blog` int(10) unsigned NOT NULL DEFAULT '0',
  `pic` int(10) unsigned NOT NULL DEFAULT '0',
  `poll` int(10) unsigned NOT NULL DEFAULT '0',
  `activity` int(10) unsigned NOT NULL DEFAULT '0',
  `share` int(10) unsigned NOT NULL DEFAULT '0',
  `thread` int(10) unsigned NOT NULL DEFAULT '0',
  `docomment` int(10) unsigned NOT NULL DEFAULT '0',
  `blogcomment` int(10) unsigned NOT NULL DEFAULT '0',
  `piccomment` int(10) unsigned NOT NULL DEFAULT '0',
  `sharecomment` int(10) unsigned NOT NULL DEFAULT '0',
  `reward` int(10) unsigned NOT NULL DEFAULT '0',
  `debate` int(10) unsigned NOT NULL DEFAULT '0',
  `trade` int(10) unsigned NOT NULL DEFAULT '0',
  `group` int(10) unsigned NOT NULL DEFAULT '0',
  `groupjoin` int(10) unsigned NOT NULL DEFAULT '0',
  `groupthread` int(10) unsigned NOT NULL DEFAULT '0',
  `grouppost` int(10) unsigned NOT NULL DEFAULT '0',
  `post` int(10) unsigned NOT NULL DEFAULT '0',
  `wall` int(10) unsigned NOT NULL DEFAULT '0',
  `poke` int(10) unsigned NOT NULL DEFAULT '0',
  `click` int(10) unsigned NOT NULL DEFAULT '0',
  `sendpm` int(10) unsigned NOT NULL DEFAULT '0',
  `friend` int(10) unsigned NOT NULL DEFAULT '0',
  `addfriend` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_statuser`
--

CREATE TABLE IF NOT EXISTS `wf_common_statuser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `daytime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` char(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_style`
--

CREATE TABLE IF NOT EXISTS `wf_common_style` (
  `styleid` smallint(6) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `templateid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `extstyle` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_stylevar`
--

CREATE TABLE IF NOT EXISTS `wf_common_stylevar` (
  `stylevarid` smallint(6) unsigned NOT NULL,
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `variable` text NOT NULL,
  `substitute` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_syscache`
--

CREATE TABLE IF NOT EXISTS `wf_common_syscache` (
  `cname` varchar(32) NOT NULL,
  `ctype` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `data` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_tag`
--

CREATE TABLE IF NOT EXISTS `wf_common_tag` (
  `tagid` smallint(6) unsigned NOT NULL,
  `tagname` char(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_tagitem`
--

CREATE TABLE IF NOT EXISTS `wf_common_tagitem` (
  `tagid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tagname` varchar(20) NOT NULL DEFAULT '',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` char(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_task`
--

CREATE TABLE IF NOT EXISTS `wf_common_task` (
  `taskid` smallint(6) unsigned NOT NULL,
  `relatedtaskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `icon` varchar(150) NOT NULL DEFAULT '',
  `applicants` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `achievers` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tasklimits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `applyperm` text NOT NULL,
  `scriptname` varchar(50) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `period` int(10) unsigned NOT NULL DEFAULT '0',
  `periodtype` tinyint(1) NOT NULL DEFAULT '0',
  `reward` enum('credit','magic','medal','invite','group') NOT NULL DEFAULT 'credit',
  `prize` varchar(15) NOT NULL DEFAULT '',
  `bonus` int(10) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `version` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_taskvar`
--

CREATE TABLE IF NOT EXISTS `wf_common_taskvar` (
  `taskvarid` mediumint(8) unsigned NOT NULL,
  `taskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sort` enum('apply','complete') NOT NULL DEFAULT 'complete',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_template`
--

CREATE TABLE IF NOT EXISTS `wf_common_template` (
  `templateid` smallint(6) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_template_block`
--

CREATE TABLE IF NOT EXISTS `wf_common_template_block` (
  `targettplname` varchar(100) NOT NULL DEFAULT '',
  `tpldirectory` varchar(80) NOT NULL DEFAULT '',
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_template_permission`
--

CREATE TABLE IF NOT EXISTS `wf_common_template_permission` (
  `targettplname` varchar(100) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allowmanage` tinyint(1) NOT NULL DEFAULT '0',
  `allowrecommend` tinyint(1) NOT NULL DEFAULT '0',
  `needverify` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedtplname` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_uin_black`
--

CREATE TABLE IF NOT EXISTS `wf_common_uin_black` (
  `uin` char(40) NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_usergroup`
--

CREATE TABLE IF NOT EXISTS `wf_common_usergroup` (
  `groupid` smallint(6) unsigned NOT NULL,
  `radminid` tinyint(3) NOT NULL DEFAULT '0',
  `type` enum('system','special','member') NOT NULL DEFAULT 'member',
  `system` varchar(255) NOT NULL DEFAULT 'private',
  `grouptitle` varchar(255) NOT NULL DEFAULT '',
  `creditshigher` int(10) NOT NULL DEFAULT '0',
  `creditslower` int(10) NOT NULL DEFAULT '0',
  `stars` tinyint(3) NOT NULL DEFAULT '0',
  `color` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `allowvisit` tinyint(1) NOT NULL DEFAULT '0',
  `allowsendpm` tinyint(1) NOT NULL DEFAULT '1',
  `allowinvite` tinyint(1) NOT NULL DEFAULT '0',
  `allowmailinvite` tinyint(1) NOT NULL DEFAULT '0',
  `maxinvitenum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `inviteprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxinviteday` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_usergroup_field`
--

CREATE TABLE IF NOT EXISTS `wf_common_usergroup_field` (
  `groupid` smallint(6) unsigned NOT NULL,
  `readaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostreward` tinyint(1) NOT NULL DEFAULT '0',
  `allowposttrade` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostactivity` tinyint(1) NOT NULL DEFAULT '0',
  `allowdirectpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetimage` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostimage` tinyint(1) NOT NULL DEFAULT '0',
  `allowvote` tinyint(1) NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0',
  `allowcstatus` tinyint(1) NOT NULL DEFAULT '0',
  `allowinvisible` tinyint(1) NOT NULL DEFAULT '0',
  `allowtransfer` tinyint(1) NOT NULL DEFAULT '0',
  `allowsetreadperm` tinyint(1) NOT NULL DEFAULT '0',
  `allowsetattachperm` tinyint(1) NOT NULL DEFAULT '0',
  `allowposttag` tinyint(1) NOT NULL DEFAULT '0',
  `allowhidecode` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allowsigbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowsigimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowmagics` tinyint(1) unsigned NOT NULL,
  `disableperiodctrl` tinyint(1) NOT NULL DEFAULT '0',
  `reasonpm` tinyint(1) NOT NULL DEFAULT '0',
  `maxprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxsigsize` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxattachsize` int(10) unsigned NOT NULL DEFAULT '0',
  `maxsizeperday` int(10) unsigned NOT NULL DEFAULT '0',
  `maxthreadsperhour` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `maxpostsperhour` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachextensions` char(100) NOT NULL DEFAULT '',
  `raterange` char(150) NOT NULL DEFAULT '',
  `mintradeprice` smallint(6) unsigned NOT NULL DEFAULT '1',
  `maxtradeprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `minrewardprice` smallint(6) unsigned NOT NULL DEFAULT '1',
  `maxrewardprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `magicsdiscount` tinyint(1) NOT NULL,
  `maxmagicsweight` smallint(6) unsigned NOT NULL,
  `allowpostdebate` tinyint(1) NOT NULL DEFAULT '0',
  `tradestick` tinyint(1) unsigned NOT NULL,
  `exempt` tinyint(1) unsigned NOT NULL,
  `maxattachnum` smallint(6) NOT NULL DEFAULT '0',
  `allowposturl` tinyint(1) NOT NULL DEFAULT '3',
  `allowrecommend` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowpostrushreply` tinyint(1) NOT NULL DEFAULT '0',
  `maxfriendnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxspacesize` int(10) unsigned NOT NULL DEFAULT '0',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '0',
  `allowcommentarticle` smallint(6) NOT NULL DEFAULT '0',
  `searchinterval` smallint(6) unsigned NOT NULL DEFAULT '0',
  `searchignore` tinyint(1) NOT NULL DEFAULT '0',
  `allowblog` tinyint(1) NOT NULL DEFAULT '0',
  `allowdoing` tinyint(1) NOT NULL DEFAULT '0',
  `allowupload` tinyint(1) NOT NULL DEFAULT '0',
  `allowshare` tinyint(1) NOT NULL DEFAULT '0',
  `allowblogmod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowdoingmod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowuploadmod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowsharemod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowcss` tinyint(1) NOT NULL DEFAULT '0',
  `allowpoke` tinyint(1) NOT NULL DEFAULT '0',
  `allowfriend` tinyint(1) NOT NULL DEFAULT '0',
  `allowclick` tinyint(1) NOT NULL DEFAULT '0',
  `allowmagic` tinyint(1) NOT NULL DEFAULT '0',
  `allowstat` tinyint(1) NOT NULL DEFAULT '0',
  `allowstatdata` tinyint(1) NOT NULL DEFAULT '0',
  `videophotoignore` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewvideophoto` tinyint(1) NOT NULL DEFAULT '0',
  `allowmyop` tinyint(1) NOT NULL DEFAULT '0',
  `magicdiscount` tinyint(1) NOT NULL DEFAULT '0',
  `domainlength` smallint(6) unsigned NOT NULL DEFAULT '0',
  `seccode` tinyint(1) NOT NULL DEFAULT '1',
  `disablepostctrl` tinyint(1) NOT NULL DEFAULT '0',
  `allowbuildgroup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowgroupdirectpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowgroupposturl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `edittimelimit` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowpostarticle` tinyint(1) NOT NULL DEFAULT '0',
  `allowdownlocalimg` tinyint(1) NOT NULL DEFAULT '0',
  `allowdownremoteimg` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostarticlemod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowspacediyhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowspacediybbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowspacediyimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowcommentpost` tinyint(1) NOT NULL DEFAULT '2',
  `allowcommentitem` tinyint(1) NOT NULL DEFAULT '0',
  `allowcommentreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowreplycredit` tinyint(1) NOT NULL DEFAULT '0',
  `ignorecensor` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowsendallpm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowsendpmmaxnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maximagesize` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allowmediacode` tinyint(1) NOT NULL DEFAULT '0',
  `allowat` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowsetpublishdate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowfollowcollection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowcommentcollection` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowcreatecollection` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_word`
--

CREATE TABLE IF NOT EXISTS `wf_common_word` (
  `id` smallint(6) unsigned NOT NULL,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '1',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `extra` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_common_word_type`
--

CREATE TABLE IF NOT EXISTS `wf_common_word_type` (
  `id` smallint(6) unsigned NOT NULL,
  `typename` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_company`
--

CREATE TABLE IF NOT EXISTS `wf_company` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `xin` tinyint(1) NOT NULL DEFAULT '0',
  `logo` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `fax` varchar(12) NOT NULL DEFAULT '',
  `joinTim` int(11) NOT NULL DEFAULT '0',
  `startTim` int(11) NOT NULL DEFAULT '0',
  `endTim` int(11) NOT NULL DEFAULT '0',
  `coopStatus` tinyint(1) NOT NULL DEFAULT '0',
  `marketPrice` varchar(255) NOT NULL DEFAULT '',
  `shopPrice` varchar(255) NOT NULL DEFAULT '',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `isIndex` tinyint(1) NOT NULL DEFAULT '0',
  `isTop` tinyint(1) NOT NULL DEFAULT '0',
  `isRec` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_complain`
--

CREATE TABLE IF NOT EXISTS `wf_complain` (
  `id` int(11) NOT NULL,
  `pId` int(11) NOT NULL DEFAULT '0',
  `buildingName` varchar(100) NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `isRead` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_comp_joins`
--

CREATE TABLE IF NOT EXISTS `wf_comp_joins` (
  `id` int(11) NOT NULL,
  `compName` varchar(30) NOT NULL DEFAULT '',
  `industry` varchar(40) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `addTim` int(11) NOT NULL DEFAULT '0',
  `visitStatus` tinyint(1) NOT NULL DEFAULT '1',
  `visitTim` int(11) NOT NULL DEFAULT '0',
  `visitNotes` varchar(1000) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `isCoop` tinyint(1) NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_connect_disktask`
--

CREATE TABLE IF NOT EXISTS `wf_connect_disktask` (
  `taskid` int(10) unsigned NOT NULL,
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` char(32) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `verifycode` char(32) NOT NULL DEFAULT '',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `downloadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `extra` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_connect_feedlog`
--

CREATE TABLE IF NOT EXISTS `wf_connect_feedlog` (
  `flid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `publishtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpublished` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_connect_memberbindlog`
--

CREATE TABLE IF NOT EXISTS `wf_connect_memberbindlog` (
  `mblid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uin` char(40) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_connect_postfeedlog`
--

CREATE TABLE IF NOT EXISTS `wf_connect_postfeedlog` (
  `flid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `publishtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpublished` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_connect_tlog`
--

CREATE TABLE IF NOT EXISTS `wf_connect_tlog` (
  `tlid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `publishtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpublished` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_connect_tthreadlog`
--

CREATE TABLE IF NOT EXISTS `wf_connect_tthreadlog` (
  `twid` char(16) NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `conopenid` char(32) NOT NULL,
  `pagetime` int(10) unsigned DEFAULT '0',
  `lasttwid` char(16) DEFAULT NULL,
  `nexttime` int(10) unsigned DEFAULT '0',
  `updatetime` int(10) unsigned DEFAULT '0',
  `dateline` int(10) unsigned DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_cost`
--

CREATE TABLE IF NOT EXISTS `wf_cost` (
  `id` int(11) unsigned NOT NULL,
  `project_id` int(6) unsigned NOT NULL COMMENT '项目id',
  `region_id` int(6) unsigned NOT NULL COMMENT '区域id',
  `place_id` int(6) unsigned NOT NULL COMMENT '办事处/门店/宿舍id',
  `cat_id` int(6) unsigned NOT NULL COMMENT '费用类别id',
  `unit_id` int(6) unsigned NOT NULL COMMENT '单位id',
  `month` int(10) unsigned NOT NULL COMMENT '使用月份，不用id了，用这个',
  `month_id` int(6) unsigned NOT NULL COMMENT '月份id',
  `invoice_id` int(6) unsigned NOT NULL COMMENT '发票类型id',
  `city_id` int(6) unsigned NOT NULL COMMENT '城市id',
  `address_id` int(6) unsigned NOT NULL COMMENT '地址id',
  `spec` varchar(255) NOT NULL COMMENT '规格',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `number` double(10,2) NOT NULL COMMENT '数量',
  `total_price` decimal(10,2) NOT NULL COMMENT '金额',
  `handle_at` int(10) unsigned NOT NULL COMMENT '办理时间',
  `handle_by` varchar(50) NOT NULL COMMENT '办理人',
  `ps` varchar(255) NOT NULL COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政费用统计表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_cost_category`
--

CREATE TABLE IF NOT EXISTS `wf_cost_category` (
  `id` int(6) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `pid` int(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '层级',
  `cid` tinyint(3) unsigned NOT NULL COMMENT '1项目，2区域3，办事处/门店/宿舍，4费用，5单位，6月份，7发票，8城市，9地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='行政费用类别表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_arrangers`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_arrangers` (
  `id` int(10) unsigned NOT NULL,
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0',
  `arrangeName` varchar(30) NOT NULL DEFAULT '',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `timeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `isBargain` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_client`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_client` (
  `id` smallint(8) unsigned NOT NULL,
  `clientId` int(6) unsigned NOT NULL DEFAULT '0',
  `clientName` char(15) NOT NULL DEFAULT '',
  `clientFrom` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1、我房网;2、后台添加;3、分销客户;4、渠道客户;5、案场客户;6、转介绍;7、其他',
  `clientLevel` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1一般客户，2重要客户，3意向客户',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `tel` char(32) NOT NULL DEFAULT '',
  `otherPhone` varchar(32) NOT NULL DEFAULT '0',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `province` smallint(6) unsigned NOT NULL DEFAULT '0',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tenderStatus` tinyint(1) NOT NULL DEFAULT '1',
  `tenderDate` int(11) NOT NULL DEFAULT '0',
  `topic` varchar(80) NOT NULL DEFAULT '',
  `provinceHome` smallint(6) unsigned NOT NULL DEFAULT '0',
  `cityHome` smallint(6) unsigned NOT NULL DEFAULT '0',
  `countyHome` smallint(6) unsigned NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '',
  `area` float(7,2) unsigned NOT NULL DEFAULT '0.00',
  `budget` varchar(11) NOT NULL DEFAULT '0',
  `budgetType` tinyint(1) NOT NULL DEFAULT '0',
  `decDate` varchar(90) NOT NULL DEFAULT '',
  `finishAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '交房时间',
  `remark` varchar(500) NOT NULL DEFAULT '',
  `message` varchar(500) NOT NULL DEFAULT '',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `changeAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `roomType` varchar(30) NOT NULL DEFAULT '',
  `bidNum` mediumint(8) NOT NULL DEFAULT '0',
  `isDeal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0、未合作；1、合作中；2已成交；3、待合作',
  `lastVisitDate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次回访时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_client_apply`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_client_apply` (
  `id` mediumint(8) NOT NULL,
  `clientId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clientName` char(15) NOT NULL DEFAULT '',
  `tel` char(32) NOT NULL DEFAULT '',
  `companyId` mediumint(8) NOT NULL DEFAULT '0',
  `askDate` int(10) unsigned NOT NULL DEFAULT '0',
  `isVisit` tinyint(1) NOT NULL DEFAULT '0',
  `isPass` tinyint(1) NOT NULL DEFAULT '0',
  `askStatus` tinyint(1) NOT NULL DEFAULT '0',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `updatedAt` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `ip` char(15) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_company_apply`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_company_apply` (
  `id` mediumint(8) NOT NULL,
  `clientId` mediumint(8) NOT NULL DEFAULT '0',
  `companyId` mediumint(8) NOT NULL DEFAULT '0',
  `companyName` varchar(50) NOT NULL DEFAULT '',
  `province` smallint(6) unsigned NOT NULL DEFAULT '0',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0',
  `county` smallint(6) unsigned NOT NULL DEFAULT '0',
  `contacts` char(15) NOT NULL DEFAULT '',
  `tel` char(32) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` char(5) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `ip` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_company_base`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_company_base` (
  `id` mediumint(8) NOT NULL,
  `companyName` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `province` smallint(6) NOT NULL DEFAULT '0',
  `city` smallint(6) NOT NULL DEFAULT '0',
  `county` smallint(6) NOT NULL DEFAULT '0',
  `contacts` char(15) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `tel` char(32) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `introduce` varchar(1000) NOT NULL DEFAULT '',
  `business` varchar(1000) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `passwd` char(32) NOT NULL DEFAULT '',
  `followNum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `clientApplyNum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tenderNum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `orderNum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isV` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedAt` int(10) NOT NULL DEFAULT '0',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `clickNum` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_company_case`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_company_case` (
  `id` mediumint(11) NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `roomType` char(30) NOT NULL DEFAULT '',
  `budgetType` tinyint(1) NOT NULL DEFAULT '0',
  `area` float(7,2) unsigned NOT NULL DEFAULT '0.00',
  `clickNum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `isSlide` tinyint(1) NOT NULL DEFAULT '0',
  `isTop` tinyint(1) NOT NULL DEFAULT '0',
  `isRecommen` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `coverImg` varchar(100) NOT NULL DEFAULT '',
  `coverId` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_company_follow`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_company_follow` (
  `id` mediumint(8) NOT NULL,
  `companyId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clientId` mediumint(8) NOT NULL DEFAULT '0',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_company_letter`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_company_letter` (
  `id` mediumint(8) NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `clickNum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `isSlide` tinyint(1) NOT NULL DEFAULT '0',
  `isTop` tinyint(1) NOT NULL DEFAULT '0',
  `isRecommen` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `updatedAt` int(10) NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_company_photo`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_company_photo` (
  `id` mediumint(8) NOT NULL,
  `image` varchar(100) NOT NULL DEFAULT '',
  `isCover` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `updatedAt` int(10) NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `caseId` mediumint(8) NOT NULL DEFAULT '0',
  `photoTitle` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_company_rank`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_company_rank` (
  `id` mediumint(8) NOT NULL,
  `companyId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clientId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quality` tinyint(2) NOT NULL DEFAULT '0',
  `charge` tinyint(2) NOT NULL DEFAULT '0',
  `manner` tinyint(2) NOT NULL DEFAULT '0',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedAt` int(10) NOT NULL DEFAULT '0',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_decorate_visit`
--

CREATE TABLE IF NOT EXISTS `wf_decorate_visit` (
  `id` int(11) unsigned NOT NULL,
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `fenxiaoId` int(10) NOT NULL DEFAULT '0',
  `visitId` int(6) unsigned NOT NULL DEFAULT '0',
  `visitName` varchar(50) NOT NULL DEFAULT '',
  `isShow` tinyint(1) NOT NULL DEFAULT '0',
  `visitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '5',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_deyou_agency_area`
--

CREATE TABLE IF NOT EXISTS `wf_deyou_agency_area` (
  `AreaID` char(32) DEFAULT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(20) DEFAULT NULL,
  `AreaNo` varchar(10) DEFAULT NULL,
  `AreaName` varchar(20) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_deyou_agency_estate`
--

CREATE TABLE IF NOT EXISTS `wf_deyou_agency_estate` (
  `EstateID` char(32) DEFAULT NULL,
  `EstateName` varchar(50) DEFAULT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(10) DEFAULT NULL,
  `AreaID` char(32) DEFAULT NULL,
  `Spell` varchar(20) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PropertyUsage` varchar(20) DEFAULT NULL,
  `PropertyType` varchar(20) DEFAULT NULL,
  `CompleteYear` varchar(10) DEFAULT NULL,
  `DevCompany` varchar(50) DEFAULT NULL,
  `MgtCompany` varchar(50) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `MgtPrice` float DEFAULT NULL,
  `Remark` longtext,
  `LandNo` varchar(50) DEFAULT NULL,
  `LandGrade` varchar(20) DEFAULT NULL,
  `FrameWork` varchar(20) DEFAULT NULL,
  `MgtTel` varchar(50) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `Environment` longtext,
  `Transportation` longtext,
  `Education` longtext,
  `Business` longtext,
  `Entertainment` longtext,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Doc1` varchar(100) DEFAULT NULL,
  `Doc2` varchar(100) DEFAULT NULL,
  `Doc3` varchar(100) DEFAULT NULL,
  `Link1` varchar(100) DEFAULT NULL,
  `Link2` varchar(100) DEFAULT NULL,
  `Link3` varchar(100) DEFAULT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `DevTel` varchar(50) DEFAULT NULL,
  `Room` smallint(6) DEFAULT NULL,
  `Square` double DEFAULT NULL,
  `EstateNameE` varchar(100) DEFAULT NULL,
  `AddressE` varchar(200) DEFAULT NULL,
  `MapID` varchar(32) DEFAULT NULL,
  `CoX` int(11) DEFAULT NULL,
  `CoY` int(11) DEFAULT NULL,
  `RoomRule` int(11) DEFAULT NULL,
  `BuildingRule` tinyint(4) DEFAULT NULL,
  `RoomRuleEx` varchar(10) DEFAULT NULL,
  `Surface` varchar(10) DEFAULT NULL,
  `OwnYear` varchar(6) DEFAULT NULL,
  `EstateNameA` varchar(25) DEFAULT NULL,
  `FlagLocked` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_deyou_agency_inquiry`
--

CREATE TABLE IF NOT EXISTS `wf_deyou_agency_inquiry` (
  `InquiryID` char(32) NOT NULL,
  `CustName` varchar(50) DEFAULT NULL,
  `CustTel` varchar(255) DEFAULT NULL,
  `Contact` varchar(50) DEFAULT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(50) DEFAULT NULL,
  `AreaID` char(32) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Floor` varchar(20) DEFAULT NULL,
  `Trade` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `CountF` varchar(3) DEFAULT NULL,
  `CountT` char(1) DEFAULT NULL,
  `CountW` char(1) DEFAULT NULL,
  `CountY` char(1) DEFAULT NULL,
  `PropertyUsage` varchar(20) DEFAULT NULL,
  `PropertyType` varchar(20) DEFAULT NULL,
  `PropertyDirection` varchar(20) DEFAULT NULL,
  `PropertyDecoration` varchar(50) DEFAULT NULL,
  `PropertyCommission` varchar(20) DEFAULT NULL,
  `TrustDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeptID` char(32) DEFAULT NULL,
  `EmpID` char(32) DEFAULT NULL,
  `Remark` longtext,
  `RegPerson` varchar(20) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModPerson` varchar(20) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FlagPrivate` tinyint(4) DEFAULT NULL,
  `FlagRecommand` tinyint(4) DEFAULT NULL,
  `CustTitle` varchar(30) DEFAULT NULL,
  `CustAddress` varchar(50) DEFAULT NULL,
  `SquareMin` double DEFAULT NULL,
  `SquareMax` double DEFAULT NULL,
  `PriceMin` float DEFAULT NULL,
  `PriceMax` float DEFAULT NULL,
  `LastFollowDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CustType` varchar(20) DEFAULT NULL,
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `InquiryNo` varchar(20) DEFAULT NULL,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PropertyBuy` varchar(20) DEFAULT NULL,
  `CustGrade` varchar(20) DEFAULT NULL,
  `InquirySource` varchar(10) DEFAULT NULL,
  `PropertyFloor` varchar(50) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Country` varchar(10) DEFAULT NULL,
  `CustMobile` varchar(80) DEFAULT NULL,
  `Usage` varchar(50) DEFAULT NULL,
  `CustOccupy` varchar(10) DEFAULT NULL,
  `CustIntent` varchar(10) DEFAULT NULL,
  `CustPeriod` varchar(10) DEFAULT NULL,
  `InquiryTrust` varchar(20) DEFAULT NULL,
  `isAdd` tinyint(1) unsigned DEFAULT '0',
  `belongId` int(10) unsigned DEFAULT '0',
  `belongName` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_deyou_agency_property`
--

CREATE TABLE IF NOT EXISTS `wf_deyou_agency_property` (
  `PropertyID` char(32) NOT NULL,
  `CityName` varchar(10) DEFAULT NULL,
  `DistrictName` varchar(10) DEFAULT NULL,
  `EstateID` char(32) DEFAULT NULL,
  `EstateName` varchar(255) DEFAULT '',
  `RoomNo` varchar(50) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Trade` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `CountF` varchar(2) DEFAULT NULL,
  `CountT` char(1) DEFAULT NULL,
  `CountW` char(1) DEFAULT NULL,
  `CountY` char(1) DEFAULT NULL,
  `FlagRecommand` tinyint(4) DEFAULT NULL,
  `PropertyUsage` varchar(20) DEFAULT NULL,
  `PropertyType` varchar(20) DEFAULT NULL,
  `PropertyDirection` varchar(20) DEFAULT NULL,
  `PropertyLook` varchar(20) DEFAULT NULL,
  `PropertyBuy` varchar(20) DEFAULT NULL,
  `PropertyCommission` varchar(20) DEFAULT NULL,
  `PropertySource` varchar(20) DEFAULT NULL,
  `Square` double DEFAULT NULL,
  `PriceUnit` float DEFAULT NULL,
  `Price` decimal(10,3) DEFAULT NULL,
  `PriceBase` decimal(10,3) DEFAULT NULL,
  `RentPriceUnit` decimal(10,3) DEFAULT NULL,
  `RentPrice` decimal(10,3) DEFAULT NULL,
  `MgtPrice` decimal(10,3) DEFAULT NULL,
  `TrustDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeptID` char(32) DEFAULT NULL,
  `EmpID` char(32) DEFAULT NULL,
  `PropertyDecoration` varchar(20) DEFAULT NULL,
  `PropertyFloor` varchar(32) DEFAULT NULL,
  `Remark` longtext,
  `RegPerson` varchar(20) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModPerson` varchar(20) DEFAULT NULL,
  `ModDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PropertyTrust` varchar(20) DEFAULT NULL,
  `KeyNo` varchar(10) DEFAULT NULL,
  `CompleteYear` varchar(10) DEFAULT NULL,
  `PropertyOccupy` varchar(20) DEFAULT NULL,
  `PropertyOwn` varchar(20) DEFAULT NULL,
  `SquareUse` double DEFAULT NULL,
  `LastFollowDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FlagTrashed` tinyint(4) DEFAULT NULL,
  `FlagDeleted` tinyint(4) DEFAULT NULL,
  `OwnerName` varchar(50) DEFAULT NULL,
  `OwnerTel` varchar(255) DEFAULT NULL,
  `ContactName` varchar(50) DEFAULT NULL,
  `PropertyFurniture` varchar(20) DEFAULT NULL,
  `PropertyNo` varchar(20) DEFAULT NULL,
  `PriceLine` double DEFAULT NULL,
  `RentPriceLine` double DEFAULT NULL,
  `BuildNo` varchar(50) DEFAULT NULL,
  `PropertyCertificate` varchar(20) DEFAULT NULL,
  `PropertyElectric` varchar(20) DEFAULT NULL,
  `ExDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FloorAll` int(11) DEFAULT NULL,
  `HandOverDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UnitName` varchar(10) DEFAULT NULL,
  `RentUnitName` varchar(10) DEFAULT NULL,
  `PhotoCount` int(11) DEFAULT NULL,
  `Usage1` double DEFAULT NULL,
  `Usage2` double DEFAULT NULL,
  `TrustNo` varchar(20) DEFAULT NULL,
  `PropertyTax` varchar(20) DEFAULT NULL,
  `OwnerMobile` varchar(80) DEFAULT NULL,
  `Country` varchar(10) DEFAULT NULL,
  `DeptID1` char(32) DEFAULT NULL,
  `EmpID2` char(32) DEFAULT NULL,
  `DeptID2` char(32) DEFAULT NULL,
  `EmpID1` char(32) DEFAULT NULL,
  `Usage` varchar(50) DEFAULT NULL,
  `BusDatas` longtext,
  `Privy` smallint(6) DEFAULT NULL,
  `FlagWeb` tinyint(4) DEFAULT NULL,
  `Word` varchar(50) DEFAULT NULL,
  `IDCard` varchar(30) DEFAULT NULL,
  `isAdd` tinyint(1) unsigned DEFAULT '0',
  `belongId` int(10) unsigned DEFAULT NULL,
  `belongName` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dingcan`
--

CREATE TABLE IF NOT EXISTS `wf_dingcan` (
  `id` mediumint(8) unsigned NOT NULL,
  `cantingId` tinyint(4) NOT NULL DEFAULT '0' COMMENT '餐厅id',
  `orderDate` date NOT NULL DEFAULT '0000-00-00' COMMENT '预定时间',
  `belongUserId` mediumint(8) NOT NULL,
  `belongUserName` varchar(20) NOT NULL,
  `departmentId` mediumint(9) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dingcan_menu`
--

CREATE TABLE IF NOT EXISTS `wf_dingcan_menu` (
  `id` mediumint(8) unsigned NOT NULL,
  `cantingId` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '餐厅id',
  `title` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL DEFAULT '',
  `pic` varchar(150) NOT NULL DEFAULT '',
  `theday` date NOT NULL DEFAULT '0000-00-00' COMMENT '今日时间',
  `isBase` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是初始菜单。',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '链接到初始菜单',
  `createdAt` int(10) unsigned NOT NULL,
  `createdId` mediumint(8) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_documents`
--

CREATE TABLE IF NOT EXISTS `wf_documents` (
  `id` int(11) unsigned NOT NULL,
  `days` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '总天数',
  `loans` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '商代次数',
  `contractNumber` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '合同跟签量',
  `fund` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '公积金',
  `outTimes` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '人均外出次数',
  `dayOutTimes` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '人均外出次数',
  `total` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '总人数',
  `totalOut` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '总外出次数',
  `month` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '月份',
  `createdAt` int(11) unsigned NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dujia_hotel`
--

CREATE TABLE IF NOT EXISTS `wf_dujia_hotel` (
  `id` mediumint(8) unsigned NOT NULL,
  `province` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `county` smallint(6) NOT NULL DEFAULT '0' COMMENT '区域',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '酒店名称',
  `oldName` varchar(200) NOT NULL DEFAULT '' COMMENT '曾用名称',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '封面图片',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '酒店地址',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '酒店类型',
  `rank` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '酒店星级',
  `fangxing` varchar(30) NOT NULL DEFAULT '' COMMENT '酒店房型',
  `openAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开业时间',
  `fixAt` int(10) NOT NULL DEFAULT '0' COMMENT '装修时间',
  `sheshi` varchar(30) NOT NULL DEFAULT '' COMMENT '酒店设施',
  `fuwu` varchar(30) NOT NULL DEFAULT '' COMMENT '酒店服务',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `floor` varchar(50) NOT NULL DEFAULT '' COMMENT '楼层',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '房间数',
  `flag` varchar(30) NOT NULL DEFAULT '' COMMENT '信息标识',
  `des` varchar(500) NOT NULL DEFAULT '' COMMENT '酒店简介',
  `mapLat` varchar(20) NOT NULL DEFAULT '0' COMMENT '百度经纬度',
  `mapLng` varchar(10) NOT NULL DEFAULT '0' COMMENT '百度经纬度',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdId` int(10) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '0',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedId` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dujia_hotel_house`
--

CREATE TABLE IF NOT EXISTS `wf_dujia_hotel_house` (
  `id` mediumint(8) unsigned NOT NULL,
  `hotelId` mediumint(8) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '房型名称',
  `fangxingId` smallint(3) NOT NULL DEFAULT '0' COMMENT '房型类别',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '基本价格',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '房型图片',
  `youhui` varchar(200) NOT NULL DEFAULT '' COMMENT '优惠信息',
  `youhuiPrice` varchar(10) NOT NULL DEFAULT '0' COMMENT '优惠价格。',
  `bkfast` varchar(30) NOT NULL DEFAULT '' COMMENT '含有的早餐服务',
  `orders` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '小到大排序',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '信息状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dujia_hotel_pic`
--

CREATE TABLE IF NOT EXISTS `wf_dujia_hotel_pic` (
  `id` mediumint(8) unsigned NOT NULL,
  `hotelId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '酒店Id',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '信息状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dujia_hotel_price`
--

CREATE TABLE IF NOT EXISTS `wf_dujia_hotel_price` (
  `id` mediumint(8) unsigned NOT NULL,
  `hotelId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '酒店id',
  `houseId` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '房型id',
  `kucun` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `bkfast` smallint(6) NOT NULL DEFAULT '0' COMMENT '早餐服务',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当日价格',
  `date` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dujia_order`
--

CREATE TABLE IF NOT EXISTS `wf_dujia_order` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '信息ID',
  `hotelId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '酒店ID',
  `houseId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '房型Id',
  `bkfast` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '价格Id',
  `userId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户Id',
  `inDate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入住时间',
  `outDate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '离店时间',
  `odPriceBase` varchar(10) NOT NULL DEFAULT '0' COMMENT '预定价格',
  `odPrice` varchar(10) NOT NULL DEFAULT '0' COMMENT '最终预定价格',
  `out_trade_no` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `bedType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '床型',
  `odRoomNum` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '房间数',
  `odName` varchar(20) NOT NULL DEFAULT '' COMMENT '入住姓名',
  `odTel` char(32) NOT NULL DEFAULT '' COMMENT '订单手机号',
  `odNotes` varchar(300) NOT NULL DEFAULT '' COMMENT '用户其他要求',
  `needBill` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要发票',
  `billName` varchar(20) NOT NULL DEFAULT '' COMMENT '发票抬头',
  `payType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式 , 1，微信支付，2 到店支付',
  `odStatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态，0未成功 , 1成功',
  `notes` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '信息状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dujia_order_paylog`
--

CREATE TABLE IF NOT EXISTS `wf_dujia_order_paylog` (
  `id` mediumint(8) unsigned NOT NULL,
  `bank_type` varchar(10) NOT NULL DEFAULT '' COMMENT 'bank_type代码',
  `openid` varchar(32) NOT NULL DEFAULT '' COMMENT '微信openid',
  `out_trade_no` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号[重要，主要是通过订单号来匹配]',
  `result_code` varchar(20) NOT NULL DEFAULT '' COMMENT '支付状态',
  `sign` varchar(64) NOT NULL DEFAULT '' COMMENT '签名',
  `transaction_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信transaction_id',
  `createdAt` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dujia_user`
--

CREATE TABLE IF NOT EXISTS `wf_dujia_user` (
  `userId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'weixin_user表的id',
  `balance` varchar(20) NOT NULL DEFAULT '' COMMENT '用户可用金额,一般用于充值金额',
  `tgBalance` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '推广获得的金额',
  `costTime` smallint(6) NOT NULL DEFAULT '0' COMMENT '成功消费次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_dynamic`
--

CREATE TABLE IF NOT EXISTS `wf_dynamic` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `userid` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(30) NOT NULL DEFAULT '',
  `actId` int(11) NOT NULL DEFAULT '0',
  `desc` varchar(200) NOT NULL DEFAULT '',
  `addTim` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_exchange_goods`
--

CREATE TABLE IF NOT EXISTS `wf_exchange_goods` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL DEFAULT '',
  `goodsName` varchar(100) NOT NULL DEFAULT '',
  `integral` int(11) NOT NULL DEFAULT '0',
  `exNum` int(11) NOT NULL DEFAULT '0',
  `virtualNum` int(11) NOT NULL DEFAULT '0',
  `isIndex` tinyint(1) NOT NULL DEFAULT '2',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_expand_account`
--

CREATE TABLE IF NOT EXISTS `wf_expand_account` (
  `id` int(10) unsigned NOT NULL,
  `departmentId` int(4) unsigned NOT NULL,
  `belongId` int(6) NOT NULL,
  `belongName` varchar(30) NOT NULL,
  `departmentName` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL COMMENT '账号',
  `password` varchar(30) NOT NULL DEFAULT '',
  `tel` char(11) NOT NULL DEFAULT '',
  `applicationType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1申请新端口2端口续费3申请增值',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '搜房端口编码',
  `jobStatus` tinyint(1) NOT NULL COMMENT '1:在职2：离职',
  `portType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '端口类型  1：免费2：自费',
  `portId` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '端口1:58端口2：58充值3:58免税4：搜房端口（120）5：搜房端口（300）6：安居客',
  `city` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '城市Id',
  `costType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '端口套餐 1:半年2：季度',
  `actionType` tinyint(1) unsigned NOT NULL COMMENT '1:申请正常账号2：申请离职账号',
  `reason` varchar(50) DEFAULT '' COMMENT '不予通过理由',
  `fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '端口费用',
  `expireAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `changeInfo` text NOT NULL COMMENT '转移信息',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '5' COMMENT '1删除2离职回收3申请状态4审核不予通过5正常状态',
  `updatedBy` varchar(50) NOT NULL DEFAULT '0',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_expand_accounts`
--

CREATE TABLE IF NOT EXISTS `wf_expand_accounts` (
  `id` int(11) unsigned NOT NULL,
  `account` varchar(30) NOT NULL COMMENT '账号',
  `password` varchar(30) NOT NULL DEFAULT '',
  `tel` char(11) NOT NULL DEFAULT '',
  `portType` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1免费账号2自费账号',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '账号类型1:58同城(40)2:58同城(80)',
  `expireAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `departmentId` int(4) unsigned NOT NULL,
  `belongId` int(8) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(30) NOT NULL,
  `departmentName` varchar(30) NOT NULL,
  `changeInfo` tinytext NOT NULL COMMENT '转移信息',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '搜房端口编码',
  `area` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '区域例如：秀英区',
  `city` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '市县',
  `fee` decimal(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '账号费用',
  `createdBy` varchar(30) NOT NULL DEFAULT '' COMMENT '审核的人',
  `createdAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核日期',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '1删除5正常2离职',
  `costType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:季度2：半年'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_expand_apply`
--

CREATE TABLE IF NOT EXISTS `wf_expand_apply` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(7) NOT NULL,
  `departmentId` int(4) unsigned NOT NULL,
  `belongId` int(6) NOT NULL,
  `belongName` varchar(30) NOT NULL,
  `departmentName` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL COMMENT '账号',
  `password` varchar(30) NOT NULL DEFAULT '',
  `tel` char(11) NOT NULL DEFAULT '',
  `applicationType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1申请新端口2端口续费3申请增值4申请离职账号',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '搜房端口编码',
  `jobStatus` tinyint(1) NOT NULL COMMENT '1:在职2：离职',
  `portType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '端口类型  1：免费2：自费',
  `portId` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '端口类型：1:58端口（40）2：58端口（80）3：搜房端口（120）4：搜房端口（300）5：安居客',
  `serviceType` tinyint(1) unsigned NOT NULL COMMENT '充值服务',
  `city` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '城市Id',
  `area` smallint(4) NOT NULL,
  `costType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '端口套餐 1:半年2：季度3：全年',
  `reason` varchar(50) DEFAULT '' COMMENT '不予通过理由',
  `fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '端口费用',
  `shopArea` int(3) NOT NULL DEFAULT '0' COMMENT '所属片区',
  `expireAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `changeInfo` text NOT NULL COMMENT '转移信息',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '5' COMMENT '1删除2离职回收3申请状态4审核不予通过5审核通过',
  `updatedBy` varchar(50) NOT NULL DEFAULT '0',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `valueAdded` decimal(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '增值费用',
  `shopAreaName` varchar(255) NOT NULL DEFAULT '',
  `roleType` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1分销2二手房'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_expand_cost`
--

CREATE TABLE IF NOT EXISTS `wf_expand_cost` (
  `id` int(10) unsigned NOT NULL,
  `month` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '月份',
  `departmentName` varchar(30) NOT NULL,
  `number` int(4) unsigned NOT NULL COMMENT '个数',
  `departmentId` int(4) unsigned NOT NULL,
  `cost` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '费用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_expand_count`
--

CREATE TABLE IF NOT EXISTS `wf_expand_count` (
  `id` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推广账号类型''1:58端口(40)2:58端口(80)3:搜房端口(120)4:搜房端口(300)5:安居客端口6:搜房无线端口7：58充值8：58免税',
  `area` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '非行政区；而是海德区，海甸岛区',
  `totalCost` decimal(4,1) NOT NULL DEFAULT '0.0',
  `total` int(4) NOT NULL DEFAULT '0' COMMENT '总数',
  `shopArea` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '门店区域',
  `month` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '月份201702',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(30) NOT NULL DEFAULT '' COMMENT '门店'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fangmeng_message`
--

CREATE TABLE IF NOT EXISTS `wf_fangmeng_message` (
  `id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(800) NOT NULL DEFAULT '' COMMENT '内容',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `createdAt` int(10) unsigned NOT NULL,
  `updatedAt` int(10) NOT NULL,
  `updatedId` mediumint(8) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_faq`
--

CREATE TABLE IF NOT EXISTS `wf_faq` (
  `id` int(11) NOT NULL,
  `pId` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `contact` varchar(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `adminCreatedId` int(11) NOT NULL,
  `adminCreatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_adviser`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_adviser` (
  `id` int(6) unsigned NOT NULL,
  `inclients` int(4) unsigned NOT NULL DEFAULT '0',
  `visits` int(4) unsigned NOT NULL DEFAULT '0',
  `propertys` int(4) unsigned NOT NULL DEFAULT '0',
  `arranges` int(4) unsigned NOT NULL DEFAULT '0',
  `interactusers` int(4) unsigned NOT NULL DEFAULT '0',
  `calls` int(4) unsigned NOT NULL DEFAULT '0',
  `members` int(4) unsigned NOT NULL DEFAULT '0',
  `benefiters` int(4) unsigned NOT NULL DEFAULT '0',
  `bargains` int(4) unsigned NOT NULL DEFAULT '0',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `departmentId` int(4) unsigned NOT NULL,
  `departmentName` varchar(30) NOT NULL DEFAULT '',
  `roleId` int(6) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL,
  `timesType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0天、1月、2年'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_area`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_area` (
  `id` int(6) unsigned NOT NULL,
  `pro_id` int(6) unsigned NOT NULL DEFAULT '0',
  `pro_name` varchar(20) NOT NULL DEFAULT '',
  `inclients` int(2) unsigned NOT NULL DEFAULT '0',
  `bargains` int(1) unsigned NOT NULL DEFAULT '0',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `roleId` int(6) unsigned NOT NULL DEFAULT '0',
  `departmentId` int(4) NOT NULL DEFAULT '0',
  `departmentName` varchar(30) NOT NULL DEFAULT '',
  `times` date NOT NULL,
  `timesType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0天、1月、2年'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_areag`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_areag` (
  `id` int(6) unsigned NOT NULL,
  `pro_id` int(6) unsigned NOT NULL DEFAULT '0',
  `inclients` int(2) unsigned NOT NULL DEFAULT '0',
  `bargains` int(1) unsigned NOT NULL DEFAULT '0',
  `departmentId` int(4) NOT NULL DEFAULT '0',
  `departmentName` varchar(30) NOT NULL DEFAULT '',
  `times` date NOT NULL,
  `timesType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0天、1月、2年'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_buycity`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_buycity` (
  `id` int(6) unsigned NOT NULL,
  `city_name` varchar(20) NOT NULL DEFAULT '',
  `counts` int(2) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_from`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_from` (
  `id` int(6) unsigned NOT NULL,
  `adviser_id` int(6) unsigned NOT NULL DEFAULT '0',
  `from_id` int(1) unsigned NOT NULL DEFAULT '0',
  `fromName` varchar(20) NOT NULL DEFAULT '',
  `inclients` int(1) unsigned NOT NULL DEFAULT '0',
  `bargains` int(1) unsigned NOT NULL DEFAULT '0',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `roleId` int(6) unsigned NOT NULL DEFAULT '0',
  `departmentId` int(4) NOT NULL DEFAULT '0',
  `departmentName` varchar(30) NOT NULL DEFAULT '',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_fromg`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_fromg` (
  `id` int(6) unsigned NOT NULL,
  `from_id` int(1) unsigned NOT NULL DEFAULT '0',
  `fromName` varchar(20) NOT NULL DEFAULT '',
  `inclients` int(1) unsigned NOT NULL DEFAULT '0',
  `bargains` int(1) unsigned NOT NULL DEFAULT '0',
  `departmentId` int(4) NOT NULL DEFAULT '0',
  `departmentName` varchar(30) NOT NULL DEFAULT '',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_groups`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_groups` (
  `id` int(6) unsigned NOT NULL,
  `inclients` int(4) unsigned NOT NULL DEFAULT '0',
  `visits` int(4) unsigned NOT NULL DEFAULT '0',
  `propertys` int(4) unsigned NOT NULL DEFAULT '0',
  `arranges` int(4) unsigned NOT NULL DEFAULT '0',
  `interactusers` int(4) unsigned NOT NULL DEFAULT '0',
  `calls` int(4) unsigned NOT NULL DEFAULT '0',
  `members` int(4) unsigned NOT NULL DEFAULT '0',
  `benefiters` int(4) unsigned NOT NULL DEFAULT '0',
  `bargains` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentId` int(4) unsigned NOT NULL,
  `departmentName` varchar(30) NOT NULL DEFAULT '',
  `times` date NOT NULL,
  `timesType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0天、1月、2年'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_interact`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_interact` (
  `id` int(6) unsigned NOT NULL,
  `users` int(2) NOT NULL DEFAULT '0',
  `others` int(2) NOT NULL DEFAULT '0',
  `allotusers` int(2) NOT NULL DEFAULT '0',
  `buildings` int(2) NOT NULL DEFAULT '0',
  `surveys` int(2) NOT NULL DEFAULT '0',
  `clients` int(2) NOT NULL DEFAULT '0',
  `bargains` int(2) NOT NULL DEFAULT '0',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_propertys`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_propertys` (
  `id` int(6) unsigned NOT NULL,
  `counts` int(2) unsigned NOT NULL DEFAULT '0',
  `clients` int(2) unsigned NOT NULL DEFAULT '0',
  `propertys` int(2) unsigned NOT NULL DEFAULT '0',
  `noallots` int(2) unsigned NOT NULL DEFAULT '0',
  `inclients` int(2) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_soapbuildings`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_soapbuildings` (
  `id` int(6) unsigned NOT NULL,
  `counts` int(2) unsigned NOT NULL DEFAULT '0',
  `buildingId` int(6) unsigned NOT NULL DEFAULT '0',
  `buildingName` varchar(100) NOT NULL DEFAULT '',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_soaps`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_soaps` (
  `id` int(6) unsigned NOT NULL,
  `counts` int(2) unsigned NOT NULL DEFAULT '0',
  `success` int(2) unsigned NOT NULL DEFAULT '0',
  `onhooks` int(2) unsigned NOT NULL DEFAULT '0',
  `refuses` int(2) unsigned NOT NULL DEFAULT '0',
  `busys` int(2) unsigned NOT NULL DEFAULT '0',
  `noanswers` int(2) unsigned NOT NULL DEFAULT '0',
  `lengs` int(6) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_visits`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_visits` (
  `id` int(6) unsigned NOT NULL,
  `counts` int(2) unsigned NOT NULL DEFAULT '0',
  `firsts` int(2) unsigned NOT NULL DEFAULT '0',
  `seconds` int(2) NOT NULL DEFAULT '0',
  `gt_seconds` int(2) NOT NULL DEFAULT '0',
  `bargains` int(2) unsigned NOT NULL DEFAULT '0',
  `nexts` int(2) unsigned NOT NULL DEFAULT '0',
  `times` date NOT NULL,
  `clientType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `departmentId` int(6) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fencount_visitslevel`
--

CREATE TABLE IF NOT EXISTS `wf_fencount_visitslevel` (
  `id` int(6) unsigned NOT NULL,
  `counts` int(2) unsigned NOT NULL DEFAULT '0',
  `clientLevel` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientType` tinyint(1) NOT NULL DEFAULT '0',
  `times` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_fenxiaocount_chengjiao`
--
CREATE TABLE IF NOT EXISTS `wf_fenxiaocount_chengjiao` (
`isBargain` tinyint(1)
,`clientFrom` tinyint(4)
,`clientLevel` tinyint(4)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`status` tinyint(1)
,`clientId` int(11)
,`askDate` int(6) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_fenxiaocount_kanfang`
--
CREATE TABLE IF NOT EXISTS `wf_fenxiaocount_kanfang` (
`clientId` int(10) unsigned
,`clientFrom` tinyint(4)
,`clientLevel` tinyint(4)
,`province` int(4) unsigned
,`belongUserId` int(11)
,`belongUser` varchar(50)
,`seeStatus` tinyint(4)
,`seeDate` int(6) unsigned
,`status` tinyint(4)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_arrange`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_arrange` (
  `id` int(11) unsigned NOT NULL,
  `buildingName` varchar(255) NOT NULL DEFAULT '',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `clientNum` int(1) NOT NULL DEFAULT '0',
  `isTake` tinyint(4) NOT NULL DEFAULT '0',
  `clientInfo` varchar(1000) NOT NULL DEFAULT '',
  `toDate` int(11) NOT NULL DEFAULT '0',
  `backDate` int(11) NOT NULL DEFAULT '0',
  `way` tinyint(4) NOT NULL DEFAULT '0',
  `ticket` tinyint(4) NOT NULL DEFAULT '0',
  `flighNum` varchar(20) NOT NULL DEFAULT '',
  `offTime` varchar(20) NOT NULL DEFAULT '0',
  `arriveTime` varchar(20) NOT NULL DEFAULT '0',
  `arrivePlace` varchar(20) NOT NULL DEFAULT '',
  `hotelOrder` tinyint(4) NOT NULL DEFAULT '0',
  `hotel` varchar(50) NOT NULL DEFAULT '',
  `seeDate` int(6) unsigned NOT NULL DEFAULT '0',
  `billDate` int(6) unsigned NOT NULL DEFAULT '0',
  `seeStatus` tinyint(4) NOT NULL DEFAULT '0',
  `carOrder` tinyint(4) NOT NULL DEFAULT '0',
  `sellSuggestion` varchar(1000) NOT NULL DEFAULT '',
  `saleNotes` varchar(1000) NOT NULL DEFAULT '',
  `saleId` int(11) NOT NULL DEFAULT '0',
  `saleName` varchar(20) NOT NULL DEFAULT '',
  `saleDate` int(11) NOT NULL DEFAULT '0',
  `serviceNotes` varchar(1000) NOT NULL DEFAULT '',
  `serviceId` int(11) NOT NULL DEFAULT '0',
  `serviceName` varchar(20) NOT NULL DEFAULT '',
  `serviceDate` int(11) NOT NULL DEFAULT '0',
  `travelNotes` varchar(1000) NOT NULL DEFAULT '',
  `travelId` int(11) NOT NULL DEFAULT '0',
  `travelName` varchar(20) NOT NULL DEFAULT '',
  `travelDate` int(6) unsigned NOT NULL DEFAULT '0',
  `serId` int(6) unsigned NOT NULL DEFAULT '0',
  `serUser` varchar(50) NOT NULL DEFAULT '',
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0',
  `arrangeUser` varchar(50) NOT NULL DEFAULT '',
  `useCar` varchar(50) NOT NULL DEFAULT '',
  `carFees` varchar(20) NOT NULL DEFAULT '',
  `driver` varchar(50) NOT NULL DEFAULT '',
  `driverTel` char(11) NOT NULL DEFAULT '',
  `remarks` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '5' COMMENT '5正常状态6审核状态',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `isSum` tinyint(1) NOT NULL DEFAULT '0',
  `isBargain` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_arrangers`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_arrangers` (
  `id` int(10) unsigned NOT NULL,
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0',
  `arrangeName` varchar(30) NOT NULL DEFAULT '',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `timeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `clientLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isBargain` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_client`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_client` (
  `id` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL DEFAULT '0',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `clientName` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `province` int(4) unsigned NOT NULL DEFAULT '0',
  `city` int(4) unsigned NOT NULL DEFAULT '0',
  `address` varchar(100) NOT NULL DEFAULT '',
  `clientFrom` tinyint(4) NOT NULL DEFAULT '14',
  `agentName` varchar(50) NOT NULL DEFAULT '',
  `agentTel` varchar(20) NOT NULL DEFAULT '',
  `tel` char(32) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `no3hourVisit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '3联动小组公客、4联动区域公客、5联动公客',
  `otherName` varchar(20) NOT NULL DEFAULT '',
  `otherPhone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `QQ` varchar(20) NOT NULL DEFAULT '',
  `birth` varchar(20) NOT NULL DEFAULT '',
  `job` varchar(100) NOT NULL DEFAULT '',
  `cardId` varchar(20) NOT NULL DEFAULT '',
  `feature` varchar(1000) NOT NULL DEFAULT '',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `requireType` tinyint(4) NOT NULL DEFAULT '0',
  `inHainan` tinyint(4) NOT NULL DEFAULT '0',
  `askType` tinyint(4) NOT NULL DEFAULT '0',
  `askDate` int(6) unsigned NOT NULL DEFAULT '0',
  `lastVisitDate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '第一次回访时间',
  `nextVisitDate` int(6) NOT NULL DEFAULT '0' COMMENT '最近一次回访日期',
  `visitNum` int(4) NOT NULL DEFAULT '0',
  `clientLevel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1暂未确定，2近期看房，3重要客户，4放弃客户，5看房客户，6成交客户，7退房客户',
  `category` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '客户分类',
  `serviceStatus` tinyint(6) NOT NULL DEFAULT '0',
  `belongUserId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongUser` varchar(50) NOT NULL DEFAULT '',
  `firstUserId` int(4) unsigned NOT NULL DEFAULT '0',
  `firstUser` varchar(50) NOT NULL DEFAULT '',
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0',
  `arrangeUser` varchar(50) NOT NULL DEFAULT '',
  `changeClient` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '5' COMMENT '4:app代理商添加未审核',
  `delReason` varchar(255) NOT NULL DEFAULT '',
  `belongPid` int(6) unsigned NOT NULL,
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '0',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `changeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `isguanjia` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否房管家客户',
  `agentId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '分销商id',
  `agentNextId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '经纪人id',
  `isAnchang` int(4) unsigned NOT NULL DEFAULT '0',
  `jobType` tinyint(1) NOT NULL DEFAULT '0',
  `visitHouseAt` int(6) unsigned NOT NULL DEFAULT '0',
  `isBargain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已成交，2未成交',
  `agentAt` int(6) NOT NULL DEFAULT '0' COMMENT '确认时间',
  `agentSaleName` varchar(50) NOT NULL DEFAULT '',
  `agentSaleTel` varchar(20) NOT NULL DEFAULT '',
  `fitmentId` int(6) unsigned NOT NULL DEFAULT '0',
  `seeItem` varchar(255) NOT NULL DEFAULT '',
  `buyCity` varchar(100) NOT NULL DEFAULT '',
  `clientPoint` varchar(1000) NOT NULL DEFAULT '',
  `showAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 触发器 `wf_fenxiao_client`
--
DELIMITER $$
CREATE TRIGGER `del` AFTER DELETE ON `wf_fenxiao_client`
 FOR EACH ROW delete from wf_fenxiao_client_little where id = old.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` AFTER INSERT ON `wf_fenxiao_client`
 FOR EACH ROW insert into wf_fenxiao_client_little (id,belongUserId,belongUser,province,city,clientFrom,createdAt,status,isBargain,no3hourVisit,changeAt,createdId,nextVisitDate,clientLevel) values(new.id,new.belongUserId,new.belongUser,new.province,new.city,new.clientFrom,new.createdAt,new.status,new.isBargain,new.no3hourVisit,new.changeAt,new.createdId,new.nextVisitDate,new.clientLevel)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` AFTER UPDATE ON `wf_fenxiao_client`
 FOR EACH ROW UPDATE wf_fenxiao_client_little
SET belongUserId = new.belongUserId,
 belongUser = new.belongUser,
 province = new.province,
 city = new.city,
 clientFrom = new.clientFrom,
 createdAt = new.createdAt,
 STATUS = new. STATUS,
 isBargain = new.isBargain,
 no3hourVisit = new.no3hourVisit,
 changeAt = new.changeAt,
 createdId = new.createdId,
 agentId = new.agentId,
 nextVisitDate = new.nextVisitDate,
 clientLevel = new.clientLevel
WHERE
	id = new.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_clientfollow`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_clientfollow` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `demand` varchar(255) NOT NULL DEFAULT '',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `degree` tinyint(1) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_client_little`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_client_little` (
  `id` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `belongUserId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongUser` varchar(50) NOT NULL DEFAULT '',
  `province` int(4) unsigned NOT NULL DEFAULT '0',
  `city` int(4) unsigned NOT NULL DEFAULT '0',
  `clientFrom` tinyint(4) NOT NULL DEFAULT '14',
  `isBargain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已成交，2未成交',
  `no3hourVisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `changeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '5',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `agentId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '代理商id',
  `nextVisitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `clientLevel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1暂未确定，2近期看房，3重要客户，4放弃客户，5看房客户，6成交客户，7退房客户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_client_tel`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_client_tel` (
  `id` int(11) NOT NULL DEFAULT '0',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `otherPhone` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_complaint`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_complaint` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `compName` varchar(30) NOT NULL DEFAULT '',
  `compFrom` tinyint(1) NOT NULL DEFAULT '1',
  `compInfo` varchar(255) NOT NULL DEFAULT '',
  `compAt` int(11) NOT NULL DEFAULT '0',
  `solveAt` int(11) NOT NULL DEFAULT '0',
  `solveResult` varchar(255) NOT NULL DEFAULT '',
  `solveName` varchar(30) NOT NULL DEFAULT '',
  `notes` varchar(550) NOT NULL DEFAULT '',
  `notatoInfo` varchar(255) NOT NULL DEFAULT '',
  `notatioName` varchar(50) NOT NULL DEFAULT '',
  `notatioAt` int(11) NOT NULL DEFAULT '0',
  `createdBY` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_dealbuilding`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_dealbuilding` (
  `id` int(11) unsigned NOT NULL,
  `summaryId` int(11) NOT NULL DEFAULT '0',
  `getArrangeId` int(11) NOT NULL DEFAULT '0',
  `clientId` int(11) NOT NULL DEFAULT '0',
  `belongUserId` int(6) unsigned NOT NULL DEFAULT '0',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `sellerId` int(11) NOT NULL DEFAULT '0',
  `sellerName` varchar(50) NOT NULL DEFAULT '',
  `sellerTel` varchar(50) NOT NULL DEFAULT '0',
  `period` varchar(20) NOT NULL DEFAULT '',
  `houseNo` varchar(20) NOT NULL DEFAULT '',
  `owner` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(10) NOT NULL DEFAULT '',
  `eachPrice` float(20,0) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `earnestDate` date NOT NULL,
  `earnest` varchar(20) NOT NULL DEFAULT '',
  `dealDate` varchar(20) NOT NULL DEFAULT '',
  `signDate` varchar(20) NOT NULL DEFAULT '',
  `preference` varchar(200) NOT NULL DEFAULT '',
  `preferencePrice` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '优惠金额',
  `preferenceWay` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '优惠方式(1:优先从成交奖励减，不够再从总房款减；2：从总房款减 )',
  `payWay` tinyint(1) NOT NULL DEFAULT '0',
  `isBack` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否结佣：1未结佣，2部分结佣，3全部结佣',
  `firstDate` varchar(20) NOT NULL DEFAULT '',
  `firstMoney` varchar(20) NOT NULL DEFAULT '',
  `fullDate` varchar(20) NOT NULL DEFAULT '',
  `lastDate` varchar(20) NOT NULL DEFAULT '',
  `lastMoney` varchar(20) NOT NULL DEFAULT '',
  `dealNotes` varchar(500) NOT NULL DEFAULT '',
  `developer` varchar(200) NOT NULL DEFAULT '',
  `recepter` varchar(20) NOT NULL DEFAULT '',
  `receptPhone` varchar(20) NOT NULL DEFAULT '',
  `presenter` varchar(20) NOT NULL DEFAULT '',
  `prePhone` varchar(20) NOT NULL DEFAULT '',
  `checkAt` int(6) unsigned NOT NULL DEFAULT '0',
  `checkId` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `confirm` tinyint(1) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `results` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `point` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '楼盘返点(渠道默认100)',
  `dealAward` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '成交奖励',
  `driverId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '部门司机',
  `issee` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否提交看房确认单（0：未提交，1：已提交）',
  `isdeal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否提交成交确认单（0：未提交，1：已提交）',
  `accounted` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '可结金额'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_dealscale`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_dealscale` (
  `id` int(6) unsigned NOT NULL COMMENT 'id',
  `dealId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '购房明细id',
  `clientId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1表示权属，2表示地接',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '业务人员id',
  `belongName` varchar(50) NOT NULL DEFAULT '' COMMENT '业务人员',
  `scale` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '业绩所占比例',
  `departmentId` mediumint(4) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `parentDepartUser` varchar(255) NOT NULL DEFAULT '' COMMENT '部门所有人',
  `performance` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '业绩',
  `payment` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '提成基数',
  `earnestDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_dj`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_dj` (
  `djId` int(11) NOT NULL,
  `clientId` int(11) DEFAULT NULL,
  `clientNum` varchar(10) DEFAULT NULL,
  `companyInfo` varchar(255) DEFAULT NULL,
  `wayToHainan` int(11) DEFAULT NULL,
  `ToHNDate` varchar(20) DEFAULT NULL,
  `backDate` varchar(50) DEFAULT NULL,
  `FlighTicket` int(11) DEFAULT NULL,
  `flighNum` varchar(20) DEFAULT NULL,
  `offTime` varchar(20) DEFAULT NULL,
  `arriveTime` varchar(20) DEFAULT NULL,
  `arriveWhere` varchar(20) DEFAULT NULL,
  `isTake` int(11) DEFAULT NULL,
  `hotelOrder` int(11) DEFAULT NULL,
  `hotel` varchar(50) DEFAULT NULL,
  `carOrder` int(11) DEFAULT NULL,
  `carFees` varchar(50) DEFAULT NULL,
  `intentHouse` varchar(255) DEFAULT NULL,
  `seeDate` varchar(50) DEFAULT NULL,
  `budgetEach` varchar(10) DEFAULT NULL,
  `budgetTotal` varchar(10) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `intentCount` varchar(10) DEFAULT NULL,
  `payWay` varchar(200) DEFAULT NULL,
  `clientPoint` text,
  `sellerAdvice` text,
  `tim` int(11) DEFAULT NULL,
  `saleNotes` text,
  `SName` varchar(20) DEFAULT NULL,
  `SDate` int(11) DEFAULT NULL,
  `serviceNotes` text,
  `seName` varchar(20) DEFAULT NULL,
  `seDate` int(11) DEFAULT NULL,
  `service` varchar(20) DEFAULT NULL,
  `travelNotes` text,
  `trName` varchar(20) DEFAULT NULL,
  `trDate` int(11) DEFAULT NULL,
  `preHouse` varchar(255) DEFAULT NULL,
  `preNum` int(11) DEFAULT NULL,
  `permitCar` varchar(50) DEFAULT NULL,
  `permitCarFees` varchar(50) DEFAULT NULL,
  `driver` varchar(50) DEFAULT NULL,
  `driverTel` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `isshow` int(11) DEFAULT NULL,
  `isSum` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_duty`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_duty` (
  `id` int(11) NOT NULL,
  `dutyId` int(11) NOT NULL DEFAULT '0',
  `dutyName` varchar(20) NOT NULL DEFAULT '',
  `groupName` varchar(20) NOT NULL DEFAULT '',
  `clientCount` int(4) NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `signIn` int(11) NOT NULL DEFAULT '0',
  `signOut` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedId` int(11) NOT NULL DEFAULT '0',
  `depart` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1、分销，2、案场'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_money_param`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_money_param` (
  `id` int(10) unsigned NOT NULL,
  `jobId` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '岗位ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `typeName` varchar(20) NOT NULL DEFAULT '' COMMENT '类型名称',
  `param` double(10,5) unsigned NOT NULL,
  `performanceStart` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '业绩开始',
  `performanceEnd` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `monthStart` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开始月份',
  `monthEnd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '结束月份',
  `months` varchar(50) NOT NULL DEFAULT '',
  `numberStart` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '人头数',
  `numberEnd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `startAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_prebuilding`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_prebuilding` (
  `id` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `clientId` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `seeStatus` tinyint(1) NOT NULL,
  `seeDate` int(11) NOT NULL DEFAULT '0',
  `content` varchar(500) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_property`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_property` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `clientLevel` tinyint(1) NOT NULL,
  `serviceStatus` tinyint(1) NOT NULL,
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `belongUserId` int(11) NOT NULL DEFAULT '0',
  `belongUser` varchar(50) NOT NULL DEFAULT '',
  `purpose` varchar(50) NOT NULL DEFAULT '',
  `buyCity` varchar(100) NOT NULL DEFAULT '',
  `preference` varchar(100) NOT NULL DEFAULT '',
  `unitPrice` tinyint(4) NOT NULL DEFAULT '0',
  `unitPrice1` varchar(20) NOT NULL DEFAULT '',
  `totalPrice` tinyint(4) NOT NULL DEFAULT '0',
  `totalPrice1` varchar(20) NOT NULL DEFAULT '',
  `area` tinyint(4) NOT NULL DEFAULT '0',
  `area1` varchar(20) NOT NULL DEFAULT '',
  `fitment` tinyint(4) NOT NULL DEFAULT '0',
  `fitment1` varchar(20) NOT NULL DEFAULT '',
  `roomType` varchar(100) NOT NULL DEFAULT '',
  `buyNum` int(11) NOT NULL DEFAULT '0',
  `clientPoint` varchar(1000) NOT NULL DEFAULT '',
  `propertyNotes` varchar(1000) NOT NULL DEFAULT '',
  `propertyType` tinyint(1) NOT NULL DEFAULT '1',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `seeItem` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_remoney`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_remoney` (
  `id` int(6) unsigned NOT NULL,
  `dealId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '购房明细',
  `agentDealId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '代理商结佣id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型（1：购房明细回款，2：代理商结佣）',
  `money` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '回款',
  `backAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回款时间',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `createdBy` varchar(25) NOT NULL DEFAULT '' COMMENT '添加人',
  `isBack` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '结佣类别',
  `backStatus` varchar(30) NOT NULL DEFAULT '' COMMENT '储存backStatus的字段集合，方便检索。{1:2|2:1}',
  `backStatusStr` varchar(500) NOT NULL DEFAULT '' COMMENT '回佣流程,json'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_reported`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_reported` (
  `id` int(11) unsigned NOT NULL,
  `source` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1web2App',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '报备类型(1分销，2二手房）3直销',
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '看房安排ID',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '客户性别',
  `clientId` int(6) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `clientName` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(32) NOT NULL DEFAULT '',
  `buildingId` int(6) unsigned NOT NULL DEFAULT '0',
  `buildingName` varchar(50) NOT NULL DEFAULT '',
  `arrangeUserId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '带看人Id',
  `arrangeUser` varchar(50) NOT NULL DEFAULT '' COMMENT '带看人',
  `belongId` int(11) NOT NULL DEFAULT '0' COMMENT '权属人ID',
  `belongUser` varchar(15) NOT NULL DEFAULT '' COMMENT '权属人',
  `clientNum` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '带看人数',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `confirmAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `updatedAt` int(6) unsigned NOT NULL,
  `cooperateType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:我房网，2：房盟网，3：分销项目（值的2次方相加）      2我房网,4房盟网，6我房网和房盟都选',
  `seeDate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '报备状态 1：无效客户，2:报备客户，3：初步确认，可带看，4：申请带看，5：确认带看(成交列表), 6:成交客户，7：确认成交  9：退房客户,10,带看无效  11删除  12 确认无效  20同一天多条，永远不显示 ,21在看房安排用户删除掉的数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_reported_client`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_reported_client` (
  `id` int(11) unsigned NOT NULL,
  `clientId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `arrangeId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '看房安排ID',
  `reportId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '报备id',
  `clientName` varchar(50) NOT NULL DEFAULT '' COMMENT '客户姓名',
  `tel` char(32) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '报备状态 1：无效客户，2:报备客户，3：初步确认，可带看，4：申请带看，5：确认带看(成交列表), 6:成交客户，7：确认成交  9：退房客户,10,带看无效  11删除  12 确认无效  20同一天多条，永远不显示  21业务员删除',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '报备类型(1分销，2二手房部门看新房）',
  `dddd` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_reported_status`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_reported_status` (
  `id` int(6) unsigned NOT NULL,
  `reportId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '报备',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '操作人',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1:分销报备2二手房新房报备',
  `createdBy` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `notes` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '操作等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_sales`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_sales` (
  `buildingId` int(11) NOT NULL,
  `surplus` int(11) NOT NULL DEFAULT '0',
  `surplusRoom` varchar(200) NOT NULL DEFAULT '',
  `areaScope` varchar(200) NOT NULL DEFAULT '',
  `priceScope` varchar(200) NOT NULL DEFAULT '',
  `payType` varchar(200) NOT NULL DEFAULT '',
  `favourable` varchar(200) NOT NULL DEFAULT '',
  `loanBank` varchar(100) NOT NULL DEFAULT '',
  `mortgage` varchar(100) NOT NULL DEFAULT '',
  `pinControl` varchar(200) NOT NULL DEFAULT '',
  `intenet` varchar(100) NOT NULL DEFAULT '',
  `purchase` varchar(200) NOT NULL DEFAULT '',
  `project` varchar(200) NOT NULL DEFAULT '',
  `payTime` varchar(50) NOT NULL DEFAULT '',
  `fiveCard` varchar(100) NOT NULL DEFAULT '',
  `propertyTime` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `updateBy` varchar(50) NOT NULL DEFAULT '',
  `updateAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_summary`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_summary` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL DEFAULT '0',
  `getArrangeId` int(11) NOT NULL DEFAULT '0',
  `isBargain` tinyint(1) NOT NULL DEFAULT '2',
  `noIntro` varchar(500) NOT NULL DEFAULT '',
  `noNotes` varchar(255) NOT NULL DEFAULT '',
  `receptTim` int(11) NOT NULL DEFAULT '0',
  `days` tinyint(4) NOT NULL DEFAULT '0',
  `summary` varchar(1000) NOT NULL DEFAULT '',
  `travel` varchar(1000) NOT NULL DEFAULT '',
  `carNum` varchar(20) NOT NULL DEFAULT '',
  `driver` varchar(20) NOT NULL DEFAULT '',
  `driverTel` varchar(50) NOT NULL DEFAULT '',
  `dateStart` varchar(20) NOT NULL DEFAULT '',
  `dateEnd` varchar(20) NOT NULL DEFAULT '',
  `mileStart` varchar(20) NOT NULL DEFAULT '',
  `mileEnd` varchar(20) NOT NULL DEFAULT '',
  `gas` varchar(50) NOT NULL DEFAULT '0',
  `carNotes` varchar(500) NOT NULL DEFAULT '',
  `sumNotation` varchar(1000) NOT NULL DEFAULT '',
  `postilId` int(11) NOT NULL DEFAULT '0',
  `postilName` varchar(50) NOT NULL DEFAULT '',
  `postilDate` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_summary_view`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_summary_view` (
  `id` int(11) unsigned NOT NULL,
  `currentId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '购房明细id',
  `userId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `userName` varchar(25) NOT NULL DEFAULT '' COMMENT '操作人',
  `dayAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '查看时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_tel`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_tel` (
  `id` mediumint(8) unsigned NOT NULL,
  `clientId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `telName` varchar(30) NOT NULL DEFAULT '',
  `tel` char(32) NOT NULL DEFAULT '',
  `xtel` char(20) NOT NULL DEFAULT '',
  `telType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `clientLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_tel_views`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_tel_views` (
  `id` int(10) unsigned NOT NULL,
  `currentId` int(10) unsigned NOT NULL DEFAULT '0',
  `viewUserid` int(6) unsigned NOT NULL DEFAULT '0',
  `viewUser` varchar(50) NOT NULL DEFAULT '',
  `counts` int(4) unsigned NOT NULL DEFAULT '0',
  `daycounts` int(4) unsigned NOT NULL DEFAULT '0',
  `dayAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_usercar`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_usercar` (
  `id` int(11) NOT NULL,
  `driverId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '司机Id',
  `driverName` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '出车类型：1分销 2二手房,3装修4案场',
  `clientId` mediumint(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `getArrangeId` mediumint(11) unsigned NOT NULL DEFAULT '0' COMMENT '看房安排Id',
  `userId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '置业顾问Id',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `userId2` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '出车顾问2 id',
  `userName2` varchar(50) NOT NULL DEFAULT '',
  `manNum` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '出车人数',
  `carId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `carNum` varchar(20) NOT NULL DEFAULT '' COMMENT '车牌号',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '出车城市',
  `aimCity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '目的城市',
  `aimType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接客地点,类型',
  `area` varchar(1000) NOT NULL DEFAULT '' COMMENT '出车区域',
  `outAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '出车时间',
  `trueOutAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实际出车时间',
  `overAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `howAt` int(10) NOT NULL DEFAULT '0',
  `orderAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间(司机)',
  `buildingId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '愈看楼盘ID，第一个',
  `orderBuliding` varchar(255) NOT NULL DEFAULT '' COMMENT '预看楼盘',
  `signAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签到时间',
  `signOverAt` int(10) NOT NULL DEFAULT '0' COMMENT '司机收车时间',
  `signOverMap` varchar(100) NOT NULL DEFAULT '' COMMENT '收车坐标',
  `startKm` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '出车公里',
  `endKm` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '收车公里',
  `howFar` varchar(30) NOT NULL DEFAULT '0',
  `oilCost` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '油费',
  `eachCost` tinyint(5) unsigned NOT NULL DEFAULT '0',
  `otherCost` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '其他费用',
  `totalCost` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '总费用',
  `notes` varchar(255) NOT NULL DEFAULT '',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '6发布预约、7发布出车,8出车完毕',
  `carAddress` varchar(255) NOT NULL DEFAULT '' COMMENT '用车地址',
  `mapLng` varchar(20) NOT NULL DEFAULT '0',
  `mapLat` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_visit`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_visit` (
  `id` int(11) unsigned NOT NULL,
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `visitId` int(6) unsigned NOT NULL DEFAULT '0',
  `visitName` varchar(50) NOT NULL DEFAULT '',
  `way` tinyint(4) NOT NULL DEFAULT '0',
  `serviceWay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientLevel` tinyint(4) NOT NULL DEFAULT '0',
  `lastVisitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `nextVisitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `nextContent2` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '5',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `isNeedArrange` tinyint(1) NOT NULL DEFAULT '0',
  `isFitment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '1需要指定地接，2需要指定装修管家',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `visitHouseAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (id)
(PARTITION p2013 VALUES LESS THAN (280124) ENGINE = MyISAM,
 PARTITION p2014 VALUES LESS THAN MAXVALUE ENGINE = MyISAM) */;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_visit1`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_visit1` (
  `id` int(11) unsigned NOT NULL,
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `visitId` int(6) unsigned NOT NULL DEFAULT '0',
  `visitName` varchar(50) NOT NULL DEFAULT '',
  `way` tinyint(4) NOT NULL DEFAULT '0',
  `serviceWay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientLevel` tinyint(4) NOT NULL DEFAULT '0',
  `lastVisitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `nextVisitDate` int(6) unsigned NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `nextContent2` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '5',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `isNeedArrange` tinyint(1) NOT NULL DEFAULT '0',
  `isFitment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrangeId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '1需要指定地接，2需要指定装修管家',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `visitHouseAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (id)
(PARTITION p2013 VALUES LESS THAN (280124) ENGINE = MyISAM,
 PARTITION p2014 VALUES LESS THAN MAXVALUE ENGINE = MyISAM) */;

-- --------------------------------------------------------

--
-- 表的结构 `wf_fenxiao_visit_content`
--

CREATE TABLE IF NOT EXISTS `wf_fenxiao_visit_content` (
  `visitId` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL DEFAULT '',
  `nextContent` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_agent`
--

CREATE TABLE IF NOT EXISTS `wf_form_agent` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL COMMENT 'agent表的代理商id',
  `name` varchar(255) NOT NULL COMMENT '代理商名称',
  `url` varchar(255) NOT NULL COMMENT '网络地址',
  `type` tinyint(1) unsigned NOT NULL COMMENT '拓客方式',
  `size` tinyint(1) unsigned NOT NULL COMMENT '人数规模',
  `area` varchar(255) NOT NULL COMMENT '主推区域，逗号隔开',
  `content` text NOT NULL COMMENT '分销商介绍',
  `manager` varchar(30) NOT NULL COMMENT '代理商总经理',
  `manager_tel` varchar(30) NOT NULL COMMENT '总经理电话',
  `contact` varchar(30) NOT NULL COMMENT '代理商对接人',
  `contact_tel` varchar(30) NOT NULL COMMENT '对接人电话',
  `service_point` varchar(255) NOT NULL COMMENT '服务点',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商简介表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_agent_address`
--

CREATE TABLE IF NOT EXISTS `wf_form_agent_address` (
  `agent_id` int(11) NOT NULL COMMENT '代理商id',
  `province` int(6) NOT NULL COMMENT '省id',
  `city` int(6) NOT NULL COMMENT '市id',
  `address` varchar(255) NOT NULL COMMENT '地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代理商门店地址表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_agent_dw`
--

CREATE TABLE IF NOT EXISTS `wf_form_agent_dw` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '代理商名称',
  `province` int(11) NOT NULL COMMENT '省id',
  `city` int(11) NOT NULL COMMENT '市id',
  `type` varchar(255) NOT NULL COMMENT '拓展方式',
  `content` text NOT NULL COMMENT '拓客详情',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岛外拓展代理商表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_field`
--

CREATE TABLE IF NOT EXISTS `wf_form_field` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '驻场名称',
  `type` varchar(255) NOT NULL COMMENT '到案场方式',
  `content` text NOT NULL COMMENT '驻场详情',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='渠道驻场表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_garrison`
--

CREATE TABLE IF NOT EXISTS `wf_form_garrison` (
  `id` int(11) unsigned NOT NULL,
  `check_date` int(10) unsigned NOT NULL COMMENT '检查日期',
  `area_id` int(11) NOT NULL COMMENT '区域id',
  `area_name` varchar(50) NOT NULL COMMENT '区域名称',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `store_name` varchar(50) NOT NULL COMMENT '门店名称',
  `group_id` int(11) NOT NULL COMMENT '组别id',
  `group_name` varchar(50) NOT NULL COMMENT '组别名称',
  `manager_id` int(11) NOT NULL COMMENT '负责人id',
  `manager_name` varchar(50) NOT NULL COMMENT '负责人名称',
  `place` varchar(255) NOT NULL COMMENT '检查地点',
  `dress` tinyint(1) NOT NULL COMMENT '检查整体着装',
  `dress_ps` varchar(100) NOT NULL COMMENT '检查整体着装附言',
  `state` tinyint(1) NOT NULL COMMENT '检查人员状态',
  `state_ps` varchar(100) NOT NULL COMMENT '检查人员状态附言',
  `rubbish` tinyint(1) NOT NULL COMMENT '店内垃圾桶情况',
  `rubbish_ps` varchar(100) NOT NULL COMMENT '是否派发一手传单附言',
  `leaflet` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否派发一手传单：默认0否，1是',
  `leaflet_ps` varchar(100) NOT NULL COMMENT '店内卫生形象情况附言',
  `guest` varchar(100) NOT NULL COMMENT '收客情况',
  `peers` varchar(100) NOT NULL COMMENT '同行驻守状态',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='驻守报告';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_garrison_img`
--

CREATE TABLE IF NOT EXISTS `wf_form_garrison_img` (
  `id` int(11) unsigned NOT NULL,
  `garrison_id` int(11) unsigned NOT NULL COMMENT '驻守id',
  `path` varchar(255) NOT NULL COMMENT '图片路径',
  `name` varchar(255) NOT NULL COMMENT '图片名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1驻守图片，2同行驻守图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='驻守图片';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_inspections_hks`
--

CREATE TABLE IF NOT EXISTS `wf_form_inspections_hks` (
  `id` int(11) unsigned NOT NULL,
  `check_date` int(10) unsigned NOT NULL COMMENT '检查日期',
  `area_id` int(11) unsigned NOT NULL COMMENT '区域（部门）id',
  `area_name` varchar(50) NOT NULL COMMENT '区域名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '门店（部门）id',
  `store_name` varchar(50) NOT NULL COMMENT '门店名称',
  `group_id` int(11) NOT NULL COMMENT '组别id',
  `group_name` varchar(50) NOT NULL COMMENT '组别名称',
  `manager_id` int(11) NOT NULL COMMENT '负责人id',
  `manager_name` varchar(50) NOT NULL COMMENT '负责人名称',
  `total` int(5) NOT NULL COMMENT '总分',
  `ranking` int(5) NOT NULL COMMENT '门店排名',
  `patrol_health` int(5) NOT NULL COMMENT '门店卫生（巡店）',
  `patrol_health_ps` varchar(100) NOT NULL,
  `patrol_dress` int(5) NOT NULL COMMENT '着装（巡店）',
  `patrol_dress_ps` varchar(100) NOT NULL,
  `patrol_outlook` int(5) NOT NULL COMMENT '精神面貌（巡店）',
  `patrol_outlook_ps` varchar(100) NOT NULL,
  `patrol_total` int(5) NOT NULL COMMENT '巡店总分',
  `garrison_dress` int(5) NOT NULL COMMENT '着装（驻守）',
  `garrison_dress_ps` varchar(100) NOT NULL,
  `garrison_state` int(5) NOT NULL COMMENT '状态（驻守）',
  `garrison_state_ps` varchar(100) NOT NULL,
  `garrison_attendance` int(5) NOT NULL COMMENT '到岗情况（驻守）',
  `garrison_attendance_ps` varchar(100) NOT NULL,
  `garrison_total` int(5) NOT NULL COMMENT '驻守总分',
  `receipt_standard` int(5) NOT NULL COMMENT '填写规范（收据合同）',
  `receipt_standard_ps` varchar(100) NOT NULL,
  `receipt_back` int(5) NOT NULL COMMENT '及时收回（收据合同）',
  `receipt_back_ps` varchar(100) NOT NULL,
  `receipt_lose` int(5) NOT NULL COMMENT '遗失情况（收据合同）',
  `receipt_lose_ps` varchar(100) NOT NULL,
  `receipt_total` int(5) NOT NULL COMMENT '收据合同总分',
  `visit_complain` int(5) NOT NULL COMMENT '是否投诉（电话回访）',
  `visit_complain_ps` varchar(100) NOT NULL,
  `visit_truth` int(5) NOT NULL COMMENT '真实性（电话回访）',
  `visit_truth_ps` varchar(100) NOT NULL,
  `visit_attitude` int(5) NOT NULL COMMENT '服务态度（电话回访）',
  `visit_attitude_ps` varchar(100) NOT NULL,
  `visit_total` int(5) NOT NULL COMMENT '电话回访总分',
  `prospecting_standard` int(5) NOT NULL COMMENT '符合标准（实勘）',
  `prospecting_standard_ps` varchar(100) NOT NULL,
  `prospecting_truth` int(5) NOT NULL COMMENT '真实性（实勘）',
  `prospecting_truth_ps` varchar(100) NOT NULL,
  `prospecting_total` int(5) NOT NULL COMMENT '实勘总分',
  `network_standard` int(5) NOT NULL COMMENT '标题规范（网络检查）',
  `network_standard_ps` varchar(100) NOT NULL,
  `network_truth` int(5) NOT NULL COMMENT '房源真实（网络检查）',
  `network_truth_ps` varchar(100) NOT NULL,
  `network_pass` int(5) NOT NULL COMMENT '使用合格率（网络检查）',
  `network_pass_ps` varchar(100) NOT NULL,
  `network_total` int(5) NOT NULL COMMENT '网络检查总分',
  `ps` varchar(255) NOT NULL COMMENT '备注',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='海口二手房门店稽查';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_inspections_hks_statistics`
--

CREATE TABLE IF NOT EXISTS `wf_form_inspections_hks_statistics` (
  `id` int(11) unsigned NOT NULL,
  `area_id` int(11) NOT NULL,
  `area_name` varchar(50) NOT NULL,
  `total` double(10,2) NOT NULL,
  `ranking` int(5) NOT NULL,
  `start_time` int(10) NOT NULL COMMENT '一周开始日期，周一00:00',
  `end_time` int(10) NOT NULL COMMENT '一周结束时间，周日23:59',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='海口二手房稽查区域总分排名统计表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_material`
--

CREATE TABLE IF NOT EXISTS `wf_form_material` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL COMMENT '代理商id',
  `agent_name` varchar(255) NOT NULL COMMENT '代理商名称',
  `content` text NOT NULL COMMENT '物料配送及培训详情',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代理商物料配送及培训表表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_patrol`
--

CREATE TABLE IF NOT EXISTS `wf_form_patrol` (
  `id` int(11) unsigned NOT NULL,
  `check_date` int(10) unsigned NOT NULL COMMENT '检查日期',
  `area_id` int(11) unsigned NOT NULL COMMENT '区域（部门）id',
  `area_name` varchar(50) NOT NULL COMMENT '区域名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '门店（部门）id',
  `store_name` varchar(50) NOT NULL COMMENT '门店名称',
  `group_id` int(11) NOT NULL COMMENT '组别id',
  `group_name` varchar(50) NOT NULL COMMENT '组别名称',
  `manager_id` int(11) NOT NULL COMMENT '负责人id',
  `manager_name` varchar(50) NOT NULL COMMENT '负责人名称',
  `ground` tinyint(1) NOT NULL COMMENT '店内地面情况',
  `ground_ps` varchar(100) NOT NULL COMMENT '店内地面情况附言',
  `toilet` tinyint(1) NOT NULL COMMENT '卫生间情况',
  `toilet_ps` varchar(100) NOT NULL COMMENT '卫生间情况附言',
  `rubbish` tinyint(1) NOT NULL COMMENT '店内垃圾桶情况',
  `rubbish_ps` varchar(100) NOT NULL COMMENT '店内垃圾桶情况附言',
  `health` tinyint(1) NOT NULL COMMENT '店内卫生形象情况',
  `health_ps` varchar(100) NOT NULL COMMENT '店内卫生形象情况附言',
  `work` tinyint(1) NOT NULL COMMENT '人员及工作状态',
  `work_ps` varchar(100) NOT NULL COMMENT '人员及工作状态附言',
  `out` tinyint(1) NOT NULL COMMENT '外出登记情况',
  `out_ps` varchar(100) NOT NULL COMMENT '外出登记情况附言',
  `key` tinyint(1) NOT NULL COMMENT '钥匙登记情况',
  `key_ps` varchar(100) NOT NULL COMMENT '钥匙登记情况附言',
  `question` tinyint(1) NOT NULL COMMENT '提问详情',
  `question_ps` varchar(100) NOT NULL COMMENT '提问详情附言',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='巡店报告';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_patrol_chargebacks`
--

CREATE TABLE IF NOT EXISTS `wf_form_patrol_chargebacks` (
  `id` int(11) unsigned NOT NULL,
  `area_id` int(11) unsigned NOT NULL COMMENT '区域（部门）id',
  `area_name` varchar(50) NOT NULL COMMENT '区域名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '门店（部门）id',
  `store_name` varchar(50) NOT NULL COMMENT '门店名称',
  `group_id` int(11) NOT NULL COMMENT '组别id',
  `group_name` varchar(50) NOT NULL COMMENT '组别名称',
  `manager_id` int(11) NOT NULL COMMENT '负责人id',
  `manager_name` varchar(50) NOT NULL COMMENT '负责人名称',
  `staff_id` int(11) NOT NULL COMMENT '员工id',
  `staff` varchar(50) NOT NULL COMMENT '被罚人员',
  `price` decimal(10,2) NOT NULL COMMENT '被罚金额',
  `reason` varchar(255) NOT NULL COMMENT '被罚原因',
  `fine_date` int(10) NOT NULL COMMENT '被罚日期',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='巡店扣款';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_patrol_img`
--

CREATE TABLE IF NOT EXISTS `wf_form_patrol_img` (
  `id` int(11) unsigned NOT NULL,
  `patrol_id` int(11) unsigned NOT NULL COMMENT '巡店id',
  `path` varchar(255) NOT NULL COMMENT '图片路径',
  `name` varchar(255) NOT NULL COMMENT '图片名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='巡店图片';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_salesman`
--

CREATE TABLE IF NOT EXISTS `wf_form_salesman` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '业务员姓名',
  `tel` varchar(30) NOT NULL COMMENT '联系方式',
  `station` varchar(30) NOT NULL COMMENT '岗位',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='业务员通讯录表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_form_visit`
--

CREATE TABLE IF NOT EXISTS `wf_form_visit` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL COMMENT '代理商id',
  `agent_name` varchar(255) NOT NULL COMMENT '代理商名称',
  `content` text NOT NULL COMMENT '拜访内容',
  `city` int(11) NOT NULL COMMENT '拜访城市id',
  `visit_at` int(10) NOT NULL COMMENT '拜访时间',
  `created_id` int(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_id` int(11) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上门拜访代理商表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_access`
--

CREATE TABLE IF NOT EXISTS `wf_forum_access` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allowview` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetimage` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostimage` tinyint(1) NOT NULL DEFAULT '0',
  `adminuser` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_activity`
--

CREATE TABLE IF NOT EXISTS `wf_forum_activity` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttimefrom` int(10) unsigned NOT NULL DEFAULT '0',
  `starttimeto` int(10) unsigned NOT NULL DEFAULT '0',
  `place` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `applynumber` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `ufield` text NOT NULL,
  `credit` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_activityapply`
--

CREATE TABLE IF NOT EXISTS `wf_forum_activityapply` (
  `applyid` int(10) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` mediumint(8) NOT NULL DEFAULT '0',
  `ufielddata` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_announcement`
--

CREATE TABLE IF NOT EXISTS `wf_forum_announcement` (
  `id` smallint(6) unsigned NOT NULL,
  `author` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `groups` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_0`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_0` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_1`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_1` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_2`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_2` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_3`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_3` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_4`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_4` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_5`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_5` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_6`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_6` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_7`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_7` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_8`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_8` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_9`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_9` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `picid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_exif`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_exif` (
  `aid` mediumint(8) unsigned NOT NULL,
  `exif` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachment_unused`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachment_unused` (
  `aid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_attachtype`
--

CREATE TABLE IF NOT EXISTS `wf_forum_attachtype` (
  `id` smallint(6) unsigned NOT NULL,
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` char(12) NOT NULL DEFAULT '',
  `maxsize` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_bbcode`
--

CREATE TABLE IF NOT EXISTS `wf_forum_bbcode` (
  `id` mediumint(8) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `replacement` text NOT NULL,
  `example` varchar(255) NOT NULL DEFAULT '',
  `explanation` text NOT NULL,
  `params` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `prompt` text NOT NULL,
  `nest` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `perm` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_building`
--

CREATE TABLE IF NOT EXISTS `wf_forum_building` (
  `buildingid` mediumint(8) unsigned NOT NULL,
  `fid` mediumint(8) unsigned NOT NULL,
  `pinyin` char(2) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_collection`
--

CREATE TABLE IF NOT EXISTS `wf_forum_collection` (
  `ctid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `follownum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threadnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `commentnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `rate` float NOT NULL DEFAULT '0',
  `ratenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastsubject` varchar(80) NOT NULL DEFAULT '',
  `lastposttime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposter` varchar(15) NOT NULL DEFAULT '',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_collectioncomment`
--

CREATE TABLE IF NOT EXISTS `wf_forum_collectioncomment` (
  `cid` mediumint(8) unsigned NOT NULL,
  `ctid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `useip` varchar(16) NOT NULL DEFAULT '',
  `rate` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_collectionfollow`
--

CREATE TABLE IF NOT EXISTS `wf_forum_collectionfollow` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `ctid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_collectioninvite`
--

CREATE TABLE IF NOT EXISTS `wf_forum_collectioninvite` (
  `ctid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_collectionrelated`
--

CREATE TABLE IF NOT EXISTS `wf_forum_collectionrelated` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `collection` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_collectionteamworker`
--

CREATE TABLE IF NOT EXISTS `wf_forum_collectionteamworker` (
  `ctid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(15) NOT NULL DEFAULT '',
  `lastvisit` int(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_collectionthread`
--

CREATE TABLE IF NOT EXISTS `wf_forum_collectionthread` (
  `ctid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_creditslog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_creditslog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromto` char(15) NOT NULL DEFAULT '',
  `sendcredits` tinyint(1) NOT NULL DEFAULT '0',
  `receivecredits` tinyint(1) NOT NULL DEFAULT '0',
  `send` int(10) unsigned NOT NULL DEFAULT '0',
  `receive` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `operation` char(3) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_debate`
--

CREATE TABLE IF NOT EXISTS `wf_forum_debate` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `affirmdebaters` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `negadebaters` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `affirmvotes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `negavotes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `umpire` varchar(15) NOT NULL DEFAULT '',
  `winner` tinyint(1) NOT NULL DEFAULT '0',
  `bestdebater` varchar(50) NOT NULL DEFAULT '',
  `affirmpoint` text NOT NULL,
  `negapoint` text NOT NULL,
  `umpirepoint` text NOT NULL,
  `affirmvoterids` text NOT NULL,
  `negavoterids` text NOT NULL,
  `affirmreplies` mediumint(8) unsigned NOT NULL,
  `negareplies` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_debatepost`
--

CREATE TABLE IF NOT EXISTS `wf_forum_debatepost` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `stand` tinyint(1) NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `voters` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `voterids` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_faq`
--

CREATE TABLE IF NOT EXISTS `wf_forum_faq` (
  `id` smallint(6) NOT NULL,
  `fpid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `identifier` varchar(20) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_forum`
--

CREATE TABLE IF NOT EXISTS `wf_forum_forum` (
  `fid` mediumint(8) unsigned NOT NULL,
  `fup` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` enum('group','forum','sub') NOT NULL DEFAULT 'forum',
  `name` char(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `todayposts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` char(110) NOT NULL DEFAULT '',
  `domain` char(15) NOT NULL DEFAULT '',
  `allowsmilies` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowmediacode` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostspecial` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowspecialonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowappend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alloweditrules` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '1',
  `allowside` tinyint(1) NOT NULL DEFAULT '0',
  `recyclebin` tinyint(1) NOT NULL DEFAULT '0',
  `modnewposts` tinyint(1) NOT NULL DEFAULT '0',
  `jammer` tinyint(1) NOT NULL DEFAULT '0',
  `disablewatermark` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedmod` tinyint(1) NOT NULL DEFAULT '0',
  `autoclose` smallint(6) NOT NULL DEFAULT '0',
  `forumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `catforumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `threadcaches` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `simple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modworks` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowglobalstick` tinyint(1) NOT NULL DEFAULT '1',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `commoncredits` int(10) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `recommend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disablethumb` tinyint(1) NOT NULL DEFAULT '0',
  `disablecollect` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_forumfield`
--

CREATE TABLE IF NOT EXISTS `wf_forum_forumfield` (
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `password` varchar(12) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  `attachextensions` varchar(255) NOT NULL DEFAULT '',
  `creditspolicy` mediumtext NOT NULL,
  `formulaperm` text NOT NULL,
  `moderators` text NOT NULL,
  `rules` text NOT NULL,
  `threadtypes` text NOT NULL,
  `threadsorts` text NOT NULL,
  `viewperm` text NOT NULL,
  `postperm` text NOT NULL,
  `replyperm` text NOT NULL,
  `getattachperm` text NOT NULL,
  `postattachperm` text NOT NULL,
  `postimageperm` text NOT NULL,
  `spviewperm` text NOT NULL,
  `seotitle` text NOT NULL,
  `keywords` text NOT NULL,
  `seodescription` text NOT NULL,
  `supe_pushsetting` text NOT NULL,
  `modrecommend` text NOT NULL,
  `threadplugin` text NOT NULL,
  `extra` text NOT NULL,
  `jointype` tinyint(1) NOT NULL DEFAULT '0',
  `gviewperm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `membernum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `activity` int(10) unsigned NOT NULL DEFAULT '0',
  `founderuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `foundername` varchar(255) NOT NULL DEFAULT '',
  `banner` varchar(255) NOT NULL DEFAULT '',
  `groupnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `commentitem` text NOT NULL,
  `relatedgroup` text NOT NULL,
  `picstyle` tinyint(1) NOT NULL DEFAULT '0',
  `widthauto` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_forumrecommend`
--

CREATE TABLE IF NOT EXISTS `wf_forum_forumrecommend` (
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL,
  `typeid` smallint(6) NOT NULL,
  `displayorder` tinyint(1) NOT NULL,
  `subject` char(80) NOT NULL,
  `author` char(15) NOT NULL,
  `authorid` mediumint(8) NOT NULL,
  `moderatorid` mediumint(8) NOT NULL,
  `expiration` int(10) unsigned NOT NULL,
  `position` tinyint(1) NOT NULL DEFAULT '0',
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `filename` char(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_forum_copy`
--

CREATE TABLE IF NOT EXISTS `wf_forum_forum_copy` (
  `fid` mediumint(8) unsigned NOT NULL,
  `fup` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` enum('group','forum','sub') NOT NULL DEFAULT 'forum',
  `name` char(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `todayposts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` char(110) NOT NULL DEFAULT '',
  `domain` char(15) NOT NULL DEFAULT '',
  `allowsmilies` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowmediacode` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostspecial` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowspecialonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowappend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alloweditrules` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '0',
  `allowside` tinyint(1) NOT NULL DEFAULT '0',
  `recyclebin` tinyint(1) NOT NULL DEFAULT '0',
  `modnewposts` tinyint(1) NOT NULL DEFAULT '0',
  `jammer` tinyint(1) NOT NULL DEFAULT '0',
  `disablewatermark` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedmod` tinyint(1) NOT NULL DEFAULT '0',
  `autoclose` smallint(6) NOT NULL DEFAULT '0',
  `forumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `catforumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `threadcaches` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `simple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modworks` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowglobalstick` tinyint(1) NOT NULL DEFAULT '1',
  `level` smallint(6) unsigned NOT NULL DEFAULT '0',
  `commoncredits` int(10) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `recommend` smallint(6) unsigned NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disablethumb` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_forum_threadtable`
--

CREATE TABLE IF NOT EXISTS `wf_forum_forum_threadtable` (
  `fid` smallint(6) unsigned NOT NULL,
  `threadtableid` smallint(6) unsigned NOT NULL,
  `threads` int(11) unsigned NOT NULL DEFAULT '0',
  `posts` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_groupcreditslog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_groupcreditslog` (
  `fid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL,
  `logdate` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_groupfield`
--

CREATE TABLE IF NOT EXISTS `wf_forum_groupfield` (
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `privacy` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_groupinvite`
--

CREATE TABLE IF NOT EXISTS `wf_forum_groupinvite` (
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `inviteuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_grouplevel`
--

CREATE TABLE IF NOT EXISTS `wf_forum_grouplevel` (
  `levelid` smallint(6) unsigned NOT NULL,
  `type` enum('special','default') NOT NULL DEFAULT 'default',
  `leveltitle` varchar(255) NOT NULL DEFAULT '',
  `creditshigher` int(10) NOT NULL DEFAULT '0',
  `creditslower` int(10) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `creditspolicy` text NOT NULL,
  `postpolicy` text NOT NULL,
  `specialswitch` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_groupranking`
--

CREATE TABLE IF NOT EXISTS `wf_forum_groupranking` (
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `yesterday` smallint(6) unsigned NOT NULL DEFAULT '0',
  `today` smallint(6) unsigned NOT NULL DEFAULT '0',
  `trend` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_groupuser`
--

CREATE TABLE IF NOT EXISTS `wf_forum_groupuser` (
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `joindateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `privacy` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_imagetype`
--

CREATE TABLE IF NOT EXISTS `wf_forum_imagetype` (
  `typeid` smallint(6) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` char(20) NOT NULL,
  `type` enum('smiley','icon','avatar') NOT NULL DEFAULT 'smiley',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `directory` char(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_medal`
--

CREATE TABLE IF NOT EXISTS `wf_forum_medal` (
  `medalid` smallint(6) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `expiration` smallint(6) unsigned NOT NULL DEFAULT '0',
  `permission` mediumtext NOT NULL,
  `credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_medallog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_medallog` (
  `id` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `medalid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_memberrecommend`
--

CREATE TABLE IF NOT EXISTS `wf_forum_memberrecommend` (
  `tid` mediumint(8) unsigned NOT NULL,
  `recommenduid` mediumint(8) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_moderator`
--

CREATE TABLE IF NOT EXISTS `wf_forum_moderator` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `inherited` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_modwork`
--

CREATE TABLE IF NOT EXISTS `wf_forum_modwork` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modaction` char(3) NOT NULL DEFAULT '',
  `dateline` date NOT NULL DEFAULT '2006-01-01',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  `posts` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_onlinelist`
--

CREATE TABLE IF NOT EXISTS `wf_forum_onlinelist` (
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_optionvalue1`
--

CREATE TABLE IF NOT EXISTS `wf_forum_optionvalue1` (
  `recr_name` mediumtext NOT NULL,
  `recr_style` varchar(50) NOT NULL,
  `recr_area` varchar(50) NOT NULL,
  `recr_price` varchar(50) NOT NULL,
  `recr_square` int(10) unsigned NOT NULL DEFAULT '0',
  `recr_type` varchar(50) NOT NULL,
  `recr_Kitch` mediumtext NOT NULL,
  `recr_aspect` varchar(50) NOT NULL,
  `recr_floor` int(10) unsigned NOT NULL DEFAULT '0',
  `recr_decoration` smallint(6) unsigned NOT NULL DEFAULT '0',
  `recr_location` mediumtext NOT NULL,
  `recr_mate` mediumtext NOT NULL,
  `recr_linkman` mediumtext NOT NULL,
  `recr_tel` mediumtext NOT NULL,
  `recr_email` mediumtext NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `recr_title` mediumtext NOT NULL,
  `recr_person` smallint(6) unsigned NOT NULL DEFAULT '0',
  `recr_housing` mediumtext NOT NULL,
  `recr_types` varchar(50) NOT NULL,
  `recr_description` mediumtext NOT NULL,
  `recr_phone` mediumtext NOT NULL,
  `recr_contact` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_optionvalue2`
--

CREATE TABLE IF NOT EXISTS `wf_forum_optionvalue2` (
  `recr_names` mediumtext NOT NULL,
  `recr_areas` varchar(50) NOT NULL,
  `recr_prices` varchar(50) NOT NULL,
  `recr_squares` int(10) unsigned NOT NULL DEFAULT '0',
  `recr_styles` varchar(50) NOT NULL,
  `recr_aspects` varchar(50) NOT NULL,
  `recr_floors` mediumtext NOT NULL,
  `recr_decorations` smallint(6) unsigned NOT NULL DEFAULT '0',
  `recr_mates` mediumtext NOT NULL,
  `recr_locations` mediumtext NOT NULL,
  `recr_linkmen` mediumtext NOT NULL,
  `recr_tels` mediumtext NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `recr_kitchen` mediumtext NOT NULL,
  `recr_titles` mediumtext NOT NULL,
  `recr_persons` smallint(6) unsigned NOT NULL DEFAULT '0',
  `recr_buildings` mediumtext NOT NULL,
  `recr_style` varchar(50) NOT NULL,
  `recr_descriptions` mediumtext NOT NULL,
  `recr_telephone` mediumtext NOT NULL,
  `recr_contacts` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_order`
--

CREATE TABLE IF NOT EXISTS `wf_forum_order` (
  `orderid` char(32) NOT NULL DEFAULT '',
  `status` char(3) NOT NULL DEFAULT '',
  `buyer` char(50) NOT NULL DEFAULT '',
  `admin` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `price` float(7,2) unsigned NOT NULL DEFAULT '0.00',
  `submitdate` int(10) unsigned NOT NULL DEFAULT '0',
  `confirmdate` int(10) unsigned NOT NULL DEFAULT '0',
  `email` char(40) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_poll`
--

CREATE TABLE IF NOT EXISTS `wf_forum_poll` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `overt` tinyint(1) NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `maxchoices` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `pollpreview` varchar(255) NOT NULL DEFAULT '',
  `voters` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_polloption`
--

CREATE TABLE IF NOT EXISTS `wf_forum_polloption` (
  `polloptionid` int(10) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `votes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `polloption` varchar(80) NOT NULL DEFAULT '',
  `voterids` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_pollvoter`
--

CREATE TABLE IF NOT EXISTS `wf_forum_pollvoter` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `options` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_post`
--

CREATE TABLE IF NOT EXISTS `wf_forum_post` (
  `pid` int(10) unsigned NOT NULL,
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `buildingId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `first` tinyint(1) NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` mediumtext NOT NULL,
  `useip` varchar(15) NOT NULL DEFAULT '',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `usesig` tinyint(1) NOT NULL DEFAULT '0',
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `bbcodeoff` tinyint(1) NOT NULL DEFAULT '0',
  `smileyoff` tinyint(1) NOT NULL DEFAULT '0',
  `parseurloff` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `rate` smallint(6) NOT NULL DEFAULT '0',
  `ratetimes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '0',
  `comment` tinyint(1) NOT NULL DEFAULT '0',
  `replycredit` int(10) NOT NULL DEFAULT '0',
  `position` int(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_postcache`
--

CREATE TABLE IF NOT EXISTS `wf_forum_postcache` (
  `pid` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `rate` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_postcomment`
--

CREATE TABLE IF NOT EXISTS `wf_forum_postcomment` (
  `id` int(10) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `score` tinyint(1) NOT NULL DEFAULT '0',
  `useip` varchar(15) NOT NULL DEFAULT '',
  `rpid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_postlog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_postlog` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_postposition`
--

CREATE TABLE IF NOT EXISTS `wf_forum_postposition` (
  `tid` mediumint(8) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_poststick`
--

CREATE TABLE IF NOT EXISTS `wf_forum_poststick` (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_post_location`
--

CREATE TABLE IF NOT EXISTS `wf_forum_post_location` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned DEFAULT '0',
  `uid` mediumint(8) unsigned DEFAULT '0',
  `mapx` varchar(255) NOT NULL,
  `mapy` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_post_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_forum_post_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_post_tableid`
--

CREATE TABLE IF NOT EXISTS `wf_forum_post_tableid` (
  `pid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_promotion`
--

CREATE TABLE IF NOT EXISTS `wf_forum_promotion` (
  `ip` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_ratelog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_ratelog` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `extcredits` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `score` smallint(6) NOT NULL DEFAULT '0',
  `reason` char(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_relatedthread`
--

CREATE TABLE IF NOT EXISTS `wf_forum_relatedthread` (
  `tid` mediumint(8) NOT NULL DEFAULT '0',
  `type` enum('general','trade') NOT NULL DEFAULT 'general',
  `expiration` int(10) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `relatedthreads` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_replycredit`
--

CREATE TABLE IF NOT EXISTS `wf_forum_replycredit` (
  `tid` mediumint(6) unsigned NOT NULL,
  `extcredits` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `extcreditstype` tinyint(1) NOT NULL DEFAULT '0',
  `times` smallint(6) unsigned NOT NULL DEFAULT '0',
  `membertimes` smallint(6) unsigned NOT NULL DEFAULT '0',
  `random` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_rsscache`
--

CREATE TABLE IF NOT EXISTS `wf_forum_rsscache` (
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `forum` char(50) NOT NULL DEFAULT '',
  `author` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `guidetype` char(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_spacecache`
--

CREATE TABLE IF NOT EXISTS `wf_forum_spacecache` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `variable` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `expiration` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_statlog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_statlog` (
  `logdate` date NOT NULL,
  `fid` mediumint(8) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_thread`
--

CREATE TABLE IF NOT EXISTS `wf_forum_thread` (
  `tid` mediumint(8) unsigned NOT NULL,
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posttableid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `buildingId` smallint(8) NOT NULL DEFAULT '0',
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) NOT NULL DEFAULT '0',
  `author` char(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposter` char(15) NOT NULL DEFAULT '',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(1) NOT NULL DEFAULT '0',
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `digest` tinyint(1) NOT NULL DEFAULT '0',
  `rate` tinyint(1) NOT NULL DEFAULT '0',
  `special` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) NOT NULL DEFAULT '0',
  `closed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `stickreply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommends` smallint(6) NOT NULL DEFAULT '0',
  `recommend_add` smallint(6) NOT NULL DEFAULT '0',
  `recommend_sub` smallint(6) NOT NULL DEFAULT '0',
  `heats` int(10) unsigned NOT NULL DEFAULT '0',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isgroup` tinyint(1) NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) NOT NULL DEFAULT '0',
  `stamp` tinyint(3) NOT NULL DEFAULT '-1',
  `icon` tinyint(3) NOT NULL DEFAULT '-1',
  `pushedaid` mediumint(8) NOT NULL DEFAULT '0',
  `cover` smallint(6) NOT NULL DEFAULT '0',
  `replycredit` smallint(6) NOT NULL DEFAULT '0',
  `relatebytag` char(255) NOT NULL DEFAULT '0',
  `maxposition` int(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadaddviews`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadaddviews` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `addviews` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadclass`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadclass` (
  `typeid` mediumint(8) unsigned NOT NULL,
  `fid` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `displayorder` mediumint(9) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `moderators` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadclosed`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadclosed` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `redirect` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threaddisablepos`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threaddisablepos` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadimage`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadimage` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadlog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadlog` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `otherid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL,
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadmod`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadmod` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `action` char(5) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL,
  `stamp` tinyint(3) NOT NULL,
  `reason` char(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadpartake`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadpartake` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadpreview`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadpreview` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `relay` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadrush`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadrush` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `stopfloor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttimefrom` int(10) unsigned NOT NULL DEFAULT '0',
  `starttimeto` int(10) unsigned NOT NULL DEFAULT '0',
  `rewardfloor` text NOT NULL,
  `creditlimit` int(10) NOT NULL DEFAULT '-996'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_threadtype`
--

CREATE TABLE IF NOT EXISTS `wf_forum_threadtype` (
  `typeid` smallint(6) unsigned NOT NULL,
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `special` smallint(6) NOT NULL DEFAULT '0',
  `modelid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `expiration` tinyint(1) NOT NULL DEFAULT '0',
  `template` text NOT NULL,
  `stemplate` text NOT NULL,
  `ptemplate` text NOT NULL,
  `btemplate` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_thread_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_forum_thread_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_trade`
--

CREATE TABLE IF NOT EXISTS `wf_forum_trade` (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `typeid` smallint(6) unsigned NOT NULL,
  `sellerid` mediumint(8) unsigned NOT NULL,
  `seller` char(15) NOT NULL,
  `account` char(50) NOT NULL,
  `tenpayaccount` char(20) NOT NULL DEFAULT '',
  `subject` char(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `amount` smallint(6) unsigned NOT NULL DEFAULT '1',
  `quality` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locus` char(20) NOT NULL,
  `transport` tinyint(1) NOT NULL DEFAULT '0',
  `ordinaryfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `expressfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `emsfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `lastbuyer` char(15) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `totalitems` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tradesum` decimal(8,2) NOT NULL DEFAULT '0.00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(1) NOT NULL,
  `costprice` decimal(8,2) NOT NULL,
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `costcredit` int(10) unsigned NOT NULL DEFAULT '0',
  `credittradesum` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_tradecomment`
--

CREATE TABLE IF NOT EXISTS `wf_forum_tradecomment` (
  `id` mediumint(8) NOT NULL,
  `orderid` char(32) NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `raterid` mediumint(8) unsigned NOT NULL,
  `rater` char(15) NOT NULL,
  `rateeid` mediumint(8) unsigned NOT NULL,
  `ratee` char(15) NOT NULL,
  `message` char(200) NOT NULL,
  `explanation` char(200) NOT NULL,
  `score` tinyint(1) NOT NULL,
  `dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_tradelog`
--

CREATE TABLE IF NOT EXISTS `wf_forum_tradelog` (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `orderid` varchar(32) NOT NULL,
  `tradeno` varchar(32) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `quality` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tax` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `locus` varchar(100) NOT NULL,
  `sellerid` mediumint(8) unsigned NOT NULL,
  `seller` varchar(15) NOT NULL,
  `selleraccount` varchar(50) NOT NULL,
  `tenpayaccount` varchar(20) NOT NULL DEFAULT '0',
  `buyerid` mediumint(8) unsigned NOT NULL,
  `buyer` varchar(15) NOT NULL,
  `buyercontact` varchar(50) NOT NULL,
  `buyercredits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `buyermsg` varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `offline` tinyint(1) NOT NULL DEFAULT '0',
  `buyername` varchar(50) NOT NULL,
  `buyerzip` varchar(10) NOT NULL,
  `buyerphone` varchar(20) NOT NULL,
  `buyermobile` varchar(20) NOT NULL,
  `transport` tinyint(1) NOT NULL DEFAULT '0',
  `transportfee` smallint(6) unsigned NOT NULL DEFAULT '0',
  `baseprice` decimal(8,2) NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `ratestatus` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `basecredit` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_typeoption`
--

CREATE TABLE IF NOT EXISTS `wf_forum_typeoption` (
  `optionid` smallint(6) unsigned NOT NULL,
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `expiration` tinyint(1) NOT NULL,
  `protect` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `unit` varchar(255) NOT NULL,
  `rules` mediumtext NOT NULL,
  `permprompt` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_typeoptionvar`
--

CREATE TABLE IF NOT EXISTS `wf_forum_typeoptionvar` (
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `optionid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_typevar`
--

CREATE TABLE IF NOT EXISTS `wf_forum_typevar` (
  `sortid` smallint(6) NOT NULL DEFAULT '0',
  `optionid` smallint(6) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `unchangeable` tinyint(1) NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `subjectshow` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_forum_warning`
--

CREATE TABLE IF NOT EXISTS `wf_forum_warning` (
  `wid` smallint(6) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `operatorid` mediumint(8) unsigned NOT NULL,
  `operator` char(15) NOT NULL,
  `authorid` mediumint(8) unsigned NOT NULL,
  `author` char(15) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `reason` char(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_help`
--

CREATE TABLE IF NOT EXISTS `wf_help` (
  `id` int(11) unsigned NOT NULL,
  `categoryId` text NOT NULL COMMENT '类别id字符串，用逗号连接',
  `departmentId` text NOT NULL COMMENT '有权限的部门id的集合',
  `userId` text NOT NULL COMMENT '有权限的用户id的集合',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `content` text NOT NULL COMMENT '文章内容',
  `click` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `praise` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `feedback` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '反馈次数',
  `isTop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `isRecommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `updatedBy` varchar(20) NOT NULL COMMENT '最后一次更新人',
  `updatedAt` int(10) unsigned NOT NULL COMMENT '最后一次更新时间',
  `createdId` int(11) unsigned NOT NULL COMMENT '创建人id',
  `createdBy` varchar(20) NOT NULL COMMENT '创建人',
  `createdAt` int(10) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_help_category`
--

CREATE TABLE IF NOT EXISTS `wf_help_category` (
  `id` int(4) unsigned NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '分类（部门）名称',
  `pId` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '上级id，无上级为0',
  `level` tinyint(1) unsigned NOT NULL COMMENT '层级',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_help_feedback`
--

CREATE TABLE IF NOT EXISTS `wf_help_feedback` (
  `id` int(4) unsigned NOT NULL,
  `helpId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `categoryId` text NOT NULL COMMENT '类别id字符串，用逗号连接',
  `departmentId` text NOT NULL COMMENT '有权限的部门id字符串，用逗号连接',
  `feedback` text NOT NULL COMMENT '反馈内容',
  `answer` text NOT NULL COMMENT '解答内容',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL,
  `createdId` int(11) unsigned NOT NULL COMMENT '反馈人id',
  `createdBy` varchar(20) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `isSolve` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否解决',
  `answerId` int(11) unsigned NOT NULL COMMENT '解答人id',
  `answerBy` varchar(20) NOT NULL COMMENT '解答人',
  `answerAt` int(10) unsigned NOT NULL COMMENT '解答时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `wf_help_file`
--

CREATE TABLE IF NOT EXISTS `wf_help_file` (
  `id` int(10) NOT NULL,
  `helpId` int(11) unsigned NOT NULL COMMENT '帮助文章id',
  `path` varchar(255) NOT NULL COMMENT '文件路径',
  `name` varchar(255) NOT NULL COMMENT '文件储存的名称',
  `showName` varchar(255) NOT NULL COMMENT '文件原名称',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_hire_browsed`
--

CREATE TABLE IF NOT EXISTS `wf_hire_browsed` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `hireId` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_hire_concern`
--

CREATE TABLE IF NOT EXISTS `wf_hire_concern` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `hireId` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_hire_content`
--

CREATE TABLE IF NOT EXISTS `wf_hire_content` (
  `hireId` int(11) NOT NULL,
  `introduction` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_hire_house`
--

CREATE TABLE IF NOT EXISTS `wf_hire_house` (
  `id` int(11) unsigned NOT NULL,
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `topic` varchar(100) NOT NULL DEFAULT '',
  `province` int(4) unsigned NOT NULL DEFAULT '4',
  `city` int(4) unsigned NOT NULL DEFAULT '0',
  `county` int(4) unsigned NOT NULL DEFAULT '0',
  `businessArea` int(4) unsigned NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `room` tinyint(1) NOT NULL DEFAULT '0',
  `hall` tinyint(1) NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0',
  `toilet` tinyint(1) NOT NULL DEFAULT '0',
  `veranda` tinyint(1) NOT NULL,
  `icon` varchar(100) NOT NULL DEFAULT '',
  `area` float NOT NULL DEFAULT '0',
  `floorsType` tinyint(1) unsigned NOT NULL,
  `onFloor` int(4) unsigned NOT NULL DEFAULT '0',
  `jumpFloor` int(2) unsigned NOT NULL DEFAULT '0',
  `floors` int(4) unsigned NOT NULL DEFAULT '0',
  `fitment` tinyint(1) NOT NULL DEFAULT '0',
  `face` char(4) NOT NULL DEFAULT '',
  `supporting` varchar(255) NOT NULL DEFAULT '',
  `traffic` varchar(255) NOT NULL DEFAULT '',
  `around` varchar(255) NOT NULL DEFAULT '',
  `hireType` tinyint(1) NOT NULL DEFAULT '1',
  `leastTime` int(11) NOT NULL DEFAULT '0',
  `price` int(6) unsigned NOT NULL DEFAULT '0',
  `pay` varchar(50) NOT NULL DEFAULT '',
  `years` int(4) unsigned NOT NULL DEFAULT '0',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `tel` char(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `qq` char(50) NOT NULL DEFAULT '',
  `isagent` tinyint(1) NOT NULL DEFAULT '1',
  `agentId` int(6) unsigned NOT NULL DEFAULT '0',
  `endTime` int(11) NOT NULL DEFAULT '0',
  `istop` tinyint(1) NOT NULL DEFAULT '0',
  `weightByname` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `weightScore` int(11) NOT NULL DEFAULT '0',
  `clickCnt` int(11) NOT NULL DEFAULT '0',
  `salestatus` tinyint(1) NOT NULL DEFAULT '1',
  `adminCreatedBy` varchar(20) NOT NULL DEFAULT '',
  `refreshAt` int(11) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `recommonAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '2:未审核；3：不显示到前台；7审核不通过；8经理回访；',
  `buildingStructure` tinyint(2) unsigned NOT NULL,
  `ownership` tinyint(2) unsigned NOT NULL,
  `houseLabel` varchar(20) NOT NULL DEFAULT '',
  `truster` varchar(50) NOT NULL DEFAULT '',
  `trustTel` char(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_hire_img`
--

CREATE TABLE IF NOT EXISTS `wf_hire_img` (
  `id` int(11) unsigned NOT NULL,
  `hireId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `detail` varchar(255) NOT NULL DEFAULT '',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '后台使用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_album`
--

CREATE TABLE IF NOT EXISTS `wf_home_album` (
  `albumid` mediumint(8) unsigned NOT NULL,
  `albumname` varchar(50) NOT NULL DEFAULT '',
  `catid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `picnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(60) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(10) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL,
  `favtimes` mediumint(8) unsigned NOT NULL,
  `sharetimes` mediumint(8) unsigned NOT NULL,
  `depict` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_album_category`
--

CREATE TABLE IF NOT EXISTS `wf_home_album_category` (
  `catid` mediumint(8) unsigned NOT NULL,
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(255) NOT NULL DEFAULT '',
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_appcreditlog`
--

CREATE TABLE IF NOT EXISTS `wf_home_appcreditlog` (
  `logid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `credit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_blacklist`
--

CREATE TABLE IF NOT EXISTS `wf_home_blacklist` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `buid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_blog`
--

CREATE TABLE IF NOT EXISTS `wf_home_blog` (
  `blogid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `replynum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `noreply` tinyint(1) NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `password` char(10) NOT NULL DEFAULT '',
  `favtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `click1` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click2` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click3` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click4` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click5` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click6` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click7` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click8` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_blogfield`
--

CREATE TABLE IF NOT EXISTS `wf_home_blogfield` (
  `blogid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(255) NOT NULL DEFAULT '',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `postip` varchar(255) NOT NULL DEFAULT '',
  `related` text NOT NULL,
  `relatedtime` int(10) unsigned NOT NULL DEFAULT '0',
  `target_ids` text NOT NULL,
  `hotuser` text NOT NULL,
  `magiccolor` tinyint(6) NOT NULL DEFAULT '0',
  `magicpaper` tinyint(6) NOT NULL DEFAULT '0',
  `pushedaid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_blog_category`
--

CREATE TABLE IF NOT EXISTS `wf_home_blog_category` (
  `catid` mediumint(8) unsigned NOT NULL,
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(255) NOT NULL DEFAULT '',
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_blog_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_home_blog_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_class`
--

CREATE TABLE IF NOT EXISTS `wf_home_class` (
  `classid` mediumint(8) unsigned NOT NULL,
  `classname` char(40) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_click`
--

CREATE TABLE IF NOT EXISTS `wf_home_click` (
  `clickid` smallint(6) unsigned NOT NULL,
  `name` char(50) NOT NULL DEFAULT '',
  `icon` char(100) NOT NULL DEFAULT '',
  `idtype` char(15) NOT NULL DEFAULT '',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_clickuser`
--

CREATE TABLE IF NOT EXISTS `wf_home_clickuser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `clickid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_comment`
--

CREATE TABLE IF NOT EXISTS `wf_home_comment` (
  `cid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `magicflicker` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_comment_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_home_comment_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_docomment`
--

CREATE TABLE IF NOT EXISTS `wf_home_docomment` (
  `id` int(10) unsigned NOT NULL,
  `upid` int(10) unsigned NOT NULL DEFAULT '0',
  `doid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `grade` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_doing`
--

CREATE TABLE IF NOT EXISTS `wf_home_doing` (
  `doid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `from` varchar(20) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `replynum` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_doing_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_home_doing_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_favorite`
--

CREATE TABLE IF NOT EXISTS `wf_home_favorite` (
  `favid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(255) NOT NULL DEFAULT '',
  `spaceuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_feed`
--

CREATE TABLE IF NOT EXISTS `wf_home_feed` (
  `feedid` int(10) unsigned NOT NULL,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_feed_app`
--

CREATE TABLE IF NOT EXISTS `wf_home_feed_app` (
  `feedid` int(10) unsigned NOT NULL,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_follow`
--

CREATE TABLE IF NOT EXISTS `wf_home_follow` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `followuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` char(15) NOT NULL DEFAULT '',
  `bkname` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `mutual` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_follow_feed`
--

CREATE TABLE IF NOT EXISTS `wf_home_follow_feed` (
  `feedid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_follow_feed_archiver`
--

CREATE TABLE IF NOT EXISTS `wf_home_follow_feed_archiver` (
  `feedid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_friend`
--

CREATE TABLE IF NOT EXISTS `wf_home_friend` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` varchar(15) NOT NULL DEFAULT '',
  `gid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_friendlog`
--

CREATE TABLE IF NOT EXISTS `wf_home_friendlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_friend_request`
--

CREATE TABLE IF NOT EXISTS `wf_home_friend_request` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fusername` char(15) NOT NULL DEFAULT '',
  `gid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `note` char(60) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_notification`
--

CREATE TABLE IF NOT EXISTS `wf_home_notification` (
  `id` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `from_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `from_idtype` varchar(20) NOT NULL DEFAULT '',
  `from_num` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_pic`
--

CREATE TABLE IF NOT EXISTS `wf_home_pic` (
  `picid` mediumint(8) NOT NULL,
  `albumid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `postip` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `click1` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click2` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click3` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click4` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click5` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click6` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click7` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click8` smallint(6) unsigned NOT NULL DEFAULT '0',
  `magicframe` tinyint(6) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_picfield`
--

CREATE TABLE IF NOT EXISTS `wf_home_picfield` (
  `picid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_pic_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_home_pic_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_poke`
--

CREATE TABLE IF NOT EXISTS `wf_home_poke` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromusername` varchar(15) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `iconid` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_pokearchive`
--

CREATE TABLE IF NOT EXISTS `wf_home_pokearchive` (
  `pid` mediumint(8) NOT NULL,
  `pokeuid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `iconid` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_share`
--

CREATE TABLE IF NOT EXISTS `wf_home_share` (
  `sid` mediumint(8) unsigned NOT NULL,
  `itemid` mediumint(8) unsigned NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `title_template` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_link` varchar(255) NOT NULL DEFAULT '',
  `hot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hotuser` text NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_share_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_home_share_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_show`
--

CREATE TABLE IF NOT EXISTS `wf_home_show` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `unitprice` int(10) unsigned NOT NULL DEFAULT '1',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_specialuser`
--

CREATE TABLE IF NOT EXISTS `wf_home_specialuser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `opuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opusername` varchar(15) NOT NULL DEFAULT '',
  `displayorder` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_userapp`
--

CREATE TABLE IF NOT EXISTS `wf_home_userapp` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `allowsidenav` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '0',
  `allowprofilelink` tinyint(1) NOT NULL DEFAULT '0',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `menuorder` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_userappfield`
--

CREATE TABLE IF NOT EXISTS `wf_home_userappfield` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `profilelink` text NOT NULL,
  `myml` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_home_visitor`
--

CREATE TABLE IF NOT EXISTS `wf_home_visitor` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vusername` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_house_search`
--

CREATE TABLE IF NOT EXISTS `wf_house_search` (
  `id` int(11) NOT NULL,
  `keywords` varchar(1000) NOT NULL DEFAULT '',
  `city` int(6) unsigned NOT NULL DEFAULT '0',
  `tab` varchar(20) NOT NULL,
  `isagent` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_index_property`
--

CREATE TABLE IF NOT EXISTS `wf_index_property` (
  `id` int(11) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `clientId` int(11) NOT NULL,
  `clientName` varchar(30) NOT NULL,
  `belongUserId` int(11) NOT NULL,
  `belongUser` varchar(100) NOT NULL,
  `context` varchar(1000) NOT NULL,
  `createAt` int(11) NOT NULL,
  `notes` varchar(250) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(30) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_inotice`
--

CREATE TABLE IF NOT EXISTS `wf_inotice` (
  `id` int(6) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `tcolor` char(3) NOT NULL DEFAULT '',
  `detail` mediumtext NOT NULL,
  `departIdstr` varchar(100) NOT NULL DEFAULT '',
  `departmentId` int(6) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) NOT NULL DEFAULT '0',
  `createdBy` varchar(30) NOT NULL DEFAULT '',
  `updatedAt` int(6) NOT NULL DEFAULT '0',
  `updatedBy` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_interact_record`
--

CREATE TABLE IF NOT EXISTS `wf_interact_record` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `interactId` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `sendType` tinyint(1) NOT NULL DEFAULT '0',
  `recordFrom` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `buildingName` varchar(50) NOT NULL DEFAULT '',
  `interctAt` int(11) NOT NULL DEFAULT '0',
  `trueName` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `notes` varchar(255) NOT NULL DEFAULT '',
  `belongUserId` int(11) NOT NULL DEFAULT '0',
  `message` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `updateAt` int(11) NOT NULL DEFAULT '0',
  `updateBy` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_interact_user`
--

CREATE TABLE IF NOT EXISTS `wf_interact_user` (
  `id` int(11) unsigned NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(20) NOT NULL DEFAULT '',
  `clientId` int(11) unsigned NOT NULL DEFAULT '0',
  `tel` char(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `trueName` varchar(30) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `belongUserId` int(11) NOT NULL DEFAULT '0',
  `belongUserName` varchar(30) NOT NULL DEFAULT '',
  `tuanNum` int(11) NOT NULL DEFAULT '0',
  `concernNum` int(11) NOT NULL,
  `youhuiNum` int(11) NOT NULL DEFAULT '0',
  `dynamicNum` int(11) NOT NULL DEFAULT '0',
  `optionalNum` int(11) NOT NULL DEFAULT '0',
  `smsNum` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `belongPid` int(11) NOT NULL DEFAULT '0',
  `updateAt` int(11) NOT NULL DEFAULT '0',
  `updateBy` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `forClientType` tinyint(1) NOT NULL DEFAULT '0',
  `comeFrom` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `firstAt` int(11) NOT NULL DEFAULT '0' COMMENT '第一次转移时间',
  `fromWeb` tinyint(1) NOT NULL DEFAULT '1' COMMENT '来自哪个网站：1、我房网2、0898；3、三亚地产'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_internal_links`
--

CREATE TABLE IF NOT EXISTS `wf_internal_links` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '0',
  `bold` tinyint(1) NOT NULL DEFAULT '0',
  `slope` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `orders` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_links`
--

CREATE TABLE IF NOT EXISTS `wf_links` (
  `id` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `categoryId` int(4) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `urls` varchar(100) NOT NULL DEFAULT '',
  `logo` varchar(50) NOT NULL DEFAULT '',
  `orders` int(4) NOT NULL DEFAULT '0',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(13) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(13) NOT NULL DEFAULT '',
  `intro` varchar(1000) NOT NULL DEFAULT '',
  `channel` varchar(50) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `createdId` varchar(20) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `istopAll` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `cityId` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_log`
--

CREATE TABLE IF NOT EXISTS `wf_log` (
  `id` int(11) unsigned NOT NULL,
  `dataId` int(11) NOT NULL DEFAULT '0' COMMENT '操作模块id',
  `log_module` varchar(40) NOT NULL DEFAULT '' COMMENT '模块名称',
  `log_moduleCn` varchar(50) NOT NULL DEFAULT '' COMMENT '模块中文名字',
  `log_action` varchar(40) NOT NULL DEFAULT '' COMMENT '操作名字',
  `log_actionCn` varchar(50) NOT NULL DEFAULT '' COMMENT '操作中文名字',
  `belongId` varchar(255) NOT NULL DEFAULT '0' COMMENT '操作数据id',
  `ip` varchar(16) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '操作是否成功：1为成功，2为不成功',
  `msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '记录详细信息',
  `createdAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_meeting_apply`
--

CREATE TABLE IF NOT EXISTS `wf_meeting_apply` (
  `id` smallint(5) unsigned NOT NULL COMMENT '设备id',
  `meetingRoomId` smallint(5) unsigned NOT NULL COMMENT '会议室id',
  `number` smallint(5) unsigned NOT NULL COMMENT '开会人数',
  `startTime` int(10) NOT NULL COMMENT '开始时间',
  `endTime` int(10) NOT NULL COMMENT '结束时间',
  `equipmentId` varchar(100) NOT NULL COMMENT '申请设备id，多个用逗号连接',
  `used` varchar(255) NOT NULL COMMENT '申请会议室用途',
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdAt` int(10) NOT NULL,
  `createdDepId` int(6) NOT NULL,
  `createdDep` varchar(100) NOT NULL COMMENT '申请部门名称',
  `approvalId` int(11) NOT NULL COMMENT '审批人id',
  `approvalBy` varchar(50) NOT NULL COMMENT '审批人',
  `approvalAt` int(10) NOT NULL COMMENT '审批时间',
  `opinion` varchar(255) NOT NULL COMMENT '审批意见',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '状态，默认2待审批'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会议室申请表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_meeting_equipment`
--

CREATE TABLE IF NOT EXISTS `wf_meeting_equipment` (
  `id` smallint(5) unsigned NOT NULL COMMENT '设备id',
  `name` varchar(100) NOT NULL COMMENT '设备名称',
  `number` int(6) unsigned NOT NULL COMMENT '设备数量',
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdAt` int(10) NOT NULL,
  `updatedId` int(11) NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedAt` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会议室设备表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_meeting_room`
--

CREATE TABLE IF NOT EXISTS `wf_meeting_room` (
  `id` smallint(5) unsigned NOT NULL COMMENT '会议室id',
  `name` varchar(100) NOT NULL COMMENT '会议室名称',
  `maxNumber` smallint(5) unsigned NOT NULL COMMENT '最大容纳人数',
  `equipmentId` varchar(100) NOT NULL COMMENT '设备id，多个用逗号连接',
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdAt` int(10) NOT NULL,
  `updatedId` int(11) NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedAt` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议室表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_message`
--

CREATE TABLE IF NOT EXISTS `wf_message` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `tel` char(20) NOT NULL DEFAULT '',
  `isHideName` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_mobile_setting`
--

CREATE TABLE IF NOT EXISTS `wf_mobile_setting` (
  `skey` varchar(255) NOT NULL DEFAULT '',
  `svalue` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_msg_send`
--

CREATE TABLE IF NOT EXISTS `wf_msg_send` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `userType` tinyint(1) NOT NULL DEFAULT '0',
  `way` tinyint(1) NOT NULL DEFAULT '0',
  `content` varchar(200) NOT NULL DEFAULT '',
  `sendTim` int(11) NOT NULL DEFAULT '0',
  `msgStatus` tinyint(4) NOT NULL DEFAULT '0',
  `sendBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_msg_template`
--

CREATE TABLE IF NOT EXISTS `wf_msg_template` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `keyword` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_myrepeats`
--

CREATE TABLE IF NOT EXISTS `wf_myrepeats` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` varchar(15) NOT NULL DEFAULT '',
  `logindata` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `lastswitch` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_news`
--

CREATE TABLE IF NOT EXISTS `wf_news` (
  `id` int(11) unsigned NOT NULL,
  `categoryId` int(4) unsigned NOT NULL DEFAULT '0',
  `sortId` int(4) unsigned NOT NULL DEFAULT '0',
  `sortName` varchar(30) NOT NULL DEFAULT '',
  `province` int(6) unsigned NOT NULL DEFAULT '0',
  `city` int(6) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `titleColor` varchar(50) NOT NULL DEFAULT '',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `newsAbstract` varchar(1000) NOT NULL DEFAULT '',
  `author` varchar(50) NOT NULL DEFAULT '',
  `source` varchar(100) NOT NULL DEFAULT '',
  `click` int(6) unsigned NOT NULL DEFAULT '0',
  `isTop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isHead` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '头条,默认为0',
  `isRecommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isSlide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '幻灯,默认为0',
  `isCityHead` tinyint(1) NOT NULL DEFAULT '0' COMMENT '城市头条',
  `isCitySlide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '城市幻灯',
  `weight` int(11) NOT NULL DEFAULT '0',
  `pic` varchar(50) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `isCaiji` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_news_category`
--

CREATE TABLE IF NOT EXISTS `wf_news_category` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL DEFAULT '',
  `keyword` varchar(200) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `pId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `addTime` int(11) NOT NULL DEFAULT '0',
  `isHtml` tinyint(1) NOT NULL DEFAULT '0',
  `htmlFile` varchar(200) NOT NULL DEFAULT '',
  `newsCnt` int(11) NOT NULL DEFAULT '0',
  `orders` int(4) NOT NULL DEFAULT '0',
  `isShow` tinyint(1) NOT NULL DEFAULT '1',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_news_content`
--

CREATE TABLE IF NOT EXISTS `wf_news_content` (
  `newsId` int(11) unsigned NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_news_statistics`
--

CREATE TABLE IF NOT EXISTS `wf_news_statistics` (
  `id` int(10) unsigned NOT NULL,
  `bId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼盘id',
  `nId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新闻ID',
  `aId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'agent（代理商用户）ID',
  `uId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'agentuser(代理商人员）ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型（1：分享；2：浏览；3：点赞）',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '状态',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_news_subscribe`
--

CREATE TABLE IF NOT EXISTS `wf_news_subscribe` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `certifyid` varchar(50) NOT NULL,
  `cert` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_next_role`
--
CREATE TABLE IF NOT EXISTS `wf_next_role` (
`name` varchar(50)
,`title` varchar(100)
,`pId` int(11)
,`roleNavId` int(11)
,`status` tinyint(1)
,`sort` int(11)
,`id` int(11)
,`roleId` int(11)
,`navStatus` tinyint(1)
,`navSort` int(11)
,`navName` varchar(50)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_notice`
--

CREATE TABLE IF NOT EXISTS `wf_notice` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `startTim` int(11) NOT NULL DEFAULT '0',
  `endTim` int(11) NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `defaultNum` int(11) NOT NULL DEFAULT '0',
  `joinNum` int(11) NOT NULL DEFAULT '0',
  `remindWay` tinyint(1) NOT NULL DEFAULT '1',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_onez_qraccount_binds`
--

CREATE TABLE IF NOT EXISTS `wf_onez_qraccount_binds` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `plat` varchar(20) DEFAULT NULL,
  `platid` varchar(50) DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `token` varchar(50) DEFAULT NULL,
  `rndkey` varchar(50) DEFAULT NULL,
  `loginkey` varchar(50) DEFAULT NULL,
  `times` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `waittime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_order_house`
--

CREATE TABLE IF NOT EXISTS `wf_order_house` (
  `id` int(10) unsigned NOT NULL,
  `currentId` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1二手房、2租房、3分销、4网销',
  `clientId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '录入客户id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '称呼',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '联系方式',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongUser` varchar(20) DEFAULT '' COMMENT '权属人',
  `belongName` varchar(20) NOT NULL DEFAULT '' COMMENT '发布人',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_order_refresh`
--

CREATE TABLE IF NOT EXISTS `wf_order_refresh` (
  `id` int(6) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '房源类型，1：二手房，2：租房',
  `houseId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '房源Id',
  `userId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '用户id,用来限制用户每天刷新次数',
  `refreshAt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间',
  `number` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '第几次预约(目前每条数据只能预约3次)',
  `allTimes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '一共设置的次数',
  `remains` tinyint(1) NOT NULL DEFAULT '0' COMMENT '剩余的次数',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '时间差，以分钟为单位'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_partner`
--

CREATE TABLE IF NOT EXISTS `wf_partner` (
  `id` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `urls` varchar(100) NOT NULL DEFAULT '',
  `logo` varchar(50) NOT NULL DEFAULT '',
  `orders` int(4) NOT NULL DEFAULT '0',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(13) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(13) NOT NULL DEFAULT '',
  `intro` varchar(1000) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `createdId` varchar(20) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_plot_img`
--

CREATE TABLE IF NOT EXISTS `wf_plot_img` (
  `id` int(11) unsigned NOT NULL,
  `suiteId` int(11) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `detail` varchar(255) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL,
  `createdBy` varchar(100) NOT NULL DEFAULT '',
  `updatedBy` varchar(100) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_article_content`
--

CREATE TABLE IF NOT EXISTS `wf_portal_article_content` (
  `cid` int(10) unsigned NOT NULL,
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `pageorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_article_count`
--

CREATE TABLE IF NOT EXISTS `wf_portal_article_count` (
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `commentnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sharetimes` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_article_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_portal_article_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_article_related`
--

CREATE TABLE IF NOT EXISTS `wf_portal_article_related` (
  `aid` mediumint(8) unsigned NOT NULL,
  `raid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_article_title`
--

CREATE TABLE IF NOT EXISTS `wf_portal_article_title` (
  `aid` mediumint(8) unsigned NOT NULL,
  `catid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `shorttitle` varchar(255) NOT NULL DEFAULT '',
  `highlight` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `from` varchar(255) NOT NULL DEFAULT '',
  `fromurl` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(255) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(255) NOT NULL DEFAULT '',
  `contents` smallint(6) NOT NULL DEFAULT '0',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '0',
  `owncomment` tinyint(1) NOT NULL DEFAULT '0',
  `click1` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click2` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click3` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click4` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click5` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click6` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click7` smallint(6) unsigned NOT NULL DEFAULT '0',
  `click8` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tag` tinyint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showinnernav` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_article_trash`
--

CREATE TABLE IF NOT EXISTS `wf_portal_article_trash` (
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_attachment`
--

CREATE TABLE IF NOT EXISTS `wf_portal_attachment` (
  `attachid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filetype` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_category`
--

CREATE TABLE IF NOT EXISTS `wf_portal_category` (
  `catid` mediumint(8) unsigned NOT NULL,
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(255) NOT NULL DEFAULT '',
  `articles` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '1',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `notinheritedarticle` tinyint(1) NOT NULL DEFAULT '0',
  `notinheritedblock` tinyint(1) NOT NULL DEFAULT '0',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `shownav` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `seotitle` text NOT NULL,
  `keyword` text NOT NULL,
  `primaltplname` varchar(255) NOT NULL DEFAULT '',
  `articleprimaltplname` varchar(255) NOT NULL DEFAULT '',
  `disallowpublish` tinyint(1) NOT NULL DEFAULT '0',
  `foldername` varchar(255) NOT NULL DEFAULT '',
  `notshowarticlesummay` varchar(255) NOT NULL DEFAULT '',
  `perpage` smallint(6) NOT NULL DEFAULT '0',
  `maxpages` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_category_permission`
--

CREATE TABLE IF NOT EXISTS `wf_portal_category_permission` (
  `catid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allowpublish` tinyint(1) NOT NULL DEFAULT '0',
  `allowmanage` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedcatid` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_comment`
--

CREATE TABLE IF NOT EXISTS `wf_portal_comment` (
  `cid` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(20) NOT NULL DEFAULT '',
  `postip` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_comment_moderate`
--

CREATE TABLE IF NOT EXISTS `wf_portal_comment_moderate` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_rsscache`
--

CREATE TABLE IF NOT EXISTS `wf_portal_rsscache` (
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `catname` char(50) NOT NULL DEFAULT '',
  `author` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_topic`
--

CREATE TABLE IF NOT EXISTS `wf_portal_topic` (
  `topicid` mediumint(8) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `keyword` text NOT NULL,
  `cover` varchar(255) NOT NULL DEFAULT '',
  `picflag` tinyint(1) NOT NULL DEFAULT '0',
  `primaltplname` varchar(255) NOT NULL DEFAULT '',
  `useheader` tinyint(1) NOT NULL DEFAULT '0',
  `usefooter` tinyint(1) NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `viewnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `allowcomment` tinyint(1) NOT NULL DEFAULT '0',
  `commentnum` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_portal_topic_pic`
--

CREATE TABLE IF NOT EXISTS `wf_portal_topic_pic` (
  `picid` mediumint(8) NOT NULL,
  `topicid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_protocol`
--

CREATE TABLE IF NOT EXISTS `wf_protocol` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_qudao_role`
--

CREATE TABLE IF NOT EXISTS `wf_qudao_role` (
  `userId` int(10) unsigned NOT NULL,
  `servePoints` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上限服务点',
  `buildingStr` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_qudao_visit`
--

CREATE TABLE IF NOT EXISTS `wf_qudao_visit` (
  `id` int(10) unsigned NOT NULL,
  `buildingId` int(6) unsigned NOT NULL DEFAULT '0',
  `buildingName` varchar(50) NOT NULL DEFAULT '',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '权属人ID',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '回访内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_recommend_log`
--

CREATE TABLE IF NOT EXISTS `wf_recommend_log` (
  `id` int(11) unsigned NOT NULL,
  `bid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'buildingRecommend表的Id',
  `userName` varchar(30) NOT NULL COMMENT '操作者',
  `operation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作了：',
  `createdId` int(11) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_report_jieyong`
--

CREATE TABLE IF NOT EXISTS `wf_report_jieyong` (
  `reportId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '报备ID',
  `signAt` int(10) unsigned NOT NULL COMMENT '签约时间',
  `fangkuanAt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_report_record`
--

CREATE TABLE IF NOT EXISTS `wf_report_record` (
  `id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1新房，2二手房',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `arrangeId` int(4) unsigned NOT NULL DEFAULT '0',
  `arrangeName` varchar(20) NOT NULL DEFAULT '',
  `createdBy` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_resources`
--

CREATE TABLE IF NOT EXISTS `wf_resources` (
  `dateAt` date NOT NULL DEFAULT '0000-00-00',
  `counts` smallint(5) unsigned NOT NULL,
  `typeId` smallint(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_resource_date`
--

CREATE TABLE IF NOT EXISTS `wf_resource_date` (
  `dateAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_resource_type`
--

CREATE TABLE IF NOT EXISTS `wf_resource_type` (
  `id` smallint(4) unsigned NOT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `type` enum('web','cost') NOT NULL DEFAULT 'cost',
  `name` varchar(50) NOT NULL DEFAULT '',
  `orders` smallint(4) unsigned NOT NULL DEFAULT '0',
  `isAdd` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否添加数据',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role`
--

CREATE TABLE IF NOT EXISTS `wf_role` (
  `id` int(6) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pId` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `orders` int(4) unsigned NOT NULL DEFAULT '0',
  `clientType` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_advocate`
--

CREATE TABLE IF NOT EXISTS `wf_role_advocate` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_department`
--

CREATE TABLE IF NOT EXISTS `wf_role_department` (
  `id` int(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `pid` int(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `orders` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isGroup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_idepartment`
--

CREATE TABLE IF NOT EXISTS `wf_role_idepartment` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `name` varchar(12) NOT NULL,
  `roleuser_id` int(11) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为最高父级，依次类推',
  `status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '状态：5 为正常，6为已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_info`
--

CREATE TABLE IF NOT EXISTS `wf_role_info` (
  `userId` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `county` int(11) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `icon` varchar(200) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `section` tinyint(1) NOT NULL,
  `position` tinyint(1) NOT NULL,
  `entryTim` int(11) NOT NULL,
  `consult` varchar(30) NOT NULL DEFAULT '',
  `advocateProvince` int(11) NOT NULL,
  `advocateCity` int(11) NOT NULL,
  `advocateCounty` int(11) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `weiboName` varchar(50) NOT NULL DEFAULT '',
  `weiboQQ` varchar(200) NOT NULL DEFAULT '',
  `weiboSina` varchar(200) NOT NULL DEFAULT '',
  `homeWeb` varchar(300) NOT NULL DEFAULT '',
  `info` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_jobs`
--

CREATE TABLE IF NOT EXISTS `wf_role_jobs` (
  `id` int(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `salary` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '级别工资',
  `pid` int(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `orders` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_jobs_change`
--

CREATE TABLE IF NOT EXISTS `wf_role_jobs_change` (
  `id` int(10) unsigned NOT NULL,
  `userId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `trueName` varchar(20) NOT NULL DEFAULT '',
  `jobId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `jobName` varchar(20) NOT NULL,
  `startAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_mac`
--

CREATE TABLE IF NOT EXISTS `wf_role_mac` (
  `id` int(10) unsigned NOT NULL,
  `departmentId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `mac` char(25) NOT NULL DEFAULT '',
  `disk` char(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_members`
--

CREATE TABLE IF NOT EXISTS `wf_role_members` (
  `id` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL DEFAULT '0',
  `members` smallint(6) unsigned NOT NULL DEFAULT '0',
  `month` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_nav`
--

CREATE TABLE IF NOT EXISTS `wf_role_nav` (
  `id` int(11) NOT NULL,
  `pId` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `byname` varchar(20) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_nav_old`
--

CREATE TABLE IF NOT EXISTS `wf_role_nav_old` (
  `id` int(11) NOT NULL,
  `pId` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `byname` varchar(20) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_node`
--

CREATE TABLE IF NOT EXISTS `wf_role_node` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `pId` int(11) NOT NULL DEFAULT '0',
  `pTitle` varchar(50) NOT NULL DEFAULT '',
  `groupId` int(11) NOT NULL DEFAULT '0',
  `roleNavId` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `isMenu` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_node_old`
--

CREATE TABLE IF NOT EXISTS `wf_role_node_old` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `pId` int(11) NOT NULL DEFAULT '0',
  `pTitle` varchar(50) NOT NULL DEFAULT '',
  `groupId` int(11) NOT NULL DEFAULT '0',
  `roleNavId` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `isMenu` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_pic`
--

CREATE TABLE IF NOT EXISTS `wf_role_pic` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `urls` varchar(200) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `istop` tinyint(1) NOT NULL,
  `orders` tinyint(4) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_pic_category`
--

CREATE TABLE IF NOT EXISTS `wf_role_pic_category` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL DEFAULT '',
  `content` varchar(200) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `createdId` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_user`
--

CREATE TABLE IF NOT EXISTS `wf_role_user` (
  `id` int(10) unsigned NOT NULL,
  `adminUserName` varchar(50) NOT NULL DEFAULT '',
  `trueName` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别：1男2女',
  `password` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `phone` char(12) NOT NULL,
  `lastIp` varchar(15) NOT NULL DEFAULT '',
  `lastTime` int(6) NOT NULL DEFAULT '0',
  `isPerson` tinyint(1) NOT NULL DEFAULT '0',
  `roleId` int(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `isAnchang` smallint(4) unsigned NOT NULL DEFAULT '0',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `roleCate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `roleArea` varchar(255) NOT NULL DEFAULT '0',
  `clientType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isWeishop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `telSort` char(8) NOT NULL DEFAULT '',
  `qq` char(12) NOT NULL DEFAULT '',
  `jobsId` mediumint(4) NOT NULL DEFAULT '0',
  `mac` varchar(30) NOT NULL DEFAULT '',
  `jobNum` varchar(20) NOT NULL DEFAULT '' COMMENT '工号',
  `entryAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入职时间',
  `leaveAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '离职时间',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `wf_role_user_other`
--

CREATE TABLE IF NOT EXISTS `wf_role_user_other` (
  `role_user_id` int(10) NOT NULL COMMENT '业务员id，对应wf_role_user表的id',
  `suite_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '满足二手客源房源录入数量的时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务员附加表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_sale_browsed`
--

CREATE TABLE IF NOT EXISTS `wf_sale_browsed` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `saleId` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_sale_browsed_view`
--
CREATE TABLE IF NOT EXISTS `wf_sale_browsed_view` (
`id` int(11)
,`userId` int(11)
,`saleId` int(11)
,`ip` varchar(15)
,`num` int(11)
,`createdAt` int(11)
,`buildingId` int(10) unsigned
,`topic` varchar(100)
,`city` int(6) unsigned
,`county` int(6) unsigned
,`room` tinyint(1)
,`hall` tinyint(1)
,`kitchen` tinyint(1)
,`toilet` tinyint(1)
,`veranda` tinyint(1)
,`area` int(4) unsigned
,`price` float(6,2)
,`province` int(6) unsigned
,`icon` varchar(100)
,`title` varchar(100)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_sale_comments`
--

CREATE TABLE IF NOT EXISTS `wf_sale_comments` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `saleId` int(11) NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `topNum` int(11) NOT NULL DEFAULT '0',
  `noNum` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `addTime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_sale_concern`
--

CREATE TABLE IF NOT EXISTS `wf_sale_concern` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `saleId` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_sale_concern_view`
--
CREATE TABLE IF NOT EXISTS `wf_sale_concern_view` (
`id` int(11)
,`userId` int(11)
,`saleId` int(11)
,`ip` varchar(15)
,`num` int(11)
,`createdAt` int(11)
,`buildingId` int(10) unsigned
,`title` varchar(100)
,`topic` varchar(100)
,`city` int(6) unsigned
,`county` int(6) unsigned
,`room` tinyint(1)
,`hall` tinyint(1)
,`kitchen` tinyint(1)
,`toilet` tinyint(1)
,`veranda` tinyint(1)
,`area` int(4) unsigned
,`price` float(6,2)
,`province` int(6) unsigned
,`icon` varchar(100)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_sale_content`
--

CREATE TABLE IF NOT EXISTS `wf_sale_content` (
  `saleId` int(11) NOT NULL,
  `introduction` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_sale_fenxiao`
--

CREATE TABLE IF NOT EXISTS `wf_sale_fenxiao` (
  `saleId` int(11) NOT NULL,
  `endYear` int(11) NOT NULL,
  `cardInfo` varchar(50) NOT NULL,
  `payType` varchar(100) NOT NULL,
  `isLiving` tinyint(1) NOT NULL DEFAULT '1',
  `master` varchar(50) NOT NULL,
  `trustPriceMin` varchar(100) NOT NULL,
  `collaStatus` tinyint(1) NOT NULL,
  `sellStatus` tinyint(1) NOT NULL DEFAULT '1',
  `backWay` varchar(50) NOT NULL,
  `remarks` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_sale_house`
--

CREATE TABLE IF NOT EXISTS `wf_sale_house` (
  `id` int(11) NOT NULL,
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `topic` varchar(100) NOT NULL DEFAULT '',
  `province` int(6) unsigned NOT NULL DEFAULT '4',
  `city` int(6) unsigned NOT NULL DEFAULT '0',
  `county` int(6) unsigned NOT NULL DEFAULT '0',
  `businessArea` int(6) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `room` tinyint(1) NOT NULL DEFAULT '0',
  `hall` tinyint(1) NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0',
  `toilet` tinyint(1) NOT NULL DEFAULT '0',
  `veranda` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `area` int(4) unsigned NOT NULL DEFAULT '0',
  `eachPrice` float(8,2) NOT NULL DEFAULT '0.00',
  `price` float(6,2) NOT NULL DEFAULT '0.00',
  `floorsType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `onFloor` int(11) NOT NULL DEFAULT '0',
  `jumpFloor` int(11) NOT NULL,
  `floors` int(11) NOT NULL DEFAULT '0',
  `face` char(4) NOT NULL DEFAULT '',
  `fitment` tinyint(1) NOT NULL DEFAULT '0',
  `supporting` varchar(100) NOT NULL DEFAULT '',
  `traffic` varchar(1000) NOT NULL DEFAULT '',
  `around` varchar(1000) NOT NULL DEFAULT '',
  `endTime` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `tel` char(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `qq` char(50) NOT NULL DEFAULT '',
  `agentId` int(6) unsigned NOT NULL DEFAULT '0',
  `isagent` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1个人2中介3房管家',
  `istop` tinyint(1) NOT NULL DEFAULT '0',
  `weightByname` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `weightScore` int(11) NOT NULL DEFAULT '0',
  `fieldScore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clickCnt` int(11) NOT NULL DEFAULT '0',
  `years` int(10) NOT NULL,
  `salestatus` tinyint(1) NOT NULL DEFAULT '1',
  `adminCreatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `refreshAt` int(11) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `recommonAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '5' COMMENT '5默认,4会员删除',
  `truster` varchar(50) NOT NULL DEFAULT '',
  `trustTel` char(50) NOT NULL DEFAULT '',
  `buildingStructure` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ownership` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `houseLabel` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 触发器 `wf_sale_house`
--
DELIMITER $$
CREATE TRIGGER `in_saleHouse` AFTER INSERT ON `wf_sale_house`
 FOR EACH ROW update wf_user_base set operateAt=new.createdAt where id=new.createdId
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_saleHouse` AFTER UPDATE ON `wf_sale_house`
 FOR EACH ROW update wf_user_base set operateAt=new.updatedAt where id=new.createdId
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `wf_sale_img`
--

CREATE TABLE IF NOT EXISTS `wf_sale_img` (
  `id` int(11) unsigned NOT NULL,
  `saleId` int(10) unsigned NOT NULL DEFAULT '0',
  `detail` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '后台使用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_search`
--

CREATE TABLE IF NOT EXISTS `wf_search` (
  `id` int(11) NOT NULL,
  `keywords` varchar(1000) NOT NULL DEFAULT '',
  `tab` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_search_keywords`
--

CREATE TABLE IF NOT EXISTS `wf_search_keywords` (
  `id` int(11) NOT NULL,
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `pinyin` varchar(10) NOT NULL DEFAULT '',
  `tabs` varchar(150) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `showTim` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_secretary_base`
--

CREATE TABLE IF NOT EXISTS `wf_secretary_base` (
  `intro` varchar(1000) NOT NULL,
  `before` varchar(1000) NOT NULL DEFAULT '',
  `middle` varchar(1000) NOT NULL DEFAULT '',
  `end` varchar(1000) NOT NULL DEFAULT '',
  `service` varchar(1000) NOT NULL DEFAULT '',
  `remarks` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_security_evilpost`
--

CREATE TABLE IF NOT EXISTS `wf_security_evilpost` (
  `pid` int(10) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `evilcount` int(10) NOT NULL DEFAULT '0',
  `eviltype` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `operateresult` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isreported` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_security_eviluser`
--

CREATE TABLE IF NOT EXISTS `wf_security_eviluser` (
  `uid` int(10) unsigned NOT NULL,
  `evilcount` int(10) NOT NULL DEFAULT '0',
  `eviltype` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `operateresult` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isreported` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_security_failedlog`
--

CREATE TABLE IF NOT EXISTS `wf_security_failedlog` (
  `id` int(11) NOT NULL,
  `reporttype` char(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `failcount` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `delreason` char(255) NOT NULL,
  `scheduletime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastfailtime` int(10) unsigned NOT NULL DEFAULT '0',
  `extra1` int(10) unsigned NOT NULL,
  `extra2` char(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_sellbuilding_tags`
--

CREATE TABLE IF NOT EXISTS `wf_sellbuilding_tags` (
  `id` int(11) NOT NULL,
  `city` int(11) NOT NULL DEFAULT '0',
  `cate` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `istop` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_send_record`
--

CREATE TABLE IF NOT EXISTS `wf_send_record` (
  `id` int(11) unsigned NOT NULL,
  `fromId` int(11) NOT NULL DEFAULT '0',
  `currentId` int(11) NOT NULL DEFAULT '0',
  `currentName` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1互动记录，2楼盘动态订阅，3购房联盟，4取消楼盘订阅',
  `tels` text NOT NULL,
  `sendContent` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdBy` varchar(30) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `sendNum` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_shuang11`
--

CREATE TABLE IF NOT EXISTS `wf_shuang11` (
  `id` mediumint(8) unsigned NOT NULL,
  `openId` char(64) NOT NULL DEFAULT '' COMMENT '微信的openId',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `prizeType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '奖项id , 小于4标识中奖',
  `amount` decimal(5,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '数额',
  `date` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '日期',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_shuang11_quan`
--

CREATE TABLE IF NOT EXISTS `wf_shuang11_quan` (
  `id` mediumint(8) unsigned NOT NULL,
  `openId` char(64) NOT NULL DEFAULT '' COMMENT '微信openId',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `buildingId` mediumint(9) NOT NULL DEFAULT '0' COMMENT '优惠楼盘id',
  `isUse` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(20) NOT NULL DEFAULT '0' COMMENT '电话',
  `isPay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支付',
  `createdAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_site_list`
--

CREATE TABLE IF NOT EXISTS `wf_site_list` (
  `id` mediumint(8) unsigned NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '根域名',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '网站标题',
  `comp` varchar(120) NOT NULL DEFAULT '' COMMENT '公司名',
  `beian` varchar(30) NOT NULL DEFAULT '',
  `cityId` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `cityArr` varchar(200) NOT NULL DEFAULT '' COMMENT '城市列表',
  `code1` varchar(150) NOT NULL DEFAULT '' COMMENT '统计代码等。',
  `code2` varchar(150) NOT NULL DEFAULT '' COMMENT '其他代码等',
  `code3` varchar(255) NOT NULL DEFAULT '' COMMENT '商桥',
  `extCode` char(1) NOT NULL DEFAULT '' COMMENT '400短号开头数字',
  `buildingOrder1` varchar(50) NOT NULL DEFAULT '',
  `buildingOrder2` varchar(50) NOT NULL DEFAULT '',
  `buildingOrder3` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_site_map`
--

CREATE TABLE IF NOT EXISTS `wf_site_map` (
  `id` int(11) NOT NULL,
  `categoryId` int(4) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `urls` varchar(100) NOT NULL DEFAULT '',
  `orders` int(4) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `istopAll` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_site_page`
--

CREATE TABLE IF NOT EXISTS `wf_site_page` (
  `id` mediumint(8) unsigned NOT NULL,
  `siteId` mediumint(8) unsigned NOT NULL,
  `typeName` char(20) NOT NULL,
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `updatedAt` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_sms_rank`
--

CREATE TABLE IF NOT EXISTS `wf_sms_rank` (
  `id` int(10) unsigned NOT NULL,
  `smsId` int(10) NOT NULL DEFAULT '0' COMMENT '短信的返回编码',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户Id',
  `clientName` varchar(50) NOT NULL DEFAULT '' COMMENT '客户姓名',
  `arrangeId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '带看ID',
  `content` varchar(30) DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '客户联系电话',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '被评价人Id',
  `belongName` varchar(20) NOT NULL DEFAULT '' COMMENT '评价人姓名',
  `rank` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评分等级',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_soap_detail`
--

CREATE TABLE IF NOT EXISTS `wf_soap_detail` (
  `id` int(11) NOT NULL,
  `startid` int(10) unsigned NOT NULL DEFAULT '0',
  `isfree` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `userNmae` varchar(50) NOT NULL,
  `roleId` int(11) NOT NULL,
  `rolePid` int(11) NOT NULL,
  `belongUser` varchar(30) NOT NULL DEFAULT '',
  `extCode` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `buildingName` varchar(50) NOT NULL,
  `buildingId` int(11) NOT NULL,
  `callResult` varchar(30) NOT NULL,
  `ani` varchar(30) NOT NULL,
  `dni` varchar(30) NOT NULL,
  `startDate` int(11) NOT NULL,
  `leng` int(11) NOT NULL,
  `callCount` int(11) NOT NULL,
  `bigcode` char(10) NOT NULL DEFAULT '4008170898',
  `custid` int(6) unsigned NOT NULL DEFAULT '4398',
  `userId` int(6) unsigned NOT NULL DEFAULT '0',
  `notes` varchar(1000) NOT NULL DEFAULT '',
  `noteDate` int(10) unsigned NOT NULL DEFAULT '0',
  `noteBy` char(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_soap_group`
--

CREATE TABLE IF NOT EXISTS `wf_soap_group` (
  `id` int(6) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `groupGuid` varchar(50) NOT NULL DEFAULT '',
  `userList` varchar(50) NOT NULL DEFAULT '',
  `bigCode` varchar(20) NOT NULL DEFAULT '',
  `extCode` char(6) NOT NULL DEFAULT '',
  `custid` int(6) unsigned NOT NULL DEFAULT '4398'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_soap_worker`
--

CREATE TABLE IF NOT EXISTS `wf_soap_worker` (
  `userid` int(6) unsigned NOT NULL DEFAULT '0',
  `loginid` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `custid` int(6) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) NOT NULL DEFAULT '',
  `bigcode` char(10) NOT NULL DEFAULT '4008170898',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `istel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1手机、2座机',
  `roleUserId` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_subscribes`
--

CREATE TABLE IF NOT EXISTS `wf_subscribes` (
  `id` int(10) unsigned NOT NULL,
  `fromId` int(10) unsigned NOT NULL DEFAULT '0',
  `currentId` int(10) unsigned NOT NULL DEFAULT '0',
  `tel` char(11) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1楼盘动态',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '5正常，1删除',
  `istel` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0取消短信',
  `isemail` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0取消邮件',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suggestion`
--

CREATE TABLE IF NOT EXISTS `wf_suggestion` (
  `id` int(11) NOT NULL,
  `pId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `comObject` varchar(50) NOT NULL DEFAULT '',
  `from` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isRead` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_arranges`
--

CREATE TABLE IF NOT EXISTS `wf_suite_arranges` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1出售、2出租',
  `houseId` int(10) unsigned NOT NULL DEFAULT '0',
  `ownerName` varchar(20) NOT NULL DEFAULT '',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `clientName` varchar(20) NOT NULL DEFAULT '',
  `isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1有效，2无效',
  `entrustDate` datetime NOT NULL,
  `remarks` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(4) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_arranges_building`
--

CREATE TABLE IF NOT EXISTS `wf_suite_arranges_building` (
  `id` int(10) unsigned NOT NULL,
  `buildingName` varchar(255) NOT NULL DEFAULT '',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `clientName` tinytext NOT NULL,
  `isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1有效，2无效',
  `entrustDate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出车时间',
  `remarks` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(4) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `seeStatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '派车用途'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_bargains`
--

CREATE TABLE IF NOT EXISTS `wf_suite_bargains` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1出售、2出租',
  `houseId` int(10) unsigned NOT NULL DEFAULT '0',
  `ownerName` varchar(20) NOT NULL DEFAULT '',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `clientName` varchar(20) NOT NULL DEFAULT '',
  `bargainp` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '成交金额',
  `agreep` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '合同金额',
  `ownerp` int(4) NOT NULL DEFAULT '0',
  `ownerp2` int(4) unsigned NOT NULL DEFAULT '0',
  `clientp` int(4) NOT NULL DEFAULT '0',
  `clientp2` int(4) unsigned NOT NULL DEFAULT '0',
  `realp` int(4) unsigned NOT NULL DEFAULT '0',
  `bargainDate` char(20) NOT NULL DEFAULT '',
  `remarks` varchar(1000) NOT NULL DEFAULT '',
  `isReceivables` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已有收款明细：默认0否，1是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '5为审核；6稽查审核；8店长确认',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(4) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `commission` int(4) unsigned NOT NULL DEFAULT '0',
  `commission2` int(4) unsigned NOT NULL DEFAULT '0',
  `commissionAt` char(20) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `statusInfo` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_bargains_other`
--

CREATE TABLE IF NOT EXISTS `wf_suite_bargains_other` (
  `id` int(10) unsigned NOT NULL,
  `clientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `houseId` int(10) unsigned NOT NULL DEFAULT '0',
  `ownerName` varchar(20) NOT NULL DEFAULT '',
  `commission` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金',
  `commissionAt` int(6) unsigned NOT NULL DEFAULT '0',
  `bargainDate` int(6) unsigned NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '6已确定业绩',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_building`
--

CREATE TABLE IF NOT EXISTS `wf_suite_building` (
  `id` int(6) unsigned NOT NULL,
  `clientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `buildingId` int(11) unsigned NOT NULL DEFAULT '0',
  `builidngTitle` varchar(100) NOT NULL DEFAULT '' COMMENT '楼盘名称',
  `doorplate` varchar(20) NOT NULL DEFAULT '' COMMENT '门牌号',
  `payWay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` smallint(5) unsigned NOT NULL DEFAULT '0',
  `money` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '成交金额',
  `points` float(4,2) NOT NULL DEFAULT '0.00' COMMENT '实际业绩',
  `pointMoney` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `couponMoney` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `cash` varchar(255) NOT NULL DEFAULT '',
  `bargainDate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '成交日期',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '6确定业绩',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_client`
--

CREATE TABLE IF NOT EXISTS `wf_suite_client` (
  `id` int(10) unsigned NOT NULL,
  `clientCate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '客户类型：1求购、2求租',
  `cprovince` int(6) unsigned NOT NULL DEFAULT '0',
  `ccity` int(6) unsigned NOT NULL DEFAULT '0',
  `city` varchar(30) NOT NULL DEFAULT '',
  `county` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `fenxiaoId` int(6) unsigned NOT NULL DEFAULT '0',
  `room1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `room2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hall1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hall2` tinyint(1) NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `toilet` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `veranda` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT '',
  `years` int(4) unsigned NOT NULL DEFAULT '0',
  `fitment` varchar(30) NOT NULL DEFAULT '',
  `face` varchar(30) NOT NULL DEFAULT '',
  `area1` int(4) unsigned NOT NULL DEFAULT '0',
  `area2` int(4) unsigned NOT NULL DEFAULT '0',
  `floors1` int(2) unsigned NOT NULL DEFAULT '0',
  `floors2` int(2) unsigned NOT NULL DEFAULT '0',
  `price1` float unsigned NOT NULL DEFAULT '0',
  `price2` float unsigned NOT NULL DEFAULT '0',
  `priceunit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1万元、2平方米',
  `payway` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `servantway` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agreement` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `infoFrom` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `entrustDate` char(10) NOT NULL DEFAULT '',
  `remarks` varchar(500) NOT NULL DEFAULT '',
  `clientName` varchar(20) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1男2女',
  `salestatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientLevel` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `requireType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:一手房，2：二手房',
  `tel` char(32) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `contactAddress` varchar(50) NOT NULL DEFAULT '',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(4) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `isprivate` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1是私客(不用了)',
  `isprivateStatus` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1是私客，2组别公客，3区域公客（或行销办事处公客），4公司公客',
  `privateAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'isprivateStatus掉到下一个值的时间（4不会再掉了）',
  `endprivate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '(不用了)',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '2:未审核；5：审核通过；7审核不通过；8经理回访；',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `changeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `showAt` int(10) unsigned NOT NULL DEFAULT '0',
  `changeAtF` int(6) unsigned NOT NULL DEFAULT '0',
  `hireType` tinyint(1) NOT NULL,
  `visitDate` int(6) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_client_website`
--

CREATE TABLE IF NOT EXISTS `wf_suite_client_website` (
  `id` int(10) unsigned NOT NULL,
  `clientCate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '客户类型：1求购、2求租',
  `cprovince` int(6) unsigned NOT NULL DEFAULT '0',
  `ccity` int(6) unsigned NOT NULL DEFAULT '0',
  `city` varchar(30) NOT NULL DEFAULT '',
  `county` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `fenxiaoId` int(6) unsigned NOT NULL DEFAULT '0',
  `room` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `room2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hall` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hall2` tinyint(1) NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `toilet` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `veranda` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT '',
  `years` int(4) unsigned NOT NULL DEFAULT '0',
  `years2` int(4) unsigned NOT NULL DEFAULT '0',
  `fitment` varchar(30) NOT NULL DEFAULT '',
  `face` varchar(30) NOT NULL DEFAULT '',
  `area1` int(4) unsigned NOT NULL DEFAULT '0',
  `area2` int(4) unsigned NOT NULL DEFAULT '0',
  `floors1` int(2) unsigned NOT NULL DEFAULT '0',
  `floors2` int(2) unsigned NOT NULL DEFAULT '0',
  `price1` float unsigned NOT NULL DEFAULT '0',
  `price2` float unsigned NOT NULL DEFAULT '0',
  `priceunit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1万元、2平方米',
  `payway` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `servantway` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agreement` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `infoFrom` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `entrustDate` char(10) NOT NULL DEFAULT '',
  `remarks` varchar(500) NOT NULL DEFAULT '',
  `clientName` varchar(20) NOT NULL DEFAULT '',
  `salestatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientLevel` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tel` char(32) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `contactAddress` varchar(50) NOT NULL DEFAULT '',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(4) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `isprivate` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `endprivate` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `changeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `hireType` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_concern`
--

CREATE TABLE IF NOT EXISTS `wf_suite_concern` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `suiteId` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_content`
--

CREATE TABLE IF NOT EXISTS `wf_suite_content` (
  `suiteId` int(10) unsigned NOT NULL COMMENT '小区id',
  `around` varchar(1000) NOT NULL DEFAULT '' COMMENT '周边环境',
  `traffic` varchar(1000) NOT NULL DEFAULT '' COMMENT '周边环境',
  `supporting` varchar(1000) NOT NULL DEFAULT '' COMMENT '小区配套',
  `info` mediumtext NOT NULL COMMENT '小区简介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_dictionary`
--

CREATE TABLE IF NOT EXISTS `wf_suite_dictionary` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `titlePinyin` varchar(100) NOT NULL,
  `pinyin` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(128) NOT NULL DEFAULT '',
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `city` int(6) unsigned NOT NULL,
  `county` int(6) unsigned NOT NULL,
  `address` varchar(255) NOT NULL,
  `floorWay` tinyint(1) unsigned NOT NULL,
  `type` int(4) NOT NULL,
  `years` int(5) unsigned NOT NULL,
  `developer` varchar(255) NOT NULL DEFAULT '',
  `property` varchar(255) NOT NULL DEFAULT '',
  `structure` tinyint(1) unsigned NOT NULL,
  `propertyFee` varchar(20) NOT NULL DEFAULT '',
  `floor` varchar(255) NOT NULL DEFAULT '',
  `buildingNum` int(10) NOT NULL DEFAULT '0',
  `houseNum` int(10) NOT NULL,
  `sales` int(10) NOT NULL DEFAULT '0',
  `hires` int(10) NOT NULL,
  `parks` varchar(255) NOT NULL DEFAULT '',
  `mapLng` varchar(20) NOT NULL,
  `mapLat` varchar(20) NOT NULL,
  `istop` tinyint(1) NOT NULL,
  `hprice` int(10) NOT NULL,
  `sprice` int(5) NOT NULL,
  `clicks` int(6) unsigned NOT NULL DEFAULT '0',
  `guanjiaId` int(10) NOT NULL,
  `updateCounts` smallint(6) unsigned NOT NULL DEFAULT '0',
  `roleArea` varchar(100) NOT NULL DEFAULT '' COMMENT '锁盘区域',
  `roleArea2` varchar(100) NOT NULL DEFAULT '' COMMENT '精耕区域',
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_doors`
--

CREATE TABLE IF NOT EXISTS `wf_suite_doors` (
  `id` int(10) unsigned NOT NULL,
  `unitId` int(11) unsigned NOT NULL DEFAULT '0',
  `doorplate` varchar(30) NOT NULL DEFAULT '',
  `room` tinyint(1) NOT NULL DEFAULT '0',
  `hall` tinyint(1) NOT NULL DEFAULT '0',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0',
  `toilet` tinyint(1) NOT NULL DEFAULT '0',
  `veranda` tinyint(1) NOT NULL DEFAULT '0',
  `area` int(4) unsigned NOT NULL DEFAULT '0',
  `useArea` float NOT NULL DEFAULT '0',
  `onFloor` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_fenxiao`
--

CREATE TABLE IF NOT EXISTS `wf_suite_fenxiao` (
  `id` int(10) unsigned NOT NULL,
  `suiteId` int(10) unsigned NOT NULL DEFAULT '0',
  `fenxiaoId` int(10) unsigned NOT NULL DEFAULT '0',
  `changeUserId` int(10) unsigned NOT NULL DEFAULT '0',
  `changeAt` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1二手房转分销 2分销转二手房',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_hire`
--

CREATE TABLE IF NOT EXISTS `wf_suite_hire` (
  `hireId` int(11) unsigned NOT NULL DEFAULT '0',
  `tower` varchar(30) NOT NULL DEFAULT '',
  `unit` varchar(30) NOT NULL DEFAULT '' COMMENT '单元',
  `doorplate` varchar(30) NOT NULL DEFAULT '',
  `propertyFee` varchar(30) NOT NULL DEFAULT '',
  `structure` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `useArea` float NOT NULL DEFAULT '0',
  `floorPri` varchar(20) NOT NULL DEFAULT '',
  `originalPri` varchar(20) NOT NULL DEFAULT '',
  `servantway` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `situation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tax` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ownerName` varchar(20) NOT NULL DEFAULT '',
  `ownerID` char(18) NOT NULL DEFAULT '',
  `ownerTel` char(11) NOT NULL DEFAULT '',
  `ownerPhone` varchar(20) NOT NULL DEFAULT '',
  `agreement` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trustType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keyType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keyInfo` varchar(50) NOT NULL DEFAULT '',
  `keyBelongId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyAt` int(10) unsigned NOT NULL DEFAULT '0',
  `infoFrom` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `salestatus2` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:有效；2：我租，3：已组，5：暂缓',
  `entrustDate` char(10) NOT NULL DEFAULT '',
  `isprivate` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `endprivate` int(6) unsigned NOT NULL DEFAULT '0',
  `islock` mediumint(8) unsigned NOT NULL DEFAULT '2' COMMENT '枷锁人id',
  `lockAt` int(10) unsigned NOT NULL DEFAULT '0',
  `referrerId` int(6) unsigned NOT NULL DEFAULT '0',
  `referrerName` varchar(30) NOT NULL DEFAULT '',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `changeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `showAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdId2` int(6) unsigned NOT NULL DEFAULT '0',
  `uniqueId` int(6) unsigned NOT NULL DEFAULT '0',
  `isHide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否藏盘'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_hire_price`
--

CREATE TABLE IF NOT EXISTS `wf_suite_hire_price` (
  `id` int(11) unsigned NOT NULL,
  `suiteId` int(11) unsigned NOT NULL,
  `price` int(5) unsigned NOT NULL,
  `createdAt` date NOT NULL,
  `room` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_house`
--

CREATE TABLE IF NOT EXISTS `wf_suite_house` (
  `saleId` int(11) unsigned NOT NULL DEFAULT '0',
  `tower` varchar(30) NOT NULL DEFAULT '',
  `unit` varchar(30) NOT NULL DEFAULT '' COMMENT '单元',
  `doorplate` varchar(30) NOT NULL DEFAULT '',
  `propertyFee` varchar(30) NOT NULL DEFAULT '',
  `structure` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `useArea` float NOT NULL DEFAULT '0',
  `floorPri` varchar(20) NOT NULL DEFAULT '',
  `originalPri` varchar(20) NOT NULL DEFAULT '',
  `payway` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `servantway` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `situation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tax` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ownerName` varchar(20) NOT NULL DEFAULT '',
  `ownerID` char(18) NOT NULL DEFAULT '',
  `ownerTel` char(11) NOT NULL DEFAULT '',
  `ownerPhone` varchar(20) NOT NULL DEFAULT '',
  `agreement` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trustType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keyType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keyInfo` varchar(50) NOT NULL DEFAULT '',
  `keyBelongId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyAt` int(10) unsigned NOT NULL DEFAULT '0',
  `infoFrom` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `salestatus2` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:有效；2：我租，3：已组，5：暂缓',
  `entrustDate` char(10) NOT NULL DEFAULT '',
  `isprivate` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1私盘，2公盘，3办事处（区域）公盘，4组别公盘（离职或晋升）',
  `endprivate` int(6) unsigned NOT NULL DEFAULT '0' COMMENT 'isprivate掉到下一个值的时间',
  `islock` mediumint(8) unsigned NOT NULL DEFAULT '2' COMMENT '枷锁人id',
  `lockAt` int(10) unsigned NOT NULL DEFAULT '0',
  `referrerId` int(6) unsigned NOT NULL DEFAULT '0',
  `referrerName` varchar(30) NOT NULL DEFAULT '',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `changeAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId2` int(6) unsigned NOT NULL DEFAULT '0',
  `uniqueId` int(6) unsigned NOT NULL DEFAULT '0',
  `buildingId` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(100) NOT NULL DEFAULT '',
  `city` int(6) unsigned NOT NULL DEFAULT '0',
  `county` int(6) unsigned NOT NULL DEFAULT '0',
  `businessArea` int(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `room` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hall` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `area` int(4) unsigned NOT NULL DEFAULT '0',
  `eachPrice` float(8,2) NOT NULL DEFAULT '0.00',
  `price` float NOT NULL DEFAULT '0',
  `onFloor` int(11) NOT NULL DEFAULT '0',
  `floors` int(11) NOT NULL DEFAULT '0',
  `face` char(4) NOT NULL DEFAULT '',
  `fitment` tinyint(1) NOT NULL DEFAULT '0',
  `contact` varchar(50) NOT NULL DEFAULT '',
  `tel` char(30) NOT NULL DEFAULT '',
  `istop` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` int(6) NOT NULL DEFAULT '0',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) NOT NULL DEFAULT '0',
  `showAt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后查看时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '2:未审核；3：不显示到前台；7审核不通过；8经理回访；',
  `houseLabel` varchar(50) NOT NULL DEFAULT '',
  `isHide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否藏盘'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_img`
--

CREATE TABLE IF NOT EXISTS `wf_suite_img` (
  `id` int(11) unsigned NOT NULL,
  `suiteId` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `detail` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '8',
  `weightByname` varchar(20) NOT NULL DEFAULT '0',
  `clicks` int(6) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(10) unsigned NOT NULL,
  `createdBy` varchar(100) NOT NULL DEFAULT '',
  `updatedBy` varchar(100) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_lock_log`
--

CREATE TABLE IF NOT EXISTS `wf_suite_lock_log` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '房源类型（1二手房、2租房、3客户）',
  `logType` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1房源加锁、2房源解锁、3删除房源、4还原房源、5领取钥匙',
  `houseId` int(11) NOT NULL,
  `createdId` smallint(5) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `createdAt` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_parameter`
--

CREATE TABLE IF NOT EXISTS `wf_suite_parameter` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `content` varchar(500) NOT NULL DEFAULT '',
  `sort` int(3) NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(20) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_performance`
--

CREATE TABLE IF NOT EXISTS `wf_suite_performance` (
  `id` int(11) unsigned NOT NULL,
  `bargainId` int(11) unsigned NOT NULL DEFAULT '0',
  `bargainType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1求购客户2求组客户3联动客户4其他',
  `belongId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(30) NOT NULL DEFAULT '',
  `departmentId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '(二手房或租房：1成交人,2房源开发,3实勘,4产证,5独家,6钥匙持有,7其他)，联动（1联动2二手房）',
  `points` float(4,3) unsigned NOT NULL DEFAULT '0.000',
  `performance` smallint(6) unsigned NOT NULL DEFAULT '0',
  `realp` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '产出业绩',
  `realPoints` float(4,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '产出点数',
  `bargainDate` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '5正常6个人确认7领导确认8客服确认',
  `statusInfo` varchar(255) NOT NULL DEFAULT '' COMMENT '确认详情',
  `houseId` int(11) NOT NULL DEFAULT '0',
  `clientId` int(11) NOT NULL DEFAULT '0',
  `city` int(6) NOT NULL DEFAULT '0',
  `infoFrom` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_plot`
--

CREATE TABLE IF NOT EXISTS `wf_suite_plot` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(150) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `suiteId` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `createdAt` int(11) NOT NULL,
  `createdBy` varchar(100) NOT NULL DEFAULT '',
  `createdId` int(11) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  `updatedBy` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1审核 2删除 5正常（未审核）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_receivables`
--

CREATE TABLE IF NOT EXISTS `wf_suite_receivables` (
  `id` int(11) NOT NULL,
  `bargainId` int(11) NOT NULL COMMENT '成交明细id',
  `receivablesDate` int(10) NOT NULL COMMENT '收款时间',
  `belongId` int(11) NOT NULL COMMENT '置业顾问id',
  `belongName` varchar(50) NOT NULL COMMENT '置业顾问姓名',
  `belongRoleArea` varchar(255) NOT NULL COMMENT '管理区域',
  `departmentId` int(11) NOT NULL COMMENT '部门（门店）id',
  `departmentName` varchar(100) NOT NULL COMMENT '部门（门店）名称',
  `receivablesPrice` decimal(10,2) NOT NULL COMMENT '收款金额',
  `depositDate` int(10) NOT NULL COMMENT '下定金日期',
  `suiteName` varchar(100) NOT NULL COMMENT '小区名称',
  `towerDoorplate` varchar(100) NOT NULL COMMENT 'X栋X单元X号房',
  `salesman` varchar(50) NOT NULL COMMENT '经办销售人员',
  `receiptNumber` varchar(100) NOT NULL COMMENT '收据编号',
  `type` tinyint(1) NOT NULL COMMENT '款项：1佣金，2租赁诚意金，3评估费',
  `receivablesType` tinyint(1) NOT NULL COMMENT '收款方式：1现金，2转账',
  `financeType` tinyint(1) NOT NULL COMMENT '给财务方式：1现金，2转账',
  `reimbursement` varchar(100) NOT NULL COMMENT '财务报账',
  `bargainClientId` int(11) NOT NULL COMMENT '对应成交明细客户id',
  `bargainHouseId` int(11) NOT NULL COMMENT '对应成交明细房源id',
  `bargainType` tinyint(1) NOT NULL COMMENT '对应成交明细的类型',
  `ps` varchar(255) NOT NULL COMMENT '备注',
  `psReceipt` varchar(255) NOT NULL COMMENT '收据备注',
  `createdBy` varchar(50) NOT NULL COMMENT '创建人/经办客服',
  `createdId` int(11) NOT NULL,
  `createdAt` int(10) NOT NULL,
  `updatedId` int(11) NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedAt` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='二手房成交明细-收款明细表';

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_receivables_img`
--

CREATE TABLE IF NOT EXISTS `wf_suite_receivables_img` (
  `id` int(11) unsigned NOT NULL,
  `receivables_id` int(11) unsigned NOT NULL COMMENT '收款明细id',
  `path` varchar(255) NOT NULL COMMENT '图片路径',
  `name` varchar(255) NOT NULL COMMENT '图片名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收款明细图片';

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_remoney`
--

CREATE TABLE IF NOT EXISTS `wf_suite_remoney` (
  `id` int(10) unsigned NOT NULL,
  `bargainId` int(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1买卖、2租赁、3联动、4其它',
  `money` int(6) unsigned NOT NULL DEFAULT '0',
  `dateAt` int(5) unsigned NOT NULL DEFAULT '0',
  `way` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_remoney_detail`
--

CREATE TABLE IF NOT EXISTS `wf_suite_remoney_detail` (
  `id` int(10) unsigned NOT NULL,
  `bargainId` int(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1买卖、2租赁、3联动、4其它',
  `money` int(6) unsigned NOT NULL DEFAULT '0',
  `dateAt` int(5) unsigned NOT NULL DEFAULT '0',
  `way` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_sale_price`
--

CREATE TABLE IF NOT EXISTS `wf_suite_sale_price` (
  `id` int(11) unsigned NOT NULL,
  `suiteId` int(11) unsigned NOT NULL,
  `price` int(5) unsigned NOT NULL,
  `createdAt` date NOT NULL,
  `updateCounts` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_secondhand`
--

CREATE TABLE IF NOT EXISTS `wf_suite_secondhand` (
  `id` mediumint(8) NOT NULL,
  `topic` varchar(80) NOT NULL DEFAULT '',
  `province` smallint(6) NOT NULL DEFAULT '0',
  `city` smallint(6) NOT NULL DEFAULT '0',
  `county` smallint(6) NOT NULL DEFAULT '0',
  `address` varchar(80) NOT NULL DEFAULT '',
  `area` float(7,2) NOT NULL DEFAULT '0.00',
  `roomType` varchar(30) NOT NULL DEFAULT '',
  `price` mediumint(9) NOT NULL DEFAULT '0',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `createdBy` char(15) NOT NULL DEFAULT '',
  `updatedAt` int(10) NOT NULL DEFAULT '0',
  `updatedBy` char(15) NOT NULL DEFAULT '',
  `clientName` char(20) NOT NULL DEFAULT '',
  `tel` char(32) NOT NULL DEFAULT '',
  `saleType` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_units`
--

CREATE TABLE IF NOT EXISTS `wf_suite_units` (
  `id` int(11) unsigned NOT NULL,
  `suiteId` int(11) unsigned NOT NULL DEFAULT '0',
  `pId` int(11) unsigned NOT NULL DEFAULT '0',
  `units` varchar(10) NOT NULL DEFAULT '',
  `floors` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `orders` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_views`
--

CREATE TABLE IF NOT EXISTS `wf_suite_views` (
  `id` int(10) unsigned NOT NULL,
  `currentId` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1出售、2出租、3求购、4求租',
  `viewUserid` int(6) unsigned NOT NULL DEFAULT '0',
  `viewUser` varchar(50) NOT NULL DEFAULT '',
  `counts` int(4) unsigned NOT NULL DEFAULT '0',
  `daycounts` int(4) unsigned NOT NULL DEFAULT '0',
  `dayAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_visits`
--

CREATE TABLE IF NOT EXISTS `wf_suite_visits` (
  `id` int(10) unsigned NOT NULL,
  `currentId` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1出售、2出租、3求购、4求租,5出售客服,6出租客服，7求购客服，8求租客服,9出售房源状态审核，10出租房源状态审核,11求购客户状态审核，12：求租客户状态审核',
  `cate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '回访类别',
  `way` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '回访方式',
  `visitDate` date NOT NULL,
  `remarks` varchar(1000) NOT NULL DEFAULT '',
  `entrustDate` char(10) NOT NULL DEFAULT '',
  `entrustName` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '4审核不通过（无效）；6审核通过（有效）',
  `departmentId` int(4) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(4) unsigned NOT NULL DEFAULT '0',
  `belongName` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_visits_content`
--

CREATE TABLE IF NOT EXISTS `wf_suite_visits_content` (
  `visitId` int(11) NOT NULL,
  `remarks` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_suite_warrant`
--

CREATE TABLE IF NOT EXISTS `wf_suite_warrant` (
  `id` int(6) unsigned NOT NULL,
  `currentId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '二手房id',
  `warrantId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '权证负责专员id',
  `warrantName` varchar(20) NOT NULL DEFAULT '' COMMENT '权证负责人',
  `departmentId` int(6) unsigned NOT NULL DEFAULT '0',
  `departmentName` varchar(20) NOT NULL DEFAULT '',
  `belongId` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '过户专员id',
  `belongName` varchar(20) NOT NULL DEFAULT '' COMMENT '过户专员',
  `isSigned` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否签订合同',
  `interviewAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际面签时间',
  `twiceViewAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际二次面签时间',
  `assessAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际评估时间',
  `lotAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际批货时间',
  `twiceLotAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际二次批货时间',
  `isTransfer` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否房产过户',
  `getCardAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际领证时间',
  `isLand` tinyint(6) unsigned NOT NULL DEFAULT '0' COMMENT '是否土地证过户',
  `pledgeAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际抵押时间',
  `loanAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '实际放宽时间',
  `isFinish` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '是否完结',
  `createdId` int(6) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_tel_code`
--

CREATE TABLE IF NOT EXISTS `wf_tel_code` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `tel` char(11) NOT NULL DEFAULT '0',
  `code` int(11) NOT NULL DEFAULT '0',
  `ip` char(20) NOT NULL DEFAULT '',
  `sendAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_template_type`
--

CREATE TABLE IF NOT EXISTS `wf_template_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_tour_order`
--

CREATE TABLE IF NOT EXISTS `wf_tour_order` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `tel` char(11) NOT NULL DEFAULT '0',
  `wayId` int(11) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `orderAt1` int(11) NOT NULL DEFAULT '0',
  `orderAt2` int(11) NOT NULL DEFAULT '0',
  `visitStatus` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `visitAt` int(11) NOT NULL DEFAULT '0',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `isAdd` tinyint(11) NOT NULL DEFAULT '0',
  `belongUserId` int(11) NOT NULL DEFAULT '0',
  `belongUser` varchar(50) NOT NULL DEFAULT '',
  `belongPid` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(10000) NOT NULL DEFAULT '',
  `number` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_tour_way`
--

CREATE TABLE IF NOT EXISTS `wf_tour_way` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `days` int(2) NOT NULL DEFAULT '0',
  `signDate` varchar(20) NOT NULL DEFAULT '',
  `passHouse` varchar(500) NOT NULL DEFAULT '',
  `subTourPlan` text NOT NULL,
  `inclusion` varchar(1000) NOT NULL DEFAULT '',
  `notInclusion` varchar(1000) NOT NULL DEFAULT '',
  `feature` varchar(1000) NOT NULL DEFAULT '',
  `notice` varchar(1000) NOT NULL DEFAULT '',
  `isTop` tinyint(1) NOT NULL DEFAULT '0',
  `isRecommend` tinyint(1) NOT NULL DEFAULT '0',
  `pic` varchar(100) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `signNum` int(5) NOT NULL DEFAULT '0',
  `isTravel` tinyint(1) NOT NULL DEFAULT '0',
  `categoryId` tinyint(11) NOT NULL DEFAULT '0',
  `costPrice` int(10) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `qq` varchar(12) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_tour_way_plan`
--

CREATE TABLE IF NOT EXISTS `wf_tour_way_plan` (
  `pid` int(11) NOT NULL,
  `tourWayId` int(11) NOT NULL DEFAULT '0',
  `cityName` varchar(50) NOT NULL DEFAULT '',
  `tourPlan` text NOT NULL,
  `orders` int(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_admins`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_admins` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `allowadminsetting` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminapp` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminbadword` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmintag` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincredits` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindomain` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindb` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminnote` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincache` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminlog` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_applications`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_applications` (
  `appid` smallint(6) unsigned NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `authkey` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `viewprourl` varchar(255) NOT NULL,
  `apifilename` varchar(30) NOT NULL DEFAULT 'uc.php',
  `charset` varchar(8) NOT NULL DEFAULT '',
  `dbcharset` varchar(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  `recvnote` tinyint(1) DEFAULT '0',
  `extra` text NOT NULL,
  `tagtemplates` text NOT NULL,
  `allowips` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_badwords`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_badwords` (
  `id` smallint(6) unsigned NOT NULL,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `findpattern` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_domains`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_domains` (
  `id` int(10) unsigned NOT NULL,
  `domain` char(40) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_failedlogins`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_feeds`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_feeds` (
  `feedid` mediumint(8) unsigned NOT NULL,
  `appid` varchar(30) NOT NULL DEFAULT '',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_friends`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_friends` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friendid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `direction` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL,
  `delstatus` tinyint(1) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_mailqueue`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_mailqueue` (
  `mailid` int(10) unsigned NOT NULL,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tomail` varchar(32) NOT NULL,
  `frommail` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `charset` varchar(15) NOT NULL,
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `failures` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_memberfields`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_memberfields` (
  `uid` mediumint(8) unsigned NOT NULL,
  `blacklist` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_members`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_members` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `mobile` char(12) NOT NULL DEFAULT '0',
  `myid` char(30) NOT NULL DEFAULT '',
  `myidkey` char(16) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `salt` char(6) NOT NULL,
  `secques` char(8) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_mergemembers`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_mergemembers` (
  `appid` smallint(6) unsigned NOT NULL,
  `username` char(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_newpm`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_newpm` (
  `uid` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_notelist`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_notelist` (
  `noteid` int(10) unsigned NOT NULL,
  `operation` char(32) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `succeednum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `getdata` mediumtext NOT NULL,
  `postdata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) NOT NULL DEFAULT '0',
  `app2` tinyint(4) NOT NULL,
  `app3` tinyint(4) NOT NULL,
  `app4` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_indexes`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_indexes` (
  `pmid` mediumint(8) unsigned NOT NULL,
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_lists`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_lists` (
  `plid` mediumint(8) unsigned NOT NULL,
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pmtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL,
  `members` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min_max` varchar(17) NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastmessage` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_members`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_members` (
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pmnum` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_0`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_0` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_1`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_1` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_2`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_2` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_3`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_3` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_4`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_4` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_5`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_5` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_6`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_6` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_7`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_7` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_8`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_8` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_pm_messages_9`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_pm_messages_9` (
  `pmid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_protectedmembers`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_protectedmembers` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `appid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` char(15) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_settings`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_settings` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_sqlcache`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_sqlcache` (
  `sqlid` char(6) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL,
  `expiry` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_tags`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_tags` (
  `tagname` char(20) NOT NULL,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext,
  `expiration` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_ucenter_vars`
--

CREATE TABLE IF NOT EXISTS `wf_ucenter_vars` (
  `name` char(32) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_usercar_files`
--

CREATE TABLE IF NOT EXISTS `wf_usercar_files` (
  `userCarId` int(10) unsigned NOT NULL,
  `fileType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文件类型',
  `fileReason` varchar(255) NOT NULL DEFAULT '' COMMENT '带看奖励原因及预计取回时间',
  `goaward` varchar(255) NOT NULL DEFAULT '' COMMENT '带看奖励',
  `confirmAt` int(11) NOT NULL DEFAULT '0' COMMENT '确认单回收时间',
  `confirmBy` varchar(20) NOT NULL DEFAULT '' COMMENT '确认单人',
  `awardBy` varchar(20) NOT NULL DEFAULT '' COMMENT '奖励回收人',
  `awardAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '奖励回收时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_active`
--

CREATE TABLE IF NOT EXISTS `wf_user_active` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `noticeId` int(11) NOT NULL DEFAULT '0',
  `startTim` int(11) NOT NULL DEFAULT '0',
  `endTim` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `isused` tinyint(1) NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_base`
--

CREATE TABLE IF NOT EXISTS `wf_user_base` (
  `id` int(10) unsigned NOT NULL,
  `tel` char(20) NOT NULL DEFAULT '',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `province` varchar(60) NOT NULL DEFAULT '0',
  `city` varchar(60) NOT NULL DEFAULT '0',
  `regIP` varchar(15) NOT NULL DEFAULT '',
  `regTime` int(6) unsigned NOT NULL DEFAULT '0',
  `telCert` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `emailCert` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userWay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `succStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `loginCnt` int(6) unsigned NOT NULL DEFAULT '0',
  `loginIP` varchar(15) NOT NULL DEFAULT '',
  `onlineTime` int(10) NOT NULL,
  `loginTime` int(6) unsigned NOT NULL DEFAULT '0',
  `open_id` varchar(32) NOT NULL DEFAULT '',
  `rank` float(5,2) unsigned NOT NULL DEFAULT '0.00',
  `bargainCounts` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `operateAt` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '最近操作时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_base_ceshi`
--

CREATE TABLE IF NOT EXISTS `wf_user_base_ceshi` (
  `id` int(10) unsigned NOT NULL,
  `tel` char(11) NOT NULL DEFAULT '',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `province` int(6) unsigned NOT NULL DEFAULT '0',
  `city` int(6) unsigned NOT NULL DEFAULT '0',
  `regIP` varchar(15) NOT NULL DEFAULT '',
  `regTime` int(6) unsigned NOT NULL DEFAULT '0',
  `telCert` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `emailCert` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userWay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `succStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(5) unsigned NOT NULL DEFAULT '5',
  `loginCnt` int(6) unsigned NOT NULL DEFAULT '0',
  `loginIP` varchar(15) NOT NULL DEFAULT '',
  `isagent` tinyint(1) NOT NULL,
  `onlineTime` int(10) NOT NULL,
  `loginTime` int(6) unsigned NOT NULL DEFAULT '0',
  `open_id` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_user_base_view`
--
CREATE TABLE IF NOT EXISTS `wf_user_base_view` (
`id` int(10) unsigned
,`tel` char(20)
,`userName` varchar(50)
,`email` varchar(100)
,`province` varchar(60)
,`regTime` int(6) unsigned
,`city` varchar(60)
,`status` tinyint(1) unsigned
,`loginTime` int(6) unsigned
,`userType` tinyint(1) unsigned
,`loginCnt` int(6) unsigned
,`userId` int(10) unsigned
,`name` varchar(50)
,`sex` tinyint(1) unsigned
,`icon` varchar(128)
,`statusInfo` varchar(50)
,`updatedBy` varchar(30)
,`updatedAt` int(6) unsigned
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`belongPid` int(6) unsigned
,`creditTotal` int(6) unsigned
,`creditSum` int(6) unsigned
,`userWay` tinyint(1) unsigned
,`succStatus` tinyint(1) unsigned
,`clientId` int(10) unsigned
,`buyTotal` int(6) unsigned
,`roleId` int(4)
,`notes` varchar(255)
,`isAnchang` smallint(4) unsigned
,`birth` int(6) unsigned
,`userTim` int(6) unsigned
,`onlineTime` int(10)
,`loginIP` varchar(15)
,`regIP` varchar(15)
,`open_id` varchar(32)
,`company` varchar(50)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_exchange`
--

CREATE TABLE IF NOT EXISTS `wf_user_exchange` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `exchangeId` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `isChange` tinyint(1) NOT NULL DEFAULT '2',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_info`
--

CREATE TABLE IF NOT EXISTS `wf_user_info` (
  `userId` int(10) unsigned NOT NULL,
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `icon` varchar(128) NOT NULL DEFAULT '',
  `birth` int(6) unsigned NOT NULL DEFAULT '0',
  `career` varchar(30) NOT NULL DEFAULT '',
  `belongUserId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongUser` varchar(50) NOT NULL DEFAULT '',
  `belongPid` int(6) unsigned NOT NULL DEFAULT '0',
  `address` varchar(100) NOT NULL DEFAULT '',
  `QQ` varchar(20) NOT NULL DEFAULT '',
  `cerAudit` tinyint(1) unsigned NOT NULL,
  `icenAudit` tinyint(1) unsigned NOT NULL,
  `visitAudit` tinyint(1) unsigned NOT NULL,
  `idAudit` tinyint(1) unsigned NOT NULL,
  `idCard` varchar(18) NOT NULL DEFAULT '',
  `certification` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `statusInfo` varchar(50) NOT NULL DEFAULT '',
  `updatedId` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(30) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(30) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `changedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `buyTotal` int(6) unsigned NOT NULL DEFAULT '0',
  `creditTotal` int(6) unsigned NOT NULL DEFAULT '0',
  `creditSum` int(6) unsigned NOT NULL DEFAULT '0',
  `startTim` int(6) unsigned NOT NULL DEFAULT '0',
  `endTim` int(6) unsigned NOT NULL DEFAULT '0',
  `userTim` int(6) unsigned NOT NULL DEFAULT '0',
  `notes` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(50) NOT NULL DEFAULT '',
  `clickNum` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_info_ceshi`
--

CREATE TABLE IF NOT EXISTS `wf_user_info_ceshi` (
  `userId` int(10) unsigned NOT NULL,
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `icon` varchar(128) NOT NULL DEFAULT '',
  `birth` int(6) unsigned NOT NULL DEFAULT '0',
  `career` varchar(30) NOT NULL DEFAULT '',
  `belongUserId` int(6) unsigned NOT NULL DEFAULT '0',
  `belongUser` varchar(50) NOT NULL DEFAULT '',
  `belongPid` int(6) unsigned NOT NULL DEFAULT '0',
  `address` varchar(100) NOT NULL DEFAULT '',
  `QQ` varchar(20) NOT NULL DEFAULT '',
  `cerAudit` tinyint(1) unsigned NOT NULL,
  `icenAudit` tinyint(1) unsigned NOT NULL,
  `visitAudit` tinyint(1) unsigned NOT NULL,
  `idAudit` tinyint(1) unsigned NOT NULL,
  `idCard` varchar(18) NOT NULL DEFAULT '',
  `visitImg` varchar(128) NOT NULL DEFAULT '',
  `idcardImg` varchar(128) NOT NULL DEFAULT '',
  `icenImg` varchar(128) NOT NULL DEFAULT '',
  `certification` varchar(100) NOT NULL DEFAULT '',
  `certificationImg` varchar(128) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `statusInfo` varchar(50) NOT NULL DEFAULT '',
  `updatedId` int(6) unsigned NOT NULL DEFAULT '0',
  `updatedBy` varchar(30) NOT NULL DEFAULT '',
  `updatedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(30) NOT NULL DEFAULT '',
  `createdAt` int(6) unsigned NOT NULL DEFAULT '0',
  `changedAt` int(6) unsigned NOT NULL DEFAULT '0',
  `buyTotal` int(6) unsigned NOT NULL DEFAULT '0',
  `creditTotal` int(6) unsigned NOT NULL DEFAULT '0',
  `creditSum` int(6) unsigned NOT NULL DEFAULT '0',
  `startTim` int(6) unsigned NOT NULL DEFAULT '0',
  `endTim` int(6) unsigned NOT NULL DEFAULT '0',
  `userTim` int(6) unsigned NOT NULL DEFAULT '0',
  `notes` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_other`
--

CREATE TABLE IF NOT EXISTS `wf_user_other` (
  `userId` int(11) unsigned NOT NULL,
  `saleRecount` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `hireRecount` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `saleReAt` int(6) unsigned NOT NULL DEFAULT '0',
  `hireReAt` int(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_statistics`
--

CREATE TABLE IF NOT EXISTS `wf_user_statistics` (
  `id` int(11) unsigned NOT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '统计类型：1：二手房房源查看号码，2：租房房源查看号码，3：二手房客户查看号码，4：租房客户查看号码',
  `counts` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `dates` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_user_visit`
--

CREATE TABLE IF NOT EXISTS `wf_user_visit` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `way` int(11) NOT NULL DEFAULT '0',
  `visitTim` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vagent`
--
CREATE TABLE IF NOT EXISTS `wf_vagent` (
`id` smallint(8)
,`tel` varchar(30)
,`name` varchar(50)
,`passwd` varchar(36)
,`sex` tinyint(1)
,`idCard` varchar(50)
,`province` int(11)
,`city` int(11)
,`county` int(11)
,`regTime` int(11)
,`address` varchar(100)
,`agreement` tinyint(1)
,`joinState` tinyint(1)
,`startTim` int(11)
,`endTim` int(11)
,`status` tinyint(1)
,`message` varchar(1000)
,`notes` varchar(1000)
,`belongUser` varchar(50)
,`belongUserId` int(11) unsigned
,`updatedBy` varchar(50)
,`updatedAt` int(11)
,`createdBy` varchar(50)
,`createdAt` int(11)
,`createdId` int(11)
,`changeClient` tinyint(1)
,`roleId` int(4)
,`joinWay` tinyint(1)
,`pid` smallint(5) unsigned
,`companyInfo` varchar(255)
,`loginTime` int(6) unsigned
,`loginCnt` int(6) unsigned
,`isHouse` tinyint(1) unsigned
,`delAt` int(10) unsigned
,`delId` varchar(20)
,`delBy` varchar(30)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vagent_clients`
--
CREATE TABLE IF NOT EXISTS `wf_vagent_clients` (
`id` int(10) unsigned
,`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`clientFrom` tinyint(4)
,`tel` char(32)
,`phone` varchar(50)
,`otherPhone` varchar(50)
,`askDate` int(6) unsigned
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`firstUserId` int(4) unsigned
,`status` tinyint(4)
,`arrangeRoleId` int(4)
,`clientType` tinyint(1) unsigned
,`roleId` int(4)
,`clientPoint` varchar(1000)
,`name` varchar(50)
,`agentName` varchar(50)
,`agentUserId` int(11) unsigned
,`agentRoleId` int(4)
,`agentId` int(6) unsigned
,`clientLevel` tinyint(4)
,`isBargain` tinyint(1)
,`agentSaleName` varchar(50)
,`agentSaleTel` varchar(20)
,`seeItem` varchar(255)
,`fitmentId` int(6) unsigned
,`agentAt` int(6)
,`lastVisitDate` int(6) unsigned
,`changeAt` int(6) unsigned
,`createdAt` int(6) unsigned
,`agentProvince` int(11)
,`isHouse` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vagent_clients_deal`
--
CREATE TABLE IF NOT EXISTS `wf_vagent_clients_deal` (
`title` varchar(50)
,`houseNo` varchar(20)
,`dealId` int(11) unsigned
,`earnestDate` date
,`total` int(11)
,`eachPrice` float(20,0)
,`area` varchar(10)
,`signDate` varchar(20)
,`payWay` tinyint(1)
,`dealNotes` varchar(500)
,`results` mediumint(8) unsigned
,`roleId` int(4)
,`arrangeRoleId` int(4)
,`agentUserId` int(11) unsigned
,`isBargain` tinyint(1)
,`agentRoleId` int(4)
,`agentName` varchar(50)
,`status` tinyint(4)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`clientFrom` tinyint(4)
,`clientName` varchar(50)
,`firstUser` varchar(50)
,`arrangeUser` varchar(50)
,`arrangeId` int(6) unsigned
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`tel` char(32)
,`phone` varchar(50)
,`otherPhone` varchar(50)
,`askDate` int(6) unsigned
,`clientType` tinyint(1) unsigned
,`clientLevel` tinyint(4)
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vagent_clients_deal_copy`
--
CREATE TABLE IF NOT EXISTS `wf_vagent_clients_deal_copy` (
`clientPoint` varchar(1000)
,`buyCity` varchar(100)
,`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`roomType` varchar(100)
,`createdBy` varchar(20)
,`updatedAt` int(11)
,`createdAt` int(11)
,`purpose` varchar(50)
,`fitment` tinyint(4)
,`propertyType` tinyint(1)
,`buyNum` int(11)
,`fitment1` varchar(20)
,`propertyNotes` varchar(1000)
,`id` int(10) unsigned
,`userId` int(10) unsigned
,`userName` varchar(50)
,`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`tel` char(32)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`changeClient` tinyint(1)
,`status` tinyint(4)
,`belongPid` int(6) unsigned
,`changeAt` int(6) unsigned
,`agentId` int(6) unsigned
,`isAnchang` smallint(4) unsigned
,`jobType` tinyint(1)
,`visitHouseAt` int(6) unsigned
,`isBargain` tinyint(1)
,`roleId` int(4)
,`clientType` tinyint(1) unsigned
,`arrangeRoleId` int(4)
,`title` varchar(50)
,`houseNo` varchar(20)
,`dealId` int(11) unsigned
,`earnestDate` date
,`total` int(11)
,`eachPrice` float(20,0)
,`area` varchar(10)
,`signDate` varchar(20)
,`payWay` tinyint(1)
,`dealNotes` varchar(500)
,`results` mediumint(8) unsigned
,`agentRoleId` int(4)
,`agentUserId` int(11) unsigned
,`agentName` varchar(50)
,`agentTel` varchar(20)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vagent_role`
--
CREATE TABLE IF NOT EXISTS `wf_vagent_role` (
`id` smallint(8)
,`agentName` varchar(50)
,`agentUserId` int(11) unsigned
,`agentRoleId` int(4)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_varrangers_role`
--
CREATE TABLE IF NOT EXISTS `wf_varrangers_role` (
`id` int(10) unsigned
,`arrangeId` int(6) unsigned
,`arrangeName` varchar(30)
,`clientId` int(10) unsigned
,`timeAt` int(6) unsigned
,`clientLevel` tinyint(3) unsigned
,`roleId` int(4)
,`clientType` tinyint(1) unsigned
,`isAnchang` smallint(4) unsigned
,`isBargain` tinyint(1) unsigned
,`roleCate` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vasks_replys`
--
CREATE TABLE IF NOT EXISTS `wf_vasks_replys` (
`askid` int(10) unsigned
,`id` int(10) unsigned
,`content` text
,`supports` int(6) unsigned
,`opposes` int(6) unsigned
,`status` tinyint(1) unsigned
,`uid` int(10) unsigned
,`uname` varchar(30)
,`createdAt` int(10) unsigned
,`createdBy` varchar(20)
,`title` varchar(255)
,`detail` text
,`replys` mediumint(4) unsigned
,`cateId` tinyint(1) unsigned
,`subcateid` tinyint(2) unsigned
,`clicks` int(6) unsigned
,`askuname` varchar(30)
,`askcreatedAt` int(10) unsigned
,`isolve` tinyint(1) unsigned
,`currentId` int(11) unsigned
,`currentName` varchar(50)
,`currentType` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vbbs_recommend`
--
CREATE TABLE IF NOT EXISTS `wf_vbbs_recommend` (
`id` int(11)
,`buildingId` int(11)
,`userId` int(11)
,`clientId` int(11)
,`contact` varchar(50)
,`tel` varchar(20)
,`seeDate` int(11)
,`seeStatus` tinyint(1)
,`prebuilding` tinyint(1)
,`content` varchar(255)
,`recommendId` int(11)
,`reason` varchar(255)
,`status` tinyint(1)
,`userStatus` tinyint(1)
,`title` varchar(150)
,`icon` varchar(128)
,`type` varchar(150)
,`feature` varchar(150)
,`zone` varchar(50)
,`address` varchar(100)
,`startTime` int(11)
,`adTitle` varchar(150)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`weightScore` int(6) unsigned
,`joinTime` int(11)
,`decoration` varchar(150)
,`buildingNum` varchar(50)
,`houseNum` varchar(50)
,`parkingNum` varchar(20)
,`priceAvg` int(6) unsigned
,`priceSum` varchar(150)
,`priceSumType` varchar(100)
,`qiXian` tinyint(4) unsigned
,`contacterTel` varchar(50)
,`contacter` varchar(50)
,`recommendType` tinyint(1)
,`cooperateStatus` tinyint(4) unsigned
,`sellerTel` varchar(20)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vbsi_concern`
--
CREATE TABLE IF NOT EXISTS `wf_vbsi_concern` (
`title` varchar(150)
,`icon` varchar(128)
,`type` varchar(150)
,`feature` varchar(150)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`county` int(6) unsigned
,`zone` varchar(50)
,`address` varchar(100)
,`startTime` int(11)
,`adTitle` varchar(150)
,`joinTime` int(11)
,`decoration` varchar(150)
,`buildingNum` varchar(50)
,`weightByname` int(6) unsigned
,`houseNum` varchar(50)
,`weightScore` int(6) unsigned
,`status` tinyint(4) unsigned
,`priceAvg` int(6) unsigned
,`priceMin` int(6)
,`priceMax` int(6) unsigned
,`priceSum` varchar(150)
,`priceSumType` varchar(100)
,`qiXian` tinyint(4) unsigned
,`saleStatus` tinyint(4) unsigned
,`buildingType` varchar(100)
,`investor` varchar(50)
,`developer` varchar(50)
,`commentNum` int(11)
,`concernNum` int(11)
,`tuanNum` int(11)
,`optionalNum` int(11)
,`newsNum` int(11)
,`dynamicNum` int(11)
,`roomNum` int(11)
,`picNum` int(11)
,`videoNum` int(11)
,`smsNum` int(11)
,`emailNum` int(11)
,`clickNum` int(11)
,`buildingId` int(11)
,`updateAt` int(11)
,`concernType` tinyint(1)
,`id` int(11)
,`userId` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vbsi_recommend`
--
CREATE TABLE IF NOT EXISTS `wf_vbsi_recommend` (
`buildingId` int(11)
,`userId` int(11)
,`reason` varchar(255)
,`id` int(11)
,`title` varchar(150)
,`icon` varchar(128)
,`feature` varchar(150)
,`type` varchar(150)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`zone` varchar(50)
,`address` varchar(100)
,`startTime` int(11)
,`adTitle` varchar(150)
,`joinTime` int(11)
,`decoration` varchar(150)
,`buildingNum` varchar(50)
,`houseNum` varchar(50)
,`parkingNum` varchar(20)
,`weightScore` int(6) unsigned
,`priceAvg` int(6) unsigned
,`priceMin` int(6)
,`priceMax` int(6) unsigned
,`priceSum` varchar(150)
,`priceSumType` varchar(100)
,`qiXian` tinyint(4) unsigned
,`saleStatus` tinyint(4) unsigned
,`areaMax` int(100)
,`areaMin` int(100)
,`recommendType` tinyint(1)
,`contacter` varchar(50)
,`contacterTel` varchar(50)
,`fax` varchar(50)
,`clientId` int(11)
,`seeStatus` tinyint(1)
,`sellerName` varchar(50)
,`sellerTel` varchar(20)
,`status` tinyint(1)
,`seeDate` int(11)
,`content` varchar(255)
,`tel` varchar(20)
,`contact` varchar(50)
,`prebuilding` tinyint(1)
,`isConfirm` tinyint(1) unsigned
,`confirmAt` int(11)
,`getArrangeId` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vbuilding_tuanjoin`
--
CREATE TABLE IF NOT EXISTS `wf_vbuilding_tuanjoin` (
`id` int(11)
,`belongUserId` int(6) unsigned
,`belongUserName` varchar(30)
,`createdAt` int(11)
,`tuanId` int(11)
,`buildingId` int(11)
,`buildingTitle` varchar(150)
,`userName` varchar(50)
,`tel` varchar(20)
,`joinType` tinyint(1)
,`joinTime` int(11)
,`clientId` int(6) unsigned
,`roleId` int(4)
,`status` tinyint(1)
,`joinStatus` tinyint(1)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vbusinesscount_aclients`
--
CREATE TABLE IF NOT EXISTS `wf_vbusinesscount_aclients` (
`id` int(10) unsigned
,`inclients` int(2) unsigned
,`bargains` int(2) unsigned
,`agentId` int(6) unsigned
,`agentName` varchar(100)
,`times` date
,`belongId` int(11) unsigned
,`belongUser` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vclient_role`
--
CREATE TABLE IF NOT EXISTS `wf_vclient_role` (
`id` int(10) unsigned
,`userId` int(10) unsigned
,`userName` varchar(50)
,`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`agentName` varchar(50)
,`agentTel` varchar(20)
,`tel` char(32)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`changeClient` tinyint(1)
,`status` tinyint(4)
,`belongPid` int(6) unsigned
,`changeAt` int(6) unsigned
,`agentId` int(6) unsigned
,`jobType` tinyint(1)
,`visitHouseAt` int(6) unsigned
,`roleId` int(4)
,`arrangeRoleId` int(4)
,`clientType` tinyint(1) unsigned
,`isAnchang` smallint(4) unsigned
,`isBargain` tinyint(1)
,`visitNum` int(4)
,`createdAt` int(6) unsigned
,`agentSaleName` varchar(50)
,`agentSaleTel` varchar(20)
,`fitmentId` int(6) unsigned
,`agentAt` int(6)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vdichan_building_bsc`
--
CREATE TABLE IF NOT EXISTS `wf_vdichan_building_bsc` (
`id` int(11) unsigned
,`title` varchar(150)
,`titlePinyin` varchar(300)
,`icon` varchar(128)
,`type` varchar(150)
,`feature` varchar(150)
,`province` int(6) unsigned
,`city` int(6) unsigned
,`county` int(6) unsigned
,`zone` varchar(50)
,`lat` double(10,0)
,`lng` double(10,0)
,`address` varchar(100)
,`startTime` int(11)
,`startByname` varchar(30)
,`joinTime` int(11)
,`joinByname` varchar(30)
,`adTitle` varchar(150)
,`reason` varchar(255)
,`decoration` varchar(150)
,`buildingNum` varchar(50)
,`houseNum` varchar(50)
,`parkingNum` varchar(20)
,`recommendRoom` varchar(50)
,`room` varchar(60)
,`sellerId` int(6) unsigned
,`sellerName` varchar(50)
,`sellerTel` varchar(20)
,`boundAt` int(6) unsigned
,`weightByname` int(6) unsigned
,`weightScore` int(6) unsigned
,`updatedBy` varchar(20)
,`updatedAt` int(6) unsigned
,`fieldScore` int(6) unsigned
,`youhui` tinyint(1)
,`gift` tinyint(1) unsigned
,`createdBy` varchar(20)
,`createdAt` int(6) unsigned
,`status` tinyint(4) unsigned
,`patent` int(4) unsigned
,`priceMax` int(6) unsigned
,`priceMin` int(6)
,`priceAvg` int(6) unsigned
,`priceSum` varchar(150)
,`saleStatus` tinyint(4) unsigned
,`buildingId` int(11)
,`roomNum` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vdichan_building_message_base`
--
CREATE TABLE IF NOT EXISTS `wf_vdichan_building_message_base` (
`id` int(11)
,`buildingId` int(11)
,`title` varchar(50)
,`type` tinyint(4)
,`releaseAt` int(11)
,`content` text
,`remark` varchar(150)
,`click` int(11)
,`emailNum` int(11)
,`SMSNum` int(11)
,`updatedBy` varchar(20)
,`updatedAt` int(11)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`status` tinyint(4) unsigned
,`city` int(6) unsigned
,`province` int(6) unsigned
,`titlePinyin` varchar(300)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vdujia_order`
--
CREATE TABLE IF NOT EXISTS `wf_vdujia_order` (
`id` mediumint(8) unsigned
,`hotelId` mediumint(8) unsigned
,`houseId` mediumint(8) unsigned
,`bkfast` tinyint(3) unsigned
,`userId` mediumint(8) unsigned
,`inDate` int(10) unsigned
,`outDate` int(10) unsigned
,`odPriceBase` varchar(10)
,`odPrice` varchar(10)
,`bedType` tinyint(1) unsigned
,`odRoomNum` smallint(3) unsigned
,`odName` varchar(20)
,`odTel` char(32)
,`odNotes` varchar(300)
,`needBill` tinyint(1) unsigned
,`billName` varchar(20)
,`odStatus` tinyint(1) unsigned
,`notes` varchar(200)
,`createdAt` int(10) unsigned
,`updatedAt` int(10) unsigned
,`status` tinyint(1) unsigned
,`city` smallint(6) unsigned
,`county` smallint(6)
,`name` varchar(200)
,`pic` varchar(200)
,`address` varchar(200)
,`rank` smallint(3) unsigned
,`title` varchar(200)
,`fangxingId` smallint(3)
,`youhui` varchar(200)
,`housePic` varchar(200)
,`youhuiPrice` varchar(10)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vdujia_price_house`
--
CREATE TABLE IF NOT EXISTS `wf_vdujia_price_house` (
`id` mediumint(8) unsigned
,`hotelId` mediumint(8) unsigned
,`houseId` smallint(6) unsigned
,`kucun` smallint(6) unsigned
,`bkfast` smallint(6)
,`price` decimal(8,2) unsigned
,`date` int(8) unsigned
,`createdAt` int(10) unsigned
,`fangxingId` smallint(3)
,`title` varchar(200)
,`youhui` varchar(200)
,`pic` varchar(200)
,`province` smallint(6) unsigned
,`city` smallint(6) unsigned
,`county` smallint(6)
,`name` varchar(200)
,`hotelPic` varchar(200)
,`address` varchar(200)
,`fuwu` varchar(30)
,`sheshi` varchar(30)
,`floor` varchar(50)
,`num` smallint(6) unsigned
,`flag` varchar(30)
,`oldName` varchar(200)
,`rank` smallint(3) unsigned
,`hotelStatus` tinyint(1)
,`status` tinyint(1)
,`mapLat` varchar(20)
,`mapLng` varchar(10)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfencount_clientbuilding`
--
CREATE TABLE IF NOT EXISTS `wf_vfencount_clientbuilding` (
`times` varchar(10)
,`province` int(4) unsigned
,`clientFrom` tinyint(4)
,`city` int(11)
,`createdAt` int(11)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`payWay` tinyint(1)
,`departmentId` int(4) unsigned
,`id` int(11) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client` (
`id` int(10) unsigned
,`userId` int(10) unsigned
,`userName` varchar(50)
,`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`agentName` varchar(50)
,`agentTel` varchar(20)
,`tel` char(32)
,`phone` varchar(50)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`changeClient` tinyint(1)
,`status` tinyint(4)
,`belongPid` int(6) unsigned
,`changeAt` int(6) unsigned
,`agentId` int(6) unsigned
,`jobType` tinyint(1)
,`visitHouseAt` int(6) unsigned
,`roleId` int(4)
,`isAnchang` smallint(4) unsigned
,`isBargain` tinyint(1)
,`visitNum` int(4)
,`createdAt` int(6) unsigned
,`agentSaleName` varchar(50)
,`agentSaleTel` varchar(20)
,`clientType` tinyint(1) unsigned
,`isguanjia` tinyint(1) unsigned
,`fitmentId` int(6) unsigned
,`agentAt` int(6)
,`no3hourVisit` tinyint(1) unsigned
,`category` tinyint(4) unsigned
,`roleCate` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_clientfollow`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_clientfollow` (
`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`tel` char(32)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`clientPoint` varchar(1000)
,`id` int(10) unsigned
,`nextVisitDate` int(6)
,`lastVisitDate` int(6) unsigned
,`userName` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`status` tinyint(4)
,`changeClient` tinyint(1)
,`buyCity` varchar(100)
,`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`roomType` varchar(100)
,`createdBy` varchar(20)
,`updatedAt` int(11)
,`createdAt` int(11)
,`purpose` varchar(50)
,`area` tinyint(4)
,`fitment` tinyint(4)
,`propertyType` tinyint(1)
,`buyNum` int(11)
,`fitment1` varchar(20)
,`belongPid` int(6) unsigned
,`propertyNotes` varchar(1000)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`roleId` int(4)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_arrange`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_arrange` (
`clientId` int(10) unsigned
,`toDate` int(11)
,`backDate` int(11)
,`billDate` int(6) unsigned
,`seeDate` int(6) unsigned
,`way` tinyint(4)
,`ticket` tinyint(4)
,`hotelOrder` tinyint(4)
,`carOrder` tinyint(4)
,`id` int(11) unsigned
,`status` tinyint(4)
,`saleNotes` varchar(1000)
,`saleId` int(11)
,`saleName` varchar(20)
,`serviceNotes` varchar(1000)
,`serviceName` varchar(20)
,`serviceDate` int(11)
,`travelNotes` varchar(1000)
,`travelName` varchar(20)
,`travelId` int(11)
,`seeStatus` tinyint(4)
,`isSum` tinyint(1)
,`driver` varchar(50)
,`useCar` varchar(50)
,`createdAt` int(6) unsigned
,`arrangeUser` varchar(50)
,`arrangeId` int(6) unsigned
,`clientName` varchar(50)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`askDate` int(6) unsigned
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUser` varchar(50)
,`firstUserId` int(4) unsigned
,`agentId` int(6) unsigned
,`isAnchang` int(4) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_arrangers`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_arrangers` (
`id` int(10) unsigned
,`tel` char(32)
,`phone` varchar(50)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`clientType1` tinyint(1) unsigned
,`isAnchang` smallint(4) unsigned
,`clientType` tinyint(1) unsigned
,`xtel` varchar(20)
,`xphone` varchar(30)
,`xotherPhone` varchar(30)
,`arrangeName` varchar(30)
,`clientType2` tinyint(1) unsigned
,`status` tinyint(4)
,`isAnchang1` smallint(4) unsigned
,`isAnchang2` smallint(4) unsigned
,`otherPhone` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_arranges_tel`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_arranges_tel` (
`belongUser` varchar(50)
,`arrangeName` varchar(30)
,`arrangeId` int(6) unsigned
,`belongUserId` int(6) unsigned
,`status` tinyint(4)
,`timeAt` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`clientLevel` tinyint(3) unsigned
,`tel` char(32)
,`xtel` char(20)
,`clientId` mediumint(8) unsigned
,`id` mediumint(8) unsigned
,`isBargain` tinyint(1) unsigned
,`telName` varchar(30)
,`clientName` varchar(50)
,`roleId` int(4)
,`isAnchang` smallint(4) unsigned
,`clientType` tinyint(1) unsigned
,`roleArea` varchar(255)
,`roleId2` int(4)
,`isAnchang2` smallint(4) unsigned
,`clientType2` tinyint(1) unsigned
,`roleArea2` varchar(255)
,`departmentId` int(4) unsigned
,`departmentId2` int(4) unsigned
,`city` int(4) unsigned
,`createdAt` int(6) unsigned
,`changeAt` int(6) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_arrange_agent`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_arrange_agent` (
`clientId` int(10) unsigned
,`toDate` int(11)
,`backDate` int(11)
,`billDate` int(6) unsigned
,`seeDate` int(6) unsigned
,`way` tinyint(4)
,`ticket` tinyint(4)
,`hotelOrder` tinyint(4)
,`carOrder` tinyint(4)
,`id` int(11) unsigned
,`status` tinyint(4)
,`saleNotes` varchar(1000)
,`saleId` int(11)
,`saleName` varchar(20)
,`serviceNotes` varchar(1000)
,`serviceName` varchar(20)
,`serviceDate` int(11)
,`travelNotes` varchar(1000)
,`travelName` varchar(20)
,`travelId` int(11)
,`seeStatus` tinyint(4)
,`isSum` tinyint(1)
,`driver` varchar(50)
,`useCar` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`clientName` varchar(50)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`tel` char(32)
,`otherPhone` varchar(50)
,`askDate` int(6) unsigned
,`belongUser` varchar(50)
,`belongUserId` int(6) unsigned
,`firstUser` varchar(50)
,`belongPid` int(6) unsigned
,`clientType` tinyint(1) unsigned
,`roleId` int(4)
,`arrangeRoleId` int(4)
,`agentName` varchar(50)
,`agentUserId` int(11) unsigned
,`agentRoleId` int(4)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_deal`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_deal` (
`clientId` int(11)
,`clientName` varchar(50)
,`dealId` int(11) unsigned
,`title` varchar(50)
,`houseNo` varchar(20)
,`area` varchar(10)
,`eachPrice` float(20,0)
,`total` int(11)
,`earnestDate` date
,`signDate` varchar(20)
,`payWay` tinyint(1)
,`dealNotes` varchar(500)
,`results` mediumint(8) unsigned
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`status` tinyint(4)
,`agentId` int(6) unsigned
,`agentNextId` int(6) unsigned
,`id` int(10) unsigned
,`isBargain` tinyint(1)
,`clientFrom` tinyint(4)
,`buildingId` int(11)
,`dealCity` int(11)
,`preferencePrice` int(6) unsigned
,`point` float(5,2)
,`dealStatus` tinyint(1)
,`isBack` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_property`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_property` (
`clientPoint` varchar(1000)
,`buyCity` varchar(100)
,`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`roomType` varchar(100)
,`createdBy` varchar(20)
,`updatedAt` int(11)
,`createdAt` int(11)
,`purpose` varchar(50)
,`area` tinyint(4)
,`fitment` tinyint(4)
,`propertyType` tinyint(1)
,`buyNum` int(11)
,`fitment1` varchar(20)
,`propertyNotes` varchar(1000)
,`id` int(10) unsigned
,`userId` int(10) unsigned
,`userName` varchar(50)
,`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`agentName` varchar(50)
,`agentTel` varchar(20)
,`tel` char(32)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`changeClient` tinyint(1)
,`status` tinyint(4)
,`belongPid` int(6) unsigned
,`changeAt` int(6) unsigned
,`agentId` int(6) unsigned
,`isAnchang` smallint(4) unsigned
,`jobType` tinyint(1)
,`visitHouseAt` int(6) unsigned
,`isBargain` tinyint(1)
,`roleId` int(4)
,`clientType` tinyint(1) unsigned
,`arrangeRoleId` int(4)
,`seeItem` varchar(255)
,`fitmentId` int(6) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_property_agent`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_property_agent` (
`clientPoint` varchar(1000)
,`buyCity` varchar(100)
,`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`roomType` varchar(100)
,`createdBy` varchar(20)
,`updatedAt` int(11)
,`createdAt` int(11)
,`purpose` varchar(50)
,`area` tinyint(4)
,`fitment` tinyint(4)
,`propertyType` tinyint(1)
,`buyNum` int(11)
,`fitment1` varchar(20)
,`propertyNotes` varchar(1000)
,`id` int(10) unsigned
,`userId` int(10) unsigned
,`userName` varchar(50)
,`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`agentTel` varchar(20)
,`tel` char(32)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`changeClient` tinyint(1)
,`status` tinyint(4)
,`belongPid` int(6) unsigned
,`changeAt` int(6) unsigned
,`agentId` int(6) unsigned
,`isAnchang` smallint(4) unsigned
,`jobType` tinyint(1)
,`visitHouseAt` int(6) unsigned
,`isBargain` tinyint(1)
,`roleId` int(4)
,`clientType` tinyint(1) unsigned
,`arrangeRoleId` int(4)
,`agentUserId` int(11) unsigned
,`agentRoleId` int(4)
,`agentName` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_summary`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_summary` (
`id` int(11)
,`clientId` int(11)
,`days` tinyint(4)
,`receptTim` int(11)
,`seeStatus` tinyint(4)
,`arrangeRoleId` int(4)
,`roleId` int(4)
,`belongPid` int(6) unsigned
,`arrangeUser` varchar(50)
,`arrangeId` int(6) unsigned
,`belongUser` varchar(50)
,`belongUserId` int(6) unsigned
,`city` int(4) unsigned
,`province` int(4) unsigned
,`clientName` varchar(50)
,`status` tinyint(1)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_summary_deal`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_summary_deal` (
`clientPoint` varchar(1000)
,`buyCity` varchar(100)
,`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`roomType` varchar(100)
,`createdBy` varchar(20)
,`updatedAt` int(11)
,`createdAt` int(11)
,`purpose` varchar(50)
,`fitment` tinyint(4)
,`propertyType` tinyint(1)
,`buyNum` int(11)
,`fitment1` varchar(20)
,`propertyNotes` varchar(1000)
,`id` int(10) unsigned
,`userId` int(10) unsigned
,`userName` varchar(50)
,`clientName` varchar(50)
,`sex` tinyint(1)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`agentName` varchar(50)
,`agentTel` varchar(20)
,`tel` char(32)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`changeClient` tinyint(1)
,`status` tinyint(4)
,`belongPid` int(6) unsigned
,`changeAt` int(6) unsigned
,`agentId` int(6) unsigned
,`isAnchang` smallint(4) unsigned
,`jobType` tinyint(1)
,`visitHouseAt` int(6) unsigned
,`isBargain` tinyint(1)
,`roleId` int(4)
,`clientType` tinyint(1) unsigned
,`arrangeRoleId` int(4)
,`title` varchar(50)
,`houseNo` varchar(20)
,`dealId` int(11) unsigned
,`earnestDate` date
,`total` int(11)
,`eachPrice` float(20,0)
,`area` varchar(10)
,`signDate` varchar(20)
,`payWay` tinyint(1)
,`dealNotes` varchar(500)
,`results` mediumint(8) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_visit`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_visit` (
`id` int(11) unsigned
,`clientId` int(10) unsigned
,`visitId` int(6) unsigned
,`visitName` varchar(50)
,`way` tinyint(4)
,`clientLevel` tinyint(4)
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6) unsigned
,`status` tinyint(4)
,`type` tinyint(1)
,`updatedBy` varchar(20)
,`updatedAt` int(6) unsigned
,`createdBy` varchar(20)
,`createdAt` int(6) unsigned
,`serviceWay` tinyint(1) unsigned
,`belongUserId` int(6) unsigned
,`userName` varchar(50)
,`clientName` varchar(50)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`agentName` varchar(50)
,`agentTel` varchar(20)
,`askDate` int(6) unsigned
,`belongUser` varchar(50)
,`agentId` int(6) unsigned
,`isBargain` tinyint(1)
,`visitNum` int(4)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_visit2`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_visit2` (
`id` int(11) unsigned
,`clientId` int(10) unsigned
,`visitId` int(6) unsigned
,`visitName` varchar(50)
,`way` tinyint(4)
,`serviceWay` tinyint(1) unsigned
,`clientLevel` tinyint(4)
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6) unsigned
,`status` tinyint(4)
,`updatedBy` varchar(20)
,`updatedAt` int(6) unsigned
,`createdBy` varchar(20)
,`createdAt` int(6) unsigned
,`visitHouseAt` int(6) unsigned
,`type` tinyint(1)
,`isNeedArrange` tinyint(1)
,`arrangeId` int(6) unsigned
,`clientName` varchar(50)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`clientType` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_client_visit_agent`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_client_visit_agent` (
`id` int(11) unsigned
,`clientId` int(10) unsigned
,`visitId` int(6) unsigned
,`visitName` varchar(50)
,`way` tinyint(4)
,`clientLevel` tinyint(4)
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6) unsigned
,`status` tinyint(4)
,`type` tinyint(1)
,`updatedBy` varchar(20)
,`updatedAt` int(6) unsigned
,`createdBy` varchar(20)
,`createdAt` int(6) unsigned
,`userId` int(10) unsigned
,`clientName` varchar(50)
,`province` int(4) unsigned
,`city` int(4) unsigned
,`askDate` int(6) unsigned
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`arrangeUser` varchar(50)
,`arrangeId` int(6) unsigned
,`belongPid` int(6) unsigned
,`roleId` int(4)
,`clientType` tinyint(1) unsigned
,`arrangeRoleId` int(4)
,`agentName` varchar(50)
,`agentUserId` int(11) unsigned
,`agentRoleId` int(4)
,`visitRoleId` int(4)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_property`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_property` (
`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`roomType` varchar(100)
,`createdBy` varchar(20)
,`clientPoint` varchar(1000)
,`updatedAt` int(11)
,`createdAt` int(11)
,`purpose` varchar(50)
,`area` tinyint(4)
,`fitment` tinyint(4)
,`propertyType` tinyint(1)
,`buyNum` int(11)
,`fitment1` varchar(20)
,`propertyNotes` varchar(1000)
,`clientName` varchar(50)
,`buyCity` varchar(100)
,`clientFrom` tinyint(4)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`lastVisitDate` int(6) unsigned
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`fitmentId` int(6) unsigned
,`isBargain` tinyint(1)
,`isguanjia` tinyint(1) unsigned
,`agentId` int(6) unsigned
,`id` int(11)
,`clientId` int(11)
,`userId` int(11)
,`userName` varchar(50)
,`province` int(11)
,`city` int(11)
,`tel` varchar(50)
,`area1` varchar(20)
,`updatedBy` varchar(20)
,`status` tinyint(1)
,`address` varchar(100)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`askDate` int(6) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_property_client`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_property_client` (
`clientName` varchar(50)
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`email` varchar(50)
,`QQ` varchar(20)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`changeClient` tinyint(1)
,`purpose` varchar(50)
,`buyCity` varchar(100)
,`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`area` tinyint(4)
,`area1` varchar(20)
,`fitment` tinyint(4)
,`fitment1` varchar(20)
,`roomType` varchar(100)
,`buyNum` int(11)
,`clientPoint` varchar(1000)
,`updatedAt` int(11)
,`updatedBy` varchar(20)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`propertyNotes` varchar(1000)
,`propertyType` tinyint(1)
,`clientId` int(11)
,`id` int(11)
,`province` int(11)
,`city` int(11)
,`userName` varchar(50)
,`userId` int(11)
,`status` tinyint(1)
,`tel` varchar(50)
,`belongUserId` int(11)
,`belongUser` varchar(50)
,`pId` int(6) unsigned
,`roleId` int(4)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`clientType` tinyint(1) unsigned
,`clientCreateAt` int(6) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_property_client_agent`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_property_client_agent` (
`purpose` varchar(50)
,`buyCity` varchar(100)
,`preference` varchar(100)
,`unitPrice` tinyint(4)
,`unitPrice1` varchar(20)
,`totalPrice` tinyint(4)
,`totalPrice1` varchar(20)
,`area` tinyint(4)
,`area1` varchar(20)
,`fitment` tinyint(4)
,`fitment1` varchar(20)
,`roomType` varchar(100)
,`buyNum` int(11)
,`clientPoint` varchar(1000)
,`updatedAt` int(11)
,`updatedBy` varchar(20)
,`createdBy` varchar(20)
,`createdAt` int(11)
,`propertyNotes` varchar(1000)
,`propertyType` tinyint(1)
,`clientId` int(11)
,`id` int(11)
,`province` int(11)
,`city` int(11)
,`userName` varchar(50)
,`userId` int(11)
,`status` tinyint(1)
,`tel` varchar(50)
,`clientName` varchar(50)
,`address` varchar(100)
,`clientFrom` tinyint(4)
,`phone` varchar(50)
,`otherName` varchar(20)
,`otherPhone` varchar(50)
,`QQ` varchar(20)
,`email` varchar(50)
,`requireType` tinyint(4)
,`askType` tinyint(4)
,`askDate` int(6) unsigned
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6)
,`clientLevel` tinyint(4)
,`serviceStatus` tinyint(6)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
,`firstUserId` int(4) unsigned
,`firstUser` varchar(50)
,`arrangeId` int(6) unsigned
,`arrangeUser` varchar(50)
,`changeClient` tinyint(1)
,`arrangeRoleId` int(4)
,`clientType` tinyint(1) unsigned
,`roleId` int(4)
,`agentRoleId` int(4)
,`agentUserId` int(11) unsigned
,`agentName` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_remoney_dealscale`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_remoney_dealscale` (
`dealId` int(6) unsigned
,`money` int(6) unsigned
,`id` int(6) unsigned
,`backAt` int(10) unsigned
,`clientId` int(6) unsigned
,`type` tinyint(1) unsigned
,`belongId` int(6) unsigned
,`belongName` varchar(50)
,`departmentId` mediumint(4) unsigned
,`performance` float(10,2) unsigned
,`payment` float(10,2) unsigned
,`earnestDate` date
,`parentDepartUser` varchar(255)
,`scale` float(6,2) unsigned
,`reType` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_usercar_role`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_usercar_role` (
`id` int(11)
,`driverId` mediumint(8) unsigned
,`driverName` varchar(50)
,`userId` mediumint(8) unsigned
,`userName` varchar(50)
,`manNum` tinyint(1) unsigned
,`clientId` mediumint(11) unsigned
,`getArrangeId` mediumint(11) unsigned
,`carId` mediumint(8) unsigned
,`carNum` varchar(20)
,`city` smallint(5) unsigned
,`aimType` tinyint(1) unsigned
,`area` varchar(1000)
,`outAt` int(11) unsigned
,`trueOutAt` int(10) unsigned
,`overAt` int(10) unsigned
,`howAt` int(10)
,`orderAt` int(10) unsigned
,`orderBuliding` varchar(255)
,`signAt` int(10) unsigned
,`startKm` float(10,2)
,`endKm` float(10,2)
,`howFar` varchar(30)
,`otherCost` smallint(6) unsigned
,`totalCost` smallint(6) unsigned
,`remarks` varchar(255)
,`createdAt` int(11)
,`createdBy` varchar(20)
,`updatedAt` int(10) unsigned
,`updatedBy` varchar(50)
,`status` tinyint(1)
,`userId2` mediumint(8) unsigned
,`userName2` varchar(50)
,`clientName` varchar(50)
,`belongUserId` int(6) unsigned
,`belongUser` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vfenxiao_visit`
--
CREATE TABLE IF NOT EXISTS `wf_vfenxiao_visit` (
`id` int(11) unsigned
,`clientId` int(10) unsigned
,`visitId` int(6) unsigned
,`visitName` varchar(50)
,`way` tinyint(4)
,`clientLevel` tinyint(4)
,`lastVisitDate` int(6) unsigned
,`nextVisitDate` int(6) unsigned
,`status` tinyint(4)
,`type` tinyint(1)
,`updatedBy` varchar(20)
,`updatedAt` int(6) unsigned
,`createdBy` varchar(20)
,`createdAt` int(6) unsigned
,`serviceWay` tinyint(1) unsigned
,`visitRoleId` int(4)
,`clientType` tinyint(1) unsigned
,`isAnchang` smallint(4) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vinteract_user`
--
CREATE TABLE IF NOT EXISTS `wf_vinteract_user` (
`id` int(11) unsigned
,`userId` int(11)
,`userName` varchar(20)
,`clientId` int(11) unsigned
,`tel` char(32)
,`email` varchar(128)
,`trueName` varchar(30)
,`sex` tinyint(1)
,`belongUserId` int(11)
,`belongUserName` varchar(30)
,`tuanNum` int(11)
,`concernNum` int(11)
,`youhuiNum` int(11)
,`dynamicNum` int(11)
,`optionalNum` int(11)
,`smsNum` int(11)
,`notes` varchar(1000)
,`belongPid` int(11)
,`updateAt` int(11)
,`updateBy` varchar(30)
,`status` tinyint(1)
,`roleId` int(4)
,`comeFrom` tinyint(1) unsigned
,`fromWeb` tinyint(1)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vinteract_user_record`
--
CREATE TABLE IF NOT EXISTS `wf_vinteract_user_record` (
`id` int(11)
,`userId` int(11)
,`interactId` int(11)
,`type` tinyint(1)
,`sendType` tinyint(1)
,`buildingId` int(11)
,`buildingName` varchar(50)
,`interctAt` int(11)
,`trueName` varchar(50)
,`sex` tinyint(1)
,`email` varchar(100)
,`tel` varchar(50)
,`ip` varchar(30)
,`notes` varchar(255)
,`status` tinyint(1)
,`updateAt` int(11)
,`updateBy` varchar(30)
,`clientId` int(11) unsigned
,`belongUserId` int(11)
,`bcity` int(6) unsigned
,`bcounty` int(6) unsigned
,`notes2` varchar(1000)
,`sellerName` varchar(50)
,`sellerTel` varchar(20)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_vote`
--

CREATE TABLE IF NOT EXISTS `wf_vote` (
  `id` mediumint(8) unsigned NOT NULL,
  `openId` char(64) NOT NULL,
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `tel` varchar(34) NOT NULL DEFAULT '' COMMENT '手机号码',
  `text` varchar(300) NOT NULL DEFAULT '' COMMENT '宣言',
  `pic` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `score` mediumint(8) unsigned NOT NULL COMMENT '0',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_vote_follow`
--

CREATE TABLE IF NOT EXISTS `wf_vote_follow` (
  `id` mediumint(8) unsigned NOT NULL,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '推广上级Id',
  `openId` varchar(64) NOT NULL DEFAULT '' COMMENT '微信openid',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `province` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `country` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '区域',
  `headimgurl` varchar(200) NOT NULL DEFAULT '' COMMENT '用户头像',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_vote_score`
--

CREATE TABLE IF NOT EXISTS `wf_vote_score` (
  `id` mediumint(8) unsigned NOT NULL,
  `voteId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父Id',
  `openId` char(64) NOT NULL DEFAULT '' COMMENT '微信唯一id',
  `openName` varchar(30) NOT NULL,
  `createdAt` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vremind_user`
--
CREATE TABLE IF NOT EXISTS `wf_vremind_user` (
`userId` int(11)
,`isLook` tinyint(1)
,`depart` tinyint(2)
,`type` tinyint(2)
,`createdAt` int(11)
,`createdId` int(11)
,`url` varchar(100)
,`content` varchar(255)
,`reminder` varchar(255)
,`createdBy` varchar(20)
,`timingAt` int(11)
,`status` tinyint(1)
,`userStatus` tinyint(1)
,`remindId` int(11)
,`id` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vrole`
--
CREATE TABLE IF NOT EXISTS `wf_vrole` (
`userId` int(10) unsigned
,`roleId` int(4)
,`pId` int(6) unsigned
,`trueName` varchar(50)
,`isAnchang` smallint(4) unsigned
,`clientType` tinyint(1) unsigned
,`departmentId` int(4) unsigned
,`departmentName` varchar(30)
,`status` tinyint(1)
,`departOrders` smallint(5) unsigned
,`roleArea` varchar(255)
,`departPid` int(4) unsigned
,`level` tinyint(1) unsigned
,`roleCate` tinyint(1) unsigned
,`departStatus` tinyint(1) unsigned
,`leaveAt` int(10) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsoap_detail`
--
CREATE TABLE IF NOT EXISTS `wf_vsoap_detail` (
`id` int(11)
,`startid` int(10) unsigned
,`belongId` int(6) unsigned
,`userNmae` varchar(50)
,`roleId` int(11)
,`rolePid` int(11)
,`belongUser` varchar(30)
,`extCode` mediumint(8) unsigned
,`buildingName` varchar(50)
,`buildingId` int(11)
,`callResult` varchar(30)
,`ani` varchar(30)
,`dni` varchar(30)
,`startDate` int(11)
,`leng` int(11)
,`callCount` int(11)
,`bigcode` char(10)
,`custid` int(6) unsigned
,`userId` int(6) unsigned
,`notes` varchar(1000)
,`noteDate` int(10) unsigned
,`noteBy` char(20)
,`city` int(6) unsigned
,`county` int(6) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_arranges`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_arranges` (
`id` int(10) unsigned
,`type` tinyint(1) unsigned
,`houseId` int(10) unsigned
,`ownerName` varchar(20)
,`clientId` int(10) unsigned
,`clientName` varchar(20)
,`isvalid` tinyint(1)
,`entrustDate` datetime
,`remarks` varchar(1000)
,`status` tinyint(1) unsigned
,`belongId` int(4) unsigned
,`belongName` varchar(20)
,`createdAt` int(10) unsigned
,`createdId` int(6) unsigned
,`createdBy` varchar(50)
,`updatedAt` int(10) unsigned
,`updatedBy` varchar(50)
,`departmentId` int(4) unsigned
,`departmentName` varchar(30)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_client`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_client` (
`id` int(10) unsigned
,`clientCate` tinyint(1) unsigned
,`cprovince` int(6) unsigned
,`ccity` int(6) unsigned
,`city` varchar(30)
,`county` varchar(30)
,`address` varchar(255)
,`fenxiaoId` int(6) unsigned
,`room1` tinyint(1) unsigned
,`room2` tinyint(1) unsigned
,`hall1` tinyint(1) unsigned
,`hall2` tinyint(1)
,`kitchen` tinyint(1) unsigned
,`toilet` tinyint(1) unsigned
,`veranda` tinyint(1) unsigned
,`type` varchar(30)
,`years` int(4) unsigned
,`fitment` varchar(30)
,`face` varchar(30)
,`area1` int(4) unsigned
,`area2` int(4) unsigned
,`floors1` int(2) unsigned
,`floors2` int(2) unsigned
,`price1` float unsigned
,`price2` float unsigned
,`priceunit` tinyint(1) unsigned
,`payway` tinyint(1) unsigned
,`servantway` tinyint(1) unsigned
,`agreement` tinyint(1) unsigned
,`infoFrom` tinyint(1) unsigned
,`entrustDate` char(10)
,`remarks` varchar(500)
,`clientName` varchar(20)
,`salestatus` tinyint(1) unsigned
,`clientType` tinyint(1) unsigned
,`clientLevel` tinyint(1) unsigned
,`tel` char(32)
,`phone` varchar(50)
,`contactAddress` varchar(50)
,`belongName` varchar(20)
,`isprivate` tinyint(1) unsigned
,`endprivate` int(6) unsigned
,`status` tinyint(1) unsigned
,`createdAt` int(6) unsigned
,`createdId` int(6) unsigned
,`createdBy` varchar(50)
,`updatedAt` int(6) unsigned
,`updatedBy` varchar(50)
,`changeAt` int(6) unsigned
,`belongId` int(4) unsigned
,`departmentId` int(4) unsigned
,`departmentName` varchar(30)
,`departOrders` smallint(5) unsigned
,`roleArea` varchar(255)
,`requireType` tinyint(1) unsigned
,`visitDate` int(6) unsigned
,`isprivateStatus` tinyint(1) unsigned
,`privateAt` int(10) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_client_collect`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_client_collect` (
`collectId` int(6) unsigned
,`collectAt` int(6) unsigned
,`collectType` tinyint(1) unsigned
,`id` int(10) unsigned
,`clientCate` tinyint(1) unsigned
,`cprovince` int(6) unsigned
,`ccity` int(6) unsigned
,`city` varchar(30)
,`county` varchar(30)
,`address` varchar(255)
,`fenxiaoId` int(6) unsigned
,`room1` tinyint(1) unsigned
,`room2` tinyint(1) unsigned
,`hall1` tinyint(1) unsigned
,`hall2` tinyint(1)
,`kitchen` tinyint(1) unsigned
,`toilet` tinyint(1) unsigned
,`veranda` tinyint(1) unsigned
,`type` varchar(30)
,`years` int(4) unsigned
,`fitment` varchar(30)
,`face` varchar(30)
,`area1` int(4) unsigned
,`area2` int(4) unsigned
,`floors1` int(2) unsigned
,`floors2` int(2) unsigned
,`price1` float unsigned
,`price2` float unsigned
,`priceunit` tinyint(1) unsigned
,`payway` tinyint(1) unsigned
,`servantway` tinyint(1) unsigned
,`agreement` tinyint(1) unsigned
,`infoFrom` tinyint(1) unsigned
,`entrustDate` char(10)
,`remarks` varchar(500)
,`clientName` varchar(20)
,`salestatus` tinyint(1) unsigned
,`clientType` tinyint(1) unsigned
,`clientLevel` tinyint(1) unsigned
,`tel` char(32)
,`phone` varchar(50)
,`contactAddress` varchar(50)
,`belongName` varchar(20)
,`isprivate` tinyint(1) unsigned
,`endprivate` int(6) unsigned
,`status` tinyint(1) unsigned
,`createdAt` int(6) unsigned
,`createdId` int(6) unsigned
,`createdBy` varchar(50)
,`updatedAt` int(6) unsigned
,`updatedBy` varchar(50)
,`changeAt` int(6) unsigned
,`belongId` int(4) unsigned
,`departmentId` int(4) unsigned
,`departmentName` varchar(30)
,`departOrders` smallint(5) unsigned
,`roleArea` varchar(255)
,`visitDate` int(6) unsigned
,`isprivateStatus` tinyint(1) unsigned
,`privateAt` int(10) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_hire`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_hire` (
`city` int(4) unsigned
,`county` int(4) unsigned
,`address` varchar(200)
,`type` tinyint(1)
,`room` tinyint(1)
,`hall` tinyint(1)
,`kitchen` tinyint(1)
,`toilet` tinyint(1)
,`veranda` tinyint(1)
,`icon` varchar(100)
,`area` float
,`onFloor` int(4) unsigned
,`floorsType` tinyint(1) unsigned
,`floors` int(4) unsigned
,`fitment` tinyint(1)
,`face` char(4)
,`supporting` varchar(255)
,`hireType` tinyint(1)
,`price` int(6) unsigned
,`pay` varchar(50)
,`tel` char(50)
,`updatedAt` int(11)
,`createdAt` int(11)
,`status` tinyint(1)
,`tower` varchar(30)
,`ownerName` varchar(20)
,`keyType` tinyint(1) unsigned
,`infoFrom` tinyint(1) unsigned
,`salestatus2` tinyint(1) unsigned
,`isprivate` tinyint(1) unsigned
,`belongId` int(6) unsigned
,`belongName` varchar(20)
,`id` int(11) unsigned
,`topic` varchar(100)
,`doorplate` varchar(30)
,`islock` mediumint(8) unsigned
,`endprivate` int(6) unsigned
,`ownerTel` char(11)
,`ownerPhone` varchar(20)
,`title` varchar(100)
,`changeAt` int(6) unsigned
,`createdId2` int(6) unsigned
,`departmentName` varchar(30)
,`departmentId` int(4) unsigned
,`roleArea` varchar(255)
,`businessArea` int(4) unsigned
,`keyInfo` varchar(50)
,`keyBelongId` smallint(5) unsigned
,`unit` varchar(30)
,`buildingId` int(10) unsigned
,`updatedBy` varchar(50)
,`istop` tinyint(1)
,`keyAt` int(10) unsigned
,`isHide` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_hire_collect`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_hire_collect` (
`collectId` int(6) unsigned
,`collectAt` int(6) unsigned
,`collectType` tinyint(1) unsigned
,`city` int(4) unsigned
,`county` int(4) unsigned
,`address` varchar(200)
,`type` tinyint(1)
,`room` tinyint(1)
,`hall` tinyint(1)
,`kitchen` tinyint(1)
,`toilet` tinyint(1)
,`veranda` tinyint(1)
,`icon` varchar(100)
,`area` float
,`onFloor` int(4) unsigned
,`floorsType` tinyint(1) unsigned
,`floors` int(4) unsigned
,`fitment` tinyint(1)
,`face` char(4)
,`supporting` varchar(255)
,`hireType` tinyint(1)
,`price` int(6) unsigned
,`pay` varchar(50)
,`tel` char(50)
,`updatedAt` int(11)
,`createdAt` int(11)
,`status` tinyint(1)
,`tower` varchar(30)
,`ownerName` varchar(20)
,`keyType` tinyint(1) unsigned
,`infoFrom` tinyint(1) unsigned
,`salestatus2` tinyint(1) unsigned
,`isprivate` tinyint(1) unsigned
,`belongId` int(6) unsigned
,`belongName` varchar(20)
,`id` int(11) unsigned
,`topic` varchar(100)
,`doorplate` varchar(30)
,`islock` mediumint(8) unsigned
,`endprivate` int(6) unsigned
,`ownerTel` char(11)
,`ownerPhone` varchar(20)
,`title` varchar(100)
,`changeAt` int(6) unsigned
,`createdId2` int(6) unsigned
,`departmentName` varchar(30)
,`departmentId` int(4) unsigned
,`roleArea` varchar(255)
,`businessArea` int(4) unsigned
,`keyInfo` varchar(50)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_house`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_house` (
`id` int(11) unsigned
,`tower` varchar(30)
,`belongName` varchar(20)
,`belongId` int(6) unsigned
,`keyType` tinyint(1) unsigned
,`infoFrom` tinyint(1) unsigned
,`salestatus2` tinyint(1) unsigned
,`isprivate` tinyint(1) unsigned
,`ownerName` varchar(20)
,`doorplate` varchar(30)
,`islock` mediumint(8) unsigned
,`endprivate` int(6) unsigned
,`ownerTel` char(11)
,`ownerPhone` varchar(20)
,`changeAt` int(6) unsigned
,`createdId2` int(6) unsigned
,`departmentName` varchar(30)
,`departmentId` int(4) unsigned
,`roleArea` varchar(255)
,`keyInfo` varchar(50)
,`unit` varchar(30)
,`keyBelongId` smallint(5) unsigned
,`keyAt` int(10) unsigned
,`saleId` int(11) unsigned
,`buildingId` int(10) unsigned
,`topic` varchar(100)
,`city` int(6) unsigned
,`county` int(6) unsigned
,`businessArea` int(6) unsigned
,`type` tinyint(1) unsigned
,`room` tinyint(1) unsigned
,`hall` tinyint(1) unsigned
,`icon` varchar(100)
,`area` int(4) unsigned
,`eachPrice` float(8,2)
,`price` float
,`onFloor` int(11)
,`face` char(4)
,`fitment` tinyint(1)
,`tel` char(30)
,`istop` tinyint(1)
,`updatedAt` int(6)
,`createdAt` int(6)
,`status` tinyint(1) unsigned
,`isHide` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_house_collect`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_house_collect` (
`collectId` int(6) unsigned
,`collectAt` int(6) unsigned
,`collectType` tinyint(1) unsigned
,`id` int(11) unsigned
,`saleId` int(11) unsigned
,`tower` varchar(30)
,`unit` varchar(30)
,`doorplate` varchar(30)
,`propertyFee` varchar(30)
,`ownerName` varchar(20)
,`ownerID` char(18)
,`ownerTel` char(11)
,`ownerPhone` varchar(20)
,`agreement` tinyint(1) unsigned
,`trustType` tinyint(1) unsigned
,`keyType` tinyint(1) unsigned
,`keyInfo` varchar(50)
,`keyBelongId` smallint(5) unsigned
,`infoFrom` tinyint(1) unsigned
,`salestatus2` tinyint(1) unsigned
,`entrustDate` char(10)
,`isprivate` tinyint(1) unsigned
,`endprivate` int(6) unsigned
,`islock` mediumint(8) unsigned
,`lockAt` int(10) unsigned
,`belongId` int(6) unsigned
,`belongName` varchar(20)
,`changeAt` int(6) unsigned
,`createdId2` int(6) unsigned
,`uniqueId` int(6) unsigned
,`buildingId` int(10) unsigned
,`topic` varchar(100)
,`city` int(6) unsigned
,`county` int(6) unsigned
,`businessArea` int(6) unsigned
,`type` tinyint(1) unsigned
,`room` tinyint(1) unsigned
,`hall` tinyint(1) unsigned
,`icon` varchar(100)
,`area` int(4) unsigned
,`eachPrice` float(8,2)
,`price` float
,`onFloor` int(11)
,`floors` int(11)
,`face` char(4)
,`fitment` tinyint(1)
,`tel` char(30)
,`istop` tinyint(1)
,`updatedAt` int(6)
,`updatedBy` varchar(20)
,`createdBy` varchar(20)
,`createdAt` int(6)
,`status` tinyint(1) unsigned
,`departmentId` int(4) unsigned
,`departmentName` varchar(30)
,`roleArea` varchar(255)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vsuite_visits`
--
CREATE TABLE IF NOT EXISTS `wf_vsuite_visits` (
`id` int(10) unsigned
,`currentId` int(10) unsigned
,`type` tinyint(1) unsigned
,`way` tinyint(1) unsigned
,`visitDate` date
,`remarks` varchar(1000)
,`entrustDate` char(10)
,`entrustName` varchar(20)
,`status` tinyint(1) unsigned
,`belongId` int(4) unsigned
,`belongName` varchar(20)
,`createdAt` int(6) unsigned
,`createdId` int(6) unsigned
,`createdBy` varchar(50)
,`updatedAt` int(6) unsigned
,`updatedBy` varchar(50)
,`departmentId` int(4) unsigned
,`departmentName` varchar(30)
,`cate` tinyint(1) unsigned
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vtour_order_way`
--
CREATE TABLE IF NOT EXISTS `wf_vtour_order_way` (
`id` int(11)
,`name` varchar(30)
,`sex` tinyint(1)
,`province` int(11)
,`city` int(11)
,`tel` char(11)
,`wayId` int(11)
,`message` text
,`orderAt1` int(11)
,`orderAt2` int(11)
,`visitStatus` tinyint(1)
,`status` tinyint(1)
,`createdAt` int(11)
,`visitAt` int(11)
,`updatedAt` int(11)
,`isAdd` tinyint(11)
,`belongUserId` int(11)
,`belongUser` varchar(50)
,`belongPid` int(11)
,`notes` varchar(10000)
,`title` varchar(100)
,`roleId` int(4)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `wf_vweixin_user_dujia`
--
CREATE TABLE IF NOT EXISTS `wf_vweixin_user_dujia` (
`id` mediumint(8) unsigned
,`pid` mediumint(8) unsigned
,`openid` varchar(64)
,`nickname` varchar(100)
,`sex` tinyint(1) unsigned
,`province` smallint(6) unsigned
,`city` smallint(6) unsigned
,`country` smallint(6) unsigned
,`headimgurl` varchar(200)
,`realname` varchar(30)
,`tel` varchar(20)
,`createdAt` int(10)
,`updatedAt` int(10)
,`lastLoginAt` int(10)
,`status` tinyint(1) unsigned
,`balance` varchar(20)
,`costTime` smallint(6)
);

-- --------------------------------------------------------

--
-- 表的结构 `wf_web_site`
--

CREATE TABLE IF NOT EXISTS `wf_web_site` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `province` int(11) NOT NULL DEFAULT '0',
  `city` int(11) NOT NULL DEFAULT '0',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `urls` varchar(1000) NOT NULL DEFAULT '',
  `notes` mediumtext NOT NULL,
  `updatedBy` varchar(20) NOT NULL DEFAULT '',
  `updatedAt` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(20) NOT NULL DEFAULT '',
  `createdAt` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weibo_base`
--

CREATE TABLE IF NOT EXISTS `wf_weibo_base` (
  `id` int(11) NOT NULL,
  `authId` int(11) NOT NULL,
  `sinaId` float(100,0) NOT NULL,
  `qqId` varchar(100) NOT NULL,
  `weiboName` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `pId` int(11) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `createAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weibo_user`
--

CREATE TABLE IF NOT EXISTS `wf_weibo_user` (
  `id` int(11) NOT NULL,
  `authId` int(11) NOT NULL,
  `weiboId` varchar(100) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `oauth_token_keys` varchar(250) NOT NULL,
  `oauth_token_secret_keys` varchar(250) NOT NULL,
  `oauth_verifier` varchar(250) NOT NULL,
  `oauth_token_last_keys` varchar(250) NOT NULL,
  `oauth_token_secret_last_keys` varchar(250) NOT NULL,
  `createAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weishop`
--

CREATE TABLE IF NOT EXISTS `wf_weishop` (
  `roleUserId` mediumint(8) unsigned NOT NULL,
  `wxTicket` varchar(200) NOT NULL DEFAULT '',
  `wxUrl` varchar(100) NOT NULL DEFAULT '',
  `wxPic` varchar(200) NOT NULL DEFAULT '',
  `createdAt` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '5',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `showCityId` char(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weishop_follow`
--

CREATE TABLE IF NOT EXISTS `wf_weishop_follow` (
  `id` mediumint(8) unsigned NOT NULL,
  `userId` mediumint(8) unsigned NOT NULL,
  `wxOpenId` char(64) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weishop_ip`
--

CREATE TABLE IF NOT EXISTS `wf_weishop_ip` (
  `id` mediumint(8) unsigned NOT NULL,
  `userId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip2long` int(10) NOT NULL DEFAULT '0',
  `createdAt` int(10) NOT NULL,
  `date` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weishop_remark`
--

CREATE TABLE IF NOT EXISTS `wf_weishop_remark` (
  `id` mediumint(8) unsigned NOT NULL,
  `userId` mediumint(8) unsigned NOT NULL,
  `scoreManner` decimal(2,1) unsigned NOT NULL,
  `scoreSpeed` decimal(2,1) unsigned NOT NULL,
  `scoreDuce` decimal(2,1) unsigned NOT NULL,
  `tel` varchar(20) NOT NULL DEFAULT '',
  `content` varchar(500) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `iplong` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weishop_title`
--

CREATE TABLE IF NOT EXISTS `wf_weishop_title` (
  `id` mediumint(8) unsigned NOT NULL,
  `userId` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `tuiId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:主推楼盘，2：精品楼盘，3：精品二手房，4：精品租房，5：新闻',
  `title` varchar(200) NOT NULL DEFAULT '',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weishop_tui`
--

CREATE TABLE IF NOT EXISTS `wf_weishop_tui` (
  `id` mediumint(8) unsigned NOT NULL,
  `userId` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `tuiId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:主推楼盘，2：精品楼盘，3：精品二手房，4：精品租房，5：新闻',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weixin`
--

CREATE TABLE IF NOT EXISTS `wf_weixin` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `wechat` varchar(50) NOT NULL DEFAULT '',
  `publicId` varchar(50) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `secret` varchar(50) NOT NULL DEFAULT '',
  `appid` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `menus` mediumtext NOT NULL,
  `accessToken` varchar(255) NOT NULL DEFAULT '',
  `accessTim` int(6) NOT NULL DEFAULT '0',
  `jsapiTicket` varchar(255) NOT NULL DEFAULT '' COMMENT '微信js临时票据',
  `ticketTim` int(10) NOT NULL DEFAULT '0' COMMENT '7200秒过期',
  `ismenu` tinyint(1) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_weixin_user`
--

CREATE TABLE IF NOT EXISTS `wf_weixin_user` (
  `id` mediumint(8) unsigned NOT NULL,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '推广上级Id',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT '微信openid',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `province` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `country` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '区域',
  `headimgurl` varchar(200) NOT NULL DEFAULT '' COMMENT '用户头像',
  `realname` varchar(30) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `createdAt` int(10) NOT NULL DEFAULT '0',
  `updatedAt` int(10) NOT NULL DEFAULT '0',
  `lastLoginAt` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_xwb_bind_info`
--

CREATE TABLE IF NOT EXISTS `wf_xwb_bind_info` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sina_uid` bigint(20) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `tsecret` char(32) NOT NULL,
  `profile` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_xwb_bind_thread`
--

CREATE TABLE IF NOT EXISTS `wf_xwb_bind_thread` (
  `tid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mid` bigint(20) unsigned NOT NULL,
  `type` enum('article','blog','doing','share','thread') NOT NULL DEFAULT 'thread'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_xwb_session`
--

CREATE TABLE IF NOT EXISTS `wf_xwb_session` (
  `sessionid` char(32) NOT NULL DEFAULT '',
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wf_zhixiao_arrange`
--

CREATE TABLE IF NOT EXISTS `wf_zhixiao_arrange` (
  `id` int(10) unsigned NOT NULL,
  `buildingName` varchar(255) NOT NULL DEFAULT '',
  `clientId` int(10) unsigned NOT NULL DEFAULT '0',
  `clientName` tinytext NOT NULL,
  `entrustDate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出车时间',
  `remarks` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `seeDate` int(11) NOT NULL,
  `arrangeUser` varchar(20) NOT NULL DEFAULT '',
  `arrangeId` int(4) unsigned NOT NULL DEFAULT '0',
  `createdAt` int(10) unsigned NOT NULL DEFAULT '0',
  `createdBy` varchar(50) NOT NULL DEFAULT '',
  `updatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `billDate` int(11) NOT NULL,
  `updatedBy` varchar(50) NOT NULL DEFAULT '',
  `seeStatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '派车用途'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 视图结构 `wf_access_node`
--
DROP TABLE IF EXISTS `wf_access_node`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_access_node` AS select `wf_role_nav`.`name` AS `name`,`wf_access`.`roleId` AS `roleId`,`wf_access`.`nodeId` AS `nodeId`,`wf_role_node`.`title` AS `title`,`wf_role_node`.`name` AS `nodeName`,`wf_role_node`.`roleNavId` AS `roleNavId`,`wf_role_nav`.`status` AS `status`,`wf_role_node`.`status` AS `nodeStatus`,`wf_role_node`.`pId` AS `nodepId`,`wf_role_nav`.`pId` AS `pId`,`wf_role_node`.`sort` AS `nodeSort`,`wf_role_nav`.`sort` AS `sort`,`wf_role_node`.`isMenu` AS `isMenu`,`wf_role_node`.`id` AS `roleNodeId`,`wf_role_nav`.`id` AS `id` from ((`wf_role_nav` join `wf_role_node` on((`wf_role_node`.`roleNavId` = `wf_role_nav`.`id`))) join `wf_access` on((`wf_role_node`.`id` = `wf_access`.`nodeId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_app_next_role`
--
DROP TABLE IF EXISTS `wf_app_next_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_app_next_role` AS select `wf_app_role_node`.`name` AS `name`,`wf_app_role_node`.`title` AS `title`,`wf_app_role_node`.`pId` AS `pId`,`wf_app_role_node`.`roleNavId` AS `roleNavId`,`wf_app_role_node`.`status` AS `status`,`wf_app_role_node`.`sort` AS `sort`,`wf_app_role_node`.`id` AS `id`,`wf_app_access`.`roleId` AS `roleId`,`wf_app_role_nav`.`status` AS `navStatus`,`wf_app_role_nav`.`sort` AS `navSort`,`wf_app_role_nav`.`name` AS `navName` from ((`wf_app_role_node` join `wf_app_role_nav` on((`wf_app_role_nav`.`id` = `wf_app_role_node`.`roleNavId`))) join `wf_app_access` on((`wf_app_role_node`.`id` = `wf_app_access`.`nodeId`))) where (`wf_app_role_nav`.`status` = '5');

-- --------------------------------------------------------

--
-- 视图结构 `wf_base_prebuilding`
--
DROP TABLE IF EXISTS `wf_base_prebuilding`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_base_prebuilding` AS select `wf_fenxiao_prebuilding`.`buildingId` AS `buildingId`,`wf_fenxiao_prebuilding`.`title` AS `title`,`wf_fenxiao_prebuilding`.`clientId` AS `clientId`,`wf_fenxiao_prebuilding`.`contact` AS `contact`,`wf_fenxiao_prebuilding`.`tel` AS `tel`,`wf_fenxiao_prebuilding`.`seeStatus` AS `seeStatus`,`wf_fenxiao_prebuilding`.`seeDate` AS `seeDate`,`wf_fenxiao_prebuilding`.`content` AS `content`,`wf_fenxiao_prebuilding`.`updatedBy` AS `updatedBy`,`wf_fenxiao_prebuilding`.`updatedAt` AS `updatedAt`,`wf_fenxiao_prebuilding`.`createdBy` AS `createdBy`,`wf_fenxiao_prebuilding`.`createdAt` AS `createdAt`,`wf_fenxiao_prebuilding`.`status` AS `status`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city` from (`wf_building_base` join `wf_fenxiao_prebuilding` on((`wf_fenxiao_prebuilding`.`buildingId` = `wf_building_base`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_bbs`
--
DROP TABLE IF EXISTS `wf_building_bbs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_bbs` AS select `wf_building_business`.`cooperateStatus` AS `cooperateStatus`,`wf_building_business`.`rebateType` AS `rebateType`,`wf_building_business`.`rebate` AS `rebate`,`wf_building_business`.`contractStart` AS `contractStart`,`wf_building_business`.`contractEnd` AS `contractEnd`,`wf_building_business`.`lastHouse` AS `lastHouse`,`wf_building_business`.`loanBank` AS `loanBank`,`wf_building_business`.`mortgageRatio` AS `mortgageRatio`,`wf_building_business`.`repayTime` AS `repayTime`,`wf_building_business`.`houseAge` AS `houseAge`,`wf_building_business`.`certificate` AS `certificate`,`wf_building_business`.`remark` AS `remark`,`wf_building_base`.`title` AS `title`,`wf_building_business`.`createdBy` AS `createdBy`,`wf_building_business`.`createdAt` AS `createdAt`,`wf_building_business`.`updatedBy` AS `updatedBy`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`county` AS `county`,`wf_building_sale`.`saleStatus` AS `saleStatus`,`wf_building_base`.`sellerId` AS `sellerId`,`wf_building_base`.`sellerName` AS `sellerName`,`wf_building_base`.`weightByname` AS `weightByname`,`wf_building_base`.`weightScore` AS `weightScore`,`wf_building_base`.`status` AS `buildingStatus`,`wf_building_base`.`id` AS `id`,`wf_building_business`.`buildingId` AS `businessBuildingId`,`wf_building_info`.`buildingArea` AS `buildingArea`,`wf_building_info`.`houseArea` AS `houseArea`,`wf_building_info`.`buildingType` AS `buildingType`,`wf_building_info`.`FAR` AS `FAR`,`wf_building_info`.`greeningRate` AS `greeningRate`,`wf_building_info`.`poolRate` AS `poolRate`,`wf_building_info`.`builders` AS `builders`,`wf_building_info`.`structure` AS `structure`,`wf_building_info`.`wall` AS `wall`,`wf_building_info`.`developer` AS `developer`,`wf_building_info`.`investor` AS `investor`,`wf_building_info`.`agent` AS `agent`,`wf_building_info`.`manager` AS `manager`,`wf_building_info`.`managerTel` AS `managerTel`,`wf_building_info`.`contacter` AS `contacter`,`wf_building_info`.`contacterTel` AS `contacterTel`,`wf_building_info`.`fax` AS `fax`,`wf_building_info`.`saleTel` AS `saleTel`,`wf_building_info`.`saleAddress` AS `saleAddress`,`wf_building_info`.`website` AS `website`,`wf_building_info`.`licence` AS `licence`,`wf_building_info`.`propertyName` AS `propertyName`,`wf_building_info`.`propertyFee` AS `propertyFee`,`wf_building_info`.`heatingWay` AS `heatingWay`,`wf_building_info`.`waterWay` AS `waterWay`,`wf_building_info`.`naturalgasWay` AS `naturalgasWay`,`wf_building_sale`.`priceAvg` AS `priceAvg`,`wf_building_sale`.`priceSum` AS `priceSum`,`wf_building_sale`.`priceSumType` AS `priceSumType`,`wf_building_sale`.`qiXian` AS `qiXian`,`wf_building_business`.`status` AS `status`,`wf_building_business`.`updatedAt` AS `updatedAt`,`wf_building_base`.`icon` AS `icon`,`wf_building_base`.`type` AS `type`,`wf_building_base`.`feature` AS `feature`,`wf_building_base`.`zone` AS `zone`,`wf_building_base`.`address` AS `address`,`wf_building_base`.`startTime` AS `startTime`,`wf_building_base`.`adTitle` AS `adTitle`,`wf_building_base`.`reason` AS `reason`,`wf_building_base`.`joinTime` AS `joinTime`,`wf_building_base`.`decoration` AS `decoration`,`wf_building_base`.`buildingNum` AS `buildingNum`,`wf_building_base`.`houseNum` AS `houseNum`,`wf_building_base`.`parkingNum` AS `parkingNum`,`wf_building_base`.`recommendRoom` AS `recommendRoom`,`wf_building_base`.`room` AS `room`,`wf_building_base`.`sellerTel` AS `sellerTel`,`wf_building_base`.`boundAt` AS `boundAt`,`wf_building_base`.`fieldScore` AS `fieldScore`,`wf_building_base`.`youhui` AS `youhui`,`wf_building_base`.`gift` AS `gift`,`wf_building_content`.`details` AS `details`,`wf_building_content`.`introduction` AS `introduction`,`wf_building_base`.`startByname` AS `startByname`,`wf_building_base`.`joinByname` AS `joinByname`,`wf_building_sale`.`layerPoor` AS `layerPoor`,`wf_building_sale`.`priceMin` AS `priceMin`,`wf_building_sale`.`priceMax` AS `priceMax`,`wf_building_business`.`seeNotes` AS `seeNotes`,`wf_building_business`.`rebateNote` AS `rebateNote`,`wf_building_business`.`yesNote` AS `yesNote`,`wf_building_business`.`contacters` AS `contacters`,`wf_building_base`.`patent` AS `patent`,`wf_building_business`.`reporters` AS `reporters`,`wf_building_business`.`clientNotes` AS `clientNotes`,`wf_building_business`.`commissionNote` AS `commissionNote`,`wf_building_business`.`payProgress` AS `payProgress`,`wf_building_business`.`integrity` AS `integrity`,`wf_building_business`.`breachContract` AS `breachContract`,`wf_building_business`.`cooperateType` AS `cooperateType`,`wf_building_business`.`firstParty` AS `firstParty`,`wf_building_business`.`mainReport` AS `mainReport`,`wf_building_base`.`sellerName2` AS `sellerName2`,`wf_building_base`.`sellerName3` AS `sellerName3`,`wf_building_base`.`sellerId2` AS `sellerId2`,`wf_building_base`.`sellerId3` AS `sellerId3`,`wf_building_business`.`prompt` AS `prompt` from ((((`wf_building_base` left join `wf_building_business` on((`wf_building_base`.`id` = `wf_building_business`.`buildingId`))) join `wf_building_sale` on((`wf_building_sale`.`buildingId` = `wf_building_base`.`id`))) join `wf_building_info` on((`wf_building_info`.`buildingId` = `wf_building_base`.`id`))) join `wf_building_content` on((`wf_building_content`.`buildingId` = `wf_building_base`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_br`
--
DROP TABLE IF EXISTS `wf_building_br`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_br` AS select `wf_building_room`.`id` AS `id`,`wf_building_room`.`buildingId` AS `buildingId`,`wf_building_room`.`name` AS `name`,`wf_building_room`.`room` AS `room`,`wf_building_room`.`office` AS `office`,`wf_building_room`.`bathroom` AS `bathroom`,`wf_building_room`.`kitchen` AS `kitchen`,`wf_building_room`.`balcony` AS `balcony`,`wf_building_room`.`isDouble` AS `isDouble`,`wf_building_room`.`image` AS `image`,`wf_building_room`.`buildArea` AS `buildArea`,`wf_building_room`.`useArea` AS `useArea`,`wf_building_room`.`areaSum` AS `areaSum`,`wf_building_room`.`introduction` AS `introduction`,`wf_building_room`.`weightByname` AS `weightByname`,`wf_building_room`.`weightScore` AS `weightScore`,`wf_building_room`.`updatedBy` AS `updatedBy`,`wf_building_room`.`updatedAt` AS `updatedAt`,`wf_building_room`.`createdBy` AS `createdBy`,`wf_building_room`.`createdAt` AS `createdAt`,`wf_building_room`.`status` AS `status`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`county` AS `county`,`wf_building_base`.`title` AS `title` from (`wf_building_base` join `wf_building_room` on((`wf_building_base`.`id` = `wf_building_room`.`buildingId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_bround`
--
DROP TABLE IF EXISTS `wf_building_bround`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_bround` AS select `wf_building_base`.`id` AS `id`,`wf_building_base`.`title` AS `title`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`sellerId` AS `sellerId`,`wf_building_base`.`sellerName` AS `sellerName`,`wf_building_base`.`sellerTel` AS `sellerTel`,`wf_building_business`.`cooperateStatus` AS `cooperateStatus`,`wf_building_business`.`rebateType` AS `rebateType`,`wf_building_business`.`rebate` AS `rebate`,`wf_building_business`.`contractStart` AS `contractStart`,`wf_building_business`.`contractEnd` AS `contractEnd`,`wf_building_base`.`boundAt` AS `boundAt`,`wf_building_base`.`status` AS `status`,`wf_building_base`.`county` AS `county`,`wf_vrole`.`roleId` AS `roleId`,`wf_building_sale`.`saleStatus` AS `saleStatus`,`wf_building_base`.`subcity` AS `subcity`,`wf_building_base`.`sellerName2` AS `sellerName2`,`wf_building_base`.`sellerId2` AS `sellerId2`,`wf_building_base`.`sellerId3` AS `sellerId3`,`wf_building_base`.`sellerName3` AS `sellerName3` from (((`wf_building_base` left join `wf_building_business` on((`wf_building_base`.`id` = `wf_building_business`.`buildingId`))) left join `wf_vrole` on((`wf_building_base`.`sellerId` = `wf_vrole`.`userId`))) left join `wf_building_sale` on((`wf_building_sale`.`buildingId` = `wf_building_base`.`id`))) where ((`wf_building_base`.`status` = 5) and (`wf_building_base`.`province` = 4));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_bsbi`
--
DROP TABLE IF EXISTS `wf_building_bsbi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_bsbi` AS select `wf_building_base`.`id` AS `id`,`wf_building_base`.`title` AS `title`,`wf_building_base`.`icon` AS `icon`,`wf_building_base`.`type` AS `type`,`wf_building_base`.`feature` AS `feature`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`address` AS `address`,`wf_building_base`.`status` AS `status`,`wf_building_base`.`weightByname` AS `weightByname`,`wf_building_sale`.`priceMax` AS `priceMax`,`wf_building_sale`.`priceMin` AS `priceMin`,`wf_building_sale`.`priceAvg` AS `priceAvg`,`wf_building_sale`.`saleStatus` AS `saleStatus`,`wf_building_business`.`cooperateStatus` AS `cooperateStatus`,`wf_building_base`.`weightScore` AS `weightScore`,`wf_building_installation`.`subway` AS `subway`,`wf_building_installation`.`bus` AS `bus`,`wf_building_installation`.`other` AS `other`,`wf_building_base`.`startTime` AS `startTime`,`wf_building_sale`.`youhuiDesc` AS `youhuiDesc`,`wf_building_base`.`titlePinyin` AS `titlePinyin`,`wf_building_base`.`sellerTel` AS `sellerTel`,`wf_building_base`.`startByname` AS `startByname` from (((`wf_building_base` left join `wf_building_sale` on((`wf_building_sale`.`buildingId` = `wf_building_base`.`id`))) left join `wf_building_business` on((`wf_building_business`.`buildingId` = `wf_building_base`.`id`))) left join `wf_building_installation` on((`wf_building_installation`.`buildingId` = `wf_building_base`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_bsi`
--
DROP TABLE IF EXISTS `wf_building_bsi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_bsi` AS select `wf_building_base`.`id` AS `id`,`wf_building_base`.`title` AS `title`,`wf_building_base`.`icon` AS `icon`,`wf_building_base`.`type` AS `type`,`wf_building_base`.`feature` AS `feature`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`county` AS `county`,`wf_building_base`.`zone` AS `zone`,`wf_building_base`.`address` AS `address`,`wf_building_base`.`startTime` AS `startTime`,`wf_building_base`.`adTitle` AS `adTitle`,`wf_building_base`.`joinTime` AS `joinTime`,`wf_building_base`.`decoration` AS `decoration`,`wf_building_base`.`buildingNum` AS `buildingNum`,`wf_building_base`.`houseNum` AS `houseNum`,`wf_building_base`.`parkingNum` AS `parkingNum`,`wf_building_base`.`weightByname` AS `weightByname`,`wf_building_base`.`weightScore` AS `weightScore`,`wf_building_base`.`status` AS `status`,`wf_building_sale`.`priceAvg` AS `priceAvg`,`wf_building_sale`.`priceMin` AS `priceMin`,`wf_building_sale`.`priceMax` AS `priceMax`,`wf_building_sale`.`priceSum` AS `priceSum`,`wf_building_sale`.`priceSumType` AS `priceSumType`,`wf_building_sale`.`qiXian` AS `qiXian`,`wf_building_info`.`areaMax` AS `areaMax`,`wf_building_info`.`areaMin` AS `areaMin`,`wf_building_info`.`greeningRate` AS `greeningRate`,`wf_building_info`.`FAR` AS `FAR`,`wf_building_info`.`buildingType` AS `buildingType`,`wf_building_info`.`wall` AS `wall`,`wf_building_info`.`structure` AS `structure`,`wf_building_info`.`builders` AS `builders`,`wf_building_info`.`investor` AS `investor`,`wf_building_info`.`developer` AS `developer`,`wf_building_count`.`commentNum` AS `commentNum`,`wf_building_count`.`concernNum` AS `concernNum`,`wf_building_count`.`tuanNum` AS `tuanNum`,`wf_building_count`.`optionalNum` AS `optionalNum`,`wf_building_count`.`newsNum` AS `newsNum`,`wf_building_count`.`dynamicNum` AS `dynamicNum`,`wf_building_count`.`roomNum` AS `roomNum`,`wf_building_count`.`picNum` AS `picNum`,`wf_building_count`.`videoNum` AS `videoNum`,`wf_building_count`.`smsNum` AS `smsNum`,`wf_building_count`.`emailNum` AS `emailNum`,`wf_building_count`.`clickNum` AS `clickNum`,`wf_building_base`.`sellerTel` AS `sellerTel`,`wf_building_base`.`sellerId` AS `sellerId`,`wf_building_base`.`sellerName` AS `sellerName`,`wf_building_base`.`boundAt` AS `boundAt`,`wf_building_base`.`updatedAt` AS `updatedAt`,`wf_building_base`.`createdAt` AS `createdAt`,`wf_building_sale`.`saleStatus` AS `saleStatus`,`wf_building_info`.`houseArea` AS `houseArea`,`wf_building_info`.`contacter` AS `contacter`,`wf_building_info`.`contacterTel` AS `contacterTel`,`wf_building_info`.`fax` AS `fax`,`wf_building_base`.`gift` AS `gift`,`wf_building_base`.`joinByname` AS `joinByname`,`wf_building_base`.`startByname` AS `startByname`,`wf_building_base`.`recommendRoom` AS `recommendRoom`,`wf_building_business`.`cooperateStatus` AS `cooperateStatus`,`wf_building_info`.`mapLng` AS `mapLng`,`wf_building_info`.`mapLat` AS `mapLat`,`wf_building_base`.`titlePinyin` AS `titlePinyin`,`wf_building_base`.`patent` AS `patent`,`wf_building_base`.`subcity` AS `subcity`,`wf_building_base`.`netSubcity` AS `netSubcity` from ((((`wf_building_base` join `wf_building_sale` on(((`wf_building_sale`.`buildingId` = `wf_building_base`.`id`) and ('' = '')))) join `wf_building_info` on((`wf_building_info`.`buildingId` = `wf_building_base`.`id`))) join `wf_building_count` on((`wf_building_count`.`buildingId` = `wf_building_base`.`id`))) left join `wf_building_business` on((`wf_building_business`.`buildingId` = `wf_building_base`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_cjvbs`
--
DROP TABLE IF EXISTS `wf_building_cjvbs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_cjvbs` AS select `wf_building_recommend`.`id` AS `id`,`wf_building_recommend`.`buildingId` AS `buildingId`,`wf_building_base`.`title` AS `title`,`wf_building_recommend`.`clientId` AS `clientId`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_building_recommend`.`seeStatus` AS `seeStatus`,`wf_building_recommend`.`content` AS `content`,`wf_building_recommend`.`status` AS `status`,`wf_building_base`.`city` AS `city`,`wf_fenxiao_client`.`sex` AS `sex` from ((`wf_building_base` join `wf_building_recommend` on((`wf_building_base`.`id` = `wf_building_recommend`.`buildingId`))) join `wf_fenxiao_client` on((`wf_fenxiao_client`.`id` = `wf_building_recommend`.`clientId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_ib`
--
DROP TABLE IF EXISTS `wf_building_ib`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_ib` AS select `wf_building_img`.`id` AS `id`,`wf_building_img`.`buildingId` AS `buildingId`,`wf_building_img`.`type` AS `type`,`wf_building_img`.`name` AS `name`,`wf_building_img`.`introduction` AS `introduction`,`wf_building_img`.`path` AS `path`,`wf_building_img`.`click` AS `click`,`wf_building_img`.`weightByname` AS `weightByname`,`wf_building_img`.`weightScore` AS `weightScore`,`wf_building_img`.`updatedBy` AS `updatedBy`,`wf_building_img`.`updatedAt` AS `updatedAt`,`wf_building_img`.`createdBy` AS `createdBy`,`wf_building_img`.`createdAt` AS `createdAt`,`wf_building_img`.`status` AS `status`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`county` AS `county`,`wf_building_base`.`title` AS `title` from (`wf_building_base` join `wf_building_img` on((`wf_building_base`.`id` = `wf_building_img`.`buildingId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_mb`
--
DROP TABLE IF EXISTS `wf_building_mb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_mb` AS select `wf_building_message`.`id` AS `id`,`wf_building_message`.`buildingId` AS `buildingId`,`wf_building_message`.`title` AS `title`,`wf_building_message`.`type` AS `type`,`wf_building_message`.`releaseAt` AS `releaseAt`,`wf_building_message`.`content` AS `content`,`wf_building_message`.`remark` AS `remark`,`wf_building_message`.`click` AS `click`,`wf_building_message`.`emailNum` AS `emailNum`,`wf_building_message`.`SMSNum` AS `SMSNum`,`wf_building_message`.`updatedBy` AS `updatedBy`,`wf_building_message`.`updatedAt` AS `updatedAt`,`wf_building_message`.`createdBy` AS `createdBy`,`wf_building_message`.`createdAt` AS `createdAt`,`wf_building_message`.`status` AS `status`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`county` AS `county`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`title` AS `buildingTitle` from (`wf_building_base` join `wf_building_message` on((`wf_building_base`.`id` = `wf_building_message`.`buildingId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_special_view`
--
DROP TABLE IF EXISTS `wf_building_special_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_special_view` AS select `wf_building_special`.`id` AS `id`,`wf_building_special`.`title` AS `title`,`wf_building_special`.`specialNumber` AS `specialNumber`,`wf_building_special`.`orders` AS `orders`,`wf_building_special`.`beforePrice` AS `beforePrice`,`wf_building_special`.`rebatePrice` AS `rebatePrice`,`wf_building_special`.`numberMin` AS `numberMin`,`wf_building_special`.`numberMax` AS `numberMax`,`wf_building_special`.`beginTime` AS `beginTime`,`wf_building_special`.`endTime` AS `endTime`,`wf_building_special`.`status` AS `status`,`wf_building_special`.`createdAt` AS `createdAt`,`wf_building_special`.`createdBy` AS `createdBy`,`wf_building_special`.`createdId` AS `createdId`,`wf_building_special`.`updatedAt` AS `updatedAt`,`wf_building_special`.`updatedBy` AS `updatedBy`,`wf_building_special_joinplace_count`.`joinNum` AS `joinNum`,`wf_building_special_joinplace_count`.`placeNum` AS `placeNum`,`wf_building_special_joinplace_count`.`unplaceNum` AS `unplaceNum`,`wf_building_special`.`virtualNum` AS `virtualNum`,`wf_building_special`.`buildingId` AS `buildingId`,`wf_sale_house`.`title` AS `saleTitle` from ((`wf_building_special` join `wf_building_special_joinplace_count` on((`wf_building_special`.`id` = `wf_building_special_joinplace_count`.`specialId`))) join `wf_sale_house` on((`wf_building_special`.`buildingId` = `wf_sale_house`.`id`))) order by `wf_building_special`.`id` desc;

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_tagsvbs`
--
DROP TABLE IF EXISTS `wf_building_tagsvbs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_tagsvbs` AS select `wf_building_tags`.`id` AS `id`,`wf_building_tags`.`name` AS `name`,`wf_building_tags`.`price` AS `price`,`wf_building_tags`.`province` AS `province`,`wf_building_tags`.`city` AS `city`,sum(`wf_building_tags`.`buildingSum`) AS `buildingSum`,`wf_building_tags`.`isClass` AS `isClass` from `wf_building_tags` where ((`wf_building_tags`.`price` > '0') and (`wf_building_tags`.`province` = '4')) group by `wf_building_tags`.`name`;

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_tuan_view`
--
DROP TABLE IF EXISTS `wf_building_tuan_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_tuan_view` AS select `wf_building_tuan`.`id` AS `id`,`wf_building_tuan`.`title` AS `title`,`wf_building_base`.`title` AS `buildingTitle`,`wf_building_tuan`.`tuanNumber` AS `tuanNumber`,`wf_building_tuan`.`orders` AS `orders`,`wf_building_tuan`.`beforePrice` AS `beforePrice`,`wf_building_tuan`.`rebatePrice` AS `rebatePrice`,`wf_building_tuan`.`numberMin` AS `numberMin`,`wf_building_tuan`.`numberMax` AS `numberMax`,`wf_building_tuan`.`beginTime` AS `beginTime`,`wf_building_tuan`.`endTime` AS `endTime`,`wf_building_tuan`.`status` AS `status`,`wf_building_tuan`.`createdAt` AS `createdAt`,`wf_building_tuan`.`updatedAt` AS `updatedAt`,`wf_building_tuan`.`updatedBy` AS `updatedBy`,`wf_building_tuan`.`createdId` AS `createdId`,`wf_building_tuan`.`createdBy` AS `createdBy`,`wf_building_tuan_joinplace_count`.`joinNum` AS `joinNum`,`wf_building_tuan_joinplace_count`.`placeNum` AS `placeNum`,`wf_building_tuan`.`virtualNum` AS `virtualNum`,`wf_building_tuan`.`buildingId` AS `buildingId`,`wf_building_tuan`.`privilegeInfo` AS `privilegeInfo`,`wf_building_tuan`.`icon` AS `icon`,`wf_building_tuan`.`categoryId` AS `categoryId`,`wf_building_tuan`.`topic` AS `topic` from ((`wf_building_tuan` left join `wf_building_base` on((`wf_building_tuan`.`buildingId` = `wf_building_base`.`id`))) left join `wf_building_tuan_joinplace_count` on((`wf_building_tuan`.`id` = `wf_building_tuan_joinplace_count`.`tuanId`))) order by `wf_building_tuan`.`id` desc;

-- --------------------------------------------------------

--
-- 视图结构 `wf_building_vb`
--
DROP TABLE IF EXISTS `wf_building_vb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_building_vb` AS select `wf_building_video`.`id` AS `id`,`wf_building_video`.`buildingId` AS `buildingId`,`wf_building_video`.`type` AS `type`,`wf_building_video`.`name` AS `name`,`wf_building_video`.`introduction` AS `introduction`,`wf_building_video`.`smallImg` AS `smallImg`,`wf_building_video`.`url` AS `url`,`wf_building_video`.`click` AS `click`,`wf_building_video`.`weightByname` AS `weightByname`,`wf_building_video`.`weightScore` AS `weightScore`,`wf_building_video`.`updatedBy` AS `updatedBy`,`wf_building_video`.`updatedAt` AS `updatedAt`,`wf_building_video`.`createdBy` AS `createdBy`,`wf_building_video`.`createdAt` AS `createdAt`,`wf_building_video`.`status` AS `status`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`county` AS `county`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`title` AS `title` from (`wf_building_base` join `wf_building_video` on((`wf_building_base`.`id` = `wf_building_video`.`buildingId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_cate_ads`
--
DROP TABLE IF EXISTS `wf_cate_ads`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_cate_ads` AS select `wf_ads_category`.`title` AS `cateTitle`,`wf_ads_category`.`adsw` AS `adsw`,`wf_ads_category`.`adsh` AS `adsh`,`wf_ads_category`.`status` AS `cateStatus`,`wf_ads`.`id` AS `id`,`wf_ads`.`province` AS `province`,`wf_ads`.`city` AS `city`,`wf_ads`.`categoryId` AS `categoryId`,`wf_ads`.`title` AS `title`,`wf_ads`.`pic` AS `pic`,`wf_ads`.`type` AS `type`,`wf_ads`.`urls` AS `urls`,`wf_ads`.`isAdv` AS `isAdv`,`wf_ads`.`offtim` AS `offtim`,`wf_ads`.`createdBy` AS `createdBy`,`wf_ads`.`createdAt` AS `createdAt`,`wf_ads`.`status` AS `status`,`wf_ads`.`clickNum` AS `clickNum`,`wf_ads`.`showProvince` AS `showProvince`,`wf_ads`.`orders` AS `orders`,`wf_ads`.`updatedBy` AS `updatedBy`,`wf_ads`.`updatedAt` AS `updatedAt`,`wf_ads`.`createdId` AS `createdId`,`wf_ads_category`.`tpl` AS `tpl` from (`wf_ads_category` join `wf_ads` on((`wf_ads_category`.`id` = `wf_ads`.`categoryId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_fenxiaocount_chengjiao`
--
DROP TABLE IF EXISTS `wf_fenxiaocount_chengjiao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_fenxiaocount_chengjiao` AS select `wf_fenxiao_summary`.`isBargain` AS `isBargain`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_summary`.`createdBy` AS `createdBy`,`wf_fenxiao_summary`.`createdAt` AS `createdAt`,`wf_fenxiao_summary`.`status` AS `status`,`wf_fenxiao_summary`.`clientId` AS `clientId`,`wf_fenxiao_client`.`askDate` AS `askDate` from (`wf_fenxiao_summary` left join `wf_fenxiao_client` on((`wf_fenxiao_summary`.`clientId` = `wf_fenxiao_client`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_fenxiaocount_kanfang`
--
DROP TABLE IF EXISTS `wf_fenxiaocount_kanfang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_fenxiaocount_kanfang` AS select `wf_fenxiao_arrange`.`clientId` AS `clientId`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_property`.`belongUserId` AS `belongUserId`,`wf_fenxiao_property`.`belongUser` AS `belongUser`,`wf_fenxiao_arrange`.`seeStatus` AS `seeStatus`,`wf_fenxiao_arrange`.`seeDate` AS `seeDate`,`wf_fenxiao_arrange`.`status` AS `status` from ((`wf_fenxiao_arrange` left join `wf_fenxiao_client` on((`wf_fenxiao_arrange`.`clientId` = `wf_fenxiao_client`.`id`))) left join `wf_fenxiao_property` on((`wf_fenxiao_arrange`.`clientId` = `wf_fenxiao_property`.`clientId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_next_role`
--
DROP TABLE IF EXISTS `wf_next_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_next_role` AS select `wf_role_node`.`name` AS `name`,`wf_role_node`.`title` AS `title`,`wf_role_node`.`pId` AS `pId`,`wf_role_node`.`roleNavId` AS `roleNavId`,`wf_role_node`.`status` AS `status`,`wf_role_node`.`sort` AS `sort`,`wf_role_node`.`id` AS `id`,`wf_access`.`roleId` AS `roleId`,`wf_role_nav`.`status` AS `navStatus`,`wf_role_nav`.`sort` AS `navSort`,`wf_role_nav`.`name` AS `navName` from ((`wf_role_node` join `wf_role_nav` on((`wf_role_nav`.`id` = `wf_role_node`.`roleNavId`))) join `wf_access` on((`wf_role_node`.`id` = `wf_access`.`nodeId`))) where (`wf_role_nav`.`status` = '5');

-- --------------------------------------------------------

--
-- 视图结构 `wf_sale_browsed_view`
--
DROP TABLE IF EXISTS `wf_sale_browsed_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_sale_browsed_view` AS select `wf_sale_browsed`.`id` AS `id`,`wf_sale_browsed`.`userId` AS `userId`,`wf_sale_browsed`.`saleId` AS `saleId`,`wf_sale_browsed`.`ip` AS `ip`,`wf_sale_browsed`.`num` AS `num`,`wf_sale_browsed`.`createdAt` AS `createdAt`,`wf_sale_house`.`buildingId` AS `buildingId`,`wf_sale_house`.`topic` AS `topic`,`wf_sale_house`.`city` AS `city`,`wf_sale_house`.`county` AS `county`,`wf_sale_house`.`room` AS `room`,`wf_sale_house`.`hall` AS `hall`,`wf_sale_house`.`kitchen` AS `kitchen`,`wf_sale_house`.`toilet` AS `toilet`,`wf_sale_house`.`veranda` AS `veranda`,`wf_sale_house`.`area` AS `area`,`wf_sale_house`.`price` AS `price`,`wf_sale_house`.`province` AS `province`,`wf_sale_house`.`icon` AS `icon`,`wf_sale_house`.`title` AS `title` from (`wf_sale_browsed` join `wf_sale_house` on((`wf_sale_browsed`.`saleId` = `wf_sale_house`.`id`))) order by `wf_sale_browsed`.`createdAt` desc;

-- --------------------------------------------------------

--
-- 视图结构 `wf_sale_concern_view`
--
DROP TABLE IF EXISTS `wf_sale_concern_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_sale_concern_view` AS select `wf_sale_concern`.`id` AS `id`,`wf_sale_concern`.`userId` AS `userId`,`wf_sale_concern`.`saleId` AS `saleId`,`wf_sale_concern`.`ip` AS `ip`,`wf_sale_concern`.`num` AS `num`,`wf_sale_concern`.`createdAt` AS `createdAt`,`wf_sale_house`.`buildingId` AS `buildingId`,`wf_sale_house`.`title` AS `title`,`wf_sale_house`.`topic` AS `topic`,`wf_sale_house`.`city` AS `city`,`wf_sale_house`.`county` AS `county`,`wf_sale_house`.`room` AS `room`,`wf_sale_house`.`hall` AS `hall`,`wf_sale_house`.`kitchen` AS `kitchen`,`wf_sale_house`.`toilet` AS `toilet`,`wf_sale_house`.`veranda` AS `veranda`,`wf_sale_house`.`area` AS `area`,`wf_sale_house`.`price` AS `price`,`wf_sale_house`.`province` AS `province`,`wf_sale_house`.`icon` AS `icon` from (`wf_sale_concern` join `wf_sale_house` on((`wf_sale_concern`.`saleId` = `wf_sale_house`.`id`))) order by `wf_sale_concern`.`createdAt` desc;

-- --------------------------------------------------------

--
-- 视图结构 `wf_user_base_view`
--
DROP TABLE IF EXISTS `wf_user_base_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wofang_local`@`%` SQL SECURITY DEFINER VIEW `wf_user_base_view` AS select `wf_user_base`.`id` AS `id`,`wf_user_base`.`tel` AS `tel`,`wf_user_base`.`userName` AS `userName`,`wf_user_base`.`email` AS `email`,`wf_user_base`.`province` AS `province`,`wf_user_base`.`regTime` AS `regTime`,`wf_user_base`.`city` AS `city`,`wf_user_base`.`status` AS `status`,`wf_user_base`.`loginTime` AS `loginTime`,`wf_user_base`.`userType` AS `userType`,`wf_user_base`.`loginCnt` AS `loginCnt`,`wf_user_info`.`userId` AS `userId`,`wf_user_info`.`name` AS `name`,`wf_user_info`.`sex` AS `sex`,`wf_user_info`.`icon` AS `icon`,`wf_user_info`.`statusInfo` AS `statusInfo`,`wf_user_info`.`updatedBy` AS `updatedBy`,`wf_user_info`.`updatedAt` AS `updatedAt`,`wf_user_info`.`belongUserId` AS `belongUserId`,`wf_user_info`.`belongUser` AS `belongUser`,`wf_user_info`.`belongPid` AS `belongPid`,`wf_user_info`.`creditTotal` AS `creditTotal`,`wf_user_info`.`creditSum` AS `creditSum`,`wf_user_base`.`userWay` AS `userWay`,`wf_user_base`.`succStatus` AS `succStatus`,`wf_user_info`.`clientId` AS `clientId`,`wf_user_info`.`buyTotal` AS `buyTotal`,`wf_role_user`.`roleId` AS `roleId`,`wf_user_info`.`notes` AS `notes`,`wf_role_user`.`isAnchang` AS `isAnchang`,`wf_user_info`.`birth` AS `birth`,`wf_user_info`.`userTim` AS `userTim`,`wf_user_base`.`onlineTime` AS `onlineTime`,`wf_user_base`.`loginIP` AS `loginIP`,`wf_user_base`.`regIP` AS `regIP`,`wf_user_base`.`open_id` AS `open_id`,`wf_user_info`.`company` AS `company` from ((`wf_user_base` join `wf_user_info` on((`wf_user_base`.`id` = `wf_user_info`.`userId`))) left join `wf_role_user` on((`wf_user_info`.`belongUserId` = `wf_role_user`.`id`))) order by `wf_user_base`.`id` desc;

-- --------------------------------------------------------

--
-- 视图结构 `wf_vagent`
--
DROP TABLE IF EXISTS `wf_vagent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vagent` AS select `wf_agent`.`id` AS `id`,`wf_agent`.`tel` AS `tel`,`wf_agent`.`name` AS `name`,`wf_agent`.`passwd` AS `passwd`,`wf_agent`.`sex` AS `sex`,`wf_agent`.`idCard` AS `idCard`,`wf_agent`.`province` AS `province`,`wf_agent`.`city` AS `city`,`wf_agent`.`county` AS `county`,`wf_agent`.`regTime` AS `regTime`,`wf_agent`.`address` AS `address`,`wf_agent`.`agreement` AS `agreement`,`wf_agent`.`joinState` AS `joinState`,`wf_agent`.`startTim` AS `startTim`,`wf_agent`.`endTim` AS `endTim`,`wf_agent`.`status` AS `status`,`wf_agent`.`message` AS `message`,`wf_agent`.`notes` AS `notes`,`wf_agent`.`belongUser` AS `belongUser`,`wf_agent`.`belongUserId` AS `belongUserId`,`wf_agent`.`updatedBy` AS `updatedBy`,`wf_agent`.`updatedAt` AS `updatedAt`,`wf_agent`.`createdBy` AS `createdBy`,`wf_agent`.`createdAt` AS `createdAt`,`wf_agent`.`createdId` AS `createdId`,`wf_agent`.`changeClient` AS `changeClient`,`wf_role_user`.`roleId` AS `roleId`,`wf_agent`.`joinWay` AS `joinWay`,`wf_agent`.`pid` AS `pid`,`wf_agent`.`companyInfo` AS `companyInfo`,`wf_agent`.`loginTime` AS `loginTime`,`wf_agent`.`loginCnt` AS `loginCnt`,`wf_agent`.`isHouse` AS `isHouse`,`wf_agent`.`delAt` AS `delAt`,`wf_agent`.`delId` AS `delId`,`wf_agent`.`delBy` AS `delBy` from (`wf_agent` left join `wf_role_user` on((`wf_agent`.`belongUserId` = `wf_role_user`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vagent_clients`
--
DROP TABLE IF EXISTS `wf_vagent_clients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vagent_clients` AS select `wf_vclient_role`.`id` AS `id`,`wf_vclient_role`.`clientName` AS `clientName`,`wf_vclient_role`.`sex` AS `sex`,`wf_vclient_role`.`province` AS `province`,`wf_vclient_role`.`city` AS `city`,`wf_vclient_role`.`clientFrom` AS `clientFrom`,`wf_vclient_role`.`tel` AS `tel`,`wf_vclient_role`.`phone` AS `phone`,`wf_vclient_role`.`otherPhone` AS `otherPhone`,`wf_vclient_role`.`askDate` AS `askDate`,`wf_vclient_role`.`belongUserId` AS `belongUserId`,`wf_vclient_role`.`belongUser` AS `belongUser`,`wf_vclient_role`.`firstUser` AS `firstUser`,`wf_vclient_role`.`arrangeId` AS `arrangeId`,`wf_vclient_role`.`arrangeUser` AS `arrangeUser`,`wf_vclient_role`.`firstUserId` AS `firstUserId`,`wf_vclient_role`.`status` AS `status`,`wf_vclient_role`.`arrangeRoleId` AS `arrangeRoleId`,`wf_vclient_role`.`clientType` AS `clientType`,`wf_vclient_role`.`roleId` AS `roleId`,`wf_fenxiao_property`.`clientPoint` AS `clientPoint`,`wf_agent`.`name` AS `name`,`wf_agent`.`belongUser` AS `agentName`,`wf_agent`.`belongUserId` AS `agentUserId`,`wf_role_user`.`roleId` AS `agentRoleId`,`wf_vclient_role`.`agentId` AS `agentId`,`wf_vclient_role`.`clientLevel` AS `clientLevel`,`wf_vclient_role`.`isBargain` AS `isBargain`,`wf_vclient_role`.`agentSaleName` AS `agentSaleName`,`wf_vclient_role`.`agentSaleTel` AS `agentSaleTel`,`wf_fenxiao_property`.`seeItem` AS `seeItem`,`wf_vclient_role`.`fitmentId` AS `fitmentId`,`wf_vclient_role`.`agentAt` AS `agentAt`,`wf_vclient_role`.`lastVisitDate` AS `lastVisitDate`,`wf_vclient_role`.`changeAt` AS `changeAt`,`wf_vclient_role`.`createdAt` AS `createdAt`,`wf_agent`.`province` AS `agentProvince`,`wf_agent`.`isHouse` AS `isHouse` from (((`wf_vclient_role` left join `wf_fenxiao_property` on((`wf_vclient_role`.`id` = `wf_fenxiao_property`.`clientId`))) left join `wf_agent` on((`wf_vclient_role`.`agentId` = `wf_agent`.`id`))) left join `wf_role_user` on((`wf_agent`.`belongUserId` = `wf_role_user`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vagent_clients_deal`
--
DROP TABLE IF EXISTS `wf_vagent_clients_deal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vagent_clients_deal` AS select `wf_fenxiao_dealbuilding`.`title` AS `title`,`wf_fenxiao_dealbuilding`.`houseNo` AS `houseNo`,`wf_fenxiao_dealbuilding`.`id` AS `dealId`,`wf_fenxiao_dealbuilding`.`earnestDate` AS `earnestDate`,`wf_fenxiao_dealbuilding`.`total` AS `total`,`wf_fenxiao_dealbuilding`.`eachPrice` AS `eachPrice`,`wf_fenxiao_dealbuilding`.`area` AS `area`,`wf_fenxiao_dealbuilding`.`signDate` AS `signDate`,`wf_fenxiao_dealbuilding`.`payWay` AS `payWay`,`wf_fenxiao_dealbuilding`.`dealNotes` AS `dealNotes`,`wf_fenxiao_dealbuilding`.`results` AS `results`,`wf_vagent_clients`.`roleId` AS `roleId`,`wf_vagent_clients`.`arrangeRoleId` AS `arrangeRoleId`,`wf_vagent_clients`.`agentUserId` AS `agentUserId`,`wf_vagent_clients`.`isBargain` AS `isBargain`,`wf_vagent_clients`.`agentRoleId` AS `agentRoleId`,`wf_vagent_clients`.`agentName` AS `agentName`,`wf_vagent_clients`.`status` AS `status`,`wf_vagent_clients`.`belongUserId` AS `belongUserId`,`wf_vagent_clients`.`belongUser` AS `belongUser`,`wf_vagent_clients`.`clientFrom` AS `clientFrom`,`wf_vagent_clients`.`clientName` AS `clientName`,`wf_vagent_clients`.`firstUser` AS `firstUser`,`wf_vagent_clients`.`arrangeUser` AS `arrangeUser`,`wf_vagent_clients`.`arrangeId` AS `arrangeId`,`wf_vagent_clients`.`sex` AS `sex`,`wf_vagent_clients`.`province` AS `province`,`wf_vagent_clients`.`city` AS `city`,`wf_vagent_clients`.`tel` AS `tel`,`wf_vagent_clients`.`phone` AS `phone`,`wf_vagent_clients`.`otherPhone` AS `otherPhone`,`wf_vagent_clients`.`askDate` AS `askDate`,`wf_vagent_clients`.`clientType` AS `clientType`,`wf_vagent_clients`.`clientLevel` AS `clientLevel`,`wf_vagent_clients`.`id` AS `id` from (`wf_vagent_clients` left join `wf_fenxiao_dealbuilding` on((`wf_fenxiao_dealbuilding`.`clientId` = `wf_vagent_clients`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vagent_clients_deal_copy`
--
DROP TABLE IF EXISTS `wf_vagent_clients_deal_copy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vagent_clients_deal_copy` AS select `wf_vfenxiao_client_property`.`clientPoint` AS `clientPoint`,`wf_vfenxiao_client_property`.`buyCity` AS `buyCity`,`wf_vfenxiao_client_property`.`preference` AS `preference`,`wf_vfenxiao_client_property`.`unitPrice` AS `unitPrice`,`wf_vfenxiao_client_property`.`unitPrice1` AS `unitPrice1`,`wf_vfenxiao_client_property`.`totalPrice` AS `totalPrice`,`wf_vfenxiao_client_property`.`totalPrice1` AS `totalPrice1`,`wf_vfenxiao_client_property`.`roomType` AS `roomType`,`wf_vfenxiao_client_property`.`createdBy` AS `createdBy`,`wf_vfenxiao_client_property`.`updatedAt` AS `updatedAt`,`wf_vfenxiao_client_property`.`createdAt` AS `createdAt`,`wf_vfenxiao_client_property`.`purpose` AS `purpose`,`wf_vfenxiao_client_property`.`fitment` AS `fitment`,`wf_vfenxiao_client_property`.`propertyType` AS `propertyType`,`wf_vfenxiao_client_property`.`buyNum` AS `buyNum`,`wf_vfenxiao_client_property`.`fitment1` AS `fitment1`,`wf_vfenxiao_client_property`.`propertyNotes` AS `propertyNotes`,`wf_vfenxiao_client_property`.`id` AS `id`,`wf_vfenxiao_client_property`.`userId` AS `userId`,`wf_vfenxiao_client_property`.`userName` AS `userName`,`wf_vfenxiao_client_property`.`clientName` AS `clientName`,`wf_vfenxiao_client_property`.`sex` AS `sex`,`wf_vfenxiao_client_property`.`province` AS `province`,`wf_vfenxiao_client_property`.`city` AS `city`,`wf_vfenxiao_client_property`.`address` AS `address`,`wf_vfenxiao_client_property`.`clientFrom` AS `clientFrom`,`wf_vfenxiao_client_property`.`tel` AS `tel`,`wf_vfenxiao_client_property`.`phone` AS `phone`,`wf_vfenxiao_client_property`.`otherName` AS `otherName`,`wf_vfenxiao_client_property`.`otherPhone` AS `otherPhone`,`wf_vfenxiao_client_property`.`email` AS `email`,`wf_vfenxiao_client_property`.`QQ` AS `QQ`,`wf_vfenxiao_client_property`.`requireType` AS `requireType`,`wf_vfenxiao_client_property`.`askType` AS `askType`,`wf_vfenxiao_client_property`.`askDate` AS `askDate`,`wf_vfenxiao_client_property`.`lastVisitDate` AS `lastVisitDate`,`wf_vfenxiao_client_property`.`nextVisitDate` AS `nextVisitDate`,`wf_vfenxiao_client_property`.`clientLevel` AS `clientLevel`,`wf_vfenxiao_client_property`.`serviceStatus` AS `serviceStatus`,`wf_vfenxiao_client_property`.`belongUserId` AS `belongUserId`,`wf_vfenxiao_client_property`.`belongUser` AS `belongUser`,`wf_vfenxiao_client_property`.`firstUserId` AS `firstUserId`,`wf_vfenxiao_client_property`.`firstUser` AS `firstUser`,`wf_vfenxiao_client_property`.`arrangeId` AS `arrangeId`,`wf_vfenxiao_client_property`.`arrangeUser` AS `arrangeUser`,`wf_vfenxiao_client_property`.`changeClient` AS `changeClient`,`wf_vfenxiao_client_property`.`status` AS `status`,`wf_vfenxiao_client_property`.`belongPid` AS `belongPid`,`wf_vfenxiao_client_property`.`changeAt` AS `changeAt`,`wf_vfenxiao_client_property`.`agentId` AS `agentId`,`wf_vfenxiao_client_property`.`isAnchang` AS `isAnchang`,`wf_vfenxiao_client_property`.`jobType` AS `jobType`,`wf_vfenxiao_client_property`.`visitHouseAt` AS `visitHouseAt`,`wf_vfenxiao_client_property`.`isBargain` AS `isBargain`,`wf_vfenxiao_client_property`.`roleId` AS `roleId`,`wf_vfenxiao_client_property`.`clientType` AS `clientType`,`wf_vfenxiao_client_property`.`arrangeRoleId` AS `arrangeRoleId`,`wf_fenxiao_dealbuilding`.`title` AS `title`,`wf_fenxiao_dealbuilding`.`houseNo` AS `houseNo`,`wf_fenxiao_dealbuilding`.`id` AS `dealId`,`wf_fenxiao_dealbuilding`.`earnestDate` AS `earnestDate`,`wf_fenxiao_dealbuilding`.`total` AS `total`,`wf_fenxiao_dealbuilding`.`eachPrice` AS `eachPrice`,`wf_fenxiao_dealbuilding`.`area` AS `area`,`wf_fenxiao_dealbuilding`.`signDate` AS `signDate`,`wf_fenxiao_dealbuilding`.`payWay` AS `payWay`,`wf_fenxiao_dealbuilding`.`dealNotes` AS `dealNotes`,`wf_fenxiao_dealbuilding`.`results` AS `results`,`wf_vagent_role`.`agentRoleId` AS `agentRoleId`,`wf_vagent_role`.`agentUserId` AS `agentUserId`,`wf_vagent_role`.`agentName` AS `agentName`,`wf_vfenxiao_client_property`.`agentTel` AS `agentTel` from ((`wf_vfenxiao_client_property` join `wf_fenxiao_dealbuilding` on((`wf_vfenxiao_client_property`.`id` = `wf_fenxiao_dealbuilding`.`clientId`))) left join `wf_vagent_role` on((`wf_vfenxiao_client_property`.`agentId` = `wf_vagent_role`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vagent_role`
--
DROP TABLE IF EXISTS `wf_vagent_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vagent_role` AS select `wf_agent`.`id` AS `id`,`wf_agent`.`belongUser` AS `agentName`,`wf_agent`.`belongUserId` AS `agentUserId`,`wf_role_user`.`roleId` AS `agentRoleId` from (`wf_agent` join `wf_role_user` on((`wf_agent`.`belongUserId` = `wf_role_user`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_varrangers_role`
--
DROP TABLE IF EXISTS `wf_varrangers_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_varrangers_role` AS select `wf_fenxiao_arrangers`.`id` AS `id`,`wf_fenxiao_arrangers`.`arrangeId` AS `arrangeId`,`wf_fenxiao_arrangers`.`arrangeName` AS `arrangeName`,`wf_fenxiao_arrangers`.`clientId` AS `clientId`,`wf_fenxiao_arrangers`.`timeAt` AS `timeAt`,`wf_fenxiao_arrangers`.`clientLevel` AS `clientLevel`,`wf_vrole`.`roleId` AS `roleId`,`wf_vrole`.`clientType` AS `clientType`,`wf_vrole`.`isAnchang` AS `isAnchang`,`wf_fenxiao_arrangers`.`isBargain` AS `isBargain`,`wf_vrole`.`roleCate` AS `roleCate` from (`wf_fenxiao_arrangers` join `wf_vrole` on((`wf_fenxiao_arrangers`.`arrangeId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vasks_replys`
--
DROP TABLE IF EXISTS `wf_vasks_replys`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vasks_replys` AS select `wf_asks_reply`.`askid` AS `askid`,`wf_asks_reply`.`id` AS `id`,`wf_asks_reply`.`content` AS `content`,`wf_asks_reply`.`supports` AS `supports`,`wf_asks_reply`.`opposes` AS `opposes`,`wf_asks_reply`.`status` AS `status`,`wf_asks_reply`.`uid` AS `uid`,`wf_asks_reply`.`uname` AS `uname`,`wf_asks_reply`.`createdAt` AS `createdAt`,`wf_asks_reply`.`createdBy` AS `createdBy`,`wf_asks`.`title` AS `title`,`wf_asks`.`detail` AS `detail`,`wf_asks`.`replys` AS `replys`,`wf_asks`.`cateId` AS `cateId`,`wf_asks`.`subcateid` AS `subcateid`,`wf_asks`.`clicks` AS `clicks`,`wf_asks`.`uname` AS `askuname`,`wf_asks`.`createdAt` AS `askcreatedAt`,`wf_asks`.`isolve` AS `isolve`,`wf_asks`.`currentId` AS `currentId`,`wf_asks`.`currentName` AS `currentName`,`wf_asks`.`currentType` AS `currentType` from (`wf_asks_reply` left join `wf_asks` on((`wf_asks`.`id` = `wf_asks_reply`.`askid`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vbbs_recommend`
--
DROP TABLE IF EXISTS `wf_vbbs_recommend`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vbbs_recommend` AS select `wf_building_recommend`.`id` AS `id`,`wf_building_recommend`.`buildingId` AS `buildingId`,`wf_building_recommend`.`userId` AS `userId`,`wf_building_recommend`.`clientId` AS `clientId`,`wf_building_recommend`.`contact` AS `contact`,`wf_building_recommend`.`tel` AS `tel`,`wf_building_recommend`.`seeDate` AS `seeDate`,`wf_building_recommend`.`seeStatus` AS `seeStatus`,`wf_building_recommend`.`prebuilding` AS `prebuilding`,`wf_building_recommend`.`content` AS `content`,`wf_building_recommend`.`recommendId` AS `recommendId`,`wf_building_recommend`.`reason` AS `reason`,`wf_building_recommend`.`status` AS `status`,`wf_building_recommend`.`userStatus` AS `userStatus`,`wf_building_bbs`.`title` AS `title`,`wf_building_bbs`.`icon` AS `icon`,`wf_building_bbs`.`type` AS `type`,`wf_building_bbs`.`feature` AS `feature`,`wf_building_bbs`.`zone` AS `zone`,`wf_building_bbs`.`address` AS `address`,`wf_building_bbs`.`startTime` AS `startTime`,`wf_building_bbs`.`adTitle` AS `adTitle`,`wf_building_bbs`.`province` AS `province`,`wf_building_bbs`.`city` AS `city`,`wf_building_bbs`.`weightScore` AS `weightScore`,`wf_building_bbs`.`joinTime` AS `joinTime`,`wf_building_bbs`.`decoration` AS `decoration`,`wf_building_bbs`.`buildingNum` AS `buildingNum`,`wf_building_bbs`.`houseNum` AS `houseNum`,`wf_building_bbs`.`parkingNum` AS `parkingNum`,`wf_building_bbs`.`priceAvg` AS `priceAvg`,`wf_building_bbs`.`priceSum` AS `priceSum`,`wf_building_bbs`.`priceSumType` AS `priceSumType`,`wf_building_bbs`.`qiXian` AS `qiXian`,`wf_building_bbs`.`contacterTel` AS `contacterTel`,`wf_building_bbs`.`contacter` AS `contacter`,`wf_building_recommend`.`type` AS `recommendType`,`wf_building_bbs`.`cooperateStatus` AS `cooperateStatus`,`wf_building_bbs`.`sellerTel` AS `sellerTel` from (`wf_building_bbs` join `wf_building_recommend` on((`wf_building_recommend`.`buildingId` = `wf_building_bbs`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vbsi_concern`
--
DROP TABLE IF EXISTS `wf_vbsi_concern`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vbsi_concern` AS select `wf_building_bsi`.`title` AS `title`,`wf_building_bsi`.`icon` AS `icon`,`wf_building_bsi`.`type` AS `type`,`wf_building_bsi`.`feature` AS `feature`,`wf_building_bsi`.`province` AS `province`,`wf_building_bsi`.`city` AS `city`,`wf_building_bsi`.`county` AS `county`,`wf_building_bsi`.`zone` AS `zone`,`wf_building_bsi`.`address` AS `address`,`wf_building_bsi`.`startTime` AS `startTime`,`wf_building_bsi`.`adTitle` AS `adTitle`,`wf_building_bsi`.`joinTime` AS `joinTime`,`wf_building_bsi`.`decoration` AS `decoration`,`wf_building_bsi`.`buildingNum` AS `buildingNum`,`wf_building_bsi`.`weightByname` AS `weightByname`,`wf_building_bsi`.`houseNum` AS `houseNum`,`wf_building_bsi`.`weightScore` AS `weightScore`,`wf_building_bsi`.`status` AS `status`,`wf_building_bsi`.`priceAvg` AS `priceAvg`,`wf_building_bsi`.`priceMin` AS `priceMin`,`wf_building_bsi`.`priceMax` AS `priceMax`,`wf_building_bsi`.`priceSum` AS `priceSum`,`wf_building_bsi`.`priceSumType` AS `priceSumType`,`wf_building_bsi`.`qiXian` AS `qiXian`,`wf_building_bsi`.`saleStatus` AS `saleStatus`,`wf_building_bsi`.`buildingType` AS `buildingType`,`wf_building_bsi`.`investor` AS `investor`,`wf_building_bsi`.`developer` AS `developer`,`wf_building_bsi`.`commentNum` AS `commentNum`,`wf_building_bsi`.`concernNum` AS `concernNum`,`wf_building_bsi`.`tuanNum` AS `tuanNum`,`wf_building_bsi`.`optionalNum` AS `optionalNum`,`wf_building_bsi`.`newsNum` AS `newsNum`,`wf_building_bsi`.`dynamicNum` AS `dynamicNum`,`wf_building_bsi`.`roomNum` AS `roomNum`,`wf_building_bsi`.`picNum` AS `picNum`,`wf_building_bsi`.`videoNum` AS `videoNum`,`wf_building_bsi`.`smsNum` AS `smsNum`,`wf_building_bsi`.`emailNum` AS `emailNum`,`wf_building_bsi`.`clickNum` AS `clickNum`,`wf_interact_record`.`buildingId` AS `buildingId`,`wf_interact_record`.`updateAt` AS `updateAt`,`wf_interact_record`.`type` AS `concernType`,`wf_interact_record`.`id` AS `id`,`wf_interact_record`.`userId` AS `userId` from (`wf_building_bsi` join `wf_interact_record` on((`wf_interact_record`.`buildingId` = `wf_building_bsi`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vbsi_recommend`
--
DROP TABLE IF EXISTS `wf_vbsi_recommend`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vbsi_recommend` AS select `wf_building_recommend`.`buildingId` AS `buildingId`,`wf_building_recommend`.`userId` AS `userId`,`wf_building_recommend`.`reason` AS `reason`,`wf_building_recommend`.`id` AS `id`,`wf_building_bsi`.`title` AS `title`,`wf_building_bsi`.`icon` AS `icon`,`wf_building_bsi`.`feature` AS `feature`,`wf_building_bsi`.`type` AS `type`,`wf_building_bsi`.`province` AS `province`,`wf_building_bsi`.`city` AS `city`,`wf_building_bsi`.`zone` AS `zone`,`wf_building_bsi`.`address` AS `address`,`wf_building_bsi`.`startTime` AS `startTime`,`wf_building_bsi`.`adTitle` AS `adTitle`,`wf_building_bsi`.`joinTime` AS `joinTime`,`wf_building_bsi`.`decoration` AS `decoration`,`wf_building_bsi`.`buildingNum` AS `buildingNum`,`wf_building_bsi`.`houseNum` AS `houseNum`,`wf_building_bsi`.`parkingNum` AS `parkingNum`,`wf_building_bsi`.`weightScore` AS `weightScore`,`wf_building_bsi`.`priceAvg` AS `priceAvg`,`wf_building_bsi`.`priceMin` AS `priceMin`,`wf_building_bsi`.`priceMax` AS `priceMax`,`wf_building_bsi`.`priceSum` AS `priceSum`,`wf_building_bsi`.`priceSumType` AS `priceSumType`,`wf_building_bsi`.`qiXian` AS `qiXian`,`wf_building_bsi`.`saleStatus` AS `saleStatus`,`wf_building_bsi`.`areaMax` AS `areaMax`,`wf_building_bsi`.`areaMin` AS `areaMin`,`wf_building_recommend`.`type` AS `recommendType`,`wf_building_bsi`.`contacter` AS `contacter`,`wf_building_bsi`.`contacterTel` AS `contacterTel`,`wf_building_bsi`.`fax` AS `fax`,`wf_building_recommend`.`clientId` AS `clientId`,`wf_building_recommend`.`seeStatus` AS `seeStatus`,`wf_building_bsi`.`sellerName` AS `sellerName`,`wf_building_bsi`.`sellerTel` AS `sellerTel`,`wf_building_recommend`.`status` AS `status`,`wf_building_recommend`.`seeDate` AS `seeDate`,`wf_building_recommend`.`content` AS `content`,`wf_building_recommend`.`tel` AS `tel`,`wf_building_recommend`.`contact` AS `contact`,`wf_building_recommend`.`prebuilding` AS `prebuilding`,`wf_building_recommend`.`isConfirm` AS `isConfirm`,`wf_building_recommend`.`confirmAt` AS `confirmAt`,`wf_building_recommend`.`getArrangeId` AS `getArrangeId` from (`wf_building_bsi` join `wf_building_recommend` on((`wf_building_recommend`.`buildingId` = `wf_building_bsi`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vbuilding_tuanjoin`
--
DROP TABLE IF EXISTS `wf_vbuilding_tuanjoin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vbuilding_tuanjoin` AS select `wf_building_tuan_join`.`id` AS `id`,`wf_building_tuan_join`.`belongUserId` AS `belongUserId`,`wf_building_tuan_join`.`belongUserName` AS `belongUserName`,`wf_building_tuan_join`.`createdAt` AS `createdAt`,`wf_building_tuan_join`.`tuanId` AS `tuanId`,`wf_building_tuan`.`buildingId` AS `buildingId`,`wf_building_base`.`title` AS `buildingTitle`,`wf_building_tuan_join`.`userName` AS `userName`,`wf_building_tuan_join`.`tel` AS `tel`,`wf_building_tuan_join`.`joinType` AS `joinType`,`wf_building_tuan_join`.`joinTime` AS `joinTime`,`wf_building_tuan_join`.`clientId` AS `clientId`,`wf_role_user`.`roleId` AS `roleId`,`wf_building_tuan_join`.`status` AS `status`,`wf_building_tuan_join`.`joinStatus` AS `joinStatus` from (((`wf_building_tuan_join` left join `wf_building_tuan` on((`wf_building_tuan_join`.`tuanId` = `wf_building_tuan`.`id`))) left join `wf_building_base` on((`wf_building_tuan`.`buildingId` = `wf_building_base`.`id`))) left join `wf_role_user` on((`wf_role_user`.`id` = `wf_building_tuan_join`.`belongUserId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vbusinesscount_aclients`
--
DROP TABLE IF EXISTS `wf_vbusinesscount_aclients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vbusinesscount_aclients` AS select `wf_businesscount_aclients`.`id` AS `id`,`wf_businesscount_aclients`.`inclients` AS `inclients`,`wf_businesscount_aclients`.`bargains` AS `bargains`,`wf_businesscount_aclients`.`agentId` AS `agentId`,`wf_businesscount_aclients`.`agentName` AS `agentName`,`wf_businesscount_aclients`.`times` AS `times`,`wf_agent`.`belongUserId` AS `belongId`,`wf_agent`.`belongUser` AS `belongUser` from (`wf_businesscount_aclients` join `wf_agent` on((`wf_businesscount_aclients`.`agentId` = `wf_agent`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vclient_role`
--
DROP TABLE IF EXISTS `wf_vclient_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vclient_role` AS select `wf_fenxiao_client`.`id` AS `id`,`wf_fenxiao_client`.`userId` AS `userId`,`wf_fenxiao_client`.`userName` AS `userName`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`sex` AS `sex`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_client`.`city` AS `city`,`wf_fenxiao_client`.`address` AS `address`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_client`.`agentName` AS `agentName`,`wf_fenxiao_client`.`agentTel` AS `agentTel`,`wf_fenxiao_client`.`tel` AS `tel`,`wf_fenxiao_client`.`phone` AS `phone`,`wf_fenxiao_client`.`otherName` AS `otherName`,`wf_fenxiao_client`.`otherPhone` AS `otherPhone`,`wf_fenxiao_client`.`email` AS `email`,`wf_fenxiao_client`.`QQ` AS `QQ`,`wf_fenxiao_client`.`requireType` AS `requireType`,`wf_fenxiao_client`.`askType` AS `askType`,`wf_fenxiao_client`.`askDate` AS `askDate`,`wf_fenxiao_client`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_client`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`serviceStatus` AS `serviceStatus`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`firstUserId` AS `firstUserId`,`wf_fenxiao_client`.`firstUser` AS `firstUser`,`wf_fenxiao_client`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`arrangeUser` AS `arrangeUser`,`wf_fenxiao_client`.`changeClient` AS `changeClient`,`wf_fenxiao_client`.`status` AS `status`,`wf_fenxiao_client`.`belongPid` AS `belongPid`,`wf_fenxiao_client`.`changeAt` AS `changeAt`,`wf_fenxiao_client`.`agentId` AS `agentId`,`wf_fenxiao_client`.`jobType` AS `jobType`,`wf_fenxiao_client`.`visitHouseAt` AS `visitHouseAt`,`wf_role_user`.`roleId` AS `roleId`,`wf_role_user_arrange`.`roleId` AS `arrangeRoleId`,`wf_role`.`clientType` AS `clientType`,`wf_role_user`.`isAnchang` AS `isAnchang`,`wf_fenxiao_client`.`isBargain` AS `isBargain`,`wf_fenxiao_client`.`visitNum` AS `visitNum`,`wf_fenxiao_client`.`createdAt` AS `createdAt`,`wf_fenxiao_client`.`agentSaleName` AS `agentSaleName`,`wf_fenxiao_client`.`agentSaleTel` AS `agentSaleTel`,`wf_fenxiao_client`.`fitmentId` AS `fitmentId`,`wf_fenxiao_client`.`agentAt` AS `agentAt` from (((`wf_fenxiao_client` left join `wf_role_user` on((`wf_fenxiao_client`.`belongUserId` = `wf_role_user`.`id`))) left join `wf_role_user` `wf_role_user_arrange` on((`wf_fenxiao_client`.`arrangeId` = `wf_role_user_arrange`.`id`))) join `wf_role` on((`wf_role_user`.`roleId` = `wf_role`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vdichan_building_bsc`
--
DROP TABLE IF EXISTS `wf_vdichan_building_bsc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vdichan_building_bsc` AS select `wf_building_base`.`id` AS `id`,`wf_building_base`.`title` AS `title`,`wf_building_base`.`titlePinyin` AS `titlePinyin`,`wf_building_base`.`icon` AS `icon`,`wf_building_base`.`type` AS `type`,`wf_building_base`.`feature` AS `feature`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`county` AS `county`,`wf_building_base`.`zone` AS `zone`,`wf_building_base`.`lat` AS `lat`,`wf_building_base`.`lng` AS `lng`,`wf_building_base`.`address` AS `address`,`wf_building_base`.`startTime` AS `startTime`,`wf_building_base`.`startByname` AS `startByname`,`wf_building_base`.`joinTime` AS `joinTime`,`wf_building_base`.`joinByname` AS `joinByname`,`wf_building_base`.`adTitle` AS `adTitle`,`wf_building_base`.`reason` AS `reason`,`wf_building_base`.`decoration` AS `decoration`,`wf_building_base`.`buildingNum` AS `buildingNum`,`wf_building_base`.`houseNum` AS `houseNum`,`wf_building_base`.`parkingNum` AS `parkingNum`,`wf_building_base`.`recommendRoom` AS `recommendRoom`,`wf_building_base`.`room` AS `room`,`wf_building_base`.`sellerId` AS `sellerId`,`wf_building_base`.`sellerName` AS `sellerName`,`wf_building_base`.`sellerTel` AS `sellerTel`,`wf_building_base`.`boundAt` AS `boundAt`,`wf_building_base`.`weightByname` AS `weightByname`,`wf_building_base`.`weightScore` AS `weightScore`,`wf_building_base`.`updatedBy` AS `updatedBy`,`wf_building_base`.`updatedAt` AS `updatedAt`,`wf_building_base`.`fieldScore` AS `fieldScore`,`wf_building_base`.`youhui` AS `youhui`,`wf_building_base`.`gift` AS `gift`,`wf_building_base`.`createdBy` AS `createdBy`,`wf_building_base`.`createdAt` AS `createdAt`,`wf_building_base`.`status` AS `status`,`wf_building_base`.`patent` AS `patent`,`wf_building_sale`.`priceMax` AS `priceMax`,`wf_building_sale`.`priceMin` AS `priceMin`,`wf_building_sale`.`priceAvg` AS `priceAvg`,`wf_building_sale`.`priceSum` AS `priceSum`,`wf_building_sale`.`saleStatus` AS `saleStatus`,`wf_building_count`.`buildingId` AS `buildingId`,`wf_building_count`.`roomNum` AS `roomNum` from ((`wf_building_base` left join `wf_building_sale` on((`wf_building_base`.`id` = `wf_building_sale`.`buildingId`))) left join `wf_building_count` on((`wf_building_base`.`id` = `wf_building_count`.`buildingId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vdichan_building_message_base`
--
DROP TABLE IF EXISTS `wf_vdichan_building_message_base`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vdichan_building_message_base` AS select `wf_building_message`.`id` AS `id`,`wf_building_message`.`buildingId` AS `buildingId`,`wf_building_message`.`title` AS `title`,`wf_building_message`.`type` AS `type`,`wf_building_message`.`releaseAt` AS `releaseAt`,`wf_building_message`.`content` AS `content`,`wf_building_message`.`remark` AS `remark`,`wf_building_message`.`click` AS `click`,`wf_building_message`.`emailNum` AS `emailNum`,`wf_building_message`.`SMSNum` AS `SMSNum`,`wf_building_message`.`updatedBy` AS `updatedBy`,`wf_building_message`.`updatedAt` AS `updatedAt`,`wf_building_message`.`createdBy` AS `createdBy`,`wf_building_message`.`createdAt` AS `createdAt`,`wf_building_message`.`status` AS `status`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`province` AS `province`,`wf_building_base`.`titlePinyin` AS `titlePinyin` from (`wf_building_message` left join `wf_building_base` on((`wf_building_message`.`buildingId` = `wf_building_base`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vdujia_order`
--
DROP TABLE IF EXISTS `wf_vdujia_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wofang_local`@`%` SQL SECURITY DEFINER VIEW `wf_vdujia_order` AS select `wf_dujia_order`.`id` AS `id`,`wf_dujia_order`.`hotelId` AS `hotelId`,`wf_dujia_order`.`houseId` AS `houseId`,`wf_dujia_order`.`bkfast` AS `bkfast`,`wf_dujia_order`.`userId` AS `userId`,`wf_dujia_order`.`inDate` AS `inDate`,`wf_dujia_order`.`outDate` AS `outDate`,`wf_dujia_order`.`odPriceBase` AS `odPriceBase`,`wf_dujia_order`.`odPrice` AS `odPrice`,`wf_dujia_order`.`bedType` AS `bedType`,`wf_dujia_order`.`odRoomNum` AS `odRoomNum`,`wf_dujia_order`.`odName` AS `odName`,`wf_dujia_order`.`odTel` AS `odTel`,`wf_dujia_order`.`odNotes` AS `odNotes`,`wf_dujia_order`.`needBill` AS `needBill`,`wf_dujia_order`.`billName` AS `billName`,`wf_dujia_order`.`odStatus` AS `odStatus`,`wf_dujia_order`.`notes` AS `notes`,`wf_dujia_order`.`createdAt` AS `createdAt`,`wf_dujia_order`.`updatedAt` AS `updatedAt`,`wf_dujia_order`.`status` AS `status`,`wf_dujia_hotel`.`city` AS `city`,`wf_dujia_hotel`.`county` AS `county`,`wf_dujia_hotel`.`name` AS `name`,`wf_dujia_hotel`.`pic` AS `pic`,`wf_dujia_hotel`.`address` AS `address`,`wf_dujia_hotel`.`rank` AS `rank`,`wf_dujia_hotel_house`.`title` AS `title`,`wf_dujia_hotel_house`.`fangxingId` AS `fangxingId`,`wf_dujia_hotel_house`.`youhui` AS `youhui`,`wf_dujia_hotel_house`.`pic` AS `housePic`,`wf_dujia_hotel_house`.`youhuiPrice` AS `youhuiPrice` from ((`wf_dujia_order` join `wf_dujia_hotel` on((`wf_dujia_order`.`hotelId` = `wf_dujia_hotel`.`id`))) join `wf_dujia_hotel_house` on((`wf_dujia_order`.`houseId` = `wf_dujia_hotel_house`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vdujia_price_house`
--
DROP TABLE IF EXISTS `wf_vdujia_price_house`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vdujia_price_house` AS select `wf_dujia_hotel_price`.`id` AS `id`,`wf_dujia_hotel_price`.`hotelId` AS `hotelId`,`wf_dujia_hotel_price`.`houseId` AS `houseId`,`wf_dujia_hotel_price`.`kucun` AS `kucun`,`wf_dujia_hotel_price`.`bkfast` AS `bkfast`,`wf_dujia_hotel_price`.`price` AS `price`,`wf_dujia_hotel_price`.`date` AS `date`,`wf_dujia_hotel_price`.`createdAt` AS `createdAt`,`wf_dujia_hotel_house`.`fangxingId` AS `fangxingId`,`wf_dujia_hotel_house`.`title` AS `title`,`wf_dujia_hotel_house`.`youhui` AS `youhui`,`wf_dujia_hotel_house`.`pic` AS `pic`,`wf_dujia_hotel`.`province` AS `province`,`wf_dujia_hotel`.`city` AS `city`,`wf_dujia_hotel`.`county` AS `county`,`wf_dujia_hotel`.`name` AS `name`,`wf_dujia_hotel`.`pic` AS `hotelPic`,`wf_dujia_hotel`.`address` AS `address`,`wf_dujia_hotel`.`fuwu` AS `fuwu`,`wf_dujia_hotel`.`sheshi` AS `sheshi`,`wf_dujia_hotel`.`floor` AS `floor`,`wf_dujia_hotel`.`num` AS `num`,`wf_dujia_hotel`.`flag` AS `flag`,`wf_dujia_hotel`.`oldName` AS `oldName`,`wf_dujia_hotel`.`rank` AS `rank`,`wf_dujia_hotel`.`status` AS `hotelStatus`,`wf_dujia_hotel_house`.`status` AS `status`,`wf_dujia_hotel`.`mapLat` AS `mapLat`,`wf_dujia_hotel`.`mapLng` AS `mapLng` from ((`wf_dujia_hotel_price` join `wf_dujia_hotel_house` on((`wf_dujia_hotel_price`.`houseId` = `wf_dujia_hotel_house`.`id`))) join `wf_dujia_hotel` on((`wf_dujia_hotel_house`.`hotelId` = `wf_dujia_hotel`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfencount_clientbuilding`
--
DROP TABLE IF EXISTS `wf_vfencount_clientbuilding`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfencount_clientbuilding` AS select date_format(from_unixtime(`wf_fenxiao_dealbuilding`.`createdAt`),'%Y-%m-%d') AS `times`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_dealbuilding`.`city` AS `city`,`wf_fenxiao_dealbuilding`.`createdAt` AS `createdAt`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_dealbuilding`.`payWay` AS `payWay`,`wf_role_user`.`departmentId` AS `departmentId`,`wf_fenxiao_dealbuilding`.`id` AS `id` from ((`wf_fenxiao_client` join `wf_fenxiao_dealbuilding` on((`wf_fenxiao_dealbuilding`.`clientId` = `wf_fenxiao_client`.`id`))) join `wf_role_user` on((`wf_role_user`.`id` = `wf_fenxiao_client`.`belongUserId`))) where (`wf_fenxiao_dealbuilding`.`status` = 5);

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client` AS select `wf_fenxiao_client`.`id` AS `id`,`wf_fenxiao_client`.`userId` AS `userId`,`wf_fenxiao_client`.`userName` AS `userName`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`sex` AS `sex`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_client`.`city` AS `city`,`wf_fenxiao_client`.`address` AS `address`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_client`.`agentName` AS `agentName`,`wf_fenxiao_client`.`agentTel` AS `agentTel`,`wf_fenxiao_client`.`tel` AS `tel`,`wf_fenxiao_client`.`phone` AS `phone`,`wf_fenxiao_client`.`otherPhone` AS `otherPhone`,`wf_fenxiao_client`.`email` AS `email`,`wf_fenxiao_client`.`QQ` AS `QQ`,`wf_fenxiao_client`.`requireType` AS `requireType`,`wf_fenxiao_client`.`askType` AS `askType`,`wf_fenxiao_client`.`askDate` AS `askDate`,`wf_fenxiao_client`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_client`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`serviceStatus` AS `serviceStatus`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`firstUserId` AS `firstUserId`,`wf_fenxiao_client`.`firstUser` AS `firstUser`,`wf_fenxiao_client`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`arrangeUser` AS `arrangeUser`,`wf_fenxiao_client`.`changeClient` AS `changeClient`,`wf_fenxiao_client`.`status` AS `status`,`wf_fenxiao_client`.`belongPid` AS `belongPid`,`wf_fenxiao_client`.`changeAt` AS `changeAt`,`wf_fenxiao_client`.`agentId` AS `agentId`,`wf_fenxiao_client`.`jobType` AS `jobType`,`wf_fenxiao_client`.`visitHouseAt` AS `visitHouseAt`,`wf_role_user`.`roleId` AS `roleId`,`wf_role_user`.`isAnchang` AS `isAnchang`,`wf_fenxiao_client`.`isBargain` AS `isBargain`,`wf_fenxiao_client`.`visitNum` AS `visitNum`,`wf_fenxiao_client`.`createdAt` AS `createdAt`,`wf_fenxiao_client`.`agentSaleName` AS `agentSaleName`,`wf_fenxiao_client`.`agentSaleTel` AS `agentSaleTel`,`wf_role_user`.`clientType` AS `clientType`,`wf_fenxiao_client`.`isguanjia` AS `isguanjia`,`wf_fenxiao_client`.`fitmentId` AS `fitmentId`,`wf_fenxiao_client`.`agentAt` AS `agentAt`,`wf_fenxiao_client`.`no3hourVisit` AS `no3hourVisit`,`wf_fenxiao_client`.`category` AS `category`,`wf_role_user`.`roleCate` AS `roleCate` from (`wf_fenxiao_client` left join `wf_role_user` on((`wf_fenxiao_client`.`belongUserId` = `wf_role_user`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_clientfollow`
--
DROP TABLE IF EXISTS `wf_vfenxiao_clientfollow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_clientfollow` AS select `wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`sex` AS `sex`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_client`.`city` AS `city`,`wf_fenxiao_client`.`address` AS `address`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_client`.`tel` AS `tel`,`wf_fenxiao_client`.`requireType` AS `requireType`,`wf_fenxiao_client`.`askType` AS `askType`,`wf_fenxiao_client`.`askDate` AS `askDate`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`serviceStatus` AS `serviceStatus`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`firstUserId` AS `firstUserId`,`wf_fenxiao_client`.`firstUser` AS `firstUser`,`wf_fenxiao_property`.`clientPoint` AS `clientPoint`,`wf_fenxiao_client`.`id` AS `id`,`wf_fenxiao_client`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_client`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_client`.`userName` AS `userName`,`wf_fenxiao_client`.`email` AS `email`,`wf_fenxiao_client`.`QQ` AS `QQ`,`wf_fenxiao_client`.`phone` AS `phone`,`wf_fenxiao_client`.`otherName` AS `otherName`,`wf_fenxiao_client`.`otherPhone` AS `otherPhone`,`wf_fenxiao_client`.`status` AS `status`,`wf_fenxiao_client`.`changeClient` AS `changeClient`,`wf_fenxiao_property`.`buyCity` AS `buyCity`,`wf_fenxiao_property`.`preference` AS `preference`,`wf_fenxiao_property`.`unitPrice` AS `unitPrice`,`wf_fenxiao_property`.`unitPrice1` AS `unitPrice1`,`wf_fenxiao_property`.`totalPrice` AS `totalPrice`,`wf_fenxiao_property`.`totalPrice1` AS `totalPrice1`,`wf_fenxiao_property`.`roomType` AS `roomType`,`wf_fenxiao_property`.`createdBy` AS `createdBy`,`wf_fenxiao_property`.`updatedAt` AS `updatedAt`,`wf_fenxiao_property`.`createdAt` AS `createdAt`,`wf_fenxiao_property`.`purpose` AS `purpose`,`wf_fenxiao_property`.`area` AS `area`,`wf_fenxiao_property`.`fitment` AS `fitment`,`wf_fenxiao_property`.`propertyType` AS `propertyType`,`wf_fenxiao_property`.`buyNum` AS `buyNum`,`wf_fenxiao_property`.`fitment1` AS `fitment1`,`wf_fenxiao_client`.`belongPid` AS `belongPid`,`wf_fenxiao_property`.`propertyNotes` AS `propertyNotes`,`wf_fenxiao_client`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`arrangeUser` AS `arrangeUser`,`wf_role_user`.`roleId` AS `roleId` from ((`wf_fenxiao_client` join `wf_fenxiao_property` on((`wf_fenxiao_property`.`clientId` = `wf_fenxiao_client`.`id`))) join `wf_role_user` on((`wf_fenxiao_client`.`belongUser` = `wf_role_user`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_arrange`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_arrange`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_arrange` AS select `wf_fenxiao_arrange`.`clientId` AS `clientId`,`wf_fenxiao_arrange`.`toDate` AS `toDate`,`wf_fenxiao_arrange`.`backDate` AS `backDate`,`wf_fenxiao_arrange`.`billDate` AS `billDate`,`wf_fenxiao_arrange`.`seeDate` AS `seeDate`,`wf_fenxiao_arrange`.`way` AS `way`,`wf_fenxiao_arrange`.`ticket` AS `ticket`,`wf_fenxiao_arrange`.`hotelOrder` AS `hotelOrder`,`wf_fenxiao_arrange`.`carOrder` AS `carOrder`,`wf_fenxiao_arrange`.`id` AS `id`,`wf_fenxiao_arrange`.`status` AS `status`,`wf_fenxiao_arrange`.`saleNotes` AS `saleNotes`,`wf_fenxiao_arrange`.`saleId` AS `saleId`,`wf_fenxiao_arrange`.`saleName` AS `saleName`,`wf_fenxiao_arrange`.`serviceNotes` AS `serviceNotes`,`wf_fenxiao_arrange`.`serviceName` AS `serviceName`,`wf_fenxiao_arrange`.`serviceDate` AS `serviceDate`,`wf_fenxiao_arrange`.`travelNotes` AS `travelNotes`,`wf_fenxiao_arrange`.`travelName` AS `travelName`,`wf_fenxiao_arrange`.`travelId` AS `travelId`,`wf_fenxiao_arrange`.`seeStatus` AS `seeStatus`,`wf_fenxiao_arrange`.`isSum` AS `isSum`,`wf_fenxiao_arrange`.`driver` AS `driver`,`wf_fenxiao_arrange`.`useCar` AS `useCar`,`wf_fenxiao_arrange`.`createdAt` AS `createdAt`,`wf_fenxiao_arrange`.`arrangeUser` AS `arrangeUser`,`wf_fenxiao_arrange`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_client`.`city` AS `city`,`wf_fenxiao_client`.`askDate` AS `askDate`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`firstUser` AS `firstUser`,`wf_fenxiao_client`.`firstUserId` AS `firstUserId`,`wf_fenxiao_client`.`agentId` AS `agentId`,`wf_fenxiao_client`.`isAnchang` AS `isAnchang` from (`wf_fenxiao_arrange` join `wf_fenxiao_client` on((`wf_fenxiao_arrange`.`clientId` = `wf_fenxiao_client`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_arrangers`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_arrangers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_arrangers` AS select `wf_fenxiao_client`.`id` AS `id`,`wf_fenxiao_client`.`tel` AS `tel`,`wf_fenxiao_client`.`phone` AS `phone`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`arrangeUser` AS `arrangeUser`,`wf_vrole1`.`clientType` AS `clientType1`,`wf_vrole`.`isAnchang` AS `isAnchang`,`wf_vrole`.`clientType` AS `clientType`,`wf_fenxiao_client_tel`.`tel` AS `xtel`,`wf_fenxiao_client_tel`.`phone` AS `xphone`,`wf_fenxiao_client_tel`.`otherPhone` AS `xotherPhone`,`wf_fenxiao_arrangers`.`arrangeName` AS `arrangeName`,`wf_vrole2`.`clientType` AS `clientType2`,`wf_fenxiao_client`.`status` AS `status`,`wf_vrole1`.`isAnchang` AS `isAnchang1`,`wf_vrole2`.`isAnchang` AS `isAnchang2`,`wf_fenxiao_client`.`otherPhone` AS `otherPhone` from (((((`wf_fenxiao_client` left join `wf_vrole` `wf_vrole1` on((`wf_fenxiao_client`.`arrangeId` = `wf_vrole1`.`userId`))) left join `wf_vrole` on((`wf_fenxiao_client`.`belongUserId` = `wf_vrole`.`userId`))) left join `wf_fenxiao_client_tel` on((`wf_fenxiao_client`.`id` = `wf_fenxiao_client_tel`.`id`))) left join `wf_fenxiao_arrangers` on((`wf_fenxiao_client_tel`.`id` = `wf_fenxiao_arrangers`.`clientId`))) left join `wf_vrole` `wf_vrole2` on((`wf_fenxiao_arrangers`.`clientId` = `wf_vrole2`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_arranges_tel`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_arranges_tel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_arranges_tel` AS select `wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_arrangers`.`arrangeName` AS `arrangeName`,`wf_fenxiao_arrangers`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`status` AS `status`,`wf_fenxiao_arrangers`.`timeAt` AS `timeAt`,`wf_fenxiao_client`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_arrangers`.`clientLevel` AS `clientLevel`,`wf_fenxiao_tel`.`tel` AS `tel`,`wf_fenxiao_tel`.`xtel` AS `xtel`,`wf_fenxiao_tel`.`clientId` AS `clientId`,`wf_fenxiao_tel`.`id` AS `id`,`wf_fenxiao_arrangers`.`isBargain` AS `isBargain`,`wf_fenxiao_tel`.`telName` AS `telName`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_role_user`.`roleId` AS `roleId`,`wf_role_user`.`isAnchang` AS `isAnchang`,`wf_role_user`.`clientType` AS `clientType`,`wf_role_user`.`roleArea` AS `roleArea`,`wf_role_user2`.`roleId` AS `roleId2`,`wf_role_user2`.`isAnchang` AS `isAnchang2`,`wf_role_user2`.`clientType` AS `clientType2`,`wf_role_user2`.`roleArea` AS `roleArea2`,`wf_role_user`.`departmentId` AS `departmentId`,`wf_role_user2`.`departmentId` AS `departmentId2`,`wf_fenxiao_client`.`city` AS `city`,`wf_fenxiao_client`.`createdAt` AS `createdAt`,`wf_fenxiao_client`.`changeAt` AS `changeAt` from ((((`wf_fenxiao_tel` join `wf_fenxiao_client` on((`wf_fenxiao_tel`.`clientId` = `wf_fenxiao_client`.`id`))) left join `wf_fenxiao_arrangers` on((`wf_fenxiao_client`.`id` = `wf_fenxiao_arrangers`.`clientId`))) left join `wf_role_user` on((`wf_role_user`.`id` = `wf_fenxiao_client`.`belongUserId`))) left join `wf_role_user` `wf_role_user2` on((`wf_role_user2`.`id` = `wf_fenxiao_arrangers`.`arrangeId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_arrange_agent`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_arrange_agent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_arrange_agent` AS select `wf_fenxiao_arrange`.`clientId` AS `clientId`,`wf_fenxiao_arrange`.`toDate` AS `toDate`,`wf_fenxiao_arrange`.`backDate` AS `backDate`,`wf_fenxiao_arrange`.`billDate` AS `billDate`,`wf_fenxiao_arrange`.`seeDate` AS `seeDate`,`wf_fenxiao_arrange`.`way` AS `way`,`wf_fenxiao_arrange`.`ticket` AS `ticket`,`wf_fenxiao_arrange`.`hotelOrder` AS `hotelOrder`,`wf_fenxiao_arrange`.`carOrder` AS `carOrder`,`wf_fenxiao_arrange`.`id` AS `id`,`wf_fenxiao_arrange`.`status` AS `status`,`wf_fenxiao_arrange`.`saleNotes` AS `saleNotes`,`wf_fenxiao_arrange`.`saleId` AS `saleId`,`wf_fenxiao_arrange`.`saleName` AS `saleName`,`wf_fenxiao_arrange`.`serviceNotes` AS `serviceNotes`,`wf_fenxiao_arrange`.`serviceName` AS `serviceName`,`wf_fenxiao_arrange`.`serviceDate` AS `serviceDate`,`wf_fenxiao_arrange`.`travelNotes` AS `travelNotes`,`wf_fenxiao_arrange`.`travelName` AS `travelName`,`wf_fenxiao_arrange`.`travelId` AS `travelId`,`wf_fenxiao_arrange`.`seeStatus` AS `seeStatus`,`wf_fenxiao_arrange`.`isSum` AS `isSum`,`wf_fenxiao_arrange`.`driver` AS `driver`,`wf_fenxiao_arrange`.`useCar` AS `useCar`,`wf_fenxiao_arrange`.`arrangeId` AS `arrangeId`,`wf_fenxiao_arrange`.`arrangeUser` AS `arrangeUser`,`wf_vclient_role`.`clientName` AS `clientName`,`wf_vclient_role`.`province` AS `province`,`wf_vclient_role`.`city` AS `city`,`wf_vclient_role`.`tel` AS `tel`,`wf_vclient_role`.`otherPhone` AS `otherPhone`,`wf_vclient_role`.`askDate` AS `askDate`,`wf_vclient_role`.`belongUser` AS `belongUser`,`wf_vclient_role`.`belongUserId` AS `belongUserId`,`wf_vclient_role`.`firstUser` AS `firstUser`,`wf_vclient_role`.`belongPid` AS `belongPid`,`wf_vclient_role`.`clientType` AS `clientType`,`wf_vclient_role`.`roleId` AS `roleId`,`wf_vclient_role`.`arrangeRoleId` AS `arrangeRoleId`,`wf_vagent_role`.`agentName` AS `agentName`,`wf_vagent_role`.`agentUserId` AS `agentUserId`,`wf_vagent_role`.`agentRoleId` AS `agentRoleId` from ((`wf_fenxiao_arrange` join `wf_vclient_role` on((`wf_fenxiao_arrange`.`clientId` = `wf_vclient_role`.`id`))) left join `wf_vagent_role` on((`wf_vclient_role`.`agentId` = `wf_vagent_role`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_deal`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_deal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_deal` AS select `wf_fenxiao_dealbuilding`.`clientId` AS `clientId`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_dealbuilding`.`id` AS `dealId`,`wf_fenxiao_dealbuilding`.`title` AS `title`,`wf_fenxiao_dealbuilding`.`houseNo` AS `houseNo`,`wf_fenxiao_dealbuilding`.`area` AS `area`,`wf_fenxiao_dealbuilding`.`eachPrice` AS `eachPrice`,`wf_fenxiao_dealbuilding`.`total` AS `total`,`wf_fenxiao_dealbuilding`.`earnestDate` AS `earnestDate`,`wf_fenxiao_dealbuilding`.`signDate` AS `signDate`,`wf_fenxiao_dealbuilding`.`payWay` AS `payWay`,`wf_fenxiao_dealbuilding`.`dealNotes` AS `dealNotes`,`wf_fenxiao_dealbuilding`.`results` AS `results`,`wf_fenxiao_client`.`sex` AS `sex`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_client`.`city` AS `city`,`wf_fenxiao_client`.`askType` AS `askType`,`wf_fenxiao_client`.`askDate` AS `askDate`,`wf_fenxiao_client`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_client`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`serviceStatus` AS `serviceStatus`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`firstUserId` AS `firstUserId`,`wf_fenxiao_client`.`firstUser` AS `firstUser`,`wf_fenxiao_client`.`status` AS `status`,`wf_fenxiao_client`.`agentId` AS `agentId`,`wf_fenxiao_client`.`agentNextId` AS `agentNextId`,`wf_fenxiao_client`.`id` AS `id`,`wf_fenxiao_client`.`isBargain` AS `isBargain`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_dealbuilding`.`buildingId` AS `buildingId`,`wf_fenxiao_dealbuilding`.`city` AS `dealCity`,`wf_fenxiao_dealbuilding`.`preferencePrice` AS `preferencePrice`,`wf_fenxiao_dealbuilding`.`point` AS `point`,`wf_fenxiao_dealbuilding`.`status` AS `dealStatus`,`wf_fenxiao_dealbuilding`.`isBack` AS `isBack` from (`wf_fenxiao_client` left join `wf_fenxiao_dealbuilding` on((`wf_fenxiao_dealbuilding`.`clientId` = `wf_fenxiao_client`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_property`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_property`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_property` AS select `wf_fenxiao_property`.`clientPoint` AS `clientPoint`,`wf_fenxiao_property`.`buyCity` AS `buyCity`,`wf_fenxiao_property`.`preference` AS `preference`,`wf_fenxiao_property`.`unitPrice` AS `unitPrice`,`wf_fenxiao_property`.`unitPrice1` AS `unitPrice1`,`wf_fenxiao_property`.`totalPrice` AS `totalPrice`,`wf_fenxiao_property`.`totalPrice1` AS `totalPrice1`,`wf_fenxiao_property`.`roomType` AS `roomType`,`wf_fenxiao_property`.`createdBy` AS `createdBy`,`wf_fenxiao_property`.`updatedAt` AS `updatedAt`,`wf_fenxiao_property`.`createdAt` AS `createdAt`,`wf_fenxiao_property`.`purpose` AS `purpose`,`wf_fenxiao_property`.`area` AS `area`,`wf_fenxiao_property`.`fitment` AS `fitment`,`wf_fenxiao_property`.`propertyType` AS `propertyType`,`wf_fenxiao_property`.`buyNum` AS `buyNum`,`wf_fenxiao_property`.`fitment1` AS `fitment1`,`wf_fenxiao_property`.`propertyNotes` AS `propertyNotes`,`wf_vclient_role`.`id` AS `id`,`wf_vclient_role`.`userId` AS `userId`,`wf_vclient_role`.`userName` AS `userName`,`wf_vclient_role`.`clientName` AS `clientName`,`wf_vclient_role`.`sex` AS `sex`,`wf_vclient_role`.`province` AS `province`,`wf_vclient_role`.`city` AS `city`,`wf_vclient_role`.`address` AS `address`,`wf_vclient_role`.`clientFrom` AS `clientFrom`,`wf_vclient_role`.`agentName` AS `agentName`,`wf_vclient_role`.`agentTel` AS `agentTel`,`wf_vclient_role`.`tel` AS `tel`,`wf_vclient_role`.`phone` AS `phone`,`wf_vclient_role`.`otherName` AS `otherName`,`wf_vclient_role`.`otherPhone` AS `otherPhone`,`wf_vclient_role`.`email` AS `email`,`wf_vclient_role`.`QQ` AS `QQ`,`wf_vclient_role`.`requireType` AS `requireType`,`wf_vclient_role`.`askType` AS `askType`,`wf_vclient_role`.`askDate` AS `askDate`,`wf_vclient_role`.`lastVisitDate` AS `lastVisitDate`,`wf_vclient_role`.`nextVisitDate` AS `nextVisitDate`,`wf_vclient_role`.`clientLevel` AS `clientLevel`,`wf_vclient_role`.`serviceStatus` AS `serviceStatus`,`wf_vclient_role`.`belongUserId` AS `belongUserId`,`wf_vclient_role`.`belongUser` AS `belongUser`,`wf_vclient_role`.`firstUserId` AS `firstUserId`,`wf_vclient_role`.`firstUser` AS `firstUser`,`wf_vclient_role`.`arrangeId` AS `arrangeId`,`wf_vclient_role`.`arrangeUser` AS `arrangeUser`,`wf_vclient_role`.`changeClient` AS `changeClient`,`wf_vclient_role`.`status` AS `status`,`wf_vclient_role`.`belongPid` AS `belongPid`,`wf_vclient_role`.`changeAt` AS `changeAt`,`wf_vclient_role`.`agentId` AS `agentId`,`wf_vclient_role`.`isAnchang` AS `isAnchang`,`wf_vclient_role`.`jobType` AS `jobType`,`wf_vclient_role`.`visitHouseAt` AS `visitHouseAt`,`wf_vclient_role`.`isBargain` AS `isBargain`,`wf_vclient_role`.`roleId` AS `roleId`,`wf_vclient_role`.`clientType` AS `clientType`,`wf_vclient_role`.`arrangeRoleId` AS `arrangeRoleId`,`wf_fenxiao_property`.`seeItem` AS `seeItem`,`wf_vclient_role`.`fitmentId` AS `fitmentId` from (`wf_fenxiao_property` join `wf_vclient_role` on((`wf_fenxiao_property`.`clientId` = `wf_vclient_role`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_property_agent`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_property_agent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_property_agent` AS select `wf_fenxiao_property`.`clientPoint` AS `clientPoint`,`wf_fenxiao_property`.`buyCity` AS `buyCity`,`wf_fenxiao_property`.`preference` AS `preference`,`wf_fenxiao_property`.`unitPrice` AS `unitPrice`,`wf_fenxiao_property`.`unitPrice1` AS `unitPrice1`,`wf_fenxiao_property`.`totalPrice` AS `totalPrice`,`wf_fenxiao_property`.`totalPrice1` AS `totalPrice1`,`wf_fenxiao_property`.`roomType` AS `roomType`,`wf_fenxiao_property`.`createdBy` AS `createdBy`,`wf_fenxiao_property`.`updatedAt` AS `updatedAt`,`wf_fenxiao_property`.`createdAt` AS `createdAt`,`wf_fenxiao_property`.`purpose` AS `purpose`,`wf_fenxiao_property`.`area` AS `area`,`wf_fenxiao_property`.`fitment` AS `fitment`,`wf_fenxiao_property`.`propertyType` AS `propertyType`,`wf_fenxiao_property`.`buyNum` AS `buyNum`,`wf_fenxiao_property`.`fitment1` AS `fitment1`,`wf_fenxiao_property`.`propertyNotes` AS `propertyNotes`,`wf_vclient_role`.`id` AS `id`,`wf_vclient_role`.`userId` AS `userId`,`wf_vclient_role`.`userName` AS `userName`,`wf_vclient_role`.`clientName` AS `clientName`,`wf_vclient_role`.`sex` AS `sex`,`wf_vclient_role`.`province` AS `province`,`wf_vclient_role`.`city` AS `city`,`wf_vclient_role`.`address` AS `address`,`wf_vclient_role`.`clientFrom` AS `clientFrom`,`wf_vclient_role`.`agentTel` AS `agentTel`,`wf_vclient_role`.`tel` AS `tel`,`wf_vclient_role`.`phone` AS `phone`,`wf_vclient_role`.`otherName` AS `otherName`,`wf_vclient_role`.`otherPhone` AS `otherPhone`,`wf_vclient_role`.`email` AS `email`,`wf_vclient_role`.`QQ` AS `QQ`,`wf_vclient_role`.`requireType` AS `requireType`,`wf_vclient_role`.`askType` AS `askType`,`wf_vclient_role`.`askDate` AS `askDate`,`wf_vclient_role`.`lastVisitDate` AS `lastVisitDate`,`wf_vclient_role`.`nextVisitDate` AS `nextVisitDate`,`wf_vclient_role`.`clientLevel` AS `clientLevel`,`wf_vclient_role`.`serviceStatus` AS `serviceStatus`,`wf_vclient_role`.`belongUserId` AS `belongUserId`,`wf_vclient_role`.`belongUser` AS `belongUser`,`wf_vclient_role`.`firstUserId` AS `firstUserId`,`wf_vclient_role`.`firstUser` AS `firstUser`,`wf_vclient_role`.`arrangeId` AS `arrangeId`,`wf_vclient_role`.`arrangeUser` AS `arrangeUser`,`wf_vclient_role`.`changeClient` AS `changeClient`,`wf_vclient_role`.`status` AS `status`,`wf_vclient_role`.`belongPid` AS `belongPid`,`wf_vclient_role`.`changeAt` AS `changeAt`,`wf_vclient_role`.`agentId` AS `agentId`,`wf_vclient_role`.`isAnchang` AS `isAnchang`,`wf_vclient_role`.`jobType` AS `jobType`,`wf_vclient_role`.`visitHouseAt` AS `visitHouseAt`,`wf_vclient_role`.`isBargain` AS `isBargain`,`wf_vclient_role`.`roleId` AS `roleId`,`wf_vclient_role`.`clientType` AS `clientType`,`wf_vclient_role`.`arrangeRoleId` AS `arrangeRoleId`,`wf_vagent_role`.`agentUserId` AS `agentUserId`,`wf_vagent_role`.`agentRoleId` AS `agentRoleId`,`wf_vclient_role`.`agentName` AS `agentName` from ((`wf_fenxiao_property` join `wf_vclient_role` on((`wf_fenxiao_property`.`clientId` = `wf_vclient_role`.`id`))) left join `wf_vagent_role` on((`wf_vclient_role`.`agentId` = `wf_vagent_role`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_summary`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_summary` AS select `wf_fenxiao_summary`.`id` AS `id`,`wf_fenxiao_summary`.`clientId` AS `clientId`,`wf_fenxiao_summary`.`days` AS `days`,`wf_fenxiao_summary`.`receptTim` AS `receptTim`,`wf_fenxiao_arrange`.`seeStatus` AS `seeStatus`,`wf_vclient_role`.`arrangeRoleId` AS `arrangeRoleId`,`wf_vclient_role`.`roleId` AS `roleId`,`wf_vclient_role`.`belongPid` AS `belongPid`,`wf_vclient_role`.`arrangeUser` AS `arrangeUser`,`wf_vclient_role`.`arrangeId` AS `arrangeId`,`wf_vclient_role`.`belongUser` AS `belongUser`,`wf_vclient_role`.`belongUserId` AS `belongUserId`,`wf_vclient_role`.`city` AS `city`,`wf_vclient_role`.`province` AS `province`,`wf_vclient_role`.`clientName` AS `clientName`,`wf_fenxiao_summary`.`status` AS `status` from ((`wf_fenxiao_summary` join `wf_fenxiao_arrange` on((`wf_fenxiao_summary`.`clientId` = `wf_fenxiao_arrange`.`clientId`))) join `wf_vclient_role` on((`wf_fenxiao_summary`.`clientId` = `wf_vclient_role`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_summary_deal`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_summary_deal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_summary_deal` AS select `wf_vfenxiao_client_property`.`clientPoint` AS `clientPoint`,`wf_vfenxiao_client_property`.`buyCity` AS `buyCity`,`wf_vfenxiao_client_property`.`preference` AS `preference`,`wf_vfenxiao_client_property`.`unitPrice` AS `unitPrice`,`wf_vfenxiao_client_property`.`unitPrice1` AS `unitPrice1`,`wf_vfenxiao_client_property`.`totalPrice` AS `totalPrice`,`wf_vfenxiao_client_property`.`totalPrice1` AS `totalPrice1`,`wf_vfenxiao_client_property`.`roomType` AS `roomType`,`wf_vfenxiao_client_property`.`createdBy` AS `createdBy`,`wf_vfenxiao_client_property`.`updatedAt` AS `updatedAt`,`wf_vfenxiao_client_property`.`createdAt` AS `createdAt`,`wf_vfenxiao_client_property`.`purpose` AS `purpose`,`wf_vfenxiao_client_property`.`fitment` AS `fitment`,`wf_vfenxiao_client_property`.`propertyType` AS `propertyType`,`wf_vfenxiao_client_property`.`buyNum` AS `buyNum`,`wf_vfenxiao_client_property`.`fitment1` AS `fitment1`,`wf_vfenxiao_client_property`.`propertyNotes` AS `propertyNotes`,`wf_vfenxiao_client_property`.`id` AS `id`,`wf_vfenxiao_client_property`.`userId` AS `userId`,`wf_vfenxiao_client_property`.`userName` AS `userName`,`wf_vfenxiao_client_property`.`clientName` AS `clientName`,`wf_vfenxiao_client_property`.`sex` AS `sex`,`wf_vfenxiao_client_property`.`province` AS `province`,`wf_vfenxiao_client_property`.`city` AS `city`,`wf_vfenxiao_client_property`.`address` AS `address`,`wf_vfenxiao_client_property`.`clientFrom` AS `clientFrom`,`wf_vfenxiao_client_property`.`agentName` AS `agentName`,`wf_vfenxiao_client_property`.`agentTel` AS `agentTel`,`wf_vfenxiao_client_property`.`tel` AS `tel`,`wf_vfenxiao_client_property`.`phone` AS `phone`,`wf_vfenxiao_client_property`.`otherName` AS `otherName`,`wf_vfenxiao_client_property`.`otherPhone` AS `otherPhone`,`wf_vfenxiao_client_property`.`email` AS `email`,`wf_vfenxiao_client_property`.`QQ` AS `QQ`,`wf_vfenxiao_client_property`.`requireType` AS `requireType`,`wf_vfenxiao_client_property`.`askType` AS `askType`,`wf_vfenxiao_client_property`.`askDate` AS `askDate`,`wf_vfenxiao_client_property`.`lastVisitDate` AS `lastVisitDate`,`wf_vfenxiao_client_property`.`nextVisitDate` AS `nextVisitDate`,`wf_vfenxiao_client_property`.`clientLevel` AS `clientLevel`,`wf_vfenxiao_client_property`.`serviceStatus` AS `serviceStatus`,`wf_vfenxiao_client_property`.`belongUserId` AS `belongUserId`,`wf_vfenxiao_client_property`.`belongUser` AS `belongUser`,`wf_vfenxiao_client_property`.`firstUserId` AS `firstUserId`,`wf_vfenxiao_client_property`.`firstUser` AS `firstUser`,`wf_vfenxiao_client_property`.`arrangeId` AS `arrangeId`,`wf_vfenxiao_client_property`.`arrangeUser` AS `arrangeUser`,`wf_vfenxiao_client_property`.`changeClient` AS `changeClient`,`wf_vfenxiao_client_property`.`status` AS `status`,`wf_vfenxiao_client_property`.`belongPid` AS `belongPid`,`wf_vfenxiao_client_property`.`changeAt` AS `changeAt`,`wf_vfenxiao_client_property`.`agentId` AS `agentId`,`wf_vfenxiao_client_property`.`isAnchang` AS `isAnchang`,`wf_vfenxiao_client_property`.`jobType` AS `jobType`,`wf_vfenxiao_client_property`.`visitHouseAt` AS `visitHouseAt`,`wf_vfenxiao_client_property`.`isBargain` AS `isBargain`,`wf_vfenxiao_client_property`.`roleId` AS `roleId`,`wf_vfenxiao_client_property`.`clientType` AS `clientType`,`wf_vfenxiao_client_property`.`arrangeRoleId` AS `arrangeRoleId`,`wf_fenxiao_dealbuilding`.`title` AS `title`,`wf_fenxiao_dealbuilding`.`houseNo` AS `houseNo`,`wf_fenxiao_dealbuilding`.`id` AS `dealId`,`wf_fenxiao_dealbuilding`.`earnestDate` AS `earnestDate`,`wf_fenxiao_dealbuilding`.`total` AS `total`,`wf_fenxiao_dealbuilding`.`eachPrice` AS `eachPrice`,`wf_fenxiao_dealbuilding`.`area` AS `area`,`wf_fenxiao_dealbuilding`.`signDate` AS `signDate`,`wf_fenxiao_dealbuilding`.`payWay` AS `payWay`,`wf_fenxiao_dealbuilding`.`dealNotes` AS `dealNotes`,`wf_fenxiao_dealbuilding`.`results` AS `results` from (`wf_vfenxiao_client_property` join `wf_fenxiao_dealbuilding` on((`wf_vfenxiao_client_property`.`id` = `wf_fenxiao_dealbuilding`.`clientId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_visit`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_visit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_visit` AS select `wf_fenxiao_visit`.`id` AS `id`,`wf_fenxiao_visit`.`clientId` AS `clientId`,`wf_fenxiao_visit`.`visitId` AS `visitId`,`wf_fenxiao_visit`.`visitName` AS `visitName`,`wf_fenxiao_visit`.`way` AS `way`,`wf_fenxiao_visit`.`clientLevel` AS `clientLevel`,`wf_fenxiao_visit`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_visit`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_visit`.`status` AS `status`,`wf_fenxiao_visit`.`type` AS `type`,`wf_fenxiao_visit`.`updatedBy` AS `updatedBy`,`wf_fenxiao_visit`.`updatedAt` AS `updatedAt`,`wf_fenxiao_visit`.`createdBy` AS `createdBy`,`wf_fenxiao_visit`.`createdAt` AS `createdAt`,`wf_fenxiao_visit`.`serviceWay` AS `serviceWay`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`userName` AS `userName`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`province` AS `province`,`wf_fenxiao_client`.`city` AS `city`,`wf_fenxiao_client`.`agentName` AS `agentName`,`wf_fenxiao_client`.`agentTel` AS `agentTel`,`wf_fenxiao_client`.`askDate` AS `askDate`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`agentId` AS `agentId`,`wf_fenxiao_client`.`isBargain` AS `isBargain`,`wf_fenxiao_client`.`visitNum` AS `visitNum` from (`wf_fenxiao_visit` left join `wf_fenxiao_client` on((`wf_fenxiao_client`.`id` = `wf_fenxiao_visit`.`clientId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_visit2`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_visit2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_visit2` AS select `wf_fenxiao_visit`.`id` AS `id`,`wf_fenxiao_visit`.`clientId` AS `clientId`,`wf_fenxiao_visit`.`visitId` AS `visitId`,`wf_fenxiao_visit`.`visitName` AS `visitName`,`wf_fenxiao_visit`.`way` AS `way`,`wf_fenxiao_visit`.`serviceWay` AS `serviceWay`,`wf_fenxiao_visit`.`clientLevel` AS `clientLevel`,`wf_fenxiao_visit`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_visit`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_visit`.`status` AS `status`,`wf_fenxiao_visit`.`updatedBy` AS `updatedBy`,`wf_fenxiao_visit`.`updatedAt` AS `updatedAt`,`wf_fenxiao_visit`.`createdBy` AS `createdBy`,`wf_fenxiao_visit`.`createdAt` AS `createdAt`,`wf_fenxiao_visit`.`visitHouseAt` AS `visitHouseAt`,`wf_fenxiao_visit`.`type` AS `type`,`wf_fenxiao_visit`.`isNeedArrange` AS `isNeedArrange`,`wf_fenxiao_visit`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_vrole`.`clientType` AS `clientType` from ((`wf_fenxiao_visit` left join `wf_fenxiao_client` on((`wf_fenxiao_visit`.`clientId` = `wf_fenxiao_client`.`id`))) left join `wf_vrole` on((`wf_fenxiao_client`.`belongUserId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_client_visit_agent`
--
DROP TABLE IF EXISTS `wf_vfenxiao_client_visit_agent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_client_visit_agent` AS select `wf_fenxiao_visit`.`id` AS `id`,`wf_fenxiao_visit`.`clientId` AS `clientId`,`wf_fenxiao_visit`.`visitId` AS `visitId`,`wf_fenxiao_visit`.`visitName` AS `visitName`,`wf_fenxiao_visit`.`way` AS `way`,`wf_fenxiao_visit`.`clientLevel` AS `clientLevel`,`wf_fenxiao_visit`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_visit`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_visit`.`status` AS `status`,`wf_fenxiao_visit`.`type` AS `type`,`wf_fenxiao_visit`.`updatedBy` AS `updatedBy`,`wf_fenxiao_visit`.`updatedAt` AS `updatedAt`,`wf_fenxiao_visit`.`createdBy` AS `createdBy`,`wf_fenxiao_visit`.`createdAt` AS `createdAt`,`wf_vclient_role`.`userId` AS `userId`,`wf_vclient_role`.`clientName` AS `clientName`,`wf_vclient_role`.`province` AS `province`,`wf_vclient_role`.`city` AS `city`,`wf_vclient_role`.`askDate` AS `askDate`,`wf_vclient_role`.`belongUserId` AS `belongUserId`,`wf_vclient_role`.`belongUser` AS `belongUser`,`wf_vclient_role`.`arrangeUser` AS `arrangeUser`,`wf_vclient_role`.`arrangeId` AS `arrangeId`,`wf_vclient_role`.`belongPid` AS `belongPid`,`wf_vclient_role`.`roleId` AS `roleId`,`wf_vclient_role`.`clientType` AS `clientType`,`wf_vclient_role`.`arrangeRoleId` AS `arrangeRoleId`,`wf_vagent_role`.`agentName` AS `agentName`,`wf_vagent_role`.`agentUserId` AS `agentUserId`,`wf_vagent_role`.`agentRoleId` AS `agentRoleId`,`wf_vrole`.`roleId` AS `visitRoleId` from (((`wf_fenxiao_visit` join `wf_vclient_role` on((`wf_fenxiao_visit`.`clientId` = `wf_vclient_role`.`id`))) left join `wf_vagent_role` on((`wf_vclient_role`.`agentId` = `wf_vagent_role`.`id`))) join `wf_vrole` on((`wf_fenxiao_visit`.`visitId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_property`
--
DROP TABLE IF EXISTS `wf_vfenxiao_property`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_property` AS select `wf_fenxiao_property`.`preference` AS `preference`,`wf_fenxiao_property`.`unitPrice` AS `unitPrice`,`wf_fenxiao_property`.`unitPrice1` AS `unitPrice1`,`wf_fenxiao_property`.`totalPrice` AS `totalPrice`,`wf_fenxiao_property`.`totalPrice1` AS `totalPrice1`,`wf_fenxiao_property`.`roomType` AS `roomType`,`wf_fenxiao_property`.`createdBy` AS `createdBy`,`wf_fenxiao_property`.`clientPoint` AS `clientPoint`,`wf_fenxiao_property`.`updatedAt` AS `updatedAt`,`wf_fenxiao_property`.`createdAt` AS `createdAt`,`wf_fenxiao_property`.`purpose` AS `purpose`,`wf_fenxiao_property`.`area` AS `area`,`wf_fenxiao_property`.`fitment` AS `fitment`,`wf_fenxiao_property`.`propertyType` AS `propertyType`,`wf_fenxiao_property`.`buyNum` AS `buyNum`,`wf_fenxiao_property`.`fitment1` AS `fitment1`,`wf_fenxiao_property`.`propertyNotes` AS `propertyNotes`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_property`.`buyCity` AS `buyCity`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_client`.`requireType` AS `requireType`,`wf_fenxiao_client`.`askType` AS `askType`,`wf_fenxiao_client`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`serviceStatus` AS `serviceStatus`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser`,`wf_fenxiao_client`.`firstUserId` AS `firstUserId`,`wf_fenxiao_client`.`firstUser` AS `firstUser`,`wf_fenxiao_client`.`fitmentId` AS `fitmentId`,`wf_fenxiao_client`.`isBargain` AS `isBargain`,`wf_fenxiao_client`.`isguanjia` AS `isguanjia`,`wf_fenxiao_client`.`agentId` AS `agentId`,`wf_fenxiao_property`.`id` AS `id`,`wf_fenxiao_property`.`clientId` AS `clientId`,`wf_fenxiao_property`.`userId` AS `userId`,`wf_fenxiao_property`.`userName` AS `userName`,`wf_fenxiao_property`.`province` AS `province`,`wf_fenxiao_property`.`city` AS `city`,`wf_fenxiao_property`.`tel` AS `tel`,`wf_fenxiao_property`.`area1` AS `area1`,`wf_fenxiao_property`.`updatedBy` AS `updatedBy`,`wf_fenxiao_property`.`status` AS `status`,`wf_fenxiao_client`.`address` AS `address`,`wf_fenxiao_client`.`phone` AS `phone`,`wf_fenxiao_client`.`otherName` AS `otherName`,`wf_fenxiao_client`.`otherPhone` AS `otherPhone`,`wf_fenxiao_client`.`email` AS `email`,`wf_fenxiao_client`.`QQ` AS `QQ`,`wf_fenxiao_client`.`askDate` AS `askDate` from (`wf_fenxiao_client` left join `wf_fenxiao_property` on((`wf_fenxiao_property`.`clientId` = `wf_fenxiao_client`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_property_client`
--
DROP TABLE IF EXISTS `wf_vfenxiao_property_client`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_property_client` AS select `wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`address` AS `address`,`wf_fenxiao_client`.`clientFrom` AS `clientFrom`,`wf_fenxiao_client`.`phone` AS `phone`,`wf_fenxiao_client`.`otherName` AS `otherName`,`wf_fenxiao_client`.`otherPhone` AS `otherPhone`,`wf_fenxiao_client`.`email` AS `email`,`wf_fenxiao_client`.`QQ` AS `QQ`,`wf_fenxiao_client`.`requireType` AS `requireType`,`wf_fenxiao_client`.`askType` AS `askType`,`wf_fenxiao_client`.`askDate` AS `askDate`,`wf_fenxiao_client`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_client`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_client`.`clientLevel` AS `clientLevel`,`wf_fenxiao_client`.`serviceStatus` AS `serviceStatus`,`wf_fenxiao_client`.`firstUserId` AS `firstUserId`,`wf_fenxiao_client`.`firstUser` AS `firstUser`,`wf_fenxiao_client`.`changeClient` AS `changeClient`,`wf_fenxiao_property`.`purpose` AS `purpose`,`wf_fenxiao_property`.`buyCity` AS `buyCity`,`wf_fenxiao_property`.`preference` AS `preference`,`wf_fenxiao_property`.`unitPrice` AS `unitPrice`,`wf_fenxiao_property`.`unitPrice1` AS `unitPrice1`,`wf_fenxiao_property`.`totalPrice` AS `totalPrice`,`wf_fenxiao_property`.`totalPrice1` AS `totalPrice1`,`wf_fenxiao_property`.`area` AS `area`,`wf_fenxiao_property`.`area1` AS `area1`,`wf_fenxiao_property`.`fitment` AS `fitment`,`wf_fenxiao_property`.`fitment1` AS `fitment1`,`wf_fenxiao_property`.`roomType` AS `roomType`,`wf_fenxiao_property`.`buyNum` AS `buyNum`,`wf_fenxiao_property`.`clientPoint` AS `clientPoint`,`wf_fenxiao_property`.`updatedAt` AS `updatedAt`,`wf_fenxiao_property`.`updatedBy` AS `updatedBy`,`wf_fenxiao_property`.`createdBy` AS `createdBy`,`wf_fenxiao_property`.`createdAt` AS `createdAt`,`wf_fenxiao_property`.`propertyNotes` AS `propertyNotes`,`wf_fenxiao_property`.`propertyType` AS `propertyType`,`wf_fenxiao_property`.`clientId` AS `clientId`,`wf_fenxiao_property`.`id` AS `id`,`wf_fenxiao_property`.`province` AS `province`,`wf_fenxiao_property`.`city` AS `city`,`wf_fenxiao_property`.`userName` AS `userName`,`wf_fenxiao_property`.`userId` AS `userId`,`wf_fenxiao_property`.`status` AS `status`,`wf_fenxiao_property`.`tel` AS `tel`,`wf_fenxiao_property`.`belongUserId` AS `belongUserId`,`wf_fenxiao_property`.`belongUser` AS `belongUser`,`wf_vrole`.`pId` AS `pId`,`wf_vrole`.`roleId` AS `roleId`,`wf_fenxiao_client`.`arrangeId` AS `arrangeId`,`wf_fenxiao_client`.`arrangeUser` AS `arrangeUser`,`wf_vrole`.`clientType` AS `clientType`,`wf_fenxiao_client`.`createdAt` AS `clientCreateAt` from ((`wf_fenxiao_property` left join `wf_fenxiao_client` on((`wf_fenxiao_property`.`clientId` = `wf_fenxiao_client`.`id`))) left join `wf_vrole` on((`wf_fenxiao_property`.`belongUserId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_property_client_agent`
--
DROP TABLE IF EXISTS `wf_vfenxiao_property_client_agent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_property_client_agent` AS select `wf_fenxiao_property`.`purpose` AS `purpose`,`wf_fenxiao_property`.`buyCity` AS `buyCity`,`wf_fenxiao_property`.`preference` AS `preference`,`wf_fenxiao_property`.`unitPrice` AS `unitPrice`,`wf_fenxiao_property`.`unitPrice1` AS `unitPrice1`,`wf_fenxiao_property`.`totalPrice` AS `totalPrice`,`wf_fenxiao_property`.`totalPrice1` AS `totalPrice1`,`wf_fenxiao_property`.`area` AS `area`,`wf_fenxiao_property`.`area1` AS `area1`,`wf_fenxiao_property`.`fitment` AS `fitment`,`wf_fenxiao_property`.`fitment1` AS `fitment1`,`wf_fenxiao_property`.`roomType` AS `roomType`,`wf_fenxiao_property`.`buyNum` AS `buyNum`,`wf_fenxiao_property`.`clientPoint` AS `clientPoint`,`wf_fenxiao_property`.`updatedAt` AS `updatedAt`,`wf_fenxiao_property`.`updatedBy` AS `updatedBy`,`wf_fenxiao_property`.`createdBy` AS `createdBy`,`wf_fenxiao_property`.`createdAt` AS `createdAt`,`wf_fenxiao_property`.`propertyNotes` AS `propertyNotes`,`wf_fenxiao_property`.`propertyType` AS `propertyType`,`wf_fenxiao_property`.`clientId` AS `clientId`,`wf_fenxiao_property`.`id` AS `id`,`wf_fenxiao_property`.`province` AS `province`,`wf_fenxiao_property`.`city` AS `city`,`wf_fenxiao_property`.`userName` AS `userName`,`wf_fenxiao_property`.`userId` AS `userId`,`wf_fenxiao_property`.`status` AS `status`,`wf_fenxiao_property`.`tel` AS `tel`,`wf_vclient_role`.`clientName` AS `clientName`,`wf_vclient_role`.`address` AS `address`,`wf_vclient_role`.`clientFrom` AS `clientFrom`,`wf_vclient_role`.`phone` AS `phone`,`wf_vclient_role`.`otherName` AS `otherName`,`wf_vclient_role`.`otherPhone` AS `otherPhone`,`wf_vclient_role`.`QQ` AS `QQ`,`wf_vclient_role`.`email` AS `email`,`wf_vclient_role`.`requireType` AS `requireType`,`wf_vclient_role`.`askType` AS `askType`,`wf_vclient_role`.`askDate` AS `askDate`,`wf_vclient_role`.`lastVisitDate` AS `lastVisitDate`,`wf_vclient_role`.`nextVisitDate` AS `nextVisitDate`,`wf_vclient_role`.`clientLevel` AS `clientLevel`,`wf_vclient_role`.`serviceStatus` AS `serviceStatus`,`wf_vclient_role`.`belongUserId` AS `belongUserId`,`wf_vclient_role`.`belongUser` AS `belongUser`,`wf_vclient_role`.`firstUserId` AS `firstUserId`,`wf_vclient_role`.`firstUser` AS `firstUser`,`wf_vclient_role`.`arrangeId` AS `arrangeId`,`wf_vclient_role`.`arrangeUser` AS `arrangeUser`,`wf_vclient_role`.`changeClient` AS `changeClient`,`wf_vclient_role`.`arrangeRoleId` AS `arrangeRoleId`,`wf_vclient_role`.`clientType` AS `clientType`,`wf_vclient_role`.`roleId` AS `roleId`,`wf_vagent_role`.`agentRoleId` AS `agentRoleId`,`wf_vagent_role`.`agentUserId` AS `agentUserId`,`wf_vagent_role`.`agentName` AS `agentName` from ((`wf_fenxiao_property` left join `wf_vclient_role` on((`wf_fenxiao_property`.`clientId` = `wf_vclient_role`.`id`))) left join `wf_vagent_role` on((`wf_vclient_role`.`agentId` = `wf_vagent_role`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_remoney_dealscale`
--
DROP TABLE IF EXISTS `wf_vfenxiao_remoney_dealscale`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wofang_local`@`localhost` SQL SECURITY DEFINER VIEW `wf_vfenxiao_remoney_dealscale` AS select `wf_fenxiao_remoney`.`dealId` AS `dealId`,`wf_fenxiao_remoney`.`money` AS `money`,`wf_fenxiao_remoney`.`id` AS `id`,`wf_fenxiao_remoney`.`backAt` AS `backAt`,`wf_fenxiao_dealscale`.`clientId` AS `clientId`,`wf_fenxiao_dealscale`.`type` AS `type`,`wf_fenxiao_dealscale`.`belongId` AS `belongId`,`wf_fenxiao_dealscale`.`belongName` AS `belongName`,`wf_fenxiao_dealscale`.`departmentId` AS `departmentId`,`wf_fenxiao_dealscale`.`performance` AS `performance`,`wf_fenxiao_dealscale`.`payment` AS `payment`,`wf_fenxiao_dealscale`.`earnestDate` AS `earnestDate`,`wf_fenxiao_dealscale`.`parentDepartUser` AS `parentDepartUser`,`wf_fenxiao_dealscale`.`scale` AS `scale`,`wf_fenxiao_remoney`.`type` AS `reType` from (`wf_fenxiao_remoney` left join `wf_fenxiao_dealscale` on((`wf_fenxiao_remoney`.`dealId` = `wf_fenxiao_dealscale`.`dealId`))) where (`wf_fenxiao_remoney`.`type` = 1);

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_usercar_role`
--
DROP TABLE IF EXISTS `wf_vfenxiao_usercar_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wofang_local`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_usercar_role` AS select `wf_fenxiao_usercar`.`id` AS `id`,`wf_fenxiao_usercar`.`driverId` AS `driverId`,`wf_fenxiao_usercar`.`driverName` AS `driverName`,`wf_fenxiao_usercar`.`userId` AS `userId`,`wf_fenxiao_usercar`.`userName` AS `userName`,`wf_fenxiao_usercar`.`manNum` AS `manNum`,`wf_fenxiao_usercar`.`clientId` AS `clientId`,`wf_fenxiao_usercar`.`getArrangeId` AS `getArrangeId`,`wf_fenxiao_usercar`.`carId` AS `carId`,`wf_fenxiao_usercar`.`carNum` AS `carNum`,`wf_fenxiao_usercar`.`city` AS `city`,`wf_fenxiao_usercar`.`aimType` AS `aimType`,`wf_fenxiao_usercar`.`area` AS `area`,`wf_fenxiao_usercar`.`outAt` AS `outAt`,`wf_fenxiao_usercar`.`trueOutAt` AS `trueOutAt`,`wf_fenxiao_usercar`.`overAt` AS `overAt`,`wf_fenxiao_usercar`.`howAt` AS `howAt`,`wf_fenxiao_usercar`.`orderAt` AS `orderAt`,`wf_fenxiao_usercar`.`orderBuliding` AS `orderBuliding`,`wf_fenxiao_usercar`.`signAt` AS `signAt`,`wf_fenxiao_usercar`.`startKm` AS `startKm`,`wf_fenxiao_usercar`.`endKm` AS `endKm`,`wf_fenxiao_usercar`.`howFar` AS `howFar`,`wf_fenxiao_usercar`.`otherCost` AS `otherCost`,`wf_fenxiao_usercar`.`totalCost` AS `totalCost`,`wf_fenxiao_usercar`.`remarks` AS `remarks`,`wf_fenxiao_usercar`.`createdAt` AS `createdAt`,`wf_fenxiao_usercar`.`createdBy` AS `createdBy`,`wf_fenxiao_usercar`.`updatedAt` AS `updatedAt`,`wf_fenxiao_usercar`.`updatedBy` AS `updatedBy`,`wf_fenxiao_usercar`.`status` AS `status`,`wf_fenxiao_usercar`.`userId2` AS `userId2`,`wf_fenxiao_usercar`.`userName2` AS `userName2`,`wf_fenxiao_client`.`clientName` AS `clientName`,`wf_fenxiao_client`.`belongUserId` AS `belongUserId`,`wf_fenxiao_client`.`belongUser` AS `belongUser` from (`wf_fenxiao_usercar` left join `wf_fenxiao_client` on((`wf_fenxiao_client`.`id` = `wf_fenxiao_usercar`.`clientId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vfenxiao_visit`
--
DROP TABLE IF EXISTS `wf_vfenxiao_visit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vfenxiao_visit` AS select `wf_fenxiao_visit`.`id` AS `id`,`wf_fenxiao_visit`.`clientId` AS `clientId`,`wf_fenxiao_visit`.`visitId` AS `visitId`,`wf_fenxiao_visit`.`visitName` AS `visitName`,`wf_fenxiao_visit`.`way` AS `way`,`wf_fenxiao_visit`.`clientLevel` AS `clientLevel`,`wf_fenxiao_visit`.`lastVisitDate` AS `lastVisitDate`,`wf_fenxiao_visit`.`nextVisitDate` AS `nextVisitDate`,`wf_fenxiao_visit`.`status` AS `status`,`wf_fenxiao_visit`.`type` AS `type`,`wf_fenxiao_visit`.`updatedBy` AS `updatedBy`,`wf_fenxiao_visit`.`updatedAt` AS `updatedAt`,`wf_fenxiao_visit`.`createdBy` AS `createdBy`,`wf_fenxiao_visit`.`createdAt` AS `createdAt`,`wf_fenxiao_visit`.`serviceWay` AS `serviceWay`,`wf_role_user`.`roleId` AS `visitRoleId`,`wf_role_user`.`clientType` AS `clientType`,`wf_role_user`.`isAnchang` AS `isAnchang` from (`wf_fenxiao_visit` left join `wf_role_user` on((`wf_fenxiao_visit`.`visitId` = `wf_role_user`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vinteract_user`
--
DROP TABLE IF EXISTS `wf_vinteract_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vinteract_user` AS select `wf_interact_user`.`id` AS `id`,`wf_interact_user`.`userId` AS `userId`,`wf_interact_user`.`userName` AS `userName`,`wf_interact_user`.`clientId` AS `clientId`,`wf_interact_user`.`tel` AS `tel`,`wf_interact_user`.`email` AS `email`,`wf_interact_user`.`trueName` AS `trueName`,`wf_interact_user`.`sex` AS `sex`,`wf_interact_user`.`belongUserId` AS `belongUserId`,`wf_interact_user`.`belongUserName` AS `belongUserName`,`wf_interact_user`.`tuanNum` AS `tuanNum`,`wf_interact_user`.`concernNum` AS `concernNum`,`wf_interact_user`.`youhuiNum` AS `youhuiNum`,`wf_interact_user`.`dynamicNum` AS `dynamicNum`,`wf_interact_user`.`optionalNum` AS `optionalNum`,`wf_interact_user`.`smsNum` AS `smsNum`,`wf_interact_user`.`notes` AS `notes`,`wf_interact_user`.`belongPid` AS `belongPid`,`wf_interact_user`.`updateAt` AS `updateAt`,`wf_interact_user`.`updateBy` AS `updateBy`,`wf_interact_user`.`status` AS `status`,`wf_role_user`.`roleId` AS `roleId`,`wf_interact_user`.`comeFrom` AS `comeFrom`,`wf_interact_user`.`fromWeb` AS `fromWeb` from (`wf_interact_user` left join `wf_role_user` on((`wf_interact_user`.`belongUserId` = `wf_role_user`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vinteract_user_record`
--
DROP TABLE IF EXISTS `wf_vinteract_user_record`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vinteract_user_record` AS select `wf_interact_record`.`id` AS `id`,`wf_interact_record`.`userId` AS `userId`,`wf_interact_record`.`interactId` AS `interactId`,`wf_interact_record`.`type` AS `type`,`wf_interact_record`.`sendType` AS `sendType`,`wf_interact_record`.`buildingId` AS `buildingId`,`wf_interact_record`.`buildingName` AS `buildingName`,`wf_interact_record`.`interctAt` AS `interctAt`,`wf_interact_record`.`trueName` AS `trueName`,`wf_interact_record`.`sex` AS `sex`,`wf_interact_record`.`email` AS `email`,`wf_interact_record`.`tel` AS `tel`,`wf_interact_record`.`ip` AS `ip`,`wf_interact_record`.`notes` AS `notes`,`wf_interact_record`.`status` AS `status`,`wf_interact_record`.`updateAt` AS `updateAt`,`wf_interact_record`.`updateBy` AS `updateBy`,`wf_interact_user`.`clientId` AS `clientId`,`wf_interact_user`.`belongUserId` AS `belongUserId`,`wf_building_base`.`city` AS `bcity`,`wf_building_base`.`county` AS `bcounty`,`wf_interact_user`.`notes` AS `notes2`,`wf_building_base`.`sellerName` AS `sellerName`,`wf_building_base`.`sellerTel` AS `sellerTel` from ((`wf_interact_user` join `wf_interact_record` on((`wf_interact_record`.`interactId` = `wf_interact_user`.`id`))) left join `wf_building_base` on((`wf_interact_record`.`buildingId` = `wf_building_base`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vremind_user`
--
DROP TABLE IF EXISTS `wf_vremind_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vremind_user` AS select `wf_business_user`.`userId` AS `userId`,`wf_business_user`.`isLook` AS `isLook`,`wf_business_remind`.`depart` AS `depart`,`wf_business_remind`.`type` AS `type`,`wf_business_remind`.`createdAt` AS `createdAt`,`wf_business_remind`.`createdId` AS `createdId`,`wf_business_remind`.`url` AS `url`,`wf_business_remind`.`content` AS `content`,`wf_business_remind`.`reminder` AS `reminder`,`wf_business_remind`.`createdBy` AS `createdBy`,`wf_business_remind`.`timingAt` AS `timingAt`,`wf_business_remind`.`status` AS `status`,`wf_business_user`.`status` AS `userStatus`,`wf_business_user`.`remindId` AS `remindId`,`wf_business_user`.`id` AS `id` from (`wf_business_remind` join `wf_business_user` on((`wf_business_user`.`remindId` = `wf_business_remind`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vrole`
--
DROP TABLE IF EXISTS `wf_vrole`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vrole` AS select `wf_role_user`.`id` AS `userId`,`wf_role_user`.`roleId` AS `roleId`,`wf_role`.`pId` AS `pId`,`wf_role_user`.`trueName` AS `trueName`,`wf_role_user`.`isAnchang` AS `isAnchang`,`wf_role`.`clientType` AS `clientType`,`wf_role_user`.`departmentId` AS `departmentId`,`wf_role_department`.`name` AS `departmentName`,`wf_role_user`.`status` AS `status`,`wf_role_department`.`orders` AS `departOrders`,`wf_role_user`.`roleArea` AS `roleArea`,`wf_role_department`.`pid` AS `departPid`,`wf_role_department`.`level` AS `level`,`wf_role_user`.`roleCate` AS `roleCate`,`wf_role_department`.`status` AS `departStatus`,`wf_role_user`.`leaveAt` AS `leaveAt` from ((`wf_role_user` left join `wf_role` on((`wf_role`.`id` = `wf_role_user`.`roleId`))) left join `wf_role_department` on((`wf_role_user`.`departmentId` = `wf_role_department`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsoap_detail`
--
DROP TABLE IF EXISTS `wf_vsoap_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsoap_detail` AS select `wf_soap_detail`.`id` AS `id`,`wf_soap_detail`.`startid` AS `startid`,`wf_soap_detail`.`belongId` AS `belongId`,`wf_soap_detail`.`userNmae` AS `userNmae`,`wf_soap_detail`.`roleId` AS `roleId`,`wf_soap_detail`.`rolePid` AS `rolePid`,`wf_soap_detail`.`belongUser` AS `belongUser`,`wf_soap_detail`.`extCode` AS `extCode`,`wf_soap_detail`.`buildingName` AS `buildingName`,`wf_soap_detail`.`buildingId` AS `buildingId`,`wf_soap_detail`.`callResult` AS `callResult`,`wf_soap_detail`.`ani` AS `ani`,`wf_soap_detail`.`dni` AS `dni`,`wf_soap_detail`.`startDate` AS `startDate`,`wf_soap_detail`.`leng` AS `leng`,`wf_soap_detail`.`callCount` AS `callCount`,`wf_soap_detail`.`bigcode` AS `bigcode`,`wf_soap_detail`.`custid` AS `custid`,`wf_soap_detail`.`userId` AS `userId`,`wf_soap_detail`.`notes` AS `notes`,`wf_soap_detail`.`noteDate` AS `noteDate`,`wf_soap_detail`.`noteBy` AS `noteBy`,`wf_building_base`.`city` AS `city`,`wf_building_base`.`county` AS `county` from (`wf_soap_detail` left join `wf_building_base` on((`wf_soap_detail`.`buildingId` = `wf_building_base`.`id`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_arranges`
--
DROP TABLE IF EXISTS `wf_vsuite_arranges`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_arranges` AS select `wf_suite_arranges`.`id` AS `id`,`wf_suite_arranges`.`type` AS `type`,`wf_suite_arranges`.`houseId` AS `houseId`,`wf_suite_arranges`.`ownerName` AS `ownerName`,`wf_suite_arranges`.`clientId` AS `clientId`,`wf_suite_arranges`.`clientName` AS `clientName`,`wf_suite_arranges`.`isvalid` AS `isvalid`,`wf_suite_arranges`.`entrustDate` AS `entrustDate`,`wf_suite_arranges`.`remarks` AS `remarks`,`wf_suite_arranges`.`status` AS `status`,`wf_suite_arranges`.`belongId` AS `belongId`,`wf_suite_arranges`.`belongName` AS `belongName`,`wf_suite_arranges`.`createdAt` AS `createdAt`,`wf_suite_arranges`.`createdId` AS `createdId`,`wf_suite_arranges`.`createdBy` AS `createdBy`,`wf_suite_arranges`.`updatedAt` AS `updatedAt`,`wf_suite_arranges`.`updatedBy` AS `updatedBy`,`wf_vrole`.`departmentId` AS `departmentId`,`wf_vrole`.`departmentName` AS `departmentName` from (`wf_suite_arranges` join `wf_vrole` on((`wf_suite_arranges`.`belongId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_client`
--
DROP TABLE IF EXISTS `wf_vsuite_client`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_client` AS select `wf_suite_client`.`id` AS `id`,`wf_suite_client`.`clientCate` AS `clientCate`,`wf_suite_client`.`cprovince` AS `cprovince`,`wf_suite_client`.`ccity` AS `ccity`,`wf_suite_client`.`city` AS `city`,`wf_suite_client`.`county` AS `county`,`wf_suite_client`.`address` AS `address`,`wf_suite_client`.`fenxiaoId` AS `fenxiaoId`,`wf_suite_client`.`room1` AS `room1`,`wf_suite_client`.`room2` AS `room2`,`wf_suite_client`.`hall1` AS `hall1`,`wf_suite_client`.`hall2` AS `hall2`,`wf_suite_client`.`kitchen` AS `kitchen`,`wf_suite_client`.`toilet` AS `toilet`,`wf_suite_client`.`veranda` AS `veranda`,`wf_suite_client`.`type` AS `type`,`wf_suite_client`.`years` AS `years`,`wf_suite_client`.`fitment` AS `fitment`,`wf_suite_client`.`face` AS `face`,`wf_suite_client`.`area1` AS `area1`,`wf_suite_client`.`area2` AS `area2`,`wf_suite_client`.`floors1` AS `floors1`,`wf_suite_client`.`floors2` AS `floors2`,`wf_suite_client`.`price1` AS `price1`,`wf_suite_client`.`price2` AS `price2`,`wf_suite_client`.`priceunit` AS `priceunit`,`wf_suite_client`.`payway` AS `payway`,`wf_suite_client`.`servantway` AS `servantway`,`wf_suite_client`.`agreement` AS `agreement`,`wf_suite_client`.`infoFrom` AS `infoFrom`,`wf_suite_client`.`entrustDate` AS `entrustDate`,`wf_suite_client`.`remarks` AS `remarks`,`wf_suite_client`.`clientName` AS `clientName`,`wf_suite_client`.`salestatus` AS `salestatus`,`wf_suite_client`.`clientType` AS `clientType`,`wf_suite_client`.`clientLevel` AS `clientLevel`,`wf_suite_client`.`tel` AS `tel`,`wf_suite_client`.`phone` AS `phone`,`wf_suite_client`.`contactAddress` AS `contactAddress`,`wf_suite_client`.`belongName` AS `belongName`,`wf_suite_client`.`isprivate` AS `isprivate`,`wf_suite_client`.`endprivate` AS `endprivate`,`wf_suite_client`.`status` AS `status`,`wf_suite_client`.`createdAt` AS `createdAt`,`wf_suite_client`.`createdId` AS `createdId`,`wf_suite_client`.`createdBy` AS `createdBy`,`wf_suite_client`.`updatedAt` AS `updatedAt`,`wf_suite_client`.`updatedBy` AS `updatedBy`,`wf_suite_client`.`changeAt` AS `changeAt`,`wf_suite_client`.`belongId` AS `belongId`,`wf_vrole`.`departmentId` AS `departmentId`,`wf_vrole`.`departmentName` AS `departmentName`,`wf_vrole`.`departOrders` AS `departOrders`,`wf_vrole`.`roleArea` AS `roleArea`,`wf_suite_client`.`requireType` AS `requireType`,`wf_suite_client`.`visitDate` AS `visitDate`,`wf_suite_client`.`isprivateStatus` AS `isprivateStatus`,`wf_suite_client`.`privateAt` AS `privateAt` from (`wf_suite_client` join `wf_vrole` on((`wf_suite_client`.`belongId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_client_collect`
--
DROP TABLE IF EXISTS `wf_vsuite_client_collect`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_client_collect` AS select `wf_admin_collect`.`createId` AS `collectId`,`wf_admin_collect`.`createdAt` AS `collectAt`,`wf_admin_collect`.`type` AS `collectType`,`wf_vsuite_client`.`id` AS `id`,`wf_vsuite_client`.`clientCate` AS `clientCate`,`wf_vsuite_client`.`cprovince` AS `cprovince`,`wf_vsuite_client`.`ccity` AS `ccity`,`wf_vsuite_client`.`city` AS `city`,`wf_vsuite_client`.`county` AS `county`,`wf_vsuite_client`.`address` AS `address`,`wf_vsuite_client`.`fenxiaoId` AS `fenxiaoId`,`wf_vsuite_client`.`room1` AS `room1`,`wf_vsuite_client`.`room2` AS `room2`,`wf_vsuite_client`.`hall1` AS `hall1`,`wf_vsuite_client`.`hall2` AS `hall2`,`wf_vsuite_client`.`kitchen` AS `kitchen`,`wf_vsuite_client`.`toilet` AS `toilet`,`wf_vsuite_client`.`veranda` AS `veranda`,`wf_vsuite_client`.`type` AS `type`,`wf_vsuite_client`.`years` AS `years`,`wf_vsuite_client`.`fitment` AS `fitment`,`wf_vsuite_client`.`face` AS `face`,`wf_vsuite_client`.`area1` AS `area1`,`wf_vsuite_client`.`area2` AS `area2`,`wf_vsuite_client`.`floors1` AS `floors1`,`wf_vsuite_client`.`floors2` AS `floors2`,`wf_vsuite_client`.`price1` AS `price1`,`wf_vsuite_client`.`price2` AS `price2`,`wf_vsuite_client`.`priceunit` AS `priceunit`,`wf_vsuite_client`.`payway` AS `payway`,`wf_vsuite_client`.`servantway` AS `servantway`,`wf_vsuite_client`.`agreement` AS `agreement`,`wf_vsuite_client`.`infoFrom` AS `infoFrom`,`wf_vsuite_client`.`entrustDate` AS `entrustDate`,`wf_vsuite_client`.`remarks` AS `remarks`,`wf_vsuite_client`.`clientName` AS `clientName`,`wf_vsuite_client`.`salestatus` AS `salestatus`,`wf_vsuite_client`.`clientType` AS `clientType`,`wf_vsuite_client`.`clientLevel` AS `clientLevel`,`wf_vsuite_client`.`tel` AS `tel`,`wf_vsuite_client`.`phone` AS `phone`,`wf_vsuite_client`.`contactAddress` AS `contactAddress`,`wf_vsuite_client`.`belongName` AS `belongName`,`wf_vsuite_client`.`isprivate` AS `isprivate`,`wf_vsuite_client`.`endprivate` AS `endprivate`,`wf_vsuite_client`.`status` AS `status`,`wf_vsuite_client`.`createdAt` AS `createdAt`,`wf_vsuite_client`.`createdId` AS `createdId`,`wf_vsuite_client`.`createdBy` AS `createdBy`,`wf_vsuite_client`.`updatedAt` AS `updatedAt`,`wf_vsuite_client`.`updatedBy` AS `updatedBy`,`wf_vsuite_client`.`changeAt` AS `changeAt`,`wf_vsuite_client`.`belongId` AS `belongId`,`wf_vsuite_client`.`departmentId` AS `departmentId`,`wf_vsuite_client`.`departmentName` AS `departmentName`,`wf_vsuite_client`.`departOrders` AS `departOrders`,`wf_vsuite_client`.`roleArea` AS `roleArea`,`wf_vsuite_client`.`visitDate` AS `visitDate`,`wf_vsuite_client`.`isprivateStatus` AS `isprivateStatus`,`wf_vsuite_client`.`privateAt` AS `privateAt` from (`wf_admin_collect` left join `wf_vsuite_client` on((`wf_vsuite_client`.`id` = `wf_admin_collect`.`id`))) where (`wf_admin_collect`.`type` = 3);

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_hire`
--
DROP TABLE IF EXISTS `wf_vsuite_hire`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_hire` AS select `wf_hire_house`.`city` AS `city`,`wf_hire_house`.`county` AS `county`,`wf_hire_house`.`address` AS `address`,`wf_hire_house`.`type` AS `type`,`wf_hire_house`.`room` AS `room`,`wf_hire_house`.`hall` AS `hall`,`wf_hire_house`.`kitchen` AS `kitchen`,`wf_hire_house`.`toilet` AS `toilet`,`wf_hire_house`.`veranda` AS `veranda`,`wf_hire_house`.`icon` AS `icon`,`wf_hire_house`.`area` AS `area`,`wf_hire_house`.`onFloor` AS `onFloor`,`wf_hire_house`.`floorsType` AS `floorsType`,`wf_hire_house`.`floors` AS `floors`,`wf_hire_house`.`fitment` AS `fitment`,`wf_hire_house`.`face` AS `face`,`wf_hire_house`.`supporting` AS `supporting`,`wf_hire_house`.`hireType` AS `hireType`,`wf_hire_house`.`price` AS `price`,`wf_hire_house`.`pay` AS `pay`,`wf_hire_house`.`tel` AS `tel`,`wf_hire_house`.`updatedAt` AS `updatedAt`,`wf_hire_house`.`createdAt` AS `createdAt`,`wf_hire_house`.`status` AS `status`,`wf_suite_hire`.`tower` AS `tower`,`wf_suite_hire`.`ownerName` AS `ownerName`,`wf_suite_hire`.`keyType` AS `keyType`,`wf_suite_hire`.`infoFrom` AS `infoFrom`,`wf_suite_hire`.`salestatus2` AS `salestatus2`,`wf_suite_hire`.`isprivate` AS `isprivate`,`wf_suite_hire`.`belongId` AS `belongId`,`wf_suite_hire`.`belongName` AS `belongName`,`wf_hire_house`.`id` AS `id`,`wf_hire_house`.`topic` AS `topic`,`wf_suite_hire`.`doorplate` AS `doorplate`,`wf_suite_hire`.`islock` AS `islock`,`wf_suite_hire`.`endprivate` AS `endprivate`,`wf_suite_hire`.`ownerTel` AS `ownerTel`,`wf_suite_hire`.`ownerPhone` AS `ownerPhone`,`wf_hire_house`.`title` AS `title`,`wf_suite_hire`.`changeAt` AS `changeAt`,`wf_suite_hire`.`createdId2` AS `createdId2`,`wf_vrole`.`departmentName` AS `departmentName`,`wf_vrole`.`departmentId` AS `departmentId`,`wf_vrole`.`roleArea` AS `roleArea`,`wf_hire_house`.`businessArea` AS `businessArea`,`wf_suite_hire`.`keyInfo` AS `keyInfo`,`wf_suite_hire`.`keyBelongId` AS `keyBelongId`,`wf_suite_hire`.`unit` AS `unit`,`wf_hire_house`.`buildingId` AS `buildingId`,`wf_hire_house`.`updatedBy` AS `updatedBy`,`wf_hire_house`.`istop` AS `istop`,`wf_suite_hire`.`keyAt` AS `keyAt`,`wf_suite_hire`.`isHide` AS `isHide` from ((`wf_hire_house` join `wf_suite_hire` on((`wf_suite_hire`.`hireId` = `wf_hire_house`.`id`))) left join `wf_vrole` on((`wf_suite_hire`.`belongId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_hire_collect`
--
DROP TABLE IF EXISTS `wf_vsuite_hire_collect`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_hire_collect` AS select `wf_admin_collect`.`createId` AS `collectId`,`wf_admin_collect`.`createdAt` AS `collectAt`,`wf_admin_collect`.`type` AS `collectType`,`wf_vsuite_hire`.`city` AS `city`,`wf_vsuite_hire`.`county` AS `county`,`wf_vsuite_hire`.`address` AS `address`,`wf_vsuite_hire`.`type` AS `type`,`wf_vsuite_hire`.`room` AS `room`,`wf_vsuite_hire`.`hall` AS `hall`,`wf_vsuite_hire`.`kitchen` AS `kitchen`,`wf_vsuite_hire`.`toilet` AS `toilet`,`wf_vsuite_hire`.`veranda` AS `veranda`,`wf_vsuite_hire`.`icon` AS `icon`,`wf_vsuite_hire`.`area` AS `area`,`wf_vsuite_hire`.`onFloor` AS `onFloor`,`wf_vsuite_hire`.`floorsType` AS `floorsType`,`wf_vsuite_hire`.`floors` AS `floors`,`wf_vsuite_hire`.`fitment` AS `fitment`,`wf_vsuite_hire`.`face` AS `face`,`wf_vsuite_hire`.`supporting` AS `supporting`,`wf_vsuite_hire`.`hireType` AS `hireType`,`wf_vsuite_hire`.`price` AS `price`,`wf_vsuite_hire`.`pay` AS `pay`,`wf_vsuite_hire`.`tel` AS `tel`,`wf_vsuite_hire`.`updatedAt` AS `updatedAt`,`wf_vsuite_hire`.`createdAt` AS `createdAt`,`wf_vsuite_hire`.`status` AS `status`,`wf_vsuite_hire`.`tower` AS `tower`,`wf_vsuite_hire`.`ownerName` AS `ownerName`,`wf_vsuite_hire`.`keyType` AS `keyType`,`wf_vsuite_hire`.`infoFrom` AS `infoFrom`,`wf_vsuite_hire`.`salestatus2` AS `salestatus2`,`wf_vsuite_hire`.`isprivate` AS `isprivate`,`wf_vsuite_hire`.`belongId` AS `belongId`,`wf_vsuite_hire`.`belongName` AS `belongName`,`wf_vsuite_hire`.`id` AS `id`,`wf_vsuite_hire`.`topic` AS `topic`,`wf_vsuite_hire`.`doorplate` AS `doorplate`,`wf_vsuite_hire`.`islock` AS `islock`,`wf_vsuite_hire`.`endprivate` AS `endprivate`,`wf_vsuite_hire`.`ownerTel` AS `ownerTel`,`wf_vsuite_hire`.`ownerPhone` AS `ownerPhone`,`wf_vsuite_hire`.`title` AS `title`,`wf_vsuite_hire`.`changeAt` AS `changeAt`,`wf_vsuite_hire`.`createdId2` AS `createdId2`,`wf_vsuite_hire`.`departmentName` AS `departmentName`,`wf_vsuite_hire`.`departmentId` AS `departmentId`,`wf_vsuite_hire`.`roleArea` AS `roleArea`,`wf_vsuite_hire`.`businessArea` AS `businessArea`,`wf_vsuite_hire`.`keyInfo` AS `keyInfo` from (`wf_admin_collect` left join `wf_vsuite_hire` on((`wf_vsuite_hire`.`id` = `wf_admin_collect`.`id`))) where (`wf_admin_collect`.`type` = 2);

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_house`
--
DROP TABLE IF EXISTS `wf_vsuite_house`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_house` AS select `wf_suite_house`.`saleId` AS `id`,`wf_suite_house`.`tower` AS `tower`,`wf_suite_house`.`belongName` AS `belongName`,`wf_suite_house`.`belongId` AS `belongId`,`wf_suite_house`.`keyType` AS `keyType`,`wf_suite_house`.`infoFrom` AS `infoFrom`,`wf_suite_house`.`salestatus2` AS `salestatus2`,`wf_suite_house`.`isprivate` AS `isprivate`,`wf_suite_house`.`ownerName` AS `ownerName`,`wf_suite_house`.`doorplate` AS `doorplate`,`wf_suite_house`.`islock` AS `islock`,`wf_suite_house`.`endprivate` AS `endprivate`,`wf_suite_house`.`ownerTel` AS `ownerTel`,`wf_suite_house`.`ownerPhone` AS `ownerPhone`,`wf_suite_house`.`changeAt` AS `changeAt`,`wf_suite_house`.`createdId2` AS `createdId2`,`wf_vrole`.`departmentName` AS `departmentName`,`wf_vrole`.`departmentId` AS `departmentId`,`wf_vrole`.`roleArea` AS `roleArea`,`wf_suite_house`.`keyInfo` AS `keyInfo`,`wf_suite_house`.`unit` AS `unit`,`wf_suite_house`.`keyBelongId` AS `keyBelongId`,`wf_suite_house`.`keyAt` AS `keyAt`,`wf_suite_house`.`saleId` AS `saleId`,`wf_suite_house`.`buildingId` AS `buildingId`,`wf_suite_house`.`topic` AS `topic`,`wf_suite_house`.`city` AS `city`,`wf_suite_house`.`county` AS `county`,`wf_suite_house`.`businessArea` AS `businessArea`,`wf_suite_house`.`type` AS `type`,`wf_suite_house`.`room` AS `room`,`wf_suite_house`.`hall` AS `hall`,`wf_suite_house`.`icon` AS `icon`,`wf_suite_house`.`area` AS `area`,`wf_suite_house`.`eachPrice` AS `eachPrice`,`wf_suite_house`.`price` AS `price`,`wf_suite_house`.`onFloor` AS `onFloor`,`wf_suite_house`.`face` AS `face`,`wf_suite_house`.`fitment` AS `fitment`,`wf_suite_house`.`tel` AS `tel`,`wf_suite_house`.`istop` AS `istop`,`wf_suite_house`.`updatedAt` AS `updatedAt`,`wf_suite_house`.`createdAt` AS `createdAt`,`wf_suite_house`.`status` AS `status`,`wf_suite_house`.`isHide` AS `isHide` from (`wf_suite_house` join `wf_vrole` on((`wf_vrole`.`userId` = `wf_suite_house`.`belongId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_house_collect`
--
DROP TABLE IF EXISTS `wf_vsuite_house_collect`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_house_collect` AS select `wf_admin_collect`.`createId` AS `collectId`,`wf_admin_collect`.`createdAt` AS `collectAt`,`wf_admin_collect`.`type` AS `collectType`,`wf_suite_house`.`saleId` AS `id`,`wf_suite_house`.`saleId` AS `saleId`,`wf_suite_house`.`tower` AS `tower`,`wf_suite_house`.`unit` AS `unit`,`wf_suite_house`.`doorplate` AS `doorplate`,`wf_suite_house`.`propertyFee` AS `propertyFee`,`wf_suite_house`.`ownerName` AS `ownerName`,`wf_suite_house`.`ownerID` AS `ownerID`,`wf_suite_house`.`ownerTel` AS `ownerTel`,`wf_suite_house`.`ownerPhone` AS `ownerPhone`,`wf_suite_house`.`agreement` AS `agreement`,`wf_suite_house`.`trustType` AS `trustType`,`wf_suite_house`.`keyType` AS `keyType`,`wf_suite_house`.`keyInfo` AS `keyInfo`,`wf_suite_house`.`keyBelongId` AS `keyBelongId`,`wf_suite_house`.`infoFrom` AS `infoFrom`,`wf_suite_house`.`salestatus2` AS `salestatus2`,`wf_suite_house`.`entrustDate` AS `entrustDate`,`wf_suite_house`.`isprivate` AS `isprivate`,`wf_suite_house`.`endprivate` AS `endprivate`,`wf_suite_house`.`islock` AS `islock`,`wf_suite_house`.`lockAt` AS `lockAt`,`wf_suite_house`.`belongId` AS `belongId`,`wf_suite_house`.`belongName` AS `belongName`,`wf_suite_house`.`changeAt` AS `changeAt`,`wf_suite_house`.`createdId2` AS `createdId2`,`wf_suite_house`.`uniqueId` AS `uniqueId`,`wf_suite_house`.`buildingId` AS `buildingId`,`wf_suite_house`.`topic` AS `topic`,`wf_suite_house`.`city` AS `city`,`wf_suite_house`.`county` AS `county`,`wf_suite_house`.`businessArea` AS `businessArea`,`wf_suite_house`.`type` AS `type`,`wf_suite_house`.`room` AS `room`,`wf_suite_house`.`hall` AS `hall`,`wf_suite_house`.`icon` AS `icon`,`wf_suite_house`.`area` AS `area`,`wf_suite_house`.`eachPrice` AS `eachPrice`,`wf_suite_house`.`price` AS `price`,`wf_suite_house`.`onFloor` AS `onFloor`,`wf_suite_house`.`floors` AS `floors`,`wf_suite_house`.`face` AS `face`,`wf_suite_house`.`fitment` AS `fitment`,`wf_suite_house`.`tel` AS `tel`,`wf_suite_house`.`istop` AS `istop`,`wf_suite_house`.`updatedAt` AS `updatedAt`,`wf_suite_house`.`updatedBy` AS `updatedBy`,`wf_suite_house`.`createdBy` AS `createdBy`,`wf_suite_house`.`createdAt` AS `createdAt`,`wf_suite_house`.`status` AS `status`,`wf_vrole`.`departmentId` AS `departmentId`,`wf_vrole`.`departmentName` AS `departmentName`,`wf_vrole`.`roleArea` AS `roleArea` from ((`wf_admin_collect` left join `wf_suite_house` on((`wf_suite_house`.`saleId` = `wf_admin_collect`.`id`))) left join `wf_vrole` on((`wf_suite_house`.`belongId` = `wf_vrole`.`userId`))) where (`wf_admin_collect`.`type` = 1);

-- --------------------------------------------------------

--
-- 视图结构 `wf_vsuite_visits`
--
DROP TABLE IF EXISTS `wf_vsuite_visits`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vsuite_visits` AS select `wf_suite_visits`.`id` AS `id`,`wf_suite_visits`.`currentId` AS `currentId`,`wf_suite_visits`.`type` AS `type`,`wf_suite_visits`.`way` AS `way`,`wf_suite_visits`.`visitDate` AS `visitDate`,`wf_suite_visits`.`remarks` AS `remarks`,`wf_suite_visits`.`entrustDate` AS `entrustDate`,`wf_suite_visits`.`entrustName` AS `entrustName`,`wf_suite_visits`.`status` AS `status`,`wf_suite_visits`.`belongId` AS `belongId`,`wf_suite_visits`.`belongName` AS `belongName`,`wf_suite_visits`.`createdAt` AS `createdAt`,`wf_suite_visits`.`createdId` AS `createdId`,`wf_suite_visits`.`createdBy` AS `createdBy`,`wf_suite_visits`.`updatedAt` AS `updatedAt`,`wf_suite_visits`.`updatedBy` AS `updatedBy`,`wf_vrole`.`departmentId` AS `departmentId`,`wf_vrole`.`departmentName` AS `departmentName`,`wf_suite_visits`.`cate` AS `cate` from (`wf_suite_visits` join `wf_vrole` on((`wf_suite_visits`.`belongId` = `wf_vrole`.`userId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vtour_order_way`
--
DROP TABLE IF EXISTS `wf_vtour_order_way`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `wf_vtour_order_way` AS select `wf_tour_order`.`id` AS `id`,`wf_tour_order`.`name` AS `name`,`wf_tour_order`.`sex` AS `sex`,`wf_tour_order`.`province` AS `province`,`wf_tour_order`.`city` AS `city`,`wf_tour_order`.`tel` AS `tel`,`wf_tour_order`.`wayId` AS `wayId`,`wf_tour_order`.`message` AS `message`,`wf_tour_order`.`orderAt1` AS `orderAt1`,`wf_tour_order`.`orderAt2` AS `orderAt2`,`wf_tour_order`.`visitStatus` AS `visitStatus`,`wf_tour_order`.`status` AS `status`,`wf_tour_order`.`createdAt` AS `createdAt`,`wf_tour_order`.`visitAt` AS `visitAt`,`wf_tour_order`.`updatedAt` AS `updatedAt`,`wf_tour_order`.`isAdd` AS `isAdd`,`wf_tour_order`.`belongUserId` AS `belongUserId`,`wf_tour_order`.`belongUser` AS `belongUser`,`wf_tour_order`.`belongPid` AS `belongPid`,`wf_tour_order`.`notes` AS `notes`,`wf_tour_way`.`title` AS `title`,`wf_role_user`.`roleId` AS `roleId` from ((`wf_tour_order` left join `wf_tour_way` on((`wf_tour_order`.`wayId` = `wf_tour_way`.`id`))) left join `wf_role_user` on((`wf_role_user`.`id` = `wf_tour_order`.`belongUserId`)));

-- --------------------------------------------------------

--
-- 视图结构 `wf_vweixin_user_dujia`
--
DROP TABLE IF EXISTS `wf_vweixin_user_dujia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wofang_local`@`%` SQL SECURITY DEFINER VIEW `wf_vweixin_user_dujia` AS select `wf_weixin_user`.`id` AS `id`,`wf_weixin_user`.`pid` AS `pid`,`wf_weixin_user`.`openid` AS `openid`,`wf_weixin_user`.`nickname` AS `nickname`,`wf_weixin_user`.`sex` AS `sex`,`wf_weixin_user`.`province` AS `province`,`wf_weixin_user`.`city` AS `city`,`wf_weixin_user`.`country` AS `country`,`wf_weixin_user`.`headimgurl` AS `headimgurl`,`wf_weixin_user`.`realname` AS `realname`,`wf_weixin_user`.`tel` AS `tel`,`wf_weixin_user`.`createdAt` AS `createdAt`,`wf_weixin_user`.`updatedAt` AS `updatedAt`,`wf_weixin_user`.`lastLoginAt` AS `lastLoginAt`,`wf_weixin_user`.`status` AS `status`,`wf_dujia_user`.`balance` AS `balance`,`wf_dujia_user`.`costTime` AS `costTime` from (`wf_weixin_user` left join `wf_dujia_user` on((`wf_weixin_user`.`id` = `wf_dujia_user`.`userId`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wf_about`
--
ALTER TABLE `wf_about`
  ADD PRIMARY KEY (`ids`);

--
-- Indexes for table `wf_access`
--
ALTER TABLE `wf_access`
  ADD PRIMARY KEY (`roleId`,`nodeId`),
  ADD KEY `roleId` (`roleId`),
  ADD KEY `noleId` (`nodeId`);

--
-- Indexes for table `wf_admin_collect`
--
ALTER TABLE `wf_admin_collect`
  ADD UNIQUE KEY `id_type` (`id`,`type`,`createId`) USING BTREE;

--
-- Indexes for table `wf_ads`
--
ALTER TABLE `wf_ads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `city` (`city`),
  ADD KEY `orders` (`orders`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `wf_ads_category`
--
ALTER TABLE `wf_ads_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `wf_agency_inquiry`
--
ALTER TABLE `wf_agency_inquiry`
  ADD PRIMARY KEY (`InquiryID`);

--
-- Indexes for table `wf_agency_property`
--
ALTER TABLE `wf_agency_property`
  ADD PRIMARY KEY (`PropertyID`),
  ADD KEY `IDX_BELONGID` (`belongId`);

--
-- Indexes for table `wf_agent`
--
ALTER TABLE `wf_agent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belongUserId` (`belongUserId`),
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `wf_agent_building_concern`
--
ALTER TABLE `wf_agent_building_concern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agentId` (`agentId`);

--
-- Indexes for table `wf_agent_card`
--
ALTER TABLE `wf_agent_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_agent_channel`
--
ALTER TABLE `wf_agent_channel`
  ADD PRIMARY KEY (`channelId`),
  ADD UNIQUE KEY `channelId` (`channelId`) USING BTREE;

--
-- Indexes for table `wf_agent_dealbuilding`
--
ALTER TABLE `wf_agent_dealbuilding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_agent_message`
--
ALTER TABLE `wf_agent_message`
  ADD PRIMARY KEY (`messageId`);

--
-- Indexes for table `wf_agent_point`
--
ALTER TABLE `wf_agent_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_agent_purpose`
--
ALTER TABLE `wf_agent_purpose`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_agent_shop`
--
ALTER TABLE `wf_agent_shop`
  ADD PRIMARY KEY (`agentId`);

--
-- Indexes for table `wf_agent_user`
--
ALTER TABLE `wf_agent_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_agent_visit`
--
ALTER TABLE `wf_agent_visit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `clientId` (`agentId`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_agent_wuliao`
--
ALTER TABLE `wf_agent_wuliao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdAt` (`createdAt`),
  ADD KEY `agentId` (`agentId`);

--
-- Indexes for table `wf_anchang_building`
--
ALTER TABLE `wf_anchang_building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_anchang_fixhouse`
--
ALTER TABLE `wf_anchang_fixhouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_anchang_guestbook`
--
ALTER TABLE `wf_anchang_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_anchang_house`
--
ALTER TABLE `wf_anchang_house`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_anchang_patch`
--
ALTER TABLE `wf_anchang_patch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_anchang_signed`
--
ALTER TABLE `wf_anchang_signed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_anchang_sure`
--
ALTER TABLE `wf_anchang_sure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `clientId` (`clientId`),
  ADD KEY `status` (`status`),
  ADD KEY `visitId` (`buildingName`);

--
-- Indexes for table `wf_app_access`
--
ALTER TABLE `wf_app_access`
  ADD PRIMARY KEY (`roleId`,`nodeId`),
  ADD KEY `roleId` (`roleId`),
  ADD KEY `noleId` (`nodeId`);

--
-- Indexes for table `wf_app_channel`
--
ALTER TABLE `wf_app_channel`
  ADD PRIMARY KEY (`channelId`);

--
-- Indexes for table `wf_app_manage`
--
ALTER TABLE `wf_app_manage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_app_role_nav`
--
ALTER TABLE `wf_app_role_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_app_role_node`
--
ALTER TABLE `wf_app_role_node`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `pId` (`pId`),
  ADD KEY `groupId` (`roleNavId`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `wf_app_version`
--
ALTER TABLE `wf_app_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_asks`
--
ALTER TABLE `wf_asks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `createdAt` (`createdAt`);

--
-- Indexes for table `wf_asks_go`
--
ALTER TABLE `wf_asks_go`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `pid` (`pid`),
  ADD KEY `replyid` (`replyid`);

--
-- Indexes for table `wf_asks_hotwords`
--
ALTER TABLE `wf_asks_hotwords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `wf_asks_keywords`
--
ALTER TABLE `wf_asks_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_asks_reply`
--
ALTER TABLE `wf_asks_reply`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `askid` (`askid`) USING BTREE,
  ADD KEY `createdAt` (`createdAt`) USING BTREE;

--
-- Indexes for table `wf_ask_buy_content`
--
ALTER TABLE `wf_ask_buy_content`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `wf_ask_hire_content`
--
ALTER TABLE `wf_ask_hire_content`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `wf_ask_to_buy`
--
ALTER TABLE `wf_ask_to_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `createdId` (`createdId`) USING BTREE,
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `updatedAt` (`updatedAt`) USING BTREE;

--
-- Indexes for table `wf_ask_to_hire`
--
ALTER TABLE `wf_ask_to_hire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `createdId` (`createdId`) USING BTREE,
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `updatedAt` (`updatedAt`) USING BTREE;

--
-- Indexes for table `wf_audit_visit`
--
ALTER TABLE `wf_audit_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_audit_visit_content`
--
ALTER TABLE `wf_audit_visit_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_audit_visit_img`
--
ALTER TABLE `wf_audit_visit_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auditId` (`auditId`) USING BTREE;

--
-- Indexes for table `wf_bigcode`
--
ALTER TABLE `wf_bigcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_bug`
--
ALTER TABLE `wf_bug`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_around`
--
ALTER TABLE `wf_building_around`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_base`
--
ALTER TABLE `wf_building_base`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `title` (`title`),
  ADD KEY `city` (`city`),
  ADD KEY `status` (`status`),
  ADD KEY `feature` (`feature`),
  ADD KEY `sellerId` (`sellerId`),
  ADD KEY `weightScore` (`weightScore`) USING BTREE;

--
-- Indexes for table `wf_building_browsed`
--
ALTER TABLE `wf_building_browsed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_business`
--
ALTER TABLE `wf_building_business`
  ADD PRIMARY KEY (`buildingId`),
  ADD UNIQUE KEY `buildingId` (`buildingId`) USING BTREE;

--
-- Indexes for table `wf_building_comments`
--
ALTER TABLE `wf_building_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_building_concern`
--
ALTER TABLE `wf_building_concern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `wf_building_content`
--
ALTER TABLE `wf_building_content`
  ADD PRIMARY KEY (`buildingId`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_count`
--
ALTER TABLE `wf_building_count`
  ADD PRIMARY KEY (`buildingId`);

--
-- Indexes for table `wf_building_count_date`
--
ALTER TABLE `wf_building_count_date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clickNum` (`clickNum`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `wf_building_demand`
--
ALTER TABLE `wf_building_demand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `wf_building_file`
--
ALTER TABLE `wf_building_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_gift`
--
ALTER TABLE `wf_building_gift`
  ADD PRIMARY KEY (`buildingId`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `isGift` (`isGift`),
  ADD KEY `isShow` (`isShow`),
  ADD KEY `updateAt` (`updatedAt`);

--
-- Indexes for table `wf_building_img`
--
ALTER TABLE `wf_building_img`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `buildingId_id` (`buildingId`,`id`) USING BTREE;

--
-- Indexes for table `wf_building_imgcount`
--
ALTER TABLE `wf_building_imgcount`
  ADD PRIMARY KEY (`buildingId`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_info`
--
ALTER TABLE `wf_building_info`
  ADD PRIMARY KEY (`buildingId`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_installation`
--
ALTER TABLE `wf_building_installation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_installation_copy`
--
ALTER TABLE `wf_building_installation_copy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_interaction`
--
ALTER TABLE `wf_building_interaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_log`
--
ALTER TABLE `wf_building_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_map`
--
ALTER TABLE `wf_building_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buildingId` (`buildingId`) USING BTREE COMMENT '楼盘ID',
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `wf_building_message`
--
ALTER TABLE `wf_building_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_news`
--
ALTER TABLE `wf_building_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `msDate` (`msDate`);

--
-- Indexes for table `wf_building_price`
--
ALTER TABLE `wf_building_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_building_recommend`
--
ALTER TABLE `wf_building_recommend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `type` (`type`),
  ADD KEY `clientId` (`clientId`) USING BTREE,
  ADD KEY `fileType` (`fileType`) USING BTREE;

--
-- Indexes for table `wf_building_reported`
--
ALTER TABLE `wf_building_reported`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_reported_status`
--
ALTER TABLE `wf_building_reported_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_room`
--
ALTER TABLE `wf_building_room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `buildingId` (`buildingId`,`weightScore`) USING BTREE;

--
-- Indexes for table `wf_building_sale`
--
ALTER TABLE `wf_building_sale`
  ADD PRIMARY KEY (`buildingId`),
  ADD UNIQUE KEY `buildingId` (`buildingId`) USING BTREE,
  ADD KEY `saleStatus` (`saleStatus`),
  ADD KEY `qiXian` (`qiXian`);

--
-- Indexes for table `wf_building_setorder`
--
ALTER TABLE `wf_building_setorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_type_bid` (`place`,`type`,`buildingId`) USING BTREE;

--
-- Indexes for table `wf_building_soap400`
--
ALTER TABLE `wf_building_soap400`
  ADD UNIQUE KEY `building_type` (`buildingId`,`type`);

--
-- Indexes for table `wf_building_special`
--
ALTER TABLE `wf_building_special`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `wf_building_special_business`
--
ALTER TABLE `wf_building_special_business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userName` (`userName`),
  ADD KEY `tel` (`tel`);

--
-- Indexes for table `wf_building_special_feature`
--
ALTER TABLE `wf_building_special_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `specialId` (`specialId`);

--
-- Indexes for table `wf_building_special_img`
--
ALTER TABLE `wf_building_special_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `specialId` (`specialId`) USING BTREE;

--
-- Indexes for table `wf_building_special_info`
--
ALTER TABLE `wf_building_special_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `specialId` (`specialId`) USING BTREE;

--
-- Indexes for table `wf_building_special_join`
--
ALTER TABLE `wf_building_special_join`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `specialId` (`specialId`) USING BTREE;

--
-- Indexes for table `wf_building_special_joinplace_count`
--
ALTER TABLE `wf_building_special_joinplace_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `specialId` (`specialId`);

--
-- Indexes for table `wf_building_special_notice`
--
ALTER TABLE `wf_building_special_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `specialId` (`specialId`) USING BTREE;

--
-- Indexes for table `wf_building_special_sendmobile`
--
ALTER TABLE `wf_building_special_sendmobile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `subscribeId` (`subscribeId`);

--
-- Indexes for table `wf_building_special_subscribe`
--
ALTER TABLE `wf_building_special_subscribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tel` (`tel`);

--
-- Indexes for table `wf_building_tags`
--
ALTER TABLE `wf_building_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `city` (`city`),
  ADD KEY `buildingSum` (`buildingSum`);

--
-- Indexes for table `wf_building_tags_count`
--
ALTER TABLE `wf_building_tags_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `wf_building_tuan`
--
ALTER TABLE `wf_building_tuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `wf_building_tuan_business`
--
ALTER TABLE `wf_building_tuan_business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tel` (`tel`),
  ADD KEY `buildingTitle` (`buildingTitle`);

--
-- Indexes for table `wf_building_tuan_feature`
--
ALTER TABLE `wf_building_tuan_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tuanId` (`tuanId`);

--
-- Indexes for table `wf_building_tuan_img`
--
ALTER TABLE `wf_building_tuan_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tuanId` (`tuanId`) USING BTREE;

--
-- Indexes for table `wf_building_tuan_info`
--
ALTER TABLE `wf_building_tuan_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tuanId` (`tuanId`);

--
-- Indexes for table `wf_building_tuan_join`
--
ALTER TABLE `wf_building_tuan_join`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tuanId` (`tuanId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `wf_building_tuan_joinplace_count`
--
ALTER TABLE `wf_building_tuan_joinplace_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_tuan_notice`
--
ALTER TABLE `wf_building_tuan_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tuanId` (`tuanId`);

--
-- Indexes for table `wf_building_tuan_sendmobile`
--
ALTER TABLE `wf_building_tuan_sendmobile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `subscribeId` (`subscribeId`);

--
-- Indexes for table `wf_building_tuan_subscribe`
--
ALTER TABLE `wf_building_tuan_subscribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tel` (`tel`);

--
-- Indexes for table `wf_building_tuan_survey`
--
ALTER TABLE `wf_building_tuan_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tel` (`tel`);

--
-- Indexes for table `wf_building_update`
--
ALTER TABLE `wf_building_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_building_video`
--
ALTER TABLE `wf_building_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_buliding_purchase`
--
ALTER TABLE `wf_buliding_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `wf_businesscount_aclients`
--
ALTER TABLE `wf_businesscount_aclients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agentId` (`agentId`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_businesscount_agents`
--
ALTER TABLE `wf_businesscount_agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_businesscount_agentsa`
--
ALTER TABLE `wf_businesscount_agentsa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_businesscount_areas`
--
ALTER TABLE `wf_businesscount_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `belongId` (`belongId`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_businesscount_buildings`
--
ALTER TABLE `wf_businesscount_buildings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_businesscount_citys`
--
ALTER TABLE `wf_businesscount_citys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_businesscount_cooperate`
--
ALTER TABLE `wf_businesscount_cooperate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_businesscount_salestatus`
--
ALTER TABLE `wf_businesscount_salestatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_businesscount_tuan`
--
ALTER TABLE `wf_businesscount_tuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_business_notice`
--
ALTER TABLE `wf_business_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `depart` (`depart`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `createdId` (`createdId`);

--
-- Indexes for table `wf_business_parameter`
--
ALTER TABLE `wf_business_parameter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `pid` (`subStr`);

--
-- Indexes for table `wf_business_remind`
--
ALTER TABLE `wf_business_remind`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `depart` (`depart`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `createdId` (`createdId`);

--
-- Indexes for table `wf_business_user`
--
ALTER TABLE `wf_business_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_building`
--
ALTER TABLE `wf_caiji_building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_building_image`
--
ALTER TABLE `wf_caiji_building_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_building_img_queue`
--
ALTER TABLE `wf_caiji_building_img_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_building_news`
--
ALTER TABLE `wf_caiji_building_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_building_prices`
--
ALTER TABLE `wf_caiji_building_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_building_task_queue`
--
ALTER TABLE `wf_caiji_building_task_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_building_tuku_queue`
--
ALTER TABLE `wf_caiji_building_tuku_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_huxingtu`
--
ALTER TABLE `wf_caiji_huxingtu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_huxingtu_queue`
--
ALTER TABLE `wf_caiji_huxingtu_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_queue`
--
ALTER TABLE `wf_caiji_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_caiji_setting`
--
ALTER TABLE `wf_caiji_setting`
  ADD PRIMARY KEY (`last_working`,`min_worktime_between`);

--
-- Indexes for table `wf_carcity_costs`
--
ALTER TABLE `wf_carcity_costs`
  ADD PRIMARY KEY (`city`);

--
-- Indexes for table `wf_car_audit`
--
ALTER TABLE `wf_car_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_car_cars`
--
ALTER TABLE `wf_car_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_car_company`
--
ALTER TABLE `wf_car_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_car_driver`
--
ALTER TABLE `wf_car_driver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_car_favors`
--
ALTER TABLE `wf_car_favors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_car_fix`
--
ALTER TABLE `wf_car_fix`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wf_car_gps`
--
ALTER TABLE `wf_car_gps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId_createdAt` (`orderId`,`createdAt`);

--
-- Indexes for table `wf_car_gps1`
--
ALTER TABLE `wf_car_gps1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_car_order`
--
ALTER TABLE `wf_car_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_car_order_driver`
--
ALTER TABLE `wf_car_order_driver`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `driverId_orderId` (`driverId`,`orderId`) USING BTREE;

--
-- Indexes for table `wf_car_rental`
--
ALTER TABLE `wf_car_rental`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_city`
--
ALTER TABLE `wf_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `ename` (`ename`),
  ADD KEY `pid` (`pid`),
  ADD KEY `orders` (`orders`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_client_sms`
--
ALTER TABLE `wf_client_sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tel` (`tel`),
  ADD KEY `belongUserId_type_createdAt` (`belongUserId`,`type`,`createdAt`) USING BTREE;

--
-- Indexes for table `wf_code400`
--
ALTER TABLE `wf_code400`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extCode` (`extCode`),
  ADD KEY `bigCode` (`bigCode`);

--
-- Indexes for table `wf_code400_white`
--
ALTER TABLE `wf_code400_white`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tel` (`tel`);

--
-- Indexes for table `wf_common_addon`
--
ALTER TABLE `wf_common_addon`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `wf_common_admincp_cmenu`
--
ALTER TABLE `wf_common_admincp_cmenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `displayorder` (`displayorder`);

--
-- Indexes for table `wf_common_admincp_group`
--
ALTER TABLE `wf_common_admincp_group`
  ADD PRIMARY KEY (`cpgroupid`);

--
-- Indexes for table `wf_common_admincp_member`
--
ALTER TABLE `wf_common_admincp_member`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_common_admincp_perm`
--
ALTER TABLE `wf_common_admincp_perm`
  ADD UNIQUE KEY `cpgroupperm` (`cpgroupid`,`perm`),
  ADD KEY `cpgroupid` (`cpgroupid`);

--
-- Indexes for table `wf_common_admincp_session`
--
ALTER TABLE `wf_common_admincp_session`
  ADD PRIMARY KEY (`uid`,`panel`);

--
-- Indexes for table `wf_common_admingroup`
--
ALTER TABLE `wf_common_admingroup`
  ADD PRIMARY KEY (`admingid`);

--
-- Indexes for table `wf_common_adminnote`
--
ALTER TABLE `wf_common_adminnote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_advertisement`
--
ALTER TABLE `wf_common_advertisement`
  ADD PRIMARY KEY (`advid`);

--
-- Indexes for table `wf_common_advertisement_custom`
--
ALTER TABLE `wf_common_advertisement_custom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wf_common_banned`
--
ALTER TABLE `wf_common_banned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_block`
--
ALTER TABLE `wf_common_block`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `wf_common_block_favorite`
--
ALTER TABLE `wf_common_block_favorite`
  ADD PRIMARY KEY (`favid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_common_block_item`
--
ALTER TABLE `wf_common_block_item`
  ADD PRIMARY KEY (`itemid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `wf_common_block_item_data`
--
ALTER TABLE `wf_common_block_item_data`
  ADD PRIMARY KEY (`dataid`),
  ADD KEY `bid` (`bid`,`stickgrade`,`verifiedtime`);

--
-- Indexes for table `wf_common_block_permission`
--
ALTER TABLE `wf_common_block_permission`
  ADD PRIMARY KEY (`bid`,`uid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_common_block_pic`
--
ALTER TABLE `wf_common_block_pic`
  ADD PRIMARY KEY (`picid`),
  ADD KEY `bid` (`bid`,`itemid`);

--
-- Indexes for table `wf_common_block_style`
--
ALTER TABLE `wf_common_block_style`
  ADD PRIMARY KEY (`styleid`),
  ADD KEY `hash` (`hash`),
  ADD KEY `blockclass` (`blockclass`);

--
-- Indexes for table `wf_common_block_xml`
--
ALTER TABLE `wf_common_block_xml`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_cache`
--
ALTER TABLE `wf_common_cache`
  ADD PRIMARY KEY (`cachekey`);

--
-- Indexes for table `wf_common_card`
--
ALTER TABLE `wf_common_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_common_card_log`
--
ALTER TABLE `wf_common_card_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `operation_dateline` (`operation`,`dateline`);

--
-- Indexes for table `wf_common_card_type`
--
ALTER TABLE `wf_common_card_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_connect_guest`
--
ALTER TABLE `wf_common_connect_guest`
  ADD PRIMARY KEY (`conopenid`);

--
-- Indexes for table `wf_common_credit_log`
--
ALTER TABLE `wf_common_credit_log`
  ADD KEY `uid` (`uid`),
  ADD KEY `operation` (`operation`),
  ADD KEY `relatedid` (`relatedid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_common_credit_rule`
--
ALTER TABLE `wf_common_credit_rule`
  ADD PRIMARY KEY (`rid`),
  ADD UNIQUE KEY `action` (`action`);

--
-- Indexes for table `wf_common_credit_rule_log`
--
ALTER TABLE `wf_common_credit_rule_log`
  ADD PRIMARY KEY (`clid`),
  ADD KEY `uid` (`uid`,`rid`,`fid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_common_credit_rule_log_field`
--
ALTER TABLE `wf_common_credit_rule_log_field`
  ADD PRIMARY KEY (`uid`,`clid`);

--
-- Indexes for table `wf_common_cron`
--
ALTER TABLE `wf_common_cron`
  ADD PRIMARY KEY (`cronid`),
  ADD KEY `nextrun` (`available`,`nextrun`);

--
-- Indexes for table `wf_common_devicetoken`
--
ALTER TABLE `wf_common_devicetoken`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `wf_common_district`
--
ALTER TABLE `wf_common_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upid` (`upid`,`displayorder`);

--
-- Indexes for table `wf_common_diy_data`
--
ALTER TABLE `wf_common_diy_data`
  ADD PRIMARY KEY (`targettplname`,`tpldirectory`);

--
-- Indexes for table `wf_common_domain`
--
ALTER TABLE `wf_common_domain`
  ADD PRIMARY KEY (`id`,`idtype`),
  ADD KEY `domain` (`domain`,`domainroot`),
  ADD KEY `idtype` (`idtype`);

--
-- Indexes for table `wf_common_failedlogin`
--
ALTER TABLE `wf_common_failedlogin`
  ADD PRIMARY KEY (`ip`,`username`);

--
-- Indexes for table `wf_common_friendlink`
--
ALTER TABLE `wf_common_friendlink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_grouppm`
--
ALTER TABLE `wf_common_grouppm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_invite`
--
ALTER TABLE `wf_common_invite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_common_magic`
--
ALTER TABLE `wf_common_magic`
  ADD PRIMARY KEY (`magicid`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD KEY `displayorder` (`available`,`displayorder`);

--
-- Indexes for table `wf_common_magiclog`
--
ALTER TABLE `wf_common_magiclog`
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `action` (`action`),
  ADD KEY `targetuid` (`targetuid`,`dateline`),
  ADD KEY `magicid` (`magicid`,`dateline`);

--
-- Indexes for table `wf_common_mailcron`
--
ALTER TABLE `wf_common_mailcron`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `sendtime` (`sendtime`);

--
-- Indexes for table `wf_common_mailqueue`
--
ALTER TABLE `wf_common_mailqueue`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `mcid` (`cid`,`dateline`);

--
-- Indexes for table `wf_common_member`
--
ALTER TABLE `wf_common_member`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `conisbind` (`conisbind`);

--
-- Indexes for table `wf_common_member_action_log`
--
ALTER TABLE `wf_common_member_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dateline` (`dateline`,`action`,`uid`);

--
-- Indexes for table `wf_common_member_archive`
--
ALTER TABLE `wf_common_member_archive`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `conisbind` (`conisbind`);

--
-- Indexes for table `wf_common_member_connect`
--
ALTER TABLE `wf_common_member_connect`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `conuin` (`conuin`),
  ADD KEY `conopenid` (`conopenid`);

--
-- Indexes for table `wf_common_member_count`
--
ALTER TABLE `wf_common_member_count`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `posts` (`posts`);

--
-- Indexes for table `wf_common_member_count_archive`
--
ALTER TABLE `wf_common_member_count_archive`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `posts` (`posts`);

--
-- Indexes for table `wf_common_member_crime`
--
ALTER TABLE `wf_common_member_crime`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `uid` (`uid`,`action`,`dateline`);

--
-- Indexes for table `wf_common_member_field_forum`
--
ALTER TABLE `wf_common_member_field_forum`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_common_member_field_forum_archive`
--
ALTER TABLE `wf_common_member_field_forum_archive`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_common_member_field_home`
--
ALTER TABLE `wf_common_member_field_home`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `domain` (`domain`);

--
-- Indexes for table `wf_common_member_field_home_archive`
--
ALTER TABLE `wf_common_member_field_home_archive`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `domain` (`domain`);

--
-- Indexes for table `wf_common_member_grouppm`
--
ALTER TABLE `wf_common_member_grouppm`
  ADD PRIMARY KEY (`uid`,`gpmid`);

--
-- Indexes for table `wf_common_member_log`
--
ALTER TABLE `wf_common_member_log`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_common_member_magic`
--
ALTER TABLE `wf_common_member_magic`
  ADD PRIMARY KEY (`uid`,`magicid`);

--
-- Indexes for table `wf_common_member_medal`
--
ALTER TABLE `wf_common_member_medal`
  ADD PRIMARY KEY (`uid`,`medalid`);

--
-- Indexes for table `wf_common_member_profile`
--
ALTER TABLE `wf_common_member_profile`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_common_member_profile_archive`
--
ALTER TABLE `wf_common_member_profile_archive`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_common_member_profile_setting`
--
ALTER TABLE `wf_common_member_profile_setting`
  ADD PRIMARY KEY (`fieldid`);

--
-- Indexes for table `wf_common_member_security`
--
ALTER TABLE `wf_common_member_security`
  ADD PRIMARY KEY (`securityid`),
  ADD KEY `uid` (`uid`,`fieldid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_common_member_status`
--
ALTER TABLE `wf_common_member_status`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `lastactivity` (`lastactivity`,`invisible`);

--
-- Indexes for table `wf_common_member_status_archive`
--
ALTER TABLE `wf_common_member_status_archive`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `lastactivity` (`lastactivity`,`invisible`);

--
-- Indexes for table `wf_common_member_stat_field`
--
ALTER TABLE `wf_common_member_stat_field`
  ADD PRIMARY KEY (`optionid`),
  ADD KEY `fieldid` (`fieldid`);

--
-- Indexes for table `wf_common_member_stat_fieldcache`
--
ALTER TABLE `wf_common_member_stat_fieldcache`
  ADD PRIMARY KEY (`optionid`,`uid`);

--
-- Indexes for table `wf_common_member_stat_search`
--
ALTER TABLE `wf_common_member_stat_search`
  ADD PRIMARY KEY (`optionid`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `wf_common_member_stat_searchcache`
--
ALTER TABLE `wf_common_member_stat_searchcache`
  ADD PRIMARY KEY (`optionid`,`uid`);

--
-- Indexes for table `wf_common_member_validate`
--
ALTER TABLE `wf_common_member_validate`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_common_member_verify`
--
ALTER TABLE `wf_common_member_verify`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `verify1` (`verify1`),
  ADD KEY `verify2` (`verify2`),
  ADD KEY `verify3` (`verify3`),
  ADD KEY `verify4` (`verify4`),
  ADD KEY `verify5` (`verify5`),
  ADD KEY `verify6` (`verify6`),
  ADD KEY `verify7` (`verify7`);

--
-- Indexes for table `wf_common_member_verify_info`
--
ALTER TABLE `wf_common_member_verify_info`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `verifytype` (`verifytype`,`flag`),
  ADD KEY `uid` (`uid`,`verifytype`,`dateline`);

--
-- Indexes for table `wf_common_moderate`
--
ALTER TABLE `wf_common_moderate`
  ADD PRIMARY KEY (`id`,`idtype`),
  ADD KEY `idtype` (`idtype`,`status`,`dateline`);

--
-- Indexes for table `wf_common_myapp`
--
ALTER TABLE `wf_common_myapp`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `flag` (`flag`,`displayorder`);

--
-- Indexes for table `wf_common_myinvite`
--
ALTER TABLE `wf_common_myinvite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `uid` (`touid`,`dateline`);

--
-- Indexes for table `wf_common_mytask`
--
ALTER TABLE `wf_common_mytask`
  ADD PRIMARY KEY (`uid`,`taskid`),
  ADD KEY `parter` (`taskid`,`dateline`);

--
-- Indexes for table `wf_common_nav`
--
ALTER TABLE `wf_common_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `navtype` (`navtype`);

--
-- Indexes for table `wf_common_onlinetime`
--
ALTER TABLE `wf_common_onlinetime`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_common_patch`
--
ALTER TABLE `wf_common_patch`
  ADD PRIMARY KEY (`serial`);

--
-- Indexes for table `wf_common_plugin`
--
ALTER TABLE `wf_common_plugin`
  ADD PRIMARY KEY (`pluginid`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `wf_common_pluginvar`
--
ALTER TABLE `wf_common_pluginvar`
  ADD PRIMARY KEY (`pluginvarid`),
  ADD KEY `pluginid` (`pluginid`);

--
-- Indexes for table `wf_common_process`
--
ALTER TABLE `wf_common_process`
  ADD PRIMARY KEY (`processid`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `wf_common_regip`
--
ALTER TABLE `wf_common_regip`
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `wf_common_relatedlink`
--
ALTER TABLE `wf_common_relatedlink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_report`
--
ALTER TABLE `wf_common_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `urlkey` (`urlkey`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `wf_common_searchindex`
--
ALTER TABLE `wf_common_searchindex`
  ADD PRIMARY KEY (`searchid`),
  ADD KEY `srchmod` (`srchmod`);

--
-- Indexes for table `wf_common_secquestion`
--
ALTER TABLE `wf_common_secquestion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_session`
--
ALTER TABLE `wf_common_session`
  ADD UNIQUE KEY `sid` (`sid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_common_setting`
--
ALTER TABLE `wf_common_setting`
  ADD PRIMARY KEY (`skey`);

--
-- Indexes for table `wf_common_smiley`
--
ALTER TABLE `wf_common_smiley`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`displayorder`);

--
-- Indexes for table `wf_common_sphinxcounter`
--
ALTER TABLE `wf_common_sphinxcounter`
  ADD PRIMARY KEY (`indexid`);

--
-- Indexes for table `wf_common_stat`
--
ALTER TABLE `wf_common_stat`
  ADD PRIMARY KEY (`daytime`);

--
-- Indexes for table `wf_common_statuser`
--
ALTER TABLE `wf_common_statuser`
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_common_style`
--
ALTER TABLE `wf_common_style`
  ADD PRIMARY KEY (`styleid`);

--
-- Indexes for table `wf_common_stylevar`
--
ALTER TABLE `wf_common_stylevar`
  ADD PRIMARY KEY (`stylevarid`),
  ADD KEY `styleid` (`styleid`);

--
-- Indexes for table `wf_common_syscache`
--
ALTER TABLE `wf_common_syscache`
  ADD PRIMARY KEY (`cname`);

--
-- Indexes for table `wf_common_tag`
--
ALTER TABLE `wf_common_tag`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `tagname` (`tagname`),
  ADD KEY `status` (`status`,`tagid`);

--
-- Indexes for table `wf_common_tagitem`
--
ALTER TABLE `wf_common_tagitem`
  ADD UNIQUE KEY `item` (`tagid`,`itemid`,`idtype`),
  ADD KEY `tagid` (`tagid`,`idtype`),
  ADD KEY `idtype` (`idtype`,`itemid`);

--
-- Indexes for table `wf_common_task`
--
ALTER TABLE `wf_common_task`
  ADD PRIMARY KEY (`taskid`);

--
-- Indexes for table `wf_common_taskvar`
--
ALTER TABLE `wf_common_taskvar`
  ADD PRIMARY KEY (`taskvarid`),
  ADD KEY `taskid` (`taskid`);

--
-- Indexes for table `wf_common_template`
--
ALTER TABLE `wf_common_template`
  ADD PRIMARY KEY (`templateid`);

--
-- Indexes for table `wf_common_template_block`
--
ALTER TABLE `wf_common_template_block`
  ADD PRIMARY KEY (`targettplname`,`tpldirectory`,`bid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `wf_common_template_permission`
--
ALTER TABLE `wf_common_template_permission`
  ADD PRIMARY KEY (`targettplname`,`uid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_common_uin_black`
--
ALTER TABLE `wf_common_uin_black`
  ADD PRIMARY KEY (`uin`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `wf_common_usergroup`
--
ALTER TABLE `wf_common_usergroup`
  ADD PRIMARY KEY (`groupid`),
  ADD KEY `creditsrange` (`creditshigher`,`creditslower`);

--
-- Indexes for table `wf_common_usergroup_field`
--
ALTER TABLE `wf_common_usergroup_field`
  ADD PRIMARY KEY (`groupid`);

--
-- Indexes for table `wf_common_word`
--
ALTER TABLE `wf_common_word`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_common_word_type`
--
ALTER TABLE `wf_common_word_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_company`
--
ALTER TABLE `wf_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_complain`
--
ALTER TABLE `wf_complain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userId` (`createdId`),
  ADD KEY `status` (`status`),
  ADD KEY `isRead` (`isRead`);

--
-- Indexes for table `wf_comp_joins`
--
ALTER TABLE `wf_comp_joins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_connect_disktask`
--
ALTER TABLE `wf_connect_disktask`
  ADD PRIMARY KEY (`taskid`),
  ADD KEY `openid` (`openid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_connect_feedlog`
--
ALTER TABLE `wf_connect_feedlog`
  ADD PRIMARY KEY (`flid`),
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Indexes for table `wf_connect_memberbindlog`
--
ALTER TABLE `wf_connect_memberbindlog`
  ADD PRIMARY KEY (`mblid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uin` (`uin`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_connect_postfeedlog`
--
ALTER TABLE `wf_connect_postfeedlog`
  ADD PRIMARY KEY (`flid`),
  ADD UNIQUE KEY `pid` (`pid`);

--
-- Indexes for table `wf_connect_tlog`
--
ALTER TABLE `wf_connect_tlog`
  ADD PRIMARY KEY (`tlid`),
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Indexes for table `wf_connect_tthreadlog`
--
ALTER TABLE `wf_connect_tthreadlog`
  ADD PRIMARY KEY (`twid`),
  ADD KEY `nexttime` (`tid`,`nexttime`),
  ADD KEY `updatetime` (`tid`,`updatetime`);

--
-- Indexes for table `wf_cost`
--
ALTER TABLE `wf_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_cost_category`
--
ALTER TABLE `wf_cost_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_arrangers`
--
ALTER TABLE `wf_decorate_arrangers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `arrangeId,_clientId` (`arrangeId`,`clientId`),
  ADD KEY `clientId` (`clientId`);

--
-- Indexes for table `wf_decorate_client`
--
ALTER TABLE `wf_decorate_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_client_apply`
--
ALTER TABLE `wf_decorate_client_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_company_apply`
--
ALTER TABLE `wf_decorate_company_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_company_base`
--
ALTER TABLE `wf_decorate_company_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_company_case`
--
ALTER TABLE `wf_decorate_company_case`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_company_follow`
--
ALTER TABLE `wf_decorate_company_follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_company_letter`
--
ALTER TABLE `wf_decorate_company_letter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_company_photo`
--
ALTER TABLE `wf_decorate_company_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_company_rank`
--
ALTER TABLE `wf_decorate_company_rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_decorate_visit`
--
ALTER TABLE `wf_decorate_visit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `clientId` (`clientId`),
  ADD KEY `status` (`status`),
  ADD KEY `visitId` (`visitId`);

--
-- Indexes for table `wf_deyou_agency_inquiry`
--
ALTER TABLE `wf_deyou_agency_inquiry`
  ADD PRIMARY KEY (`InquiryID`,`LastFollowDate`);

--
-- Indexes for table `wf_deyou_agency_property`
--
ALTER TABLE `wf_deyou_agency_property`
  ADD PRIMARY KEY (`PropertyID`);

--
-- Indexes for table `wf_dingcan`
--
ALTER TABLE `wf_dingcan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderDate` (`orderDate`),
  ADD KEY `belongUserId` (`belongUserId`),
  ADD KEY `departId` (`departmentId`);

--
-- Indexes for table `wf_dingcan_menu`
--
ALTER TABLE `wf_dingcan_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_documents`
--
ALTER TABLE `wf_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_dujia_hotel`
--
ALTER TABLE `wf_dujia_hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `county` (`county`),
  ADD KEY `city` (`city`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wf_dujia_hotel_house`
--
ALTER TABLE `wf_dujia_hotel_house`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_dujia_hotel_pic`
--
ALTER TABLE `wf_dujia_hotel_pic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_dujia_hotel_price`
--
ALTER TABLE `wf_dujia_hotel_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `wf_dujia_order`
--
ALTER TABLE `wf_dujia_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `out_trade_no` (`out_trade_no`);

--
-- Indexes for table `wf_dujia_order_paylog`
--
ALTER TABLE `wf_dujia_order_paylog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `result_code_trade` (`result_code`,`out_trade_no`);

--
-- Indexes for table `wf_dujia_user`
--
ALTER TABLE `wf_dujia_user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `wf_dynamic`
--
ALTER TABLE `wf_dynamic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_exchange_goods`
--
ALTER TABLE `wf_exchange_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_expand_account`
--
ALTER TABLE `wf_expand_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`,`status`);

--
-- Indexes for table `wf_expand_accounts`
--
ALTER TABLE `wf_expand_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_expand_apply`
--
ALTER TABLE `wf_expand_apply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- Indexes for table `wf_expand_cost`
--
ALTER TABLE `wf_expand_cost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_expand_count`
--
ALTER TABLE `wf_expand_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `month` (`type`,`month`,`departmentId`,`shopArea`) USING BTREE;

--
-- Indexes for table `wf_fangmeng_message`
--
ALTER TABLE `wf_fangmeng_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_faq`
--
ALTER TABLE `wf_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `title` (`title`(333)),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `updatedBy` (`updatedBy`);

--
-- Indexes for table `wf_fencount_adviser`
--
ALTER TABLE `wf_fencount_adviser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belongId` (`belongId`) USING BTREE,
  ADD KEY `departmentId` (`belongId`),
  ADD KEY `times` (`times`) USING BTREE,
  ADD KEY `timesType` (`timesType`);

--
-- Indexes for table `wf_fencount_area`
--
ALTER TABLE `wf_fencount_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `belongId` (`belongId`),
  ADD KEY `roleId` (`roleId`),
  ADD KEY `times` (`times`) USING BTREE;

--
-- Indexes for table `wf_fencount_areag`
--
ALTER TABLE `wf_fencount_areag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `times` (`times`) USING BTREE;

--
-- Indexes for table `wf_fencount_buycity`
--
ALTER TABLE `wf_fencount_buycity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`) USING BTREE,
  ADD KEY `city_name` (`city_name`);

--
-- Indexes for table `wf_fencount_from`
--
ALTER TABLE `wf_fencount_from`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adviser_id` (`adviser_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `belongId` (`belongId`),
  ADD KEY `roleId` (`roleId`),
  ADD KEY `times` (`times`) USING BTREE;

--
-- Indexes for table `wf_fencount_fromg`
--
ALTER TABLE `wf_fencount_fromg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `times` (`times`) USING BTREE,
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `wf_fencount_groups`
--
ALTER TABLE `wf_fencount_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`) USING BTREE,
  ADD KEY `timesType` (`timesType`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `wf_fencount_interact`
--
ALTER TABLE `wf_fencount_interact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fencount_propertys`
--
ALTER TABLE `wf_fencount_propertys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fencount_soapbuildings`
--
ALTER TABLE `wf_fencount_soapbuildings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_fencount_soaps`
--
ALTER TABLE `wf_fencount_soaps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`);

--
-- Indexes for table `wf_fencount_visits`
--
ALTER TABLE `wf_fencount_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`),
  ADD KEY `belongId` (`belongId`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `wf_fencount_visitslevel`
--
ALTER TABLE `wf_fencount_visitslevel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `times` (`times`),
  ADD KEY `clientLevel` (`clientLevel`) USING BTREE,
  ADD KEY `clientType` (`clientType`);

--
-- Indexes for table `wf_fenxiao_arrange`
--
ALTER TABLE `wf_fenxiao_arrange`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `arrangeId` (`arrangeId`) USING BTREE,
  ADD KEY `clientId` (`clientId`);

--
-- Indexes for table `wf_fenxiao_arrangers`
--
ALTER TABLE `wf_fenxiao_arrangers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `arrangeId,_clientId` (`arrangeId`,`clientId`),
  ADD KEY `clientId` (`clientId`);

--
-- Indexes for table `wf_fenxiao_client`
--
ALTER TABLE `wf_fenxiao_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `createdAt` (`createdAt`),
  ADD KEY `askDate` (`askDate`),
  ADD KEY `userId` (`userId`) USING BTREE,
  ADD KEY `tel` (`tel`),
  ADD KEY `belong_arrangeIds` (`belongUserId`,`arrangeId`,`id`) USING BTREE,
  ADD KEY `createdId` (`createdId`) USING BTREE;

--
-- Indexes for table `wf_fenxiao_clientfollow`
--
ALTER TABLE `wf_fenxiao_clientfollow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `clientId` (`clientId`);

--
-- Indexes for table `wf_fenxiao_client_little`
--
ALTER TABLE `wf_fenxiao_client_little`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_client_tel`
--
ALTER TABLE `wf_fenxiao_client_tel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_complaint`
--
ALTER TABLE `wf_fenxiao_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `updatedAt` (`updatedAt`);

--
-- Indexes for table `wf_fenxiao_dealbuilding`
--
ALTER TABLE `wf_fenxiao_dealbuilding`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `summaryId` (`summaryId`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_fenxiao_dealscale`
--
ALTER TABLE `wf_fenxiao_dealscale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_dj`
--
ALTER TABLE `wf_fenxiao_dj`
  ADD PRIMARY KEY (`djId`);

--
-- Indexes for table `wf_fenxiao_duty`
--
ALTER TABLE `wf_fenxiao_duty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_money_param`
--
ALTER TABLE `wf_fenxiao_money_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_prebuilding`
--
ALTER TABLE `wf_fenxiao_prebuilding`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `seeStatus` (`seeStatus`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_fenxiao_property`
--
ALTER TABLE `wf_fenxiao_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `unitPrice` (`unitPrice`),
  ADD KEY `unitPrice1` (`unitPrice1`);

--
-- Indexes for table `wf_fenxiao_remoney`
--
ALTER TABLE `wf_fenxiao_remoney`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_reported`
--
ALTER TABLE `wf_fenxiao_reported`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_reported_client`
--
ALTER TABLE `wf_fenxiao_reported_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_reported_status`
--
ALTER TABLE `wf_fenxiao_reported_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_sales`
--
ALTER TABLE `wf_fenxiao_sales`
  ADD PRIMARY KEY (`buildingId`),
  ADD KEY `buildingId` (`buildingId`);

--
-- Indexes for table `wf_fenxiao_summary`
--
ALTER TABLE `wf_fenxiao_summary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_fenxiao_summary_view`
--
ALTER TABLE `wf_fenxiao_summary_view`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_fenxiao_tel`
--
ALTER TABLE `wf_fenxiao_tel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`tel`,`xtel`);

--
-- Indexes for table `wf_fenxiao_tel_views`
--
ALTER TABLE `wf_fenxiao_tel_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currentId` (`currentId`);

--
-- Indexes for table `wf_fenxiao_usercar`
--
ALTER TABLE `wf_fenxiao_usercar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `getArrangeId` (`getArrangeId`) USING BTREE;

--
-- Indexes for table `wf_fenxiao_visit`
--
ALTER TABLE `wf_fenxiao_visit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `clientId` (`clientId`),
  ADD KEY `status` (`status`),
  ADD KEY `visitId` (`visitId`),
  ADD KEY `type` (`type`) USING BTREE;

--
-- Indexes for table `wf_fenxiao_visit1`
--
ALTER TABLE `wf_fenxiao_visit1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `clientId` (`clientId`),
  ADD KEY `status` (`status`),
  ADD KEY `visitId` (`visitId`),
  ADD KEY `type` (`type`) USING BTREE;

--
-- Indexes for table `wf_fenxiao_visit_content`
--
ALTER TABLE `wf_fenxiao_visit_content`
  ADD PRIMARY KEY (`visitId`);

--
-- Indexes for table `wf_form_agent`
--
ALTER TABLE `wf_form_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_agent_address`
--
ALTER TABLE `wf_form_agent_address`
  ADD KEY `agent_id` (`agent_id`) USING BTREE;

--
-- Indexes for table `wf_form_agent_dw`
--
ALTER TABLE `wf_form_agent_dw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_field`
--
ALTER TABLE `wf_form_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_garrison`
--
ALTER TABLE `wf_form_garrison`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_garrison_img`
--
ALTER TABLE `wf_form_garrison_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_inspections_hks`
--
ALTER TABLE `wf_form_inspections_hks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_inspections_hks_statistics`
--
ALTER TABLE `wf_form_inspections_hks_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_material`
--
ALTER TABLE `wf_form_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_patrol`
--
ALTER TABLE `wf_form_patrol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_patrol_chargebacks`
--
ALTER TABLE `wf_form_patrol_chargebacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_patrol_img`
--
ALTER TABLE `wf_form_patrol_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_salesman`
--
ALTER TABLE `wf_form_salesman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_form_visit`
--
ALTER TABLE `wf_form_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_forum_access`
--
ALTER TABLE `wf_forum_access`
  ADD PRIMARY KEY (`uid`,`fid`),
  ADD KEY `listorder` (`fid`,`dateline`);

--
-- Indexes for table `wf_forum_activity`
--
ALTER TABLE `wf_forum_activity`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`,`starttimefrom`),
  ADD KEY `starttimefrom` (`starttimefrom`),
  ADD KEY `expiration` (`expiration`),
  ADD KEY `applynumber` (`applynumber`);

--
-- Indexes for table `wf_forum_activityapply`
--
ALTER TABLE `wf_forum_activityapply`
  ADD PRIMARY KEY (`applyid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `dateline` (`tid`,`dateline`);

--
-- Indexes for table `wf_forum_announcement`
--
ALTER TABLE `wf_forum_announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timespan` (`starttime`,`endtime`);

--
-- Indexes for table `wf_forum_attachment`
--
ALTER TABLE `wf_forum_attachment`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_0`
--
ALTER TABLE `wf_forum_attachment_0`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_1`
--
ALTER TABLE `wf_forum_attachment_1`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_2`
--
ALTER TABLE `wf_forum_attachment_2`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_3`
--
ALTER TABLE `wf_forum_attachment_3`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_4`
--
ALTER TABLE `wf_forum_attachment_4`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_5`
--
ALTER TABLE `wf_forum_attachment_5`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_6`
--
ALTER TABLE `wf_forum_attachment_6`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_7`
--
ALTER TABLE `wf_forum_attachment_7`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_8`
--
ALTER TABLE `wf_forum_attachment_8`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_9`
--
ALTER TABLE `wf_forum_attachment_9`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachment_exif`
--
ALTER TABLE `wf_forum_attachment_exif`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `wf_forum_attachment_unused`
--
ALTER TABLE `wf_forum_attachment_unused`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_attachtype`
--
ALTER TABLE `wf_forum_attachtype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `wf_forum_bbcode`
--
ALTER TABLE `wf_forum_bbcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_forum_building`
--
ALTER TABLE `wf_forum_building`
  ADD PRIMARY KEY (`buildingid`),
  ADD UNIQUE KEY `fid` (`fid`) USING BTREE,
  ADD UNIQUE KEY `buildingid` (`buildingid`) USING BTREE;

--
-- Indexes for table `wf_forum_collection`
--
ALTER TABLE `wf_forum_collection`
  ADD PRIMARY KEY (`ctid`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `hotcollection` (`threadnum`,`lastupdate`),
  ADD KEY `follownum` (`follownum`);

--
-- Indexes for table `wf_forum_collectioncomment`
--
ALTER TABLE `wf_forum_collectioncomment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `ctid` (`ctid`,`dateline`),
  ADD KEY `userrate` (`ctid`,`uid`,`rate`);

--
-- Indexes for table `wf_forum_collectionfollow`
--
ALTER TABLE `wf_forum_collectionfollow`
  ADD PRIMARY KEY (`uid`,`ctid`),
  ADD KEY `ctid` (`ctid`,`dateline`);

--
-- Indexes for table `wf_forum_collectioninvite`
--
ALTER TABLE `wf_forum_collectioninvite`
  ADD PRIMARY KEY (`ctid`,`uid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_forum_collectionrelated`
--
ALTER TABLE `wf_forum_collectionrelated`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_collectionteamworker`
--
ALTER TABLE `wf_forum_collectionteamworker`
  ADD PRIMARY KEY (`ctid`,`uid`);

--
-- Indexes for table `wf_forum_collectionthread`
--
ALTER TABLE `wf_forum_collectionthread`
  ADD PRIMARY KEY (`ctid`,`tid`),
  ADD KEY `ctid` (`ctid`,`dateline`);

--
-- Indexes for table `wf_forum_creditslog`
--
ALTER TABLE `wf_forum_creditslog`
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_forum_debate`
--
ALTER TABLE `wf_forum_debate`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`,`starttime`);

--
-- Indexes for table `wf_forum_debatepost`
--
ALTER TABLE `wf_forum_debatepost`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `pid` (`pid`,`stand`),
  ADD KEY `tid` (`tid`,`uid`);

--
-- Indexes for table `wf_forum_faq`
--
ALTER TABLE `wf_forum_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `displayplay` (`displayorder`);

--
-- Indexes for table `wf_forum_forum`
--
ALTER TABLE `wf_forum_forum`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `forum` (`status`,`type`,`displayorder`),
  ADD KEY `fup_type` (`fup`,`type`,`displayorder`),
  ADD KEY `fup` (`fup`);

--
-- Indexes for table `wf_forum_forumfield`
--
ALTER TABLE `wf_forum_forumfield`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `membernum` (`membernum`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `lastupdate` (`lastupdate`),
  ADD KEY `activity` (`activity`);

--
-- Indexes for table `wf_forum_forumrecommend`
--
ALTER TABLE `wf_forum_forumrecommend`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `displayorder` (`fid`,`displayorder`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `wf_forum_forum_copy`
--
ALTER TABLE `wf_forum_forum_copy`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `forum` (`status`,`type`,`displayorder`),
  ADD KEY `fup_type` (`fup`,`type`,`displayorder`),
  ADD KEY `fup` (`fup`);

--
-- Indexes for table `wf_forum_forum_threadtable`
--
ALTER TABLE `wf_forum_forum_threadtable`
  ADD PRIMARY KEY (`fid`,`threadtableid`);

--
-- Indexes for table `wf_forum_groupcreditslog`
--
ALTER TABLE `wf_forum_groupcreditslog`
  ADD PRIMARY KEY (`fid`,`uid`,`logdate`);

--
-- Indexes for table `wf_forum_groupfield`
--
ALTER TABLE `wf_forum_groupfield`
  ADD UNIQUE KEY `types` (`fid`,`type`),
  ADD KEY `fid` (`fid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wf_forum_groupinvite`
--
ALTER TABLE `wf_forum_groupinvite`
  ADD UNIQUE KEY `ids` (`fid`,`inviteuid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_forum_grouplevel`
--
ALTER TABLE `wf_forum_grouplevel`
  ADD PRIMARY KEY (`levelid`),
  ADD KEY `creditsrange` (`creditshigher`,`creditslower`);

--
-- Indexes for table `wf_forum_groupranking`
--
ALTER TABLE `wf_forum_groupranking`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `today` (`today`);

--
-- Indexes for table `wf_forum_groupuser`
--
ALTER TABLE `wf_forum_groupuser`
  ADD PRIMARY KEY (`fid`,`uid`),
  ADD KEY `uid_lastupdate` (`uid`,`lastupdate`),
  ADD KEY `userlist` (`fid`,`level`,`lastupdate`);

--
-- Indexes for table `wf_forum_imagetype`
--
ALTER TABLE `wf_forum_imagetype`
  ADD PRIMARY KEY (`typeid`);

--
-- Indexes for table `wf_forum_medal`
--
ALTER TABLE `wf_forum_medal`
  ADD PRIMARY KEY (`medalid`),
  ADD KEY `displayorder` (`displayorder`),
  ADD KEY `available` (`available`,`displayorder`);

--
-- Indexes for table `wf_forum_medallog`
--
ALTER TABLE `wf_forum_medallog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`,`expiration`),
  ADD KEY `uid` (`uid`,`medalid`,`type`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_forum_memberrecommend`
--
ALTER TABLE `wf_forum_memberrecommend`
  ADD KEY `tid` (`tid`),
  ADD KEY `uid` (`recommenduid`);

--
-- Indexes for table `wf_forum_moderator`
--
ALTER TABLE `wf_forum_moderator`
  ADD PRIMARY KEY (`uid`,`fid`);

--
-- Indexes for table `wf_forum_modwork`
--
ALTER TABLE `wf_forum_modwork`
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_forum_optionvalue1`
--
ALTER TABLE `wf_forum_optionvalue1`
  ADD KEY `fid` (`fid`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `recr_style` (`recr_style`),
  ADD KEY `recr_area` (`recr_area`),
  ADD KEY `recr_price` (`recr_price`),
  ADD KEY `recr_square` (`recr_square`),
  ADD KEY `recr_type` (`recr_type`),
  ADD KEY `recr_aspect` (`recr_aspect`),
  ADD KEY `recr_floor` (`recr_floor`),
  ADD KEY `recr_decoration` (`recr_decoration`),
  ADD KEY `recr_person` (`recr_person`),
  ADD KEY `recr_types` (`recr_types`);

--
-- Indexes for table `wf_forum_optionvalue2`
--
ALTER TABLE `wf_forum_optionvalue2`
  ADD KEY `fid` (`fid`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `recr_areas` (`recr_areas`),
  ADD KEY `recr_prices` (`recr_prices`),
  ADD KEY `recr_squares` (`recr_squares`),
  ADD KEY `recr_styles` (`recr_styles`),
  ADD KEY `recr_aspects` (`recr_aspects`),
  ADD KEY `recr_decorations` (`recr_decorations`),
  ADD KEY `recr_persons` (`recr_persons`),
  ADD KEY `recr_style` (`recr_style`);

--
-- Indexes for table `wf_forum_order`
--
ALTER TABLE `wf_forum_order`
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `submitdate` (`submitdate`),
  ADD KEY `uid` (`uid`,`submitdate`);

--
-- Indexes for table `wf_forum_poll`
--
ALTER TABLE `wf_forum_poll`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_polloption`
--
ALTER TABLE `wf_forum_polloption`
  ADD PRIMARY KEY (`polloptionid`),
  ADD KEY `tid` (`tid`,`displayorder`);

--
-- Indexes for table `wf_forum_pollvoter`
--
ALTER TABLE `wf_forum_pollvoter`
  ADD KEY `tid` (`tid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_forum_post`
--
ALTER TABLE `wf_forum_post`
  ADD PRIMARY KEY (`tid`,`position`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD KEY `fid` (`fid`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `invisible` (`invisible`),
  ADD KEY `displayorder` (`tid`,`invisible`,`dateline`),
  ADD KEY `first` (`tid`,`first`),
  ADD KEY `authorid` (`authorid`,`invisible`),
  ADD KEY `buildingId` (`buildingId`,`pid`,`first`,`invisible`) USING BTREE;

--
-- Indexes for table `wf_forum_postcache`
--
ALTER TABLE `wf_forum_postcache`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_forum_postcomment`
--
ALTER TABLE `wf_forum_postcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tid` (`tid`),
  ADD KEY `authorid` (`authorid`),
  ADD KEY `score` (`score`),
  ADD KEY `rpid` (`rpid`),
  ADD KEY `pid` (`pid`,`dateline`);

--
-- Indexes for table `wf_forum_postlog`
--
ALTER TABLE `wf_forum_postlog`
  ADD PRIMARY KEY (`pid`,`tid`),
  ADD KEY `fid` (`fid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_forum_postposition`
--
ALTER TABLE `wf_forum_postposition`
  ADD PRIMARY KEY (`tid`,`position`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `wf_forum_poststick`
--
ALTER TABLE `wf_forum_poststick`
  ADD PRIMARY KEY (`tid`,`pid`),
  ADD KEY `dateline` (`tid`,`dateline`);

--
-- Indexes for table `wf_forum_post_location`
--
ALTER TABLE `wf_forum_post_location`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_post_moderate`
--
ALTER TABLE `wf_forum_post_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`,`dateline`);

--
-- Indexes for table `wf_forum_post_tableid`
--
ALTER TABLE `wf_forum_post_tableid`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `wf_forum_promotion`
--
ALTER TABLE `wf_forum_promotion`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `wf_forum_ratelog`
--
ALTER TABLE `wf_forum_ratelog`
  ADD KEY `pid` (`pid`,`dateline`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_forum_relatedthread`
--
ALTER TABLE `wf_forum_relatedthread`
  ADD PRIMARY KEY (`tid`,`type`);

--
-- Indexes for table `wf_forum_replycredit`
--
ALTER TABLE `wf_forum_replycredit`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_rsscache`
--
ALTER TABLE `wf_forum_rsscache`
  ADD UNIQUE KEY `tid` (`tid`),
  ADD KEY `fid` (`fid`,`dateline`);

--
-- Indexes for table `wf_forum_spacecache`
--
ALTER TABLE `wf_forum_spacecache`
  ADD PRIMARY KEY (`uid`,`variable`);

--
-- Indexes for table `wf_forum_statlog`
--
ALTER TABLE `wf_forum_statlog`
  ADD PRIMARY KEY (`logdate`,`fid`);

--
-- Indexes for table `wf_forum_thread`
--
ALTER TABLE `wf_forum_thread`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `digest` (`digest`),
  ADD KEY `sortid` (`sortid`),
  ADD KEY `displayorder` (`fid`,`displayorder`,`lastpost`),
  ADD KEY `typeid` (`fid`,`typeid`,`displayorder`,`lastpost`),
  ADD KEY `recommends` (`recommends`),
  ADD KEY `heats` (`heats`),
  ADD KEY `authorid` (`authorid`),
  ADD KEY `isgroup` (`isgroup`,`lastpost`),
  ADD KEY `special` (`special`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_forum_threadaddviews`
--
ALTER TABLE `wf_forum_threadaddviews`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_threadclass`
--
ALTER TABLE `wf_forum_threadclass`
  ADD PRIMARY KEY (`typeid`),
  ADD KEY `fid` (`fid`,`displayorder`);

--
-- Indexes for table `wf_forum_threadclosed`
--
ALTER TABLE `wf_forum_threadclosed`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_threaddisablepos`
--
ALTER TABLE `wf_forum_threaddisablepos`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_threadimage`
--
ALTER TABLE `wf_forum_threadimage`
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `wf_forum_threadlog`
--
ALTER TABLE `wf_forum_threadlog`
  ADD PRIMARY KEY (`tid`,`fid`,`uid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_forum_threadmod`
--
ALTER TABLE `wf_forum_threadmod`
  ADD KEY `tid` (`tid`,`dateline`),
  ADD KEY `expiration` (`expiration`,`status`);

--
-- Indexes for table `wf_forum_threadpartake`
--
ALTER TABLE `wf_forum_threadpartake`
  ADD KEY `tid` (`tid`,`uid`);

--
-- Indexes for table `wf_forum_threadpreview`
--
ALTER TABLE `wf_forum_threadpreview`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_threadrush`
--
ALTER TABLE `wf_forum_threadrush`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `wf_forum_threadtype`
--
ALTER TABLE `wf_forum_threadtype`
  ADD PRIMARY KEY (`typeid`);

--
-- Indexes for table `wf_forum_thread_moderate`
--
ALTER TABLE `wf_forum_thread_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`,`dateline`);

--
-- Indexes for table `wf_forum_trade`
--
ALTER TABLE `wf_forum_trade`
  ADD PRIMARY KEY (`tid`,`pid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `sellerid` (`sellerid`),
  ADD KEY `totalitems` (`totalitems`),
  ADD KEY `tradesum` (`tradesum`),
  ADD KEY `displayorder` (`tid`,`displayorder`),
  ADD KEY `sellertrades` (`sellerid`,`tradesum`,`totalitems`),
  ADD KEY `typeid` (`typeid`),
  ADD KEY `credittradesum` (`credittradesum`),
  ADD KEY `expiration` (`expiration`);

--
-- Indexes for table `wf_forum_tradecomment`
--
ALTER TABLE `wf_forum_tradecomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raterid` (`raterid`,`type`,`dateline`),
  ADD KEY `rateeid` (`rateeid`,`type`,`dateline`),
  ADD KEY `orderid` (`orderid`);

--
-- Indexes for table `wf_forum_tradelog`
--
ALTER TABLE `wf_forum_tradelog`
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `sellerid` (`sellerid`),
  ADD KEY `buyerid` (`buyerid`),
  ADD KEY `status` (`status`),
  ADD KEY `buyerlog` (`buyerid`,`status`,`lastupdate`),
  ADD KEY `sellerlog` (`sellerid`,`status`,`lastupdate`),
  ADD KEY `tid` (`tid`,`pid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `wf_forum_typeoption`
--
ALTER TABLE `wf_forum_typeoption`
  ADD PRIMARY KEY (`optionid`),
  ADD KEY `classid` (`classid`);

--
-- Indexes for table `wf_forum_typeoptionvar`
--
ALTER TABLE `wf_forum_typeoptionvar`
  ADD KEY `sortid` (`sortid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `wf_forum_typevar`
--
ALTER TABLE `wf_forum_typevar`
  ADD UNIQUE KEY `optionid` (`sortid`,`optionid`),
  ADD KEY `sortid` (`sortid`);

--
-- Indexes for table `wf_forum_warning`
--
ALTER TABLE `wf_forum_warning`
  ADD PRIMARY KEY (`wid`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD KEY `authorid` (`authorid`);

--
-- Indexes for table `wf_help`
--
ALTER TABLE `wf_help`
  ADD PRIMARY KEY (`id`),
  ADD FULLTEXT KEY `kw` (`keyword`);

--
-- Indexes for table `wf_help_category`
--
ALTER TABLE `wf_help_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_help_feedback`
--
ALTER TABLE `wf_help_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_help_file`
--
ALTER TABLE `wf_help_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_hire_browsed`
--
ALTER TABLE `wf_hire_browsed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `hireId` (`hireId`);

--
-- Indexes for table `wf_hire_concern`
--
ALTER TABLE `wf_hire_concern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `hireId` (`hireId`);

--
-- Indexes for table `wf_hire_content`
--
ALTER TABLE `wf_hire_content`
  ADD PRIMARY KEY (`hireId`);

--
-- Indexes for table `wf_hire_house`
--
ALTER TABLE `wf_hire_house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `city` (`city`),
  ADD KEY `updateAt` (`updatedBy`),
  ADD KEY `createdId` (`createdId`) USING BTREE;

--
-- Indexes for table `wf_hire_img`
--
ALTER TABLE `wf_hire_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `hireId` (`hireId`) USING BTREE;

--
-- Indexes for table `wf_home_album`
--
ALTER TABLE `wf_home_album`
  ADD PRIMARY KEY (`albumid`),
  ADD KEY `uid` (`uid`,`updatetime`),
  ADD KEY `updatetime` (`updatetime`);

--
-- Indexes for table `wf_home_album_category`
--
ALTER TABLE `wf_home_album_category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `wf_home_appcreditlog`
--
ALTER TABLE `wf_home_appcreditlog`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `appid` (`appid`);

--
-- Indexes for table `wf_home_blacklist`
--
ALTER TABLE `wf_home_blacklist`
  ADD PRIMARY KEY (`uid`,`buid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_home_blog`
--
ALTER TABLE `wf_home_blog`
  ADD PRIMARY KEY (`blogid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `hot` (`hot`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_home_blogfield`
--
ALTER TABLE `wf_home_blogfield`
  ADD PRIMARY KEY (`blogid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_home_blog_category`
--
ALTER TABLE `wf_home_blog_category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `wf_home_blog_moderate`
--
ALTER TABLE `wf_home_blog_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`,`dateline`);

--
-- Indexes for table `wf_home_class`
--
ALTER TABLE `wf_home_class`
  ADD PRIMARY KEY (`classid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_home_click`
--
ALTER TABLE `wf_home_click`
  ADD PRIMARY KEY (`clickid`),
  ADD KEY `idtype` (`idtype`,`displayorder`);

--
-- Indexes for table `wf_home_clickuser`
--
ALTER TABLE `wf_home_clickuser`
  ADD KEY `id` (`id`,`idtype`,`dateline`),
  ADD KEY `uid` (`uid`,`idtype`,`dateline`);

--
-- Indexes for table `wf_home_comment`
--
ALTER TABLE `wf_home_comment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `authorid` (`authorid`,`idtype`),
  ADD KEY `id` (`id`,`idtype`,`dateline`);

--
-- Indexes for table `wf_home_comment_moderate`
--
ALTER TABLE `wf_home_comment_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtype` (`idtype`,`status`,`dateline`);

--
-- Indexes for table `wf_home_docomment`
--
ALTER TABLE `wf_home_docomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doid` (`doid`,`dateline`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_home_doing`
--
ALTER TABLE `wf_home_doing`
  ADD PRIMARY KEY (`doid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_home_doing_moderate`
--
ALTER TABLE `wf_home_doing_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`,`dateline`);

--
-- Indexes for table `wf_home_favorite`
--
ALTER TABLE `wf_home_favorite`
  ADD PRIMARY KEY (`favid`),
  ADD KEY `idtype` (`id`,`idtype`),
  ADD KEY `uid` (`uid`,`idtype`,`dateline`);

--
-- Indexes for table `wf_home_feed`
--
ALTER TABLE `wf_home_feed`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `dateline` (`dateline`),
  ADD KEY `hot` (`hot`),
  ADD KEY `id` (`id`,`idtype`);

--
-- Indexes for table `wf_home_feed_app`
--
ALTER TABLE `wf_home_feed_app`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_home_follow`
--
ALTER TABLE `wf_home_follow`
  ADD PRIMARY KEY (`uid`,`followuid`);

--
-- Indexes for table `wf_home_follow_feed`
--
ALTER TABLE `wf_home_follow_feed`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_home_follow_feed_archiver`
--
ALTER TABLE `wf_home_follow_feed_archiver`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_home_friend`
--
ALTER TABLE `wf_home_friend`
  ADD PRIMARY KEY (`uid`,`fuid`),
  ADD KEY `fuid` (`fuid`),
  ADD KEY `uid` (`uid`,`num`,`dateline`);

--
-- Indexes for table `wf_home_friendlog`
--
ALTER TABLE `wf_home_friendlog`
  ADD PRIMARY KEY (`uid`,`fuid`);

--
-- Indexes for table `wf_home_friend_request`
--
ALTER TABLE `wf_home_friend_request`
  ADD PRIMARY KEY (`uid`,`fuid`),
  ADD KEY `fuid` (`fuid`),
  ADD KEY `dateline` (`uid`,`dateline`);

--
-- Indexes for table `wf_home_notification`
--
ALTER TABLE `wf_home_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`new`,`dateline`),
  ADD KEY `from_id` (`from_id`,`from_idtype`);

--
-- Indexes for table `wf_home_pic`
--
ALTER TABLE `wf_home_pic`
  ADD PRIMARY KEY (`picid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `albumid` (`albumid`,`dateline`);

--
-- Indexes for table `wf_home_picfield`
--
ALTER TABLE `wf_home_picfield`
  ADD PRIMARY KEY (`picid`);

--
-- Indexes for table `wf_home_pic_moderate`
--
ALTER TABLE `wf_home_pic_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`,`dateline`);

--
-- Indexes for table `wf_home_poke`
--
ALTER TABLE `wf_home_poke`
  ADD PRIMARY KEY (`uid`,`fromuid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_home_pokearchive`
--
ALTER TABLE `wf_home_pokearchive`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `pokeuid` (`pokeuid`);

--
-- Indexes for table `wf_home_share`
--
ALTER TABLE `wf_home_share`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `uid` (`uid`,`dateline`),
  ADD KEY `hot` (`hot`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_home_share_moderate`
--
ALTER TABLE `wf_home_share_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`,`dateline`);

--
-- Indexes for table `wf_home_show`
--
ALTER TABLE `wf_home_show`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `unitprice` (`unitprice`),
  ADD KEY `credit` (`credit`);

--
-- Indexes for table `wf_home_specialuser`
--
ALTER TABLE `wf_home_specialuser`
  ADD KEY `uid` (`uid`,`status`),
  ADD KEY `displayorder` (`status`,`displayorder`);

--
-- Indexes for table `wf_home_userapp`
--
ALTER TABLE `wf_home_userapp`
  ADD KEY `uid` (`uid`,`appid`),
  ADD KEY `menuorder` (`uid`,`menuorder`),
  ADD KEY `displayorder` (`uid`,`displayorder`);

--
-- Indexes for table `wf_home_userappfield`
--
ALTER TABLE `wf_home_userappfield`
  ADD KEY `uid` (`uid`,`appid`);

--
-- Indexes for table `wf_home_visitor`
--
ALTER TABLE `wf_home_visitor`
  ADD PRIMARY KEY (`uid`,`vuid`),
  ADD KEY `vuid` (`vuid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_index_property`
--
ALTER TABLE `wf_index_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_inotice`
--
ALTER TABLE `wf_inotice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_interact_record`
--
ALTER TABLE `wf_interact_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `interactId` (`interactId`);

--
-- Indexes for table `wf_interact_user`
--
ALTER TABLE `wf_interact_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belongUserId` (`belongUserId`),
  ADD KEY `updateAt` (`updateAt`),
  ADD KEY `userId` (`userId`) USING BTREE,
  ADD KEY `tel` (`tel`);

--
-- Indexes for table `wf_internal_links`
--
ALTER TABLE `wf_internal_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wf_links`
--
ALTER TABLE `wf_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `channel` (`channel`),
  ADD KEY `status` (`status`),
  ADD KEY `updatedBy` (`updatedBy`),
  ADD KEY `title` (`title`),
  ADD KEY `cityId` (`cityId`);

--
-- Indexes for table `wf_log`
--
ALTER TABLE `wf_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdAt` (`createdAt`),
  ADD FULLTEXT KEY `msg` (`msg`);

--
-- Indexes for table `wf_meeting_apply`
--
ALTER TABLE `wf_meeting_apply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meetingRoomId` (`meetingRoomId`) USING BTREE;

--
-- Indexes for table `wf_meeting_equipment`
--
ALTER TABLE `wf_meeting_equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_meeting_room`
--
ALTER TABLE `wf_meeting_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_message`
--
ALTER TABLE `wf_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_mobile_setting`
--
ALTER TABLE `wf_mobile_setting`
  ADD PRIMARY KEY (`skey`);

--
-- Indexes for table `wf_msg_send`
--
ALTER TABLE `wf_msg_send`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_msg_template`
--
ALTER TABLE `wf_msg_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_myrepeats`
--
ALTER TABLE `wf_myrepeats`
  ADD PRIMARY KEY (`uid`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `wf_news`
--
ALTER TABLE `wf_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `sortId` (`sortId`),
  ADD KEY `categoryId` (`categoryId`) USING BTREE,
  ADD KEY `status` (`status`) USING HASH,
  ADD KEY `istops` (`categoryId`,`updatedAt`,`isTop`,`status`) USING BTREE,
  ADD KEY `createdAt` (`createdAt`) USING BTREE;

--
-- Indexes for table `wf_news_category`
--
ALTER TABLE `wf_news_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `wf_news_content`
--
ALTER TABLE `wf_news_content`
  ADD PRIMARY KEY (`newsId`),
  ADD UNIQUE KEY `id` (`newsId`);

--
-- Indexes for table `wf_news_statistics`
--
ALTER TABLE `wf_news_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_news_subscribe`
--
ALTER TABLE `wf_news_subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_notice`
--
ALTER TABLE `wf_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_onez_qraccount_binds`
--
ALTER TABLE `wf_onez_qraccount_binds`
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `rndkey` (`rndkey`),
  ADD KEY `loginkey` (`loginkey`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `wf_order_house`
--
ALTER TABLE `wf_order_house`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_order_refresh`
--
ALTER TABLE `wf_order_refresh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_partner`
--
ALTER TABLE `wf_partner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `updatedBy` (`updatedBy`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `wf_plot_img`
--
ALTER TABLE `wf_plot_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_portal_article_content`
--
ALTER TABLE `wf_portal_article_content`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `aid` (`aid`,`pageorder`),
  ADD KEY `pageorder` (`pageorder`);

--
-- Indexes for table `wf_portal_article_count`
--
ALTER TABLE `wf_portal_article_count`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `wf_portal_article_moderate`
--
ALTER TABLE `wf_portal_article_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`,`dateline`);

--
-- Indexes for table `wf_portal_article_related`
--
ALTER TABLE `wf_portal_article_related`
  ADD PRIMARY KEY (`aid`,`raid`),
  ADD KEY `aid` (`aid`,`displayorder`);

--
-- Indexes for table `wf_portal_article_title`
--
ALTER TABLE `wf_portal_article_title`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `catid` (`catid`,`dateline`);

--
-- Indexes for table `wf_portal_article_trash`
--
ALTER TABLE `wf_portal_article_trash`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `wf_portal_attachment`
--
ALTER TABLE `wf_portal_attachment`
  ADD PRIMARY KEY (`attachid`),
  ADD KEY `aid` (`aid`,`attachid`);

--
-- Indexes for table `wf_portal_category`
--
ALTER TABLE `wf_portal_category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `wf_portal_category_permission`
--
ALTER TABLE `wf_portal_category_permission`
  ADD PRIMARY KEY (`catid`,`uid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_portal_comment`
--
ALTER TABLE `wf_portal_comment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `idtype` (`id`,`idtype`,`dateline`);

--
-- Indexes for table `wf_portal_comment_moderate`
--
ALTER TABLE `wf_portal_comment_moderate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtype` (`idtype`,`status`,`dateline`);

--
-- Indexes for table `wf_portal_rsscache`
--
ALTER TABLE `wf_portal_rsscache`
  ADD UNIQUE KEY `aid` (`aid`),
  ADD KEY `catid` (`catid`,`dateline`);

--
-- Indexes for table `wf_portal_topic`
--
ALTER TABLE `wf_portal_topic`
  ADD PRIMARY KEY (`topicid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wf_portal_topic_pic`
--
ALTER TABLE `wf_portal_topic_pic`
  ADD PRIMARY KEY (`picid`),
  ADD KEY `topicid` (`topicid`);

--
-- Indexes for table `wf_protocol`
--
ALTER TABLE `wf_protocol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_qudao_role`
--
ALTER TABLE `wf_qudao_role`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `wf_qudao_visit`
--
ALTER TABLE `wf_qudao_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_recommend_log`
--
ALTER TABLE `wf_recommend_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_report_jieyong`
--
ALTER TABLE `wf_report_jieyong`
  ADD PRIMARY KEY (`reportId`);

--
-- Indexes for table `wf_report_record`
--
ALTER TABLE `wf_report_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_resources`
--
ALTER TABLE `wf_resources`
  ADD PRIMARY KEY (`dateAt`,`typeId`);

--
-- Indexes for table `wf_resource_date`
--
ALTER TABLE `wf_resource_date`
  ADD PRIMARY KEY (`dateAt`);

--
-- Indexes for table `wf_resource_type`
--
ALTER TABLE `wf_resource_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_role`
--
ALTER TABLE `wf_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `pId` (`pId`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_role_advocate`
--
ALTER TABLE `wf_role_advocate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_role_department`
--
ALTER TABLE `wf_role_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_role_idepartment`
--
ALTER TABLE `wf_role_idepartment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `wf_role_info`
--
ALTER TABLE `wf_role_info`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `wf_role_jobs`
--
ALTER TABLE `wf_role_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_role_jobs_change`
--
ALTER TABLE `wf_role_jobs_change`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_role_mac`
--
ALTER TABLE `wf_role_mac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_role_members`
--
ALTER TABLE `wf_role_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId_month` (`userId`,`month`) USING BTREE;

--
-- Indexes for table `wf_role_nav`
--
ALTER TABLE `wf_role_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_role_nav_old`
--
ALTER TABLE `wf_role_nav_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `sort` (`sort`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_role_node`
--
ALTER TABLE `wf_role_node`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `pId` (`pId`),
  ADD KEY `groupId` (`roleNavId`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `wf_role_node_old`
--
ALTER TABLE `wf_role_node_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `pId` (`pId`),
  ADD KEY `groupId` (`roleNavId`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `wf_role_pic`
--
ALTER TABLE `wf_role_pic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `createdId` (`createdId`),
  ADD KEY `createdBy` (`createdBy`);

--
-- Indexes for table `wf_role_pic_category`
--
ALTER TABLE `wf_role_pic_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `createdId` (`createdId`);

--
-- Indexes for table `wf_role_user`
--
ALTER TABLE `wf_role_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `roleId` (`roleId`),
  ADD KEY `roleArea` (`roleArea`) USING BTREE,
  ADD KEY `trueName` (`trueName`) USING BTREE;

--
-- Indexes for table `wf_role_user_other`
--
ALTER TABLE `wf_role_user_other`
  ADD PRIMARY KEY (`role_user_id`);

--
-- Indexes for table `wf_sale_browsed`
--
ALTER TABLE `wf_sale_browsed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `saleId` (`saleId`);

--
-- Indexes for table `wf_sale_comments`
--
ALTER TABLE `wf_sale_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `saleId` (`saleId`);

--
-- Indexes for table `wf_sale_concern`
--
ALTER TABLE `wf_sale_concern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `saleId` (`saleId`);

--
-- Indexes for table `wf_sale_content`
--
ALTER TABLE `wf_sale_content`
  ADD PRIMARY KEY (`saleId`),
  ADD KEY `saleId` (`saleId`);

--
-- Indexes for table `wf_sale_fenxiao`
--
ALTER TABLE `wf_sale_fenxiao`
  ADD PRIMARY KEY (`saleId`),
  ADD KEY `id` (`saleId`);

--
-- Indexes for table `wf_sale_house`
--
ALTER TABLE `wf_sale_house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `city` (`city`),
  ADD KEY `status` (`status`),
  ADD KEY `createdId` (`createdId`),
  ADD KEY `updatedAt` (`updatedAt`),
  ADD KEY `isagent` (`isagent`),
  ADD KEY `buildingId` (`buildingId`),
  ADD KEY `title` (`title`) USING BTREE;

--
-- Indexes for table `wf_sale_img`
--
ALTER TABLE `wf_sale_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `saleId` (`saleId`);

--
-- Indexes for table `wf_search_keywords`
--
ALTER TABLE `wf_search_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_security_evilpost`
--
ALTER TABLE `wf_security_evilpost`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `type` (`tid`,`type`),
  ADD KEY `operateresult` (`operateresult`,`createtime`);

--
-- Indexes for table `wf_security_eviluser`
--
ALTER TABLE `wf_security_eviluser`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `operateresult` (`operateresult`,`createtime`);

--
-- Indexes for table `wf_security_failedlog`
--
ALTER TABLE `wf_security_failedlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `wf_sellbuilding_tags`
--
ALTER TABLE `wf_sellbuilding_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate` (`cate`) USING BTREE,
  ADD KEY `type` (`type`);

--
-- Indexes for table `wf_send_record`
--
ALTER TABLE `wf_send_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `createdAt` (`createdAt`),
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `currentId` (`currentId`) USING BTREE;

--
-- Indexes for table `wf_shuang11`
--
ALTER TABLE `wf_shuang11`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_date_prize` (`status`,`date`,`prizeType`),
  ADD KEY `openId` (`openId`);

--
-- Indexes for table `wf_shuang11_quan`
--
ALTER TABLE `wf_shuang11_quan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_bid_openId` (`status`,`buildingId`,`openId`);

--
-- Indexes for table `wf_site_list`
--
ALTER TABLE `wf_site_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`);

--
-- Indexes for table `wf_site_map`
--
ALTER TABLE `wf_site_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `updatedBy` (`updatedBy`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `wf_site_page`
--
ALTER TABLE `wf_site_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siteId_typeName` (`siteId`,`typeName`);

--
-- Indexes for table `wf_sms_rank`
--
ALTER TABLE `wf_sms_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belongId` (`belongId`);

--
-- Indexes for table `wf_soap_detail`
--
ALTER TABLE `wf_soap_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belongId` (`belongId`),
  ADD KEY `callResult` (`callResult`);

--
-- Indexes for table `wf_soap_group`
--
ALTER TABLE `wf_soap_group`
  ADD UNIQUE KEY `bigCode_extCode` (`bigCode`,`extCode`) USING BTREE;

--
-- Indexes for table `wf_soap_worker`
--
ALTER TABLE `wf_soap_worker`
  ADD UNIQUE KEY `userid_bigcode` (`userid`,`bigcode`) USING BTREE,
  ADD KEY `custid` (`custid`);

--
-- Indexes for table `wf_subscribes`
--
ALTER TABLE `wf_subscribes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currentId` (`currentId`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wf_suggestion`
--
ALTER TABLE `wf_suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userId` (`createdId`),
  ADD KEY `status` (`status`),
  ADD KEY `isRead` (`isRead`);

--
-- Indexes for table `wf_suite_arranges`
--
ALTER TABLE `wf_suite_arranges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `houseId` (`houseId`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `clientId` (`clientId`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `wf_suite_arranges_building`
--
ALTER TABLE `wf_suite_arranges_building`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `wf_suite_bargains`
--
ALTER TABLE `wf_suite_bargains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `houseId` (`houseId`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `clientId` (`clientId`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `wf_suite_bargains_other`
--
ALTER TABLE `wf_suite_bargains_other`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_building`
--
ALTER TABLE `wf_suite_building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_client`
--
ALTER TABLE `wf_suite_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belongId` (`belongId`),
  ADD KEY `createdAt` (`createdAt`),
  ADD KEY `updatedAt` (`updatedAt`);

--
-- Indexes for table `wf_suite_client_website`
--
ALTER TABLE `wf_suite_client_website`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_concern`
--
ALTER TABLE `wf_suite_concern`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `suiteId` (`suiteId`) USING BTREE;

--
-- Indexes for table `wf_suite_content`
--
ALTER TABLE `wf_suite_content`
  ADD PRIMARY KEY (`suiteId`);

--
-- Indexes for table `wf_suite_dictionary`
--
ALTER TABLE `wf_suite_dictionary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`,`city`) USING BTREE,
  ADD KEY `id` (`id`);

--
-- Indexes for table `wf_suite_doors`
--
ALTER TABLE `wf_suite_doors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_fenxiao`
--
ALTER TABLE `wf_suite_fenxiao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_hire`
--
ALTER TABLE `wf_suite_hire`
  ADD PRIMARY KEY (`hireId`),
  ADD KEY `belongId` (`belongId`) USING BTREE,
  ADD KEY `saleStatus` (`salestatus2`) USING BTREE,
  ADD KEY `departmentId` (`referrerId`);

--
-- Indexes for table `wf_suite_hire_price`
--
ALTER TABLE `wf_suite_hire_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_house`
--
ALTER TABLE `wf_suite_house`
  ADD PRIMARY KEY (`saleId`),
  ADD KEY `belongId` (`belongId`) USING BTREE,
  ADD KEY `saleStatus2` (`salestatus2`) USING BTREE,
  ADD KEY `islock` (`islock`),
  ADD KEY `isprivate` (`isprivate`),
  ADD KEY `endprivate` (`entrustDate`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `wf_suite_img`
--
ALTER TABLE `wf_suite_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_lock_log`
--
ALTER TABLE `wf_suite_lock_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_parameter`
--
ALTER TABLE `wf_suite_parameter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `wf_suite_performance`
--
ALTER TABLE `wf_suite_performance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_plot`
--
ALTER TABLE `wf_suite_plot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_receivables`
--
ALTER TABLE `wf_suite_receivables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_receivables_img`
--
ALTER TABLE `wf_suite_receivables_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_remoney`
--
ALTER TABLE `wf_suite_remoney`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_remoney_detail`
--
ALTER TABLE `wf_suite_remoney_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_sale_price`
--
ALTER TABLE `wf_suite_sale_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_secondhand`
--
ALTER TABLE `wf_suite_secondhand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_units`
--
ALTER TABLE `wf_suite_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_suite_views`
--
ALTER TABLE `wf_suite_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currentId` (`currentId`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `wf_suite_visits`
--
ALTER TABLE `wf_suite_visits`
  ADD PRIMARY KEY (`id`,`createdId`),
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `currentId` (`currentId`) USING BTREE;

--
-- Indexes for table `wf_suite_visits_content`
--
ALTER TABLE `wf_suite_visits_content`
  ADD PRIMARY KEY (`visitId`);

--
-- Indexes for table `wf_suite_warrant`
--
ALTER TABLE `wf_suite_warrant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_tel_code`
--
ALTER TABLE `wf_tel_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `wf_template_type`
--
ALTER TABLE `wf_template_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_tour_order`
--
ALTER TABLE `wf_tour_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `tel` (`tel`) USING BTREE;

--
-- Indexes for table `wf_tour_way`
--
ALTER TABLE `wf_tour_way`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_tour_way_plan`
--
ALTER TABLE `wf_tour_way_plan`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `wf_ucenter_admins`
--
ALTER TABLE `wf_ucenter_admins`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `wf_ucenter_applications`
--
ALTER TABLE `wf_ucenter_applications`
  ADD PRIMARY KEY (`appid`);

--
-- Indexes for table `wf_ucenter_badwords`
--
ALTER TABLE `wf_ucenter_badwords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `find` (`find`);

--
-- Indexes for table `wf_ucenter_domains`
--
ALTER TABLE `wf_ucenter_domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_ucenter_failedlogins`
--
ALTER TABLE `wf_ucenter_failedlogins`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `wf_ucenter_feeds`
--
ALTER TABLE `wf_ucenter_feeds`
  ADD PRIMARY KEY (`feedid`),
  ADD KEY `uid` (`uid`,`dateline`);

--
-- Indexes for table `wf_ucenter_friends`
--
ALTER TABLE `wf_ucenter_friends`
  ADD PRIMARY KEY (`version`),
  ADD KEY `uid` (`uid`),
  ADD KEY `friendid` (`friendid`);

--
-- Indexes for table `wf_ucenter_mailqueue`
--
ALTER TABLE `wf_ucenter_mailqueue`
  ADD PRIMARY KEY (`mailid`),
  ADD KEY `appid` (`appid`),
  ADD KEY `level` (`level`,`failures`);

--
-- Indexes for table `wf_ucenter_memberfields`
--
ALTER TABLE `wf_ucenter_memberfields`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_ucenter_members`
--
ALTER TABLE `wf_ucenter_members`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `wf_ucenter_mergemembers`
--
ALTER TABLE `wf_ucenter_mergemembers`
  ADD PRIMARY KEY (`appid`,`username`);

--
-- Indexes for table `wf_ucenter_newpm`
--
ALTER TABLE `wf_ucenter_newpm`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wf_ucenter_notelist`
--
ALTER TABLE `wf_ucenter_notelist`
  ADD PRIMARY KEY (`noteid`),
  ADD KEY `closed` (`closed`,`pri`,`noteid`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `wf_ucenter_pm_indexes`
--
ALTER TABLE `wf_ucenter_pm_indexes`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`);

--
-- Indexes for table `wf_ucenter_pm_lists`
--
ALTER TABLE `wf_ucenter_pm_lists`
  ADD PRIMARY KEY (`plid`),
  ADD KEY `pmtype` (`pmtype`),
  ADD KEY `min_max` (`min_max`),
  ADD KEY `authorid` (`authorid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_members`
--
ALTER TABLE `wf_ucenter_pm_members`
  ADD PRIMARY KEY (`plid`,`uid`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `lastdateline` (`uid`,`lastdateline`),
  ADD KEY `lastupdate` (`uid`,`lastupdate`);

--
-- Indexes for table `wf_ucenter_pm_messages_0`
--
ALTER TABLE `wf_ucenter_pm_messages_0`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_1`
--
ALTER TABLE `wf_ucenter_pm_messages_1`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_2`
--
ALTER TABLE `wf_ucenter_pm_messages_2`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_3`
--
ALTER TABLE `wf_ucenter_pm_messages_3`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_4`
--
ALTER TABLE `wf_ucenter_pm_messages_4`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_5`
--
ALTER TABLE `wf_ucenter_pm_messages_5`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_6`
--
ALTER TABLE `wf_ucenter_pm_messages_6`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_7`
--
ALTER TABLE `wf_ucenter_pm_messages_7`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_8`
--
ALTER TABLE `wf_ucenter_pm_messages_8`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_pm_messages_9`
--
ALTER TABLE `wf_ucenter_pm_messages_9`
  ADD PRIMARY KEY (`pmid`),
  ADD KEY `plid` (`plid`,`delstatus`,`dateline`),
  ADD KEY `dateline` (`plid`,`dateline`);

--
-- Indexes for table `wf_ucenter_protectedmembers`
--
ALTER TABLE `wf_ucenter_protectedmembers`
  ADD UNIQUE KEY `username` (`username`,`appid`);

--
-- Indexes for table `wf_ucenter_settings`
--
ALTER TABLE `wf_ucenter_settings`
  ADD PRIMARY KEY (`k`);

--
-- Indexes for table `wf_ucenter_sqlcache`
--
ALTER TABLE `wf_ucenter_sqlcache`
  ADD PRIMARY KEY (`sqlid`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `wf_ucenter_tags`
--
ALTER TABLE `wf_ucenter_tags`
  ADD KEY `tagname` (`tagname`,`appid`);

--
-- Indexes for table `wf_ucenter_vars`
--
ALTER TABLE `wf_ucenter_vars`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `wf_usercar_files`
--
ALTER TABLE `wf_usercar_files`
  ADD PRIMARY KEY (`userCarId`);

--
-- Indexes for table `wf_user_active`
--
ALTER TABLE `wf_user_active`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_user_base`
--
ALTER TABLE `wf_user_base`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `tel` (`tel`),
  ADD KEY `userName` (`userName`),
  ADD KEY `email` (`email`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `wf_user_base_ceshi`
--
ALTER TABLE `wf_user_base_ceshi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `tel` (`tel`) USING BTREE,
  ADD KEY `userName` (`userName`) USING BTREE,
  ADD KEY `email` (`email`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `wf_user_exchange`
--
ALTER TABLE `wf_user_exchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_user_info`
--
ALTER TABLE `wf_user_info`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userId` (`userId`) USING BTREE;

--
-- Indexes for table `wf_user_info_ceshi`
--
ALTER TABLE `wf_user_info_ceshi`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userId` (`userId`) USING BTREE;

--
-- Indexes for table `wf_user_other`
--
ALTER TABLE `wf_user_other`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `wf_user_statistics`
--
ALTER TABLE `wf_user_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_user_visit`
--
ALTER TABLE `wf_user_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_vote`
--
ALTER TABLE `wf_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_openId` (`status`,`openId`);

--
-- Indexes for table `wf_vote_follow`
--
ALTER TABLE `wf_vote_follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `openid` (`status`,`openId`);

--
-- Indexes for table `wf_vote_score`
--
ALTER TABLE `wf_vote_score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_voteId_openId` (`status`,`voteId`,`openId`) USING BTREE;

--
-- Indexes for table `wf_web_site`
--
ALTER TABLE `wf_web_site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_weibo_base`
--
ALTER TABLE `wf_weibo_base`
  ADD PRIMARY KEY (`id`,`weiboName`);

--
-- Indexes for table `wf_weibo_user`
--
ALTER TABLE `wf_weibo_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_weishop`
--
ALTER TABLE `wf_weishop`
  ADD PRIMARY KEY (`roleUserId`);

--
-- Indexes for table `wf_weishop_follow`
--
ALTER TABLE `wf_weishop_follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_userId_wxOpenId` (`status`,`userId`,`wxOpenId`) USING BTREE;

--
-- Indexes for table `wf_weishop_ip`
--
ALTER TABLE `wf_weishop_ip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_date_userId_ip2long` (`status`,`date`,`userId`,`ip2long`) USING BTREE;

--
-- Indexes for table `wf_weishop_remark`
--
ALTER TABLE `wf_weishop_remark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_userId` (`status`,`userId`);

--
-- Indexes for table `wf_weishop_title`
--
ALTER TABLE `wf_weishop_title`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updatedAt` (`updatedAt`),
  ADD KEY `status_type_userId` (`status`,`type`,`userId`) USING BTREE;

--
-- Indexes for table `wf_weishop_tui`
--
ALTER TABLE `wf_weishop_tui`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updatedAt` (`updatedAt`),
  ADD KEY `status_type_userId` (`status`,`type`,`userId`) USING BTREE;

--
-- Indexes for table `wf_weixin`
--
ALTER TABLE `wf_weixin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wf_weixin_user`
--
ALTER TABLE `wf_weixin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `openid` (`status`,`openid`);

--
-- Indexes for table `wf_xwb_bind_info`
--
ALTER TABLE `wf_xwb_bind_info`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `sina_uid` (`sina_uid`);

--
-- Indexes for table `wf_xwb_bind_thread`
--
ALTER TABLE `wf_xwb_bind_thread`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `tid` (`tid`,`type`);

--
-- Indexes for table `wf_xwb_session`
--
ALTER TABLE `wf_xwb_session`
  ADD UNIQUE KEY `sessionid` (`sessionid`),
  ADD KEY `lasttime` (`lasttime`);

--
-- Indexes for table `wf_zhixiao_arrange`
--
ALTER TABLE `wf_zhixiao_arrange`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wf_ads`
--
ALTER TABLE `wf_ads`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ads_category`
--
ALTER TABLE `wf_ads_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent`
--
ALTER TABLE `wf_agent`
  MODIFY `id` smallint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_building_concern`
--
ALTER TABLE `wf_agent_building_concern`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_card`
--
ALTER TABLE `wf_agent_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_dealbuilding`
--
ALTER TABLE `wf_agent_dealbuilding`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_point`
--
ALTER TABLE `wf_agent_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_purpose`
--
ALTER TABLE `wf_agent_purpose`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_user`
--
ALTER TABLE `wf_agent_user`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_visit`
--
ALTER TABLE `wf_agent_visit`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_agent_wuliao`
--
ALTER TABLE `wf_agent_wuliao`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_anchang_building`
--
ALTER TABLE `wf_anchang_building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_anchang_fixhouse`
--
ALTER TABLE `wf_anchang_fixhouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_anchang_guestbook`
--
ALTER TABLE `wf_anchang_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_anchang_house`
--
ALTER TABLE `wf_anchang_house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_anchang_patch`
--
ALTER TABLE `wf_anchang_patch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_anchang_signed`
--
ALTER TABLE `wf_anchang_signed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_anchang_sure`
--
ALTER TABLE `wf_anchang_sure`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_app_manage`
--
ALTER TABLE `wf_app_manage`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_app_role_nav`
--
ALTER TABLE `wf_app_role_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_app_role_node`
--
ALTER TABLE `wf_app_role_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_app_version`
--
ALTER TABLE `wf_app_version`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_asks`
--
ALTER TABLE `wf_asks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_asks_go`
--
ALTER TABLE `wf_asks_go`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_asks_hotwords`
--
ALTER TABLE `wf_asks_hotwords`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_asks_keywords`
--
ALTER TABLE `wf_asks_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_asks_reply`
--
ALTER TABLE `wf_asks_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ask_to_buy`
--
ALTER TABLE `wf_ask_to_buy`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ask_to_hire`
--
ALTER TABLE `wf_ask_to_hire`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_audit_visit`
--
ALTER TABLE `wf_audit_visit`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_audit_visit_content`
--
ALTER TABLE `wf_audit_visit_content`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_audit_visit_img`
--
ALTER TABLE `wf_audit_visit_img`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_bigcode`
--
ALTER TABLE `wf_bigcode`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_bug`
--
ALTER TABLE `wf_bug`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_around`
--
ALTER TABLE `wf_building_around`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_base`
--
ALTER TABLE `wf_building_base`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_browsed`
--
ALTER TABLE `wf_building_browsed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_comments`
--
ALTER TABLE `wf_building_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_concern`
--
ALTER TABLE `wf_building_concern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_count_date`
--
ALTER TABLE `wf_building_count_date`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_demand`
--
ALTER TABLE `wf_building_demand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_file`
--
ALTER TABLE `wf_building_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_img`
--
ALTER TABLE `wf_building_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_info`
--
ALTER TABLE `wf_building_info`
  MODIFY `buildingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_installation`
--
ALTER TABLE `wf_building_installation`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_installation_copy`
--
ALTER TABLE `wf_building_installation_copy`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_interaction`
--
ALTER TABLE `wf_building_interaction`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_log`
--
ALTER TABLE `wf_building_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_map`
--
ALTER TABLE `wf_building_map`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_message`
--
ALTER TABLE `wf_building_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_news`
--
ALTER TABLE `wf_building_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_price`
--
ALTER TABLE `wf_building_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_recommend`
--
ALTER TABLE `wf_building_recommend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_reported`
--
ALTER TABLE `wf_building_reported`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_reported_status`
--
ALTER TABLE `wf_building_reported_status`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_room`
--
ALTER TABLE `wf_building_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_setorder`
--
ALTER TABLE `wf_building_setorder`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special`
--
ALTER TABLE `wf_building_special`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_business`
--
ALTER TABLE `wf_building_special_business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_feature`
--
ALTER TABLE `wf_building_special_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_img`
--
ALTER TABLE `wf_building_special_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_info`
--
ALTER TABLE `wf_building_special_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_join`
--
ALTER TABLE `wf_building_special_join`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_joinplace_count`
--
ALTER TABLE `wf_building_special_joinplace_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_notice`
--
ALTER TABLE `wf_building_special_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_sendmobile`
--
ALTER TABLE `wf_building_special_sendmobile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_special_subscribe`
--
ALTER TABLE `wf_building_special_subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tags`
--
ALTER TABLE `wf_building_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tags_count`
--
ALTER TABLE `wf_building_tags_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan`
--
ALTER TABLE `wf_building_tuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_business`
--
ALTER TABLE `wf_building_tuan_business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_feature`
--
ALTER TABLE `wf_building_tuan_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_img`
--
ALTER TABLE `wf_building_tuan_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_info`
--
ALTER TABLE `wf_building_tuan_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_join`
--
ALTER TABLE `wf_building_tuan_join`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_joinplace_count`
--
ALTER TABLE `wf_building_tuan_joinplace_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_notice`
--
ALTER TABLE `wf_building_tuan_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_sendmobile`
--
ALTER TABLE `wf_building_tuan_sendmobile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_subscribe`
--
ALTER TABLE `wf_building_tuan_subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_tuan_survey`
--
ALTER TABLE `wf_building_tuan_survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_update`
--
ALTER TABLE `wf_building_update`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_building_video`
--
ALTER TABLE `wf_building_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_buliding_purchase`
--
ALTER TABLE `wf_buliding_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_aclients`
--
ALTER TABLE `wf_businesscount_aclients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_agents`
--
ALTER TABLE `wf_businesscount_agents`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_agentsa`
--
ALTER TABLE `wf_businesscount_agentsa`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_areas`
--
ALTER TABLE `wf_businesscount_areas`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_buildings`
--
ALTER TABLE `wf_businesscount_buildings`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_citys`
--
ALTER TABLE `wf_businesscount_citys`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_cooperate`
--
ALTER TABLE `wf_businesscount_cooperate`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_salestatus`
--
ALTER TABLE `wf_businesscount_salestatus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_businesscount_tuan`
--
ALTER TABLE `wf_businesscount_tuan`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_business_notice`
--
ALTER TABLE `wf_business_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_business_parameter`
--
ALTER TABLE `wf_business_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_business_remind`
--
ALTER TABLE `wf_business_remind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_business_user`
--
ALTER TABLE `wf_business_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_building`
--
ALTER TABLE `wf_caiji_building`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_building_image`
--
ALTER TABLE `wf_caiji_building_image`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_building_img_queue`
--
ALTER TABLE `wf_caiji_building_img_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼盘ID';
--
-- AUTO_INCREMENT for table `wf_caiji_building_news`
--
ALTER TABLE `wf_caiji_building_news`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_building_prices`
--
ALTER TABLE `wf_caiji_building_prices`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_building_task_queue`
--
ALTER TABLE `wf_caiji_building_task_queue`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_building_tuku_queue`
--
ALTER TABLE `wf_caiji_building_tuku_queue`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_huxingtu`
--
ALTER TABLE `wf_caiji_huxingtu`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_huxingtu_queue`
--
ALTER TABLE `wf_caiji_huxingtu_queue`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_caiji_queue`
--
ALTER TABLE `wf_caiji_queue`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_audit`
--
ALTER TABLE `wf_car_audit`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_cars`
--
ALTER TABLE `wf_car_cars`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_company`
--
ALTER TABLE `wf_car_company`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_driver`
--
ALTER TABLE `wf_car_driver`
  MODIFY `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_favors`
--
ALTER TABLE `wf_car_favors`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_fix`
--
ALTER TABLE `wf_car_fix`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_gps`
--
ALTER TABLE `wf_car_gps`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_gps1`
--
ALTER TABLE `wf_car_gps1`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_order`
--
ALTER TABLE `wf_car_order`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_order_driver`
--
ALTER TABLE `wf_car_order_driver`
  MODIFY `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_car_rental`
--
ALTER TABLE `wf_car_rental`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_city`
--
ALTER TABLE `wf_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_client_sms`
--
ALTER TABLE `wf_client_sms`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_code400`
--
ALTER TABLE `wf_code400`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_code400_white`
--
ALTER TABLE `wf_code400_white`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_admincp_cmenu`
--
ALTER TABLE `wf_common_admincp_cmenu`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_admincp_group`
--
ALTER TABLE `wf_common_admincp_group`
  MODIFY `cpgroupid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_adminnote`
--
ALTER TABLE `wf_common_adminnote`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_advertisement`
--
ALTER TABLE `wf_common_advertisement`
  MODIFY `advid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_advertisement_custom`
--
ALTER TABLE `wf_common_advertisement_custom`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_banned`
--
ALTER TABLE `wf_common_banned`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_block`
--
ALTER TABLE `wf_common_block`
  MODIFY `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_block_favorite`
--
ALTER TABLE `wf_common_block_favorite`
  MODIFY `favid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_block_item`
--
ALTER TABLE `wf_common_block_item`
  MODIFY `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_block_item_data`
--
ALTER TABLE `wf_common_block_item_data`
  MODIFY `dataid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_block_pic`
--
ALTER TABLE `wf_common_block_pic`
  MODIFY `picid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_block_style`
--
ALTER TABLE `wf_common_block_style`
  MODIFY `styleid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_block_xml`
--
ALTER TABLE `wf_common_block_xml`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_card_log`
--
ALTER TABLE `wf_common_card_log`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_card_type`
--
ALTER TABLE `wf_common_card_type`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_credit_rule`
--
ALTER TABLE `wf_common_credit_rule`
  MODIFY `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_credit_rule_log`
--
ALTER TABLE `wf_common_credit_rule_log`
  MODIFY `clid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_cron`
--
ALTER TABLE `wf_common_cron`
  MODIFY `cronid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_district`
--
ALTER TABLE `wf_common_district`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_friendlink`
--
ALTER TABLE `wf_common_friendlink`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_grouppm`
--
ALTER TABLE `wf_common_grouppm`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_invite`
--
ALTER TABLE `wf_common_invite`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_magic`
--
ALTER TABLE `wf_common_magic`
  MODIFY `magicid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_mailcron`
--
ALTER TABLE `wf_common_mailcron`
  MODIFY `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_mailqueue`
--
ALTER TABLE `wf_common_mailqueue`
  MODIFY `qid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member`
--
ALTER TABLE `wf_common_member`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_action_log`
--
ALTER TABLE `wf_common_member_action_log`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_archive`
--
ALTER TABLE `wf_common_member_archive`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_crime`
--
ALTER TABLE `wf_common_member_crime`
  MODIFY `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_grouppm`
--
ALTER TABLE `wf_common_member_grouppm`
  MODIFY `gpmid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_security`
--
ALTER TABLE `wf_common_member_security`
  MODIFY `securityid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_stat_field`
--
ALTER TABLE `wf_common_member_stat_field`
  MODIFY `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_stat_search`
--
ALTER TABLE `wf_common_member_stat_search`
  MODIFY `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_member_verify_info`
--
ALTER TABLE `wf_common_member_verify_info`
  MODIFY `vid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_myinvite`
--
ALTER TABLE `wf_common_myinvite`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_nav`
--
ALTER TABLE `wf_common_nav`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_plugin`
--
ALTER TABLE `wf_common_plugin`
  MODIFY `pluginid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_pluginvar`
--
ALTER TABLE `wf_common_pluginvar`
  MODIFY `pluginvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_relatedlink`
--
ALTER TABLE `wf_common_relatedlink`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_report`
--
ALTER TABLE `wf_common_report`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_searchindex`
--
ALTER TABLE `wf_common_searchindex`
  MODIFY `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_secquestion`
--
ALTER TABLE `wf_common_secquestion`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_smiley`
--
ALTER TABLE `wf_common_smiley`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_style`
--
ALTER TABLE `wf_common_style`
  MODIFY `styleid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_stylevar`
--
ALTER TABLE `wf_common_stylevar`
  MODIFY `stylevarid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_tag`
--
ALTER TABLE `wf_common_tag`
  MODIFY `tagid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_task`
--
ALTER TABLE `wf_common_task`
  MODIFY `taskid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_taskvar`
--
ALTER TABLE `wf_common_taskvar`
  MODIFY `taskvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_template`
--
ALTER TABLE `wf_common_template`
  MODIFY `templateid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_usergroup`
--
ALTER TABLE `wf_common_usergroup`
  MODIFY `groupid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_word`
--
ALTER TABLE `wf_common_word`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_common_word_type`
--
ALTER TABLE `wf_common_word_type`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_company`
--
ALTER TABLE `wf_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_complain`
--
ALTER TABLE `wf_complain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_comp_joins`
--
ALTER TABLE `wf_comp_joins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_connect_disktask`
--
ALTER TABLE `wf_connect_disktask`
  MODIFY `taskid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_connect_feedlog`
--
ALTER TABLE `wf_connect_feedlog`
  MODIFY `flid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_connect_memberbindlog`
--
ALTER TABLE `wf_connect_memberbindlog`
  MODIFY `mblid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_connect_postfeedlog`
--
ALTER TABLE `wf_connect_postfeedlog`
  MODIFY `flid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_connect_tlog`
--
ALTER TABLE `wf_connect_tlog`
  MODIFY `tlid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_cost`
--
ALTER TABLE `wf_cost`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_cost_category`
--
ALTER TABLE `wf_cost_category`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_arrangers`
--
ALTER TABLE `wf_decorate_arrangers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_client`
--
ALTER TABLE `wf_decorate_client`
  MODIFY `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_client_apply`
--
ALTER TABLE `wf_decorate_client_apply`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_company_apply`
--
ALTER TABLE `wf_decorate_company_apply`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_company_base`
--
ALTER TABLE `wf_decorate_company_base`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_company_case`
--
ALTER TABLE `wf_decorate_company_case`
  MODIFY `id` mediumint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_company_follow`
--
ALTER TABLE `wf_decorate_company_follow`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_company_letter`
--
ALTER TABLE `wf_decorate_company_letter`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_company_photo`
--
ALTER TABLE `wf_decorate_company_photo`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_company_rank`
--
ALTER TABLE `wf_decorate_company_rank`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_decorate_visit`
--
ALTER TABLE `wf_decorate_visit`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dingcan`
--
ALTER TABLE `wf_dingcan`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dingcan_menu`
--
ALTER TABLE `wf_dingcan_menu`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_documents`
--
ALTER TABLE `wf_documents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dujia_hotel`
--
ALTER TABLE `wf_dujia_hotel`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dujia_hotel_house`
--
ALTER TABLE `wf_dujia_hotel_house`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dujia_hotel_pic`
--
ALTER TABLE `wf_dujia_hotel_pic`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dujia_hotel_price`
--
ALTER TABLE `wf_dujia_hotel_price`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dujia_order`
--
ALTER TABLE `wf_dujia_order`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息ID';
--
-- AUTO_INCREMENT for table `wf_dujia_order_paylog`
--
ALTER TABLE `wf_dujia_order_paylog`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_dynamic`
--
ALTER TABLE `wf_dynamic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_exchange_goods`
--
ALTER TABLE `wf_exchange_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_expand_account`
--
ALTER TABLE `wf_expand_account`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_expand_accounts`
--
ALTER TABLE `wf_expand_accounts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_expand_apply`
--
ALTER TABLE `wf_expand_apply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_expand_cost`
--
ALTER TABLE `wf_expand_cost`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_expand_count`
--
ALTER TABLE `wf_expand_count`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fangmeng_message`
--
ALTER TABLE `wf_fangmeng_message`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_faq`
--
ALTER TABLE `wf_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_adviser`
--
ALTER TABLE `wf_fencount_adviser`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_area`
--
ALTER TABLE `wf_fencount_area`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_areag`
--
ALTER TABLE `wf_fencount_areag`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_buycity`
--
ALTER TABLE `wf_fencount_buycity`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_from`
--
ALTER TABLE `wf_fencount_from`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_fromg`
--
ALTER TABLE `wf_fencount_fromg`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_groups`
--
ALTER TABLE `wf_fencount_groups`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_interact`
--
ALTER TABLE `wf_fencount_interact`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_propertys`
--
ALTER TABLE `wf_fencount_propertys`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_soapbuildings`
--
ALTER TABLE `wf_fencount_soapbuildings`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_soaps`
--
ALTER TABLE `wf_fencount_soaps`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_visits`
--
ALTER TABLE `wf_fencount_visits`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fencount_visitslevel`
--
ALTER TABLE `wf_fencount_visitslevel`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_arrange`
--
ALTER TABLE `wf_fenxiao_arrange`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_arrangers`
--
ALTER TABLE `wf_fenxiao_arrangers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_client`
--
ALTER TABLE `wf_fenxiao_client`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_clientfollow`
--
ALTER TABLE `wf_fenxiao_clientfollow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_complaint`
--
ALTER TABLE `wf_fenxiao_complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_dealbuilding`
--
ALTER TABLE `wf_fenxiao_dealbuilding`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_dealscale`
--
ALTER TABLE `wf_fenxiao_dealscale`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `wf_fenxiao_dj`
--
ALTER TABLE `wf_fenxiao_dj`
  MODIFY `djId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_duty`
--
ALTER TABLE `wf_fenxiao_duty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_money_param`
--
ALTER TABLE `wf_fenxiao_money_param`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_prebuilding`
--
ALTER TABLE `wf_fenxiao_prebuilding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_property`
--
ALTER TABLE `wf_fenxiao_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_remoney`
--
ALTER TABLE `wf_fenxiao_remoney`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_reported`
--
ALTER TABLE `wf_fenxiao_reported`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_reported_client`
--
ALTER TABLE `wf_fenxiao_reported_client`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_reported_status`
--
ALTER TABLE `wf_fenxiao_reported_status`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_summary`
--
ALTER TABLE `wf_fenxiao_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_summary_view`
--
ALTER TABLE `wf_fenxiao_summary_view`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_tel`
--
ALTER TABLE `wf_fenxiao_tel`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_tel_views`
--
ALTER TABLE `wf_fenxiao_tel_views`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_usercar`
--
ALTER TABLE `wf_fenxiao_usercar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_visit`
--
ALTER TABLE `wf_fenxiao_visit`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_fenxiao_visit1`
--
ALTER TABLE `wf_fenxiao_visit1`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_agent`
--
ALTER TABLE `wf_form_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_agent_dw`
--
ALTER TABLE `wf_form_agent_dw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_field`
--
ALTER TABLE `wf_form_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_garrison`
--
ALTER TABLE `wf_form_garrison`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_garrison_img`
--
ALTER TABLE `wf_form_garrison_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_inspections_hks`
--
ALTER TABLE `wf_form_inspections_hks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_inspections_hks_statistics`
--
ALTER TABLE `wf_form_inspections_hks_statistics`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_material`
--
ALTER TABLE `wf_form_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_patrol`
--
ALTER TABLE `wf_form_patrol`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_patrol_chargebacks`
--
ALTER TABLE `wf_form_patrol_chargebacks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_patrol_img`
--
ALTER TABLE `wf_form_patrol_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_salesman`
--
ALTER TABLE `wf_form_salesman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_form_visit`
--
ALTER TABLE `wf_form_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_activityapply`
--
ALTER TABLE `wf_forum_activityapply`
  MODIFY `applyid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_announcement`
--
ALTER TABLE `wf_forum_announcement`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_attachment`
--
ALTER TABLE `wf_forum_attachment`
  MODIFY `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_attachtype`
--
ALTER TABLE `wf_forum_attachtype`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_bbcode`
--
ALTER TABLE `wf_forum_bbcode`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_collection`
--
ALTER TABLE `wf_forum_collection`
  MODIFY `ctid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_collectioncomment`
--
ALTER TABLE `wf_forum_collectioncomment`
  MODIFY `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_faq`
--
ALTER TABLE `wf_forum_faq`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_forum`
--
ALTER TABLE `wf_forum_forum`
  MODIFY `fid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_forum_copy`
--
ALTER TABLE `wf_forum_forum_copy`
  MODIFY `fid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_grouplevel`
--
ALTER TABLE `wf_forum_grouplevel`
  MODIFY `levelid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_imagetype`
--
ALTER TABLE `wf_forum_imagetype`
  MODIFY `typeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_medal`
--
ALTER TABLE `wf_forum_medal`
  MODIFY `medalid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_medallog`
--
ALTER TABLE `wf_forum_medallog`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_polloption`
--
ALTER TABLE `wf_forum_polloption`
  MODIFY `polloptionid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_post`
--
ALTER TABLE `wf_forum_post`
  MODIFY `position` int(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_postcomment`
--
ALTER TABLE `wf_forum_postcomment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_postposition`
--
ALTER TABLE `wf_forum_postposition`
  MODIFY `position` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_post_tableid`
--
ALTER TABLE `wf_forum_post_tableid`
  MODIFY `pid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_thread`
--
ALTER TABLE `wf_forum_thread`
  MODIFY `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_threadclass`
--
ALTER TABLE `wf_forum_threadclass`
  MODIFY `typeid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_threadtype`
--
ALTER TABLE `wf_forum_threadtype`
  MODIFY `typeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_tradecomment`
--
ALTER TABLE `wf_forum_tradecomment`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_typeoption`
--
ALTER TABLE `wf_forum_typeoption`
  MODIFY `optionid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_forum_warning`
--
ALTER TABLE `wf_forum_warning`
  MODIFY `wid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_help`
--
ALTER TABLE `wf_help`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_help_category`
--
ALTER TABLE `wf_help_category`
  MODIFY `id` int(4) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_help_feedback`
--
ALTER TABLE `wf_help_feedback`
  MODIFY `id` int(4) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_help_file`
--
ALTER TABLE `wf_help_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_hire_browsed`
--
ALTER TABLE `wf_hire_browsed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_hire_concern`
--
ALTER TABLE `wf_hire_concern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_hire_house`
--
ALTER TABLE `wf_hire_house`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_hire_img`
--
ALTER TABLE `wf_hire_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_album`
--
ALTER TABLE `wf_home_album`
  MODIFY `albumid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_album_category`
--
ALTER TABLE `wf_home_album_category`
  MODIFY `catid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_appcreditlog`
--
ALTER TABLE `wf_home_appcreditlog`
  MODIFY `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_blog`
--
ALTER TABLE `wf_home_blog`
  MODIFY `blogid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_blog_category`
--
ALTER TABLE `wf_home_blog_category`
  MODIFY `catid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_class`
--
ALTER TABLE `wf_home_class`
  MODIFY `classid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_click`
--
ALTER TABLE `wf_home_click`
  MODIFY `clickid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_comment`
--
ALTER TABLE `wf_home_comment`
  MODIFY `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_docomment`
--
ALTER TABLE `wf_home_docomment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_doing`
--
ALTER TABLE `wf_home_doing`
  MODIFY `doid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_favorite`
--
ALTER TABLE `wf_home_favorite`
  MODIFY `favid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_feed`
--
ALTER TABLE `wf_home_feed`
  MODIFY `feedid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_feed_app`
--
ALTER TABLE `wf_home_feed_app`
  MODIFY `feedid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_follow_feed`
--
ALTER TABLE `wf_home_follow_feed`
  MODIFY `feedid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_follow_feed_archiver`
--
ALTER TABLE `wf_home_follow_feed_archiver`
  MODIFY `feedid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_notification`
--
ALTER TABLE `wf_home_notification`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_pic`
--
ALTER TABLE `wf_home_pic`
  MODIFY `picid` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_pokearchive`
--
ALTER TABLE `wf_home_pokearchive`
  MODIFY `pid` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_home_share`
--
ALTER TABLE `wf_home_share`
  MODIFY `sid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_index_property`
--
ALTER TABLE `wf_index_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_inotice`
--
ALTER TABLE `wf_inotice`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_interact_record`
--
ALTER TABLE `wf_interact_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_interact_user`
--
ALTER TABLE `wf_interact_user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_internal_links`
--
ALTER TABLE `wf_internal_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_links`
--
ALTER TABLE `wf_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_log`
--
ALTER TABLE `wf_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_meeting_apply`
--
ALTER TABLE `wf_meeting_apply`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '设备id';
--
-- AUTO_INCREMENT for table `wf_meeting_equipment`
--
ALTER TABLE `wf_meeting_equipment`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '设备id';
--
-- AUTO_INCREMENT for table `wf_meeting_room`
--
ALTER TABLE `wf_meeting_room`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '会议室id';
--
-- AUTO_INCREMENT for table `wf_message`
--
ALTER TABLE `wf_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_msg_send`
--
ALTER TABLE `wf_msg_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_msg_template`
--
ALTER TABLE `wf_msg_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_news`
--
ALTER TABLE `wf_news`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_news_category`
--
ALTER TABLE `wf_news_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_news_content`
--
ALTER TABLE `wf_news_content`;
--
-- AUTO_INCREMENT for table `wf_news_statistics`
--
ALTER TABLE `wf_news_statistics`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_news_subscribe`
--
ALTER TABLE `wf_news_subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_notice`
--
ALTER TABLE `wf_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_order_house`
--
ALTER TABLE `wf_order_house`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_order_refresh`
--
ALTER TABLE `wf_order_refresh`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_partner`
--
ALTER TABLE `wf_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_plot_img`
--
ALTER TABLE `wf_plot_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_article_content`
--
ALTER TABLE `wf_portal_article_content`
  MODIFY `cid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_article_related`
--
ALTER TABLE `wf_portal_article_related`
  MODIFY `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_article_title`
--
ALTER TABLE `wf_portal_article_title`
  MODIFY `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_attachment`
--
ALTER TABLE `wf_portal_attachment`
  MODIFY `attachid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_category`
--
ALTER TABLE `wf_portal_category`
  MODIFY `catid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_comment`
--
ALTER TABLE `wf_portal_comment`
  MODIFY `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_topic`
--
ALTER TABLE `wf_portal_topic`
  MODIFY `topicid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_portal_topic_pic`
--
ALTER TABLE `wf_portal_topic_pic`
  MODIFY `picid` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_protocol`
--
ALTER TABLE `wf_protocol`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_qudao_visit`
--
ALTER TABLE `wf_qudao_visit`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_recommend_log`
--
ALTER TABLE `wf_recommend_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_report_record`
--
ALTER TABLE `wf_report_record`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_resource_type`
--
ALTER TABLE `wf_resource_type`
  MODIFY `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role`
--
ALTER TABLE `wf_role`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_advocate`
--
ALTER TABLE `wf_role_advocate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_department`
--
ALTER TABLE `wf_role_department`
  MODIFY `id` int(4) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_idepartment`
--
ALTER TABLE `wf_role_idepartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_jobs`
--
ALTER TABLE `wf_role_jobs`
  MODIFY `id` int(4) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_jobs_change`
--
ALTER TABLE `wf_role_jobs_change`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_mac`
--
ALTER TABLE `wf_role_mac`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_members`
--
ALTER TABLE `wf_role_members`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_nav`
--
ALTER TABLE `wf_role_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_nav_old`
--
ALTER TABLE `wf_role_nav_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_node`
--
ALTER TABLE `wf_role_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_node_old`
--
ALTER TABLE `wf_role_node_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_pic`
--
ALTER TABLE `wf_role_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_pic_category`
--
ALTER TABLE `wf_role_pic_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_role_user`
--
ALTER TABLE `wf_role_user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sale_browsed`
--
ALTER TABLE `wf_sale_browsed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sale_comments`
--
ALTER TABLE `wf_sale_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sale_concern`
--
ALTER TABLE `wf_sale_concern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sale_fenxiao`
--
ALTER TABLE `wf_sale_fenxiao`
  MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sale_house`
--
ALTER TABLE `wf_sale_house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sale_img`
--
ALTER TABLE `wf_sale_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_search_keywords`
--
ALTER TABLE `wf_search_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_security_failedlog`
--
ALTER TABLE `wf_security_failedlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sellbuilding_tags`
--
ALTER TABLE `wf_sellbuilding_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_send_record`
--
ALTER TABLE `wf_send_record`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_shuang11`
--
ALTER TABLE `wf_shuang11`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_shuang11_quan`
--
ALTER TABLE `wf_shuang11_quan`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_site_list`
--
ALTER TABLE `wf_site_list`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_site_map`
--
ALTER TABLE `wf_site_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_site_page`
--
ALTER TABLE `wf_site_page`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_sms_rank`
--
ALTER TABLE `wf_sms_rank`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_soap_detail`
--
ALTER TABLE `wf_soap_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_subscribes`
--
ALTER TABLE `wf_subscribes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suggestion`
--
ALTER TABLE `wf_suggestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_arranges`
--
ALTER TABLE `wf_suite_arranges`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_arranges_building`
--
ALTER TABLE `wf_suite_arranges_building`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_bargains`
--
ALTER TABLE `wf_suite_bargains`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_bargains_other`
--
ALTER TABLE `wf_suite_bargains_other`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_building`
--
ALTER TABLE `wf_suite_building`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_client`
--
ALTER TABLE `wf_suite_client`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_client_website`
--
ALTER TABLE `wf_suite_client_website`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_concern`
--
ALTER TABLE `wf_suite_concern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_dictionary`
--
ALTER TABLE `wf_suite_dictionary`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_doors`
--
ALTER TABLE `wf_suite_doors`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_fenxiao`
--
ALTER TABLE `wf_suite_fenxiao`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_hire`
--
ALTER TABLE `wf_suite_hire`;
--
-- AUTO_INCREMENT for table `wf_suite_hire_price`
--
ALTER TABLE `wf_suite_hire_price`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_house`
--
ALTER TABLE `wf_suite_house`;
--
-- AUTO_INCREMENT for table `wf_suite_img`
--
ALTER TABLE `wf_suite_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_lock_log`
--
ALTER TABLE `wf_suite_lock_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_parameter`
--
ALTER TABLE `wf_suite_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_performance`
--
ALTER TABLE `wf_suite_performance`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_plot`
--
ALTER TABLE `wf_suite_plot`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_receivables`
--
ALTER TABLE `wf_suite_receivables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_receivables_img`
--
ALTER TABLE `wf_suite_receivables_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_remoney`
--
ALTER TABLE `wf_suite_remoney`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_remoney_detail`
--
ALTER TABLE `wf_suite_remoney_detail`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_sale_price`
--
ALTER TABLE `wf_suite_sale_price`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_secondhand`
--
ALTER TABLE `wf_suite_secondhand`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_units`
--
ALTER TABLE `wf_suite_units`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_views`
--
ALTER TABLE `wf_suite_views`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_visits`
--
ALTER TABLE `wf_suite_visits`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_suite_warrant`
--
ALTER TABLE `wf_suite_warrant`
  MODIFY `id` int(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_tel_code`
--
ALTER TABLE `wf_tel_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_tour_order`
--
ALTER TABLE `wf_tour_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_tour_way`
--
ALTER TABLE `wf_tour_way`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_tour_way_plan`
--
ALTER TABLE `wf_tour_way_plan`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_admins`
--
ALTER TABLE `wf_ucenter_admins`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_applications`
--
ALTER TABLE `wf_ucenter_applications`
  MODIFY `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_badwords`
--
ALTER TABLE `wf_ucenter_badwords`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_domains`
--
ALTER TABLE `wf_ucenter_domains`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_feeds`
--
ALTER TABLE `wf_ucenter_feeds`
  MODIFY `feedid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_friends`
--
ALTER TABLE `wf_ucenter_friends`
  MODIFY `version` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_mailqueue`
--
ALTER TABLE `wf_ucenter_mailqueue`
  MODIFY `mailid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_members`
--
ALTER TABLE `wf_ucenter_members`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_notelist`
--
ALTER TABLE `wf_ucenter_notelist`
  MODIFY `noteid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_pm_indexes`
--
ALTER TABLE `wf_ucenter_pm_indexes`
  MODIFY `pmid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_ucenter_pm_lists`
--
ALTER TABLE `wf_ucenter_pm_lists`
  MODIFY `plid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_user_active`
--
ALTER TABLE `wf_user_active`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_user_base`
--
ALTER TABLE `wf_user_base`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_user_base_ceshi`
--
ALTER TABLE `wf_user_base_ceshi`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_user_exchange`
--
ALTER TABLE `wf_user_exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_user_statistics`
--
ALTER TABLE `wf_user_statistics`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_user_visit`
--
ALTER TABLE `wf_user_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_vote`
--
ALTER TABLE `wf_vote`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_vote_follow`
--
ALTER TABLE `wf_vote_follow`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_vote_score`
--
ALTER TABLE `wf_vote_score`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_web_site`
--
ALTER TABLE `wf_web_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weibo_base`
--
ALTER TABLE `wf_weibo_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weibo_user`
--
ALTER TABLE `wf_weibo_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weishop_follow`
--
ALTER TABLE `wf_weishop_follow`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weishop_ip`
--
ALTER TABLE `wf_weishop_ip`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weishop_remark`
--
ALTER TABLE `wf_weishop_remark`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weishop_title`
--
ALTER TABLE `wf_weishop_title`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weishop_tui`
--
ALTER TABLE `wf_weishop_tui`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weixin`
--
ALTER TABLE `wf_weixin`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_weixin_user`
--
ALTER TABLE `wf_weixin_user`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wf_zhixiao_arrange`
--
ALTER TABLE `wf_zhixiao_arrange`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
