<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();

include_once($_SERVER['DOCUMENT_ROOT'].'/bitrix/components/bitrix/desktop/include.php');

$arComponentParameters = Array(
	"GROUPS" => array(
	),
	"PARAMETERS" => Array(
		"ID" => Array(
				"NAME" => GetMessage("CMDESKTOP_PARAMS_ID"),
				"TYPE" => "STRING",
				"DEFAULT" => "holder1",
				"PARENT" => "DATA_SOURCE",
			),
		"CAN_EDIT" => Array(
				"NAME" => GetMessage("CMDESKTOP_PARAMS_CAN_EDIT"),
				"TYPE" => "CHECKBOX",
				"DEFAULT" => "Y",
				"PARENT" => "DATA_SOURCE",
			),
		"COLUMNS" => Array(
				"NAME" => GetMessage("CMDESKTOP_PARAMS_COLUMNS"),
				"TYPE" => "STRING",
				"DEFAULT" => "3",
				"PARENT" => "DATA_SOURCE",
				"REFRESH"=> "Y"
			),
	)
);

if (IsModuleInstalled('intranet'))
{
	CModule::IncludeModule('socialnetwork');
	
	$arComponentParameters["PARAMETERS"]["PM_URL"] = Array(
		'TYPE' => 'STRING',
		'DEFAULT' => '/company/personal/messages/chat/#USER_ID#/',
		'NAME' => GetMessage('CMDESKTOP_PARAMS_PM_URL'),
		'PARENT' => 'ADDITIONAL_SETTINGS',
	);

	$arComponentParameters["PARAMETERS"]["PATH_TO_CONPANY_DEPARTMENT"] = Array(
		'TYPE' => 'STRING',
		'DEFAULT' => '/company/structure.php?set_filter_structure=Y&structure_UF_DEPARTMENT=#ID#',
		'NAME' => GetMessage('CMDESKTOP_PARAMS_PATH_TO_CONPANY_DEPARTMENT'),
		'PARENT' => 'ADDITIONAL_SETTINGS',
	);

	if (IsModuleInstalled("video"))
	{
		$arComponentParameters["PARAMETERS"]["PATH_TO_VIDEO_CALL"] = Array(
			'TYPE' => 'STRING',
			'DEFAULT' => '/company/personal/video/#USER_ID#/',
			'NAME' => GetMessage('CMDESKTOP_PARAMS_PATH_TO_VIDEO_CALL'),
			'PARENT' => 'ADDITIONAL_SETTINGS',
		);
	}

	$arComponentParameters["PARAMETERS"]["NAME_TEMPLATE"] = Array(
		'TYPE' => 'LIST',
		'NAME' => GetMessage('CMDESKTOP_PARAMS_NAME_TEMPLATE'),
		'VALUES' => CComponentUtil::GetDefaultNameTemplates(),
		'MULTIPLE' => 'N',
		'ADDITIONAL_VALUES' => 'Y',
		'DEFAULT' => GetMessage('CMDESKTOP_PARAMS_NAME_TEMPLATE_DEFAULT'),
		'PARENT' => 'ADDITIONAL_SETTINGS',
	);

	$arComponentParameters["PARAMETERS"]["SHOW_LOGIN"] = Array(
		"NAME" => GetMessage("CMDESKTOP_PARAMS_SHOW_LOGIN"),
		"TYPE" => "CHECKBOX",
		"MULTIPLE" => "N",
		"VALUE" => "Y",
		"DEFAULT" =>"Y",
		"PARENT" => "ADDITIONAL_SETTINGS",
	);

	$arComponentParameters["PARAMETERS"]["DATE_TIME_FORMAT"] = CComponentUtil::GetDateTimeFormatField(GetMessage("CMDESKTOP_PARAMS_DATE_TIME_FORMAT"), 'ADDITIONAL_SETTINGS');
	$arComponentParameters["PARAMETERS"]["DATE_FORMAT"] = CComponentUtil::GetDateFormatField(GetMessage("CMDESKTOP_PARAMS_DATE_FORMAT"), 'ADDITIONAL_SETTINGS');
	$arComponentParameters["PARAMETERS"]["DATE_FORMAT_NO_YEAR"] = CComponentUtil::GetDateFormatField(GetMessage("CMDESKTOP_PARAMS_DATE_FORMAT_NO_YEAR"), 'ADDITIONAL_SETTINGS', true);

	$arComponentParameters["PARAMETERS"]["SHOW_YEAR"] = Array(
		"PARENT" => "ADDITIONAL_SETTINGS",
		"NAME" => GetMessage("CMDESKTOP_PARAMS_SHOW_YEAR"),
		"TYPE" => "LIST",
		"VALUES" => array(
			"Y" => GetMessage("CMDESKTOP_PARAMS_SHOW_YEAR_VALUE_Y"),
			"M" => GetMessage("CMDESKTOP_PARAMS_SHOW_YEAR_VALUE_M"),
			"N" => GetMessage("CMDESKTOP_PARAMS_SHOW_YEAR_VALUE_N")
		),
		"MULTIPLE" => "N",
		"DEFAULT" => "M"
	);
	
}


if($arCurrentValues["COLUMNS"]>0)
{
	$d = intval(100/$arCurrentValues["COLUMNS"])."%";

	for($i=0; $i<$arCurrentValues["COLUMNS"]; $i++)
		$arComponentParameters["PARAMETERS"]["COLUMN_WIDTH_".$i] = Array(
				"NAME"=>GetMessage("CMDESKTOP_PARAMS_COLUMN_WITH")." #".($i+1),
				"PARENT" => "DATA_SOURCE",
				"TYPE"=>"STRING",
				"DEFAULT"=>$d,
			);
}

$arComponentParameters["PARAMETERS"]["GADGETS"] = Array(
		"NAME" => GetMessage("CMDESKTOP_PARAMS_GADGETS"),
		"TYPE" => "LIST",
		"DEFAULT" => "ALL",
		"PARENT" => "DATA_SOURCE",
		"MULTIPLE" => "Y",
		"SIZE"=>"10",
		"REFRESH" => "Y",
		"VALUES" => Array("ALL"=>GetMessage("CMDESKTOP_PARAMS_GADGETS_ALL")),
	);

$arGadgets = BXGadget::GetList(true, $arCurrentValues);
foreach($arGadgets as $gd)
{
	if ($gd["SU_ONLY"] == true || $gd["SG_ONLY"] == true)
		continue;

	if ($gd["EXTRANET_ONLY"] == true && (!CModule::IncludeModule('extranet') || !CExtranet::IsExtranetSite($_REQUEST["src_site"])))
		continue;
	if ($gd["SEARCH_ONLY"] == true && !IsModuleInstalled("search"))
		continue;
	if ($gd["FORUM_ONLY"] == true && !IsModuleInstalled("forum"))
		continue;
	if ($gd["BLOG_ONLY"] == true && !IsModuleInstalled("blog"))
		continue;
	if ($gd["PHOTOGALLERY_ONLY"] == true && !IsModuleInstalled("photogallery"))
		continue;
	if ($gd["WEBDAV_ONLY"] == true && !IsModuleInstalled("webdav"))
		continue;
	if ($gd["VOTE_ONLY"] == true && !IsModuleInstalled("vote"))
		continue;	
		
	$arComponentParameters["PARAMETERS"]["GADGETS"]["VALUES"][$gd["ID"]] = $gd["NAME"];
	
	if(!is_array($arCurrentValues) || !is_array($arCurrentValues["GADGETS"]) || in_array($gd["ID"], $arCurrentValues["GADGETS"]) || in_array("ALL", $arCurrentValues["GADGETS"]))
	{
		if(is_array($gd["PARAMETERS"]) && count($gd["PARAMETERS"])>0)
		{
			$arComponentParameters["GROUPS"]["G_".$gd["ID"]] = Array("NAME" => GetMessage("CMDESKTOP_PARAMS_GADGET_SET")." \"".$gd["NAME"]."\"");
			foreach($gd["PARAMETERS"] as $id=>$p)
			{
				$p["PARENT"] = "G_".$gd["ID"];
				$arComponentParameters["PARAMETERS"]["G_".$gd["ID"]."_".$id] = $p;
			}
		}

		if(is_array($gd["USER_PARAMETERS"]) && count($gd["USER_PARAMETERS"])>0)
		{
			$arComponentParameters["GROUPS"]["GU_".$gd["ID"]] = Array("NAME" => GetMessage("CMDESKTOP_PARAMS_GADGET_PAR")." \"".$gd["NAME"]."\"");
			foreach($gd["USER_PARAMETERS"] as $id=>$p)
			{
				$p["PARENT"] = "GU_".$gd["ID"];
				$arComponentParameters["PARAMETERS"]["GU_".$gd["ID"]."_".$id] = $p;
			}
		}
	}
}
?>
