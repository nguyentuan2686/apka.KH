<?php
$_SERVER["DOCUMENT_ROOT"] = realpath(dirname(__FILE__)."/../../../..");
$DOCUMENT_ROOT = $_SERVER["DOCUMENT_ROOT"];

define("NO_KEEP_STATISTIC", true);
define("NOT_CHECK_PERMISSIONS",true);
define("BX_CRONTAB", true);

require($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/main/include/prolog_before.php");

@set_time_limit(0);
@ignore_user_abort(true);

CEvent::CheckEvents();
?>