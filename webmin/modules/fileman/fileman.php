<?
/*
##############################################
# Bitrix: SiteManager                        #
# Copyright (c) 2002-2005 Bitrix             #
# http://www.bitrixsoft.com                  #
# mailto:admin@bitrixsoft.com                #
##############################################
*/
global $DOCUMENT_ROOT, $MESS;
IncludeModuleLangFile(__FILE__);
define("DEBUG_FILE_MAN", false);

$GLOBALS['arFilemanPredifinedFileTypesR'] = array();
$GLOBALS['arFilemanPredifinedFileTypes'] = array(
	"css" => array(
		"exts" => array("css"),
		"gtype" => "text",
		"name" => GetMessage("MAIN_BFSD_FTYPE_CSS")
	),
	"htaccess" => array(
		"exts" => array("htaccess"),
		"gtype" => "text",
		"name" => GetMessage("MAIN_BFSD_FTYPE_SYS")
	),
	"html" => array(
		"exts" => array("html", "htm", "shtml", "shtm"),
		"gtype" => "text",
		"name" => GetMessage("MAIN_BFSD_FTYPE_HTML")
	),
	"png" => array(
		"exts" => array("png"),
		"gtype" => "image",
		"name" => GetMessage("MAIN_BFSD_FTYPE_PNG")
	),
	"gif" => array(
		"exts" => array("gif"),
		"gtype" => "image",
		"name" => GetMessage("MAIN_BFSD_FTYPE_GIF")
	),
	"jpeg" => array(
		"exts" => array("jpeg", "jpg", "jpe"),
		"gtype" => "image",
		"name" => GetMessage("MAIN_BFSD_FTYPE_JPG")
	),
	"js" => array(
		"exts" => array("js"),
		"gtype" => "text",
		"name" => "JavaScript"
	),
	"php" => array(
		"exts" => array("php", "php3", "php4", "php5", "php6", "phtml"),
		"gtype" => "text",
		"name" => GetMessage("MAIN_BFSD_FTYPE_PHP")
	),
	"txt" => array(
		"exts" => array("txt", "sql"),
		"gtype" => "text",
		"name" => GetMessage("MAIN_BFSD_FTYPE_TXT")
	),
	"xml" => array(
		"exts" => array("xml", "xsl"),
		"gtype" => "text",
		"name" => GetMessage("MAIN_BFSD_FTYPE_XML")
	),
	"csv" => array(
		"exts" => array("csv"),
		"gtype" => "text",
		"name" => GetMessage("MAIN_BFSD_FTYPE_CSV")
	),
	"flash" => array(
		"exts" => array("fla", "swf"),
		"gtype" => "file",
		"name" => GetMessage("MAIN_BFSD_FTYPE_SWF")
	),
	"file" => array(
		"exts" => array(),
		"gtype" => "file",
		"name" => GetMessage("MAIN_BFSD_FTYPE_NA")
	)
);

//AddEventHandler("fileman", "OnBeforeHTMLEditorScriptsGet", "bitrix_tabs");
//function bitrix_tabs($editorName, $arEditorParams){return array("JS" => array('bitrix_tabs.js'));}

class CFileMan
{
	var $arFILE_TYPES;

	function OnPanelCreate()
	{
		global $APPLICATION, $REQUEST_URI;
		if($APPLICATION->GetGroupRight("fileman")<="D")
			return;

		$cur_page = $APPLICATION->GetCurPage(true);
		$cur_dir = $APPLICATION->GetCurDir();

		//access to curent page
		$page_permission = $APPLICATION->GetFileAccessPermission($cur_page);

		// access to current directory
		$sect_permission = $APPLICATION->GetFileAccessPermission($cur_dir);

		$main_sort = 100;

		$full_src = "";
		$default_edit = COption::GetOptionString("fileman", "default_edit", "html");
		if($default_edit == "php")
		{
			$editor_type = "file";
			$full_src = "&full_src=Y";
		}
		elseif($default_edit == "text")
			$editor_type = "file";
		else
			$editor_type = "html";


		$aMenuItems = array(
			'create' => array(), 
			'create_section' => array(), 
			'edit' => array(), 
			'edit_section' => array()
		);
		
		if ($sect_permission>="W")
		{
			// New page
			$href = "/webmin/admin/fileman_".$editor_type."_edit.php?lang=".LANGUAGE_ID."&site=".SITE_ID."&path=".UrlEncode($APPLICATION->GetCurDir())."&new=Y&templateID=".urlencode(SITE_TEMPLATE_ID)."&back_url=".UrlEncode($REQUEST_URI);
			$APPLICATION->AddPanelButtonMenu('create', array("SEPARATOR"=>true, "SORT"=>99));
			$APPLICATION->AddPanelButtonMenu('create', array(
				"TEXT" => GetMessage("fileman_panel_admin"), 
				"TITLE"=> GetMessage("fileman_panel_new_page_title"),
				"ACTION"	=> "jsUtils.Redirect([], '".CUtil::JSEscape($href)."')",
				"SORT" => 100
			));

			//New folder
			$href = "/webmin/admin/fileman_newfolder.php?lang=".LANGUAGE_ID."&site=".SITE_ID."&path=". UrlEncode($APPLICATION->GetCurDir())."&back_url=".UrlEncode($REQUEST_URI);
			$APPLICATION->AddPanelButtonMenu('create_section', array("SEPARATOR"=>true, "SORT"=>99));
			$APPLICATION->AddPanelButtonMenu('create_section', array(
				"TEXT" => GetMessage("fileman_panel_admin"), 
				"TITLE"=> GetMessage("fileman_panel_new_folder_title"),
				"ACTION"	=> "jsUtils.Redirect([], '".CUtil::JSEscape($href)."')",
			));
		}

		// Edit page
		if ($page_permission>="W")
		{
			$href = "/webmin/admin/fileman_".$editor_type."_edit.php?lang=".LANGUAGE_ID."&site=".SITE_ID."&templateID=".urlencode(SITE_TEMPLATE_ID).$full_src."&path=".UrlEncode($_SERVER["REAL_FILE_PATH"]<>""? $_SERVER["REAL_FILE_PATH"] : $cur_page)."&back_url=".UrlEncode($REQUEST_URI);
			$APPLICATION->AddPanelButtonMenu('edit', array("SEPARATOR"=>true, "SORT"=>99));
			$APPLICATION->AddPanelButtonMenu('edit', array(
				"TEXT" => GetMessage("fileman_panel_admin"), 
				"TITLE"=> GetMessage("fileman_panel_edit_title"),
				"ACTION"	=> "jsUtils.Redirect([], '".CUtil::JSEscape($href)."')",
				"SORT" => 100
			));
		}

		// Folder properties
		$alt = GetMessage("FILEMAN_FOLDER_PROPS");
		if ($sect_permission>="W")
		{
			$href = "/webmin/admin/fileman_folder.php?lang=".LANGUAGE_ID."&site=".SITE_ID."&path=".UrlEncode($APPLICATION->GetCurDir())."&back_url=".UrlEncode($REQUEST_URI);
			$APPLICATION->AddPanelButtonMenu('edit_section', array("SEPARATOR"=>true, "SORT"=>99));
			$APPLICATION->AddPanelButtonMenu('edit_section', array(
				"TEXT" => GetMessage("fileman_panel_admin"),
				"TITLE"=> GetMessage("fileman_panel_folder_prop_title"),
				"ACTION"	=> "jsUtils.Redirect([], '".CUtil::JSEscape($href)."')",
				"SORT"=>100,
			));
		}
	}

	function CFileMan()
	{
		$this->arFILE_TYPES = Array("SOURCE"=>GetMessage("FILEMAN_FILEMAN_SCRIPT_TEXT"), "IMAGE"=>GetMessage("FILEMAN_FILEMAN_PIC"), "UNKNOWN"=>GetMessage("FILEMAN_FILEMAN_UNK"));
	}

	function OnGroupDelete($group_id){return "";}

	function GetVersion()
	{
		@include($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/fileman/install/version.php");
		if (!isset($arModuleVersion['VERSION']))
			return false;
		return $arModuleVersion['VERSION'];
	}

	function SaveMenu($path, $aMenuLinksTmp, $sMenuTemplateTmp)
	{
		global $APPLICATION;
		CMain::InitPathVars($site, $path);
		$DOC_ROOT = CSite::GetSiteDocRoot($site);

		$strMenuLinks = "";
		if(strlen($sMenuTemplateTmp)>0)
			$strMenuLinks .= "\$sMenuTemplate = \"".CFileMan::EscapePHPString($sMenuTemplateTmp)."\";\n";

		$strMenuLinks .= "\$aMenuLinks = Array(";
		$i=0;
		foreach($aMenuLinksTmp as $arMenuItem)
		{
			$i++;
			$strMenuLinksTmp = "";

			if($i>1)
				$strMenuLinksTmp .= ",";

			$strMenuLinksTmp .= "\n".
				"	Array(\n".
				"		\"".CFileMan::EscapePHPString($arMenuItem[0])."\", \n".
				"		\"".CFileMan::EscapePHPString($arMenuItem[1])."\", \n".
				"		Array(";

			if(is_array($arMenuItem[2]))
			{
				for($j=0; $j<count($arMenuItem[2]); $j++)
				{
					if($j>0)
						$strMenuLinksTmp .= ", ";
					$strMenuLinksTmp .= "\"".CFileMan::EscapePHPString($arMenuItem[2][$j])."\"";
				}
			}
			$strMenuLinksTmp .= "), \n";

			$strMenuLinksTmp .= "		Array(";
			if(is_array($arMenuItem[3]))
			{
				$arParams = array_keys($arMenuItem[3]);
				for($j=0; $j<count($arParams); $j++)
				{
					if($j>0)
						$strMenuLinksTmp .= ", ";
					$strMenuLinksTmp .= "\"".CFileMan::EscapePHPString($arParams[$j])."\"=>"."\"".CFileMan::EscapePHPString($arMenuItem[3][$arParams[$j]])."\"";
				}
			}

			$strMenuLinksTmp .= "), \n".
				"		\"".CFileMan::EscapePHPString($arMenuItem[4])."\" \n".
				"	)";

			$strMenuLinks .= $strMenuLinksTmp;
		}
		$strMenuLinks .= "\n);";
		$APPLICATION->SaveFileContent($DOC_ROOT.$path, "<"."?\n".$strMenuLinks."\n?".">");
		$GLOBALS["CACHE_MANAGER"]->CleanDir("menu");
	}

	function GetMenuArray($abs_path)
	{
		$aMenuLinks = Array();
		$sMenuTemplate = '';

		if (file_exists($abs_path))
			include($abs_path);

		return Array("aMenuLinks"=>$aMenuLinks, "sMenuTemplate" => $sMenuTemplate);
	}

	function GetFileName($path)
	{
		return GetFileName($path);
	}

	function CreateDir($path)
	{
		CMain::InitPathVars($site, $path);
		$DOC_ROOT = CSite::GetSiteDocRoot($site);

		if (DEBUG_FILE_MAN) echo "CreateDir($path);<br>";
		global $APPLICATION, $USER;

		$badDirs=Array();
		$path = str_replace("\\", "/", $path);

		while(strlen($path)>1 && $path[strlen($path)-1]=="/")
			$path=substr($path, 0, strlen($path)-1);
		$p=strrpos($path, "/");

		while($p!==false)
		{
			if(file_exists($DOC_ROOT.$path) && is_dir($DOC_ROOT.$path))
			{
				@chmod($DOC_ROOT.$path, BX_DIR_PERMISSIONS);
				break;
			}
			$badDirs[] = substr($path, $p + 1);
			$path = substr($path, 0, $p);
			$p = strrpos($path, "/");
		}

		for($i = count($badDirs) - 1; $i >= 0; $i--)
		{
			$path = $path."/".$badDirs[$i];
			if(!$USER->CanDoFileOperation('fm_create_new_folder', Array($site,$path)))
				return GetMessage("FILEMAN_FILEMAN_CREATE_FOLDER_DENY")." \"".$path."\".\n";

			if (($mess = CFileMan::CheckFileName($badDirs[$i])) !== true)
				return $mess;

			if (!@mkdir($DOC_ROOT.$path, BX_DIR_PERMISSIONS))
				return GetMessage("FILEMAN_CREATE_FOLDER_ERROR", array('#PATH#' => htmlspecialcharsex($path)));
		}
	}

	//Function check if there are anything exept .access.php and if folder is empty - delete it
	function DeleteDir($path)
	{
		if(DEBUG_FILE_MAN)echo "DeleteDir(".$path.");<br>";

		CMain::InitPathVars($site, $path);
		$DOC_ROOT = CSite::GetSiteDocRoot($site);

		global $APPLICATION, $USER;
		if(strlen(trim($path))<=0)
			return GetMessage("FILEMAN_FILEMAN_TRYING_ROOT_DELETE")."\n";
		if(!is_dir($DOC_ROOT.$path))
			return GetMessage("FILEMAN_FILEMAN_FOLDER")." \"$path\" ".GetMessage("FILEMAN_FILEMAN_NOT_EXISTS")."\n";

		//check rights to write for this subfolder
		if(!$USER->CanDoFileOperation('fm_delete_folder', Array($site,$path)))
			return GetMessage("FILEMAN_FILEMAN_FOLDER_DEL_DENY")."\" ".$path."\".\n";

		if($handle = @opendir($DOC_ROOT.$path))
		{
			while(($file = readdir($handle)) !== false)
			{
				if($file == "." || $file == "..") continue;

				if(!is_dir($DOC_ROOT.$path."/".$file) && $file!=".access.php")
					return GetMessage("FILEMAN_FILEMAN_FOLDER_DEL_ERROR")." \"".$path."\" ".GetMessage("FILEMAN_FILEMAN_FOLDER_NOT_EMPTY").".\n";
			}
		}
		@closedir($handle);

		//it's ok ... BUMP OFF!!!
		@chmod($DOC_ROOT.$path."/.access.php", BX_FILE_PERMISSIONS);
		@unlink($DOC_ROOT.$path."/.access.php");

		@chmod($DOC_ROOT.$path, BX_DIR_PERMISSIONS);
		if(DEBUG_FILE_MAN)echo "rmdir(".$path.");";
		if(!@rmdir($DOC_ROOT.$path))
			return GetMessage("FILEMAN_FILEMAN_FOLDER_DEL_ERROR")." \"".$path."\".\n";

		$APPLICATION->RemoveFileAccessPermission(Array($site, $path));
	}

	function DeleteFile($path)
	{
		global $APPLICATION, $USER;
		CMain::InitPathVars($site, $path);
		$DOC_ROOT = CSite::GetSiteDocRoot($site);

		if(!is_file($DOC_ROOT.$path))
			return GetMessage("FILEMAN_FILEMAN_FILE")." \"$path\" ".GetMessage("FILEMAN_FILEMAN_NOT_EXISTS")."\n";

		if(strlen($path)>=12 && substr($path, strlen($path) - 12)=="/.access.php")
			return;

		//check: can we delete this file
		if(!$USER->CanDoFileOperation('fm_delete_file', Array($site,$path)))
			return GetMessage("FILEMAN_FILEMAN_FILE_DEL_DENY")." \"".$path."\".\n";

		@chmod($DOC_ROOT.$path, BX_FILE_PERMISSIONS);

		//deleting file
		if(DEBUG_FILE_MAN)echo "unlink(".$DOC_ROOT.$path.");<br>";
		$file_size = filesize($DOC_ROOT.$path);
		if(@unlink($DOC_ROOT.$path))
		{
			$APPLICATION->RemoveFileAccessPermission(Array($site, $path));
			if(CModule::IncludeModule("search"))
				CSearch::DeleteIndex("main", $site."|".$path);

		//************************** Quota **************************//
			if(COption::GetOptionInt("main", "disk_space") > 0)
			{
				$quota = new CDiskQuota();
				$quota->updateDiskQuota("file", $file_size, "delete");
			}
		//************************** Quota **************************//
		}
	}

	function DeleteEx($path)
	{
		global $APPLICATION, $USER;

		CMain::InitPathVars($site, $path);

		if(strlen($path) <= 0)
			return false;

		$src = $_SERVER["DOCUMENT_ROOT"].$path;
		$src = str_replace("//","/",$src);
		if($src == $_SERVER["DOCUMENT_ROOT"])
			return false;

		$DOC_ROOT = CSite::GetSiteDocRoot($site);

		@set_time_limit(600);

		if(is_dir($DOC_ROOT.$path))//if delete folder
		{
			//check rights
			if(!$USER->CanDoFileOperation('fm_delete_folder', Array($site,$path)))
				return GetMessage("FILEMAN_FILEMAN_FOLDER_DEL_DENY")." \"".$path."\".\n";
		}
		else //if delete file
		{
			return CFileman::DeleteFile(Array($site, $path));
		}

		//get folder content
		if($handle = @opendir($DOC_ROOT.$path))
		{
			while(($file = readdir($handle)) !== false)
			{
				if($file == "." || $file == "..") continue;

				if(is_dir($DOC_ROOT.$path."/".$file)) //if it's subflder
				{
					//recursion
					$strWarning .= CFileman::DeleteEx(Array($site, $path."/".$file));
				}
				else //it's subfile ;-)
				{
					if($file == ".access.php") continue;
					$strWarning .= CFileman::DeleteFile(Array($site, $path."/".$file));
				}
			}
		}
		@closedir($handle);

		//delete first folder
		$strWarning .= CFileMan::DeleteDir(Array($site, $path));

		return $strWarning;
	}


	function NormalizePath($path)
	{
		$path = str_replace("\\", "/", $path);

		while(strpos($path, "//") !== false)
			$path = str_replace("//", "/", $path);

		while(($l = strlen($path)) > 0 && $path[$l - 1] == "/")
			$path = substr($path, 0, $l - 1);

		if (strlen($path) > 0 && substr($path, 0, 1) != '/')
			$path = '/'.$path;

		return $path;
	}

	function CopyEx($path_from, $path_to, $bDeleteAfterCopy = false, $bOverride = false)
	{
		global $APPLICATION, $USER;
		CMain::InitPathVars($site_from, $path_from);
		$DOC_ROOT_FROM = CSite::GetSiteDocRoot($site_from);

		CMain::InitPathVars($site_to, $path_to);
		$DOC_ROOT_TO = CSite::GetSiteDocRoot($site_to);

		//check: if we copy to the same directory
		if(strpos($DOC_ROOT_TO.$path_to."/", $DOC_ROOT_FROM.$path_from."/")===0)
			return GetMessage("FILEMAN_LIB_BAD_FOLDER").": \"".$path_from."\".\n";

		if(is_dir($DOC_ROOT_FROM.$path_from))// Copy folder
		{
			// Minimal access - read/listing for copying files
			if(!$USER->CanDoFileOperation('fm_view_listing', Array($site_from, $path_from)))
				return GetMessage("FILEMAN_FILEMAN_FOLDER_READ_DENY")." \"".$path_from."\".\n";

			if ($bDeleteAfterCopy && !$USER->CanDoFileOperation('fm_delete_folder', Array($site_from, $path_from)))
				return GetMessage("FILEMAN_FILEMAN_FOLDER_DEL_DENY")." \"".$path_from."\".\n";

			//Check: folder exist or not
			$strWarTmp = CFileMan::CreateDir(Array($site_to, $path_to));

			if(strlen($strWarTmp ) > 0)
				return $strWarTmp;

			$APPLICATION->CopyFileAccessPermission(Array($site_from, $path_from), Array($site_to, $path_to));
		}
		else // Copy file
		{
			// If we can write this file
			if (!$USER->CanDoFileOperation('fm_create_new_file', Array($site_to, $path_to)))
				return GetMessage("FILEMAN_FILEMAN_FILE_WRITE_DENY")." \"".$path_to."\".\n";

			// If we can't read source-file
			if(!$USER->CanDoFileOperation('fm_view_file', Array($site_from, $path_from)))
				return GetMessage("FILEMAN_FILEMAN_FILE_READ_DENY")." \"".$path_from."\".\n";

			// Copying php or system file without PHP or LPA access
			if (!($USER->CanDoOperation('edit_php') || $USER->CanDoFileOperation('fm_lpa', $arPath) ||
			!(in_array(CFileman::GetFileExtension($f_NAME), CFileMan::GetScriptFileExt()) ||
			substr($Elem["NAME"], 0, 1)==".")))
				return GetMessage("FILEMAN_FILEMAN_FILE_READ_DENY")." \"".$path_from."\".\n";

			// If we can't move source-file
			if($bDeleteAfterCopy &&  !$USER->CanDoFileOperation('fm_delete_file', Array($site_from, $path_from)))
				return GetMessage("FILEMAN_FILEMAN_FILE_DEL_DENY")." \"".$path_from."\".\n";

			//Check if folder already exist and trying to create if not
			$p=strrpos($path_to, "/");
			$path_to_dir = substr($path_to, 0, $p);
			$strWarTmp = CFileMan::CreateDir(Array($site_to, $path_to_dir));
			if(strlen($strWarTmp)>0)
				return $strWarTmp;

			if(file_exists($DOC_ROOT_TO.$path_to))
			{
				if ($bOverride)
				{
					$strWarn = CFileMan::DeleteEx($path_to);
					if ($strWarn != "")
						return $strWarn;
				}
				else
				{
					return GetMessage("FILEMAN_FILEMAN_FILE_WITH_NAME")." \"".$path_to."\" ".GetMessage("FILEMAN_FILEMAN_ALREADY_EXISTS")."!\n";
				}
			}

			$APPLICATION->CopyFileAccessPermission(Array($site_from, $path_from), Array($site_to, $path_to));

			//************************** Quota **************************//
			if(COption::GetOptionInt("main", "disk_space") > 0)
			{
				$size = filesize($DOC_ROOT_FROM.$path_from);
				$quota = new CDiskQuota();
				if (!$quota->checkDiskQuota(array("FILE_SIZE"=>$size)))
					return $quota->LAST_ERROR;
			}
			//************************** Quota **************************//

			// Copy file
			if(DEBUG_FILE_MAN)echo "copy(".$DOC_ROOT_FROM.$path_from.",".$DOC_ROOT_TO.$path_to.");<br>";

			if (!@copy($DOC_ROOT_FROM.$path_from, $DOC_ROOT_TO.$path_to))
				$strWarning .= GetMessage('FILEMAN_COPY_ERROR', array('#PATH_FROM#' => htmlspecialcharsex($path_from), '#PATH_TO#' => htmlspecialcharsex($path_to)));

			//************************** Quota **************************//
			if(COption::GetOptionInt("main", "disk_space") > 0)
			{
				$quota->updateDiskQuota("file", $size, "copy");
			}
			//************************** Quota **************************//

			if(CModule::IncludeModule("search"))
			{
				$site = CSite::GetSiteByFullPath($DOC_ROOT_TO.$path_to);
				CSearch::ReIndexFile(Array($site_to, $path_to), $site);
			}

			if($bDeleteAfterCopy && strlen($strWarning) <=0) // If was command "delete after copy"?
				$strWarning .= CFileMan::DeleteFile(Array($site_from, $path_from));

			return $strWarning;
		}

		// Recursive
		if($handle = @opendir($DOC_ROOT_FROM.$path_from))
		{
			while(($file = readdir($handle)) !== false)
			{
				if($file == "." || $file == "..") continue;

				if(is_dir($DOC_ROOT_FROM.$path_from."/".$file)) //���� ��� "��������"
				{
					//������ � ��������
					$strWarning .= CFileMan::CopyEx(Array($site_from, $path_from."/".$file), Array($site_to, $path_to."/".$file), $bDeleteAfterCopy, $bOverride);
					//��������� �� �������� - ������ ����� �������� ��� � �������
					//if($bDeleteAfterCopy) //����� ������� ��� ��������
					//	$strWarning .= CFileMan::DeleteDir($path_from."/".$file);
				}
				else //��� "�������" :-)
				{
					if($file == ".access.php")
						continue;
					//�������� ����� �� ������ "����"
					if(!$USER->CanDoFileOperation('fm_create_new_file', Array($site_to, $path_to."/".$file)))
						$strWarning .= GetMessage("FILEMAN_FILEMAN_FILE_WRITE_DENY")." \"".$path_to."/".$file."\".\n";
					//�������� ����� �� ������ "������"
					elseif(!$USER->CanDoFileOperation('fm_view_file', Array($site_from, $path_from."/".$file)))
						$strWarning .= GetMessage("FILEMAN_FILEMAN_FILE_READ_DENY")." \"".$path_from."/".$file."\".\n";
					elseif (!($USER->CanDoOperation('edit_php') || $USER->CanDoFileOperation('fm_lpa', Array($site_from, $path_from."/".$file)) ||
					!(in_array(CFileman::GetFileExtension($file), CFileMan::GetScriptFileExt()) ||
					substr($file, 0, 1)==".")))
						$strWarning .= GetMessage("FILEMAN_FILEMAN_FILE_READ_DENY")." \"".$path_from."/".$file."\".\n";
					else
					{
						if(file_exists($DOC_ROOT_TO.$path_to."/".$file))
						{
							if ($bOverride)
							{
								$strWarn = CFileMan::DeleteEx($path_to."/".$file);
								if ($strWarn != "")
									$strWarning .=  $strWarn."\n";
							}
							else
							{
								$strWarning .= GetMessage("FILEMAN_FILEMAN_FILE_WITH_NAME")." \"".$path_to."/".$file."\" ".GetMessage("FILEMAN_FILEMAN_ALREADY_EXISTS")."!\n";
							}
						}

						if ($strWarning == "")
						{
							//���� ����� - ������ ����� ����������
							$APPLICATION->CopyFileAccessPermission(Array($site_from, $path_from."/".$file), Array($site_to, $path_to."/".$file));

							if(DEBUG_FILE_MAN)
								echo "copy(".$DOC_ROOT_FROM.$path_from."/".$file.",".$DOC_ROOT_TO.$path_to."/".$file.");<br>";

							if (!copy($DOC_ROOT_FROM.$path_from."/".$file, $DOC_ROOT_TO.$path_to."/".$file))
								$strWarning .= GetMessage('FILEMAN_COPY_ERROR', array('#PATH_FROM#' => htmlspecialcharsex($path_from."/".$file), '#PATH_TO#' => htmlspecialcharsex($path_to."/".$file)));

							//************************** Quota **************************//
							if(COption::GetOptionInt("main", "disk_space") > 0)
							{
								$quota = new CDiskQuota();
								$quota->updateDiskQuota("file", filesize($DOC_ROOT_TO.$path_to."/".$file), "copy");
							}
							//************************** Quota **************************//

							if(CModule::IncludeModule("search"))
							{
								$site = CSite::GetSiteByFullPath($DOC_ROOT_TO, $path_to."/".$file);
								CSearch::ReindexFile($path_to."/".$file, $site);
							}

							if($bDeleteAfterCopy && strlen($strWarning) <=0)
							{
								$strWarning .= CFileMan::DeleteFile(Array($site_from, $path_from."/".$file));
							}
						}
					}
				}
			}
		}
		@closedir($handle);

		//�������������� ���� ������� ���� ����� ���� ����� �������
		if($bDeleteAfterCopy)
			$strWarning .= CFileMan::DeleteDir(Array($site_from, $path_from));

		return $strWarning;
	}

	function GetAllDirList(&$arDirs, $arFilter=Array(), $site=false)
	{
		$arFiles = array();
		CFileMan::DirsRecursive(Array($site, ""), $arDirs, $arFilter, 0);
	}

	function DirsRecursive($path, &$arDirs, $arFilter=Array(), $depth=0)
	{
		$depth++;
		CFileMan::GetDirList($path, $arDirsTmp, $arFiles, $arFilter, Array("name"=>"asc"), "D");
		for($i = 0, $l = count($arDirsTmp); $i < $l; $i++)
		{
			$arDir = $arDirsTmp[$i];
			$arDir["DEPTH_LEVEL"] = $depth;
			$arDirs[] = $arDir;
			CFileMan::DirsRecursive($arDir["ABS_PATH"], $arDirs, $arFilter, $depth);
		}
	}

	function CompareFiles($f1, $f2, $sort=Array())
	{
		return CompareFiles($f1, $f2, $sort);
	}

	function GetDirList($path, &$arDirs, &$arFiles, $arFilter=Array(), $sort=Array(), $type="DF", $bLogical=false, $task_mode=false)
	{
		return GetDirList($path, $arDirs, $arFiles, $arFilter, $sort, $type, $bLogical,$task_mode);
	}

	function __CheckSite($site)
	{
		if($site!==false)
		{
			if(strlen($site)>0)
			{
				$res = CSite::GetByID($site);
				if(!($arSite = $res->Fetch()))
					$site = false;
			}
			else
				$site = false;
		}
		return $site;
	}

	function ParsePath($path, $bLast=false,  $url=false, $param="", $bLogical = false)
	{
		return ParsePath($path, $bLast, $url, $param, $bLogical);
	}

	function GetFileExtension($path)
	{
		return GetFileExtension($path);
	}

	function GetFileType($path)
	{
		return GetFileType($path);
	}

	function GetStrFileSize($size)
	{
		if ($size < 1024)
			return $size.' '.GetMessage('BYTE');

		$size = round($size/1024);
		if ($size < 1024)
			return $size.' K'.GetMessage('BYTE');

		$size = round($size/1024);
		return $size.' M'.GetMessage('BYTE');
	}

	function GetFileTypeEx($fileName)
	{
		global $arFilemanPredifinedFileTypesR;
		$fileExt = GetFileExtension(strtolower($fileName));
		if (count($arFilemanPredifinedFileTypesR) <= 0)
		{
			foreach ($GLOBALS['arFilemanPredifinedFileTypes'] as $key => $value)
				foreach ($value["exts"] as $ext)
					$arFilemanPredifinedFileTypesR[$ext] = $key;
		}
		if (isset($arFilemanPredifinedFileTypesR[$fileExt]))
			return $arFilemanPredifinedFileTypesR[$fileExt];
		return "file";
	}

	function EscapePHPString($str)
	{
		return EscapePHPString($str);
	}

	function UnEscapePHPString($str)
	{
		return UnEscapePHPString($str);
	}

	function UndoFileDelete($Params, $type)
	{
		global $APPLICATION;

		$documentRoot = CSite::GetSiteDocRoot($Params['site']);

		// Restore file
		if (strlen($Params['path']) > 0)
			$APPLICATION->SaveFileContent($documentRoot.$Params['path'], $Params['content']);

		// Update disk quota
		if (COption::GetOptionInt("main", "disk_space") > 0)
		{
			$file_size = @filesize($documentRoot.$Params['path']);
			$quota = new CDiskQuota();
			$quota->UpdateDiskQuota("file", $file_size, "delete");
		}

		// Restore file access permissions
		if (is_array($Params['perm']) && count($Params['perm']) > 0)
		{
			for ($i = 0, $l = count($Params['perm']); $i < $l; $i++)
			{
				$permFile = $Params['perm'][$i]['permFile'];

				$permContent = $APPLICATION->GetFileContent($permFile);
				$permContent = substr($permContent, 0, strpos($permContent, "?".">"));
				$permContent .= "\$PERM[\"".EscapePHPString($Params['perm'][$i]['file'])."\"][\"".EscapePHPString($Params['perm'][$i]['group'])."\"]=\"".EscapePHPString($Params['perm'][$i]['perm'])."\";\n";
				$permContent .= "?".">\n";

				$APPLICATION->SaveFileContent($permFile, $permContent);
			}
		}

		// Restore menu
		if (is_array($Params['menu']) && count($Params['menu']) > 0)
		{
			for ($i = 0, $l = count($Params['menu']); $i < $l; $i++)
			{
				$menuFile = $Params['menu'][$i]['menuFile'];
				$menuIndex = $Params['menu'][$i]['menuIndex'];
				$menuItem = $Params['menu'][$i]['menuItem'];

				$arMenu = CFileman::GetMenuArray($documentRoot.$menuFile);

				$arFound = false;
				if (count($arMenu["aMenuLinks"]) <= $menuIndex)
					$arMenu["aMenuLinks"][] = $menuItem;
				else
					$arMenu["aMenuLinks"] = array_merge(array_slice($arMenu["aMenuLinks"], 0, $menuIndex), array($menuItem), array_slice($arMenu["aMenuLinks"], $menuIndex));

				CFileMan::SaveMenu(Array($Params['site'], $menuFile), $arMenu["aMenuLinks"], $arMenu["sMenuTemplate"]);
			}
		}

		// Restore UrlRewriter
		if (is_array($Params['SEF']) && count($Params['SEF']) > 0)
		{
			for ($i = 0, $l = count($Params['SEF']); $i < $l; $i++)
			{
				CUrlRewriter::Add(array(
					"SITE_ID" => $Params['site'],
					"CONDITION" => $Params['SEF'][$i]["CONDITION"],
					"ID" => $Params['SEF'][$i]["ID"],
					"PATH" => $Params['SEF'][$i]["PATH"],
					"RULE" => $Params['SEF'][$i]["RULE"]
				));
			}
		}
	}

	function UndoNewFile($Params, $type)
	{
		global $APPLICATION;

		$documentRoot = CSite::GetSiteDocRoot($Params['site']);

		// Delete file
		@chmod($Params['absPath'], BX_FILE_PERMISSIONS);

		if (COption::GetOptionInt("main", "disk_space") > 0)
		{
			$file_size = @filesize($Params['absPath']);
			$quota = new CDiskQuota();
			$quota->UpdateDiskQuota("file", $file_size, "delete");
		}

		$sucess = @unlink($Params['absPath']);

		if (!$sucess)
			return;

		$APPLICATION->RemoveFileAccessPermission(Array($Params['site'], $Params['path']));

		if (CModule::IncludeModule("search"))
			CSearch::DeleteIndex("main", $Params['site']."|".$Params['path']);

		// Find and clean file from menu
		if ($Params['menu'])
		{
			$arMenu = CFileman::GetMenuArray($documentRoot.$Params['menu']['menuFile']);
			if (!empty($arMenu["aMenuLinks"]))
			{
				$found = false;
				foreach ($arMenu["aMenuLinks"] as $menuIndex => $arItem)
				{
					if ($arItem[1] == $Params['menu']['menuPath'] && $arItem[0] == $Params['menu']['menuName'])
					{
						unset($arMenu["aMenuLinks"][$menuIndex]);
						$found = true;
						break;
					}
				}

				if ($found)
					CFileMan::SaveMenu(Array($Params['site'], $Params['menu']['menuFile']), $arMenu["aMenuLinks"], $arMenu["sMenuTemplate"]);
			}
		}
	}

	function UndoEditFile($Params, $type)
	{
		global $APPLICATION;

		// Restore file
		if (strlen($Params['absPath']) > 0)
			$APPLICATION->SaveFileContent($Params['absPath'], $Params['content']);
	}

	function UndoNewSection($Params, $type)
	{
		global $APPLICATION;

		if (strlen($Params['path']) > 0 && $Params['path'] != "/" && is_dir($Params['absPath']))
			CFileman::DeleteEx(Array($Params['site'], $Params['path']));

		$documentRoot = CSite::GetSiteDocRoot($Params['site']);
		// Find and clean file from menu
		if ($Params['menu'])
		{
			$arMenu = CFileman::GetMenuArray($documentRoot.$Params['menu']['menuFile']);
			if (!empty($arMenu["aMenuLinks"]))
			{
				$found = false;
				foreach ($arMenu["aMenuLinks"] as $menuIndex => $arItem)
				{
					if ($arItem[1] == $Params['menu']['menuPath'] && $arItem[0] == $Params['menu']['menuName'])
					{
						unset($arMenu["aMenuLinks"][$menuIndex]);
						$found = true;
						break;
					}
				}

				if ($found)
					CFileMan::SaveMenu(Array($Params['site'], $Params['menu']['menuFile']), $arMenu["aMenuLinks"], $arMenu["sMenuTemplate"]);
			}
		}
	}

	function FetchFileAccessPerm($path)
	{
		CMain::InitPathVars($site, $path);
		$DOC_ROOT = CSite::GetSiteDocRoot($site);
		$result = false;

		if(($p = bxstrrpos($path, "/")) === false)
			return $result;

		$path_file = substr($path, $p + 1);
		$path_dir = substr($path, 0, $p);

		if(!file_exists($DOC_ROOT.$path_dir."/.access.php"))
			return $result;

		include($DOC_ROOT.$path_dir."/.access.php");

		$result = array();
		foreach($PERM as $file=>$arPerm)
		{
			if($file == $path_file)
			{
				foreach($arPerm as $group=>$perm)
					$result[] = array(
						'permFile' => $DOC_ROOT.$path_dir."/.access.php",
						'file' => $file,
						'group' => $group,
						'perm' => $perm
					);
			}
		}

		return $result;
	}

	function AddHTMLEditorFrame(
				$strTextFieldName,
				$strTextValue,
				$strTextTypeFieldName,
				$strTextTypeValue,
				$arSize = Array("height"=>350),
				$CONVERT_FOR_WORKFLOW="N",
				$WORKFLOW_DOCUMENT_ID=0,
				$NEW_DOCUMENT_PATH="",
				$textarea_field="",
				$site = false,
				$bWithoutPHP = true,
				$arTaskbars = false,
				$arAdditionalParams = Array()
			)
	{
		global $htmled, $usehtmled;
		$usecookie = (!isset($arAdditionalParams['dontusecookie']) || !$arAdditionalParams['dontusecookie']);
		if (!$usecookie)
			$htmled = (isset($usehtmled) && $usehtmled == 'Y') ? 'Y' : 'N';
		if(is_array($arSize))
			$iHeight = $arSize["height"];
		else
			$iHeight = $arSize;

		$s = '
			<script>
			ons = BX("'.$strTextFieldName.'").form.onsubmit;

			if(ons)
			{
				ons = ons.toString();
				var fpos = ons.indexOf("function");
				var fname = ons.substring(fpos+9);
				fname = fname.substring(0, fname.indexOf("{"));
				document.write("<s"+"cript>function St'.$strTextFieldName.'(){subm'.$strTextFieldName.'();"+fname+";}</s"+"cript>");
				BX("'.$strTextFieldName.'").form.onsubmit=St'.$strTextFieldName.';
			}
			else
				BX("'.$strTextFieldName.'").form.onsubmit=subm'.$strTextFieldName.';
			</script>';

		$ext_html_editor = COption::GetOptionString("fileman", "ext_html_editor", "");
		if($ext_html_editor=="always" || ($ext_html_editor=="not_admin" && !$USER->IsAdmin()) || $ext_html_editor=="not_php" || $ext_html_editor=="not_pages")
		{
			$strTextValue = htmlspecialcharsback($strTextValue);
			include_once($_SERVER['DOCUMENT_ROOT']."/webmin/admin/FCKeditor/fckeditor.php");

			$oFCKeditor = new FCKeditor($strTextFieldName."_ed") ;
			$oFCKeditor->Width  = '0px' ;
			$oFCKeditor->Height = '0px' ;
			$oFCKeditor->Value = $strTextValue;
			$oFCKeditor->BasePath = '/webmin/admin/FCKeditor/';
			$oFCKeditor->Config['AutoDetectLanguage']	= false ;
			$oFCKeditor->Config['DefaultLanguage'] = LANG;
			$oFCKeditor->Config['StylesXmlPath'] = '/webmin/admin/fileman_fck_styles.php?lang='.LANG.'&template='.$template.'&list=y&site='.(strlen($site)<=0?LANG:$site).'&'.bitrix_sessid_get();
			$oFCKeditor->Config['EditorAreaCSS'] = '/webmin/admin/fileman_fck_styles.php?lang='.LANG.'&template='.$template.'&site='.(strlen($site)<=0?LANG:$site).'&'.bitrix_sessid_get();
			$oFCKeditor->Config['LinkBrowserURL'] = '/webmin/admin/fileman_fck_browser.php?lang='.LANG.'&site='.$site;
			$oFCKeditor->Config['LinkBrowserWindowWidth'] = '570';
			$oFCKeditor->Config['LinkBrowserWindowHeight'] = '480';
			$oFCKeditor->Config['ImageBrowserURL'] ='/webmin/admin/fileman_fck_browser.php?lang='.LANG.'&type=image&site='.$site;
			$oFCKeditor->Config['ImageBrowserWindowWidth'] = '620';
			$oFCKeditor->Config['ImageBrowserWindowHeight'] = '480';
			$oFCKeditor->Config['FlashBrowserURL'] = '/webmin/admin/fileman_fck_browser.php?lang='.LANG.'&type=flash&site='.$site;
			$oFCKeditor->Config['FlashBrowserWindowWidth'] = '570';
			$oFCKeditor->Config['FlashBrowserWindowHeight'] = '480';
			$oFCKeditor->Config['LinkUploadURL'] = '/webmin/admin/fileman_fck_upload.php?lang='.LANG.'&site='.$site;
			$oFCKeditor->Config['ImageUploadURL'] = '/webmin/admin/fileman_fck_upload.php?lang='.LANG.'&type=image&site='.$site;
			$oFCKeditor->Config['FlashUploadURL'] = '/webmin/admin/fileman_fck_upload.php?lang='.LANG.'&type=flash&site='.$site;

			echo
				'<font class="tablefieldtext">
				'.($strTextTypeFieldName?'
					<input type="radio" onclick="cl'.$strTextFieldName.'(this)" name="'.$strTextTypeFieldName.'" id="'.$strTextTypeFieldName.'_0" disabled value="text"'.($strTextTypeValue!='html'?' checked':'').'> <label for="'.$strTextTypeFieldName.'_0">Text</label> /
					<input type="radio" onclick="cl'.$strTextFieldName.'(this)" name="'.$strTextTypeFieldName.'" id="'.$strTextTypeFieldName.'_1" disabled value="html"'.($strTextTypeValue=='html'?' checked':'').'> <label for="'.$strTextTypeFieldName.'_1">HTML</label>
				':'').'
					<input type="checkbox" id="'.$strTextFieldName.'usehtmledit" disabled onclick="cl'.$strTextFieldName.'(this);document.cookie=\'htmled=\'+(this.checked?\'Y\':\'N\')+\'; expires=Fri, 31 Dec 2019 23:59:59 GMT;\';"'.($htmled=="Y"?" checked":"").'> <label for="'.$strTextFieldName.'usehtmledit">'.GetMessage("FILEMAN_FILEMAN_USE_HTML_EDITOR").'</label>
				</font><br>
				<textarea class="typearea" style="width:100%;height:'.$iHeight.'px;" name="'.$strTextFieldName.'" id="'.$strTextFieldName.'" wrap="virtual" '.$textarea_field.'>'.$strTextValue.'</textarea>
				<script>
				function subm'.$strTextFieldName.'()
				{
					if(prev'.$strTextFieldName.'!=0)
						BX("'.$strTextFieldName.'").value = BX("'.$strTextFieldName.'_ed___Frame").contentWindow.FCK.GetXHTML();
				}
				</script>';

			$oFCKeditor->Create();

			echo
			'<script>
			var prev'.$strTextFieldName.' = 0;
			function cl'.$strTextFieldName.'(ob)
			{
				var val;
				var nn = BX("'.$strTextFieldName.'_ed___Frame");

				if('.($strTextTypeFieldName?'BX("'.$strTextTypeFieldName.'_0").checked || ':'').'!BX("'.$strTextFieldName.'usehtmledit").checked)
				{
					if(prev'.$strTextFieldName.'!=0)
					{
						prev'.$strTextFieldName.' = 0;
						BX("'.$strTextFieldName.'").value = BX("'.$strTextFieldName.'_ed___Frame").contentWindow.FCK.GetXHTML();
						BX("'.$strTextFieldName.'_ed___Frame").style.width="0px";
						BX("'.$strTextFieldName.'_ed___Frame").style.height="0px";
						BX("'.$strTextFieldName.'").style.display="block";
					}
				}
				else
				{
					if(prev'.$strTextFieldName.'==0)
					{
						prev'.$strTextFieldName.' = 1;
						nn.contentWindow.FCK.SetHTML(BX("'.$strTextFieldName.'").value);
						BX("'.$strTextFieldName.'").style.display="none";
						BX("'.$strTextFieldName.'_ed___Frame").style.width="100%";
						BX("'.$strTextFieldName.'_ed___Frame").style.height="'.$iHeight.'px";
					}
				}
			}

			function subm'.$strTextFieldName.'()
			{
				if(prev'.$strTextFieldName.'!=0)
					BX("'.$strTextFieldName.'").value = BX("'.$strTextFieldName.'_ed___Frame").contentWindow.FCK.GetXHTML();
			}

			function '.$strTextFieldName.'load()
			{
				var nn = BX("'.$strTextFieldName.'_ed___Frame");
				if(!nn.contentWindow.FCK || !nn.contentWindow.FCK.SetHTML)
				{
					setTimeout("'.$strTextFieldName.'load()", 1000);
					return;
				}

				cl'.$strTextFieldName.'();
				'.(
				$strTextTypeFieldName?'BX("'.$strTextTypeFieldName.'_0").disabled=false;
				BX("'.$strTextTypeFieldName.'_1").disabled=false;
				':'').'
				BX("'.$strTextFieldName.'usehtmledit").disabled=false;
			}
			setTimeout("'.$strTextFieldName.'load()", 1000);
			</script>';
		}
		else
		{
			if(COption::GetOptionString("fileman", "use_old_version", "N")!="Y")
			{
				$strTextValue = htmlspecialcharsback($strTextValue);
				$curHTMLEd = (($strTextTypeValue == 'html' || !$strTextTypeValue) && $htmled == "Y");
				$dontShowTA = (!isset($arAdditionalParams['dontshowta'])) ? false : $arAdditionalParams['dontshowta'];
				setEditorEventHandlers($strTextFieldName);
				?>
					<script>
						function cl<?=$strTextFieldName?>(ob)
						{
							var el = BX("<?=$strTextFieldName?>");
							var r1 = BX("<?=$strTextTypeFieldName?>_0");
							var bEd = (r1 && !r1.checked && BX("<?=$strTextFieldName?>usehtmledit").checked);
							var bEd_2 = BX("<?=$strTextFieldName?>usehtmledit").checked && (r1==null);

							if((bEd || bEd_2) && el.style.display != "none")
							{
								_start_ = function(pMainObj)
								{
									var sContent = pMainObj.PreparseHeaders(el.value);
									pMainObj.SetContent(sContent);
									pMainObj.Show(true);
									pMainObj.LoadContent();
								}

								el.style.display = "none";
								if(!el.pMainObj)
									el.pMainObj = new BXHTMLEditor("<?=$strTextFieldName?>", _start_);
								else
									_start_(el.pMainObj);

							}
							else if(!(bEd || bEd_2) && el.style.display == "none")
							{
								el.pMainObj.Show(false);
								el.pMainObj.SaveContent(true);
								el.style.display = "inline";
							}
						}
					</script>

					<font class="tablefieldtext">
					<? if($strTextTypeFieldName): ?>
						<input type="radio" onclick="cl<?=$strTextFieldName?>(this)" name="<?=$strTextTypeFieldName?>" id="<?=$strTextTypeFieldName?>_0" value="text"<? echo($strTextTypeValue!='html'?' checked':'')?>><label for="<?=$strTextTypeFieldName?>_0">Text</label> /
						<input type="radio" onclick="cl<?=$strTextFieldName?>(this)" name="<?=$strTextTypeFieldName?>" id="<?=$strTextTypeFieldName?>_1" value="html"<? echo($strTextTypeValue=='html'?' checked':'')?>> <label for="<?=$strTextTypeFieldName?>_1">HTML</label>
					<? endif;?>
					<input type="checkbox" id="<?=$strTextFieldName?>usehtmledit" name="<?=$strTextFieldName?>usehtmledit" onclick="cl<?=$strTextFieldName?>(this);<?if($usecookie):?>document.cookie='htmled='+(this.checked?'Y':'N')+'; expires=Fri, 31 Dec 2019 23:59:59 GMT;';<?endif;?>"<? echo($htmled == "Y"?" checked":"");?>><label for="<?=$strTextFieldName?>usehtmledit"><?echo GetMessage("FILEMAN_FILEMAN_USE_HTML_EDITOR");?></label>
					</font>
					<br>
					<textarea class="typearea" style="<? echo(($curHTMLEd || $dontShowTA) ? 'display:none;' : '');?>width:100%;height:<?=$iHeight?>px;" name="<?=$strTextFieldName?>" id="<?=$strTextFieldName?>" wrap="virtual" <?=$textarea_field?>><?echo htmlspecialchars($strTextValue)?></textarea>
					<?

				if ($bWithoutPHP)
					$arTaskbars = Array("BXPropertiesTaskbar", "BXSnippetsTaskbar");
				else if (!$arTaskbars)
					$arTaskbars = Array("BXPropertiesTaskbar", "BXComponents2Taskbar");


				$arParams = Array(
					"bUseOnlyDefinedStyles"=>COption::GetOptionString("fileman", "show_untitled_styles", "N")!="Y",
					"bFromTextarea" => true,
					"bDisplay"=>$curHTMLEd,
					"bWithoutPHP"=>$bWithoutPHP,
					"arTaskbars"=>$arTaskbars,
					"height"=>($iHeight < 450 ? 450:$iHeight)
					);

				$arParams['site'] = (strlen($site)<=0?LANG:$site);
				if(isset($arSize["width"]))
					$arParams["width"] = $arSize["width"];

				if (isset($arAdditionalParams))
					$arParams["arAdditionalParams"] = $arAdditionalParams;

				if (isset($arAdditionalParams['limit_php_access']))
					$arParams['limit_php_access'] = $arAdditionalParams['limit_php_access'];

				CFileman::ShowHTMLEditControl($strTextFieldName, $strTextValue, $arParams);
				$s = "";
			}
			else
			{
				if(preg_match("/(MSIE|Internet Explorer) ([0-9]).([0-9])+/i", $_SERVER['HTTP_USER_AGENT'], $version) && IntVal($version[2]) >= 5)
				{
					if($CONVERT_FOR_WORKFLOW=="Y" && CModule::IncludeModule("workflow"))
						$par = "&WF_CONVERT=Y&DOCUMENT_ID=". intval($WORKFLOW_DOCUMENT_ID)."&WF_PATH=".$NEW_DOCUMENT_PATH;

					echo
					'
					<font class="tablefieldtext">
					'.($strTextTypeFieldName?'
						<input type="radio" onclick="cl'.$strTextFieldName.'(this)" name="'.$strTextTypeFieldName.'" id="'.$strTextTypeFieldName.'_0" disabled value="text"'.($strTextTypeValue!='html'?' checked':'').'> <label for="'.$strTextTypeFieldName.'_0">Text</label> /
						<input type="radio" onclick="cl'.$strTextFieldName.'(this)" name="'.$strTextTypeFieldName.'" id="'.$strTextTypeFieldName.'_1" disabled value="html"'.($strTextTypeValue=='html'?' checked':'').'> <label for="'.$strTextTypeFieldName.'_1">HTML</label>
				':'').'
						<input type="checkbox" id="'.$strTextFieldName.'usehtmledit" disabled onclick="cl'.$strTextFieldName.'(this);document.cookie=\'htmled=\'+(this.checked?\'Y\':\'N\')+\'; expires=Fri, 31 Dec 2019 23:59:59 GMT;\';"'.($htmled=="Y"?" checked":"").'> <label for="'.$strTextFieldName.'usehtmledit">'.GetMessage("FILEMAN_FILEMAN_USE_HTML_EDITOR").'</label>											</font><br>
					<iframe style="width:0px;height:0px;" name="'.$strTextFieldName.'_HTML" src="/webmin/admin/fileman_html_edit.php?lang='.LANG.'&fieldname='.$strTextFieldName. '&light=Y'.$par.'"></iframe>
					<textarea class="typearea" style="width:100%;height:'.$iHeight.'px;" name="'.$strTextFieldName.'" wrap="virtual" '.$textarea_field.'>'.$strTextValue.'</textarea>
					<script>
					var prev'.$strTextFieldName.' = 0;
					function cl'.$strTextFieldName.'(ob)
					{
						var val;
						if('.($strTextTypeFieldName?'document.all("'.$strTextTypeFieldName.'")[0].checked || ':'').'!document.all("'.$strTextFieldName.'usehtmledit").checked)
						{
							if(prev'.$strTextFieldName.'!=0)
							{
								prev'.$strTextFieldName.' = 0;
								document.all("'.$strTextFieldName.'").value = window.'.$strTextFieldName.'_HTML.GetContent();
								document.all("'.$strTextFieldName.'_HTML").style.width="0px";
								document.all("'.$strTextFieldName.'_HTML").style.height="0px";
								document.all("'.$strTextFieldName.'").style.display="block";
							}
						}
						else
						{
							if(prev'.$strTextFieldName.'==0)
							{
								prev'.$strTextFieldName.' = 1;
								window.'.$strTextFieldName.'_HTML.SetContent(
									document.all("'.$strTextFieldName.'").value);
								document.all("'.$strTextFieldName.'").style.display="none";
								document.all("'.$strTextFieldName.'_HTML").style.width="100%";
								document.all("'.$strTextFieldName.'_HTML").style.height="'.$iHeight.'px";
							}
						}
					}

					function subm'.$strTextFieldName.'()
					{
						if(prev'.$strTextFieldName.'!=0)
							document.all("'.$strTextFieldName.'").value = window.'.$strTextFieldName.'_HTML.GetContent();
					}

					function '.$strTextFieldName.'_OnLoad()
					{
						try{
							window.'.$strTextFieldName.'_HTML.tbContentElement.DOM.body.DocumentHTML= "";
						}catch(e){
							setTimeout("'.$strTextFieldName.'_OnLoad()", 300);
							return;
						}

						cl'.$strTextFieldName.'();
						'.(
						$strTextTypeFieldName?'document.all("'.$strTextTypeFieldName.'")[0].disabled=false;
						document.all("'.$strTextTypeFieldName.'")[1].disabled=false;
						':'').'
						document.all("'.$strTextFieldName.'usehtmledit").disabled=false;
					}
					</script>';
				}
				else
				{
					$s = '';
					echo '
						<font class="tablefieldtext">
							<input type="radio" name="'.$strTextTypeFieldName.'" value="text"'.($strTextTypeValue!='html'?' checked':'').' id="'.$strTextTypeFieldName.'_0"> <label for="'.$strTextTypeFieldName.'_0">Text</label> /
							<input type="radio" name="'.$strTextTypeFieldName.'" value="html"'.($strTextTypeValue=='html'?' checked':'').' id="'.$strTextTypeFieldName.'_1"> <label for="'.$strTextTypeFieldName.'_1">HTML</label>
						</font><br>
						<textarea class="typearea" style="width:100%;height:'.$iHeight.'px;" name="'.$strTextFieldName.'" wrap="virtual" '.$textarea_field.'>'.$strTextValue.'</textarea>
						';
				}
			}
		}
		echo $s;
	}

	function ShowHTMLEditControl($name, $content, $arParams=Array())
	{
		CUtil::InitJSCore(array('ajax', 'window'));
		$relPath = (isset($arParams["path"])) ?	$arParams["path"] : "/";
		$site = (isset($arParams["site"])) ?	$arParams["site"] : "";
		$__path = Rel2Abs("/", $relPath);
		$site = CFileMan::__CheckSite($site);

		if (!isset($arParams["limit_php_access"]))
			$arParams["limit_php_access"] = false;

		$arParams["light_mode"] = (defined('BX_PUBLIC_MODE') && BX_PUBLIC_MODE == 1) || (isset($arParams["light_mode"]) && $arParams["light_mode"] == 'Y');

		//$lng = CLanguage::GetByID(LANGUAGE_ID);
		//if($arRes = $lng->Fetch())
		//	$direction_rtl = ($arRes['DIRECTION'] =="N");

		$direction_rtl = false;

		if($site)
		{
			$DOC_ROOT = CSite::GetSiteDocRoot($site);
			$abs_path = $DOC_ROOT.$__path;
			if (is_file($abs_path))
			{
				$relPath = substr($relPath,0,strrpos($relPath,"/"));
				if ($relPath=="")
					$relPath = "/";
			}
		}

		static $bFirstUse;
		$site = $arParams["site"];
		$template = $arParams["templateID"];
		//Taskbars
		$arTaskbars = (isset($arParams["arTaskbars"])) ? $arParams["arTaskbars"] : Array();
		//Toolbars
		$arToolbars = (isset($arParams["arToolbars"])) ? $arParams["arToolbars"] : false;

		$arParams["use_advanced_php_parser"] = COption::GetOptionString("fileman", "use_advanced_php_parser", "Y");
		$arParams["ar_entities"] = COption::GetOptionString("fileman", "ar_entities", 'umlya,greek,other');
		if ($arParams["ar_entities"] == 'none')
			$arParams["ar_entities"] = '';

		if(!isset($arParams["spellCheckFirstClient"]))
			$arParams["spellCheckFirstClient"] = COption::GetOptionString("fileman", "spell_check_first_client", "Y");

		if(!isset($arParams["usePspell"]))
			$arParams["usePspell"] = COption::GetOptionString("fileman", "use_pspell", "N");

		if(!isset($arParams["useCustomSpell"]))
			$arParams["useCustomSpell"] = COption::GetOptionString("fileman", "use_custom_spell", "Y");

		$arParams['allowRenderComp2'] = COption::GetOptionString('fileman', "allow_render_components", "N") == 'Y';
		$arParams['renderComponents'] = $arParams['allowRenderComp2']  && CUserOptions::GetOption('fileman', "render_components", "Y") == 'Y';

		$lca = COption::GetOptionString("fileman", "use_lca", "N");
		$styleList_render_style = (COption::GetOptionString("fileman", "render_styles_in_classlist", "Y") == 'Y') ? 'true' : 'false';
		$arAdditionalParams = (isset($arParams["arAdditionalParams"])) ? $arParams["arAdditionalParams"] : Array();

		$arResult = CFileman::GetAllTemplateParams($template, $site, ($arParams["bWithoutPHP"] != true),$arAdditionalParams);
		$arParams["TEMPLATE"] = $arResult;
		if($bUseOnlyDefinedStyles && !is_set($arResult, "STYLES_TITLE"))
			$bUseOnlyDefinedStyles = false;

		?>
		<script>
		var relPath = "<? echo htmlspecialcharsex(str_replace("</script","</_script", $relPath));?>";
		var <? echo 'ar_'.htmlspecialchars($name).'_taskbars';?> = {};
		<?
		for ($k = 0; $k < count($arTaskbars); $k++)
			echo 'ar_'.htmlspecialcharsex($name).'_taskbars["'.$arTaskbars[$k].'"] = true;';
		if ($arToolbars !== false)
		{
			echo 'var  ar_'.htmlspecialcharsex($name).'_toolbars = {};';
			for ($k = 0; $k < count($arToolbars); $k++)
				echo 'ar_'.htmlspecialcharsex($name).'_toolbars["'.$arToolbars[$k].'"] = true;';
		}
		else
			echo 'var  ar_'.htmlspecialcharsex($name).'_toolbars = false;';
		?>
		var ar_<?= htmlspecialcharsex($name)?>_config = <?= CUtil::PhpToJSObject($arParams)?>; // editor-config
		</script>
		<?

		if($bFirstUse!==true)
		{
			$arTemplates = Array(Array('value'=>'.default', 'name'=>GetMessage("FILEMAN_DEFTEMPL")));
			$db_site_templates = CSiteTemplate::GetList();
			while($ar_site_templates = $db_site_templates->Fetch())
				$arTemplates[] = Array('value'=>$ar_site_templates['ID'], 'name'=>$ar_site_templates['NAME']);
?>
			<script>
				var
					arBXTemplates = <?= CUtil::PhpToJSObject($arTemplates)?>,
					BXSite = "<?= CUtil::JSEscape($site)?>",
					BXLang = "<?= CUtil::JSEscape(LANGUAGE_ID)?>",
					styleList_render_style = <?=$styleList_render_style?>,
					limit_php_access = <?= $arParams["limit_php_access"] ? 'true' : 'false'?>,
					lca = <?= $lca == 'Y' ? 'true' : 'false'?>,
					lightMode = <?= $arParams["light_mode"] ? 'true' : 'false'?>,
					rtlMode = <?= $direction_rtl ? 'true' : 'false'?>,
					spellcheck_js_v = "<?=@filemtime($_SERVER['DOCUMENT_ROOT'].'/webmin/admin/htmleditor2/spellcheck.js')?>",
					BX_PERSONAL_ROOT = "<?=BX_PERSONAL_ROOT?>";

				window.bxsessid = "<?=bitrix_sessid()?>";
			</script>
			<?if (isset($_GET['debug_mode']) && $_GET['debug_mode']=='Y'):?>
			<b style="font-size: 10px;">* * * * *  DEBUG MODE [WYSIWYG Editor: debug_mode=true] * * * * *</b>
			<script>debug_mode = true;</script>
			<?endif;?>

			<?
			$arJS = Array();
			$arCSS = Array();
			$events = GetModuleEvents("fileman", "OnBeforeHTMLEditorScriptsGet");
			while($arEvent = $events->Fetch())
			{
				$tmp = ExecuteModuleEventEx($arEvent, array($name, $arParams));
				if (!is_array($tmp))
					continue;

				if (is_array($tmp['JS']))
					$arJS = array_merge($arJS, $tmp['JS']);
				if (is_array($tmp['CSS']))
					$arCSS = array_merge($arCSS, $tmp['CSS']);
			}
			$arr = Array();
			// Additional JS files from event OnBeforeHtmlEditorScriptGet
			for($i = 0, $c = count($arJS); $i < $c; $i++)
			{
				$arJS[$i] = preg_replace("/[^a-zA-Z0-9_:\.]/is", "", $arJS[$i]);
				if(file_exists($_SERVER['DOCUMENT_ROOT'].'/webmin/admin/htmleditor2/'.$arJS[$i]))
					$arr[] = $arJS[$i];
			}
			$str_taskbars = CFileman::GetHTMLEditorSettings(htmlspecialchars($name), $arParams["light_mode"], $arTaskbars);
			$str_taskbars .= '_'.CFileman::GetVersion().rand();
			?>
<script type="text/javascript" src="/webmin/admin/fileman_js.php?lang=<?=LANGUAGE_ID?>&v=<?=@filemtime($_SERVER['DOCUMENT_ROOT'].'/webmin/modules/fileman/lang/'.LANGUAGE_ID.'/admin/fileman_js.php')?>"></script>
<script type="text/javascript" src="/webmin/admin/fileman_common_js.php?s=<?=$str_taskbars?>"></script>
			<?
			for($i = 0; $i < count($arr); $i++)
			{
				$script_filename = $arr[$i];
				?><script type="text/javascript" src="/webmin/admin/htmleditor2/<?=$script_filename?>?v=<?=@filemtime($_SERVER['DOCUMENT_ROOT'].'/webmin/admin/htmleditor2/'.$script_filename)?>"></script><?
			}
			?>
			<script type="text/javascript" src="/webmin/js/main/popup_menu.js?v=<?=@filemtime($_SERVER['DOCUMENT_ROOT'].'/webmin/js/main/popup_menu.js')?>"></script>
			<?if (defined('BX_PUBLIC_MODE') && BX_PUBLIC_MODE == 1):?>
			<script>
			for(var i = 0, l = arGlobalToolbar.length; i < l; i++)
			{
				if(arGlobalToolbar[i][1] && arGlobalToolbar[i][1].id == "Fullscreen")
				{
					arGlobalToolbar = arGlobalToolbar.slice(0, i).concat(arGlobalToolbar.slice(++i));
					break;
				}
			}
			</script>
			<?endif;

			for($i=0; $i<count($arCSS); $i++) // Additional CSS files from event OnBeforeHtmlEditorScriptGet
			{
				$arCSS[$i] = preg_replace("/[^a-zA-Z0-9_:\.]/is", "", $arCSS[$i]);
				if(!file_exists($_SERVER['DOCUMENT_ROOT'].'/webmin/admin/htmleditor2/'.$arCSS[$i]))
					continue;
				?><link rel="stylesheet" type="text/css" href="/webmin/admin/htmleditor2/<?=$arCSS[$i]?>?v=<?=@filemtime($_SERVER['DOCUMENT_ROOT'].'/webmin/admin/htmleditor2/'.$arCSS[$i])?>"/><?
			}

			$db_events = GetModuleEvents("fileman", "OnIncludeHTMLEditorScript");
			while($arEvent = $db_events->Fetch())
				ExecuteModuleEventEx($arEvent);

			$bFirstUse = true;
		}
		?>
			<div class="bxedmain-cont" id="<?= $name.'_object';?>">
				<table id="<?= $name?>_pFrame" class="bxedmainframe dim100x100" style="display:none;">

					<tr style="height: 1%;"><td id="<?= $name?>_toolBarSet0" colspan="2" style="width: 100%; display: none; border-bottom: 1px solid #808080 !important;"></td></tr>
					<tr>
						<td id="<?= $name?>_toolBarSet1" style="width:0%; display: none; border-right: 1px solid #808080 !important;"></td>
						<td vAlign="top" style="width: 4000px; padding: 0!important;">
							<table class="dim100x100">
								<tr>
									<td class="bx-ceditor" id="<?= $name?>_cEditor"></td>
									<td id="<?= $name?>_taskBarSet2" class="bxedtaskbarset" style="width:0%; display: none;">
									<table>
										<tr><td class="bx-move-col-v" rowSpan="3"><img src="/webmin/images/1.gif" /></td><td style="height:26px;"></td></tr>
										<tr><td style="vertical-align: top;"></td></tr>
										<tr><td class="bx-taskbar-tabs"></td></tr>
									</table>
									</td>
								</tr>
								<tr style="height:0%; display: none;">
									<td id="<?= $name?>_taskBarSet3" colspan="2">
										<table>
											<tr><td class="bx-move-col-h"><img src="/webmin/images/1.gif" /></td></tr>
											<tr><td style="height:26px;"></td></tr>
											<tr><td style="vertical-align: top; background: #F4F4F4 none !important;"></td></tr>
											<tr><td class="bx-taskbar-tabs"></td></tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td id="<?= $name?>_taskBarTabs" colspan="2" class="tasktabcell"></td></tr>
				</table>
			</div>
<script>
	var
		styles = '<?= CUtil::JSEscape($GLOBALS['APPLICATION']->GetFileContent($_SERVER['DOCUMENT_ROOT']."/webmin/admin/htmleditor2/editor.css"))?>',
		pHeads = document.getElementsByTagName("HEAD");

	if(BX.browser.IsIE())
	{
		setTimeout(function()
		{
			var ind = document.styleSheets.length - 1;
			while (ind >= 0)
			{
				if (document.styleSheets[ind]['media'] == '')
				{
					document.styleSheets[ind].cssText += styles;
					break;
				}
				ind--;
			}
		}, 5);
	}
	else
	{
		var xStyle, xStyles = pHeads[0].getElementsByTagName("STYLE");
		if (xStyles && xStyles.length > 0)
			xStyle = xStyles[xStyles.length - 1];
		else
			xStyle = pHeads[0].appendChild(document.createElement("STYLE"));

		xStyle.appendChild(document.createTextNode(styles));
	}

	var el = BX("<?= htmlspecialchars($name)?>");
	var r1 = BX("<?= htmlspecialchars($name).'_TYPE_0';?>");
	var bEd = (r1 && !r1.checked && BX("<?= htmlspecialchars($name).'usehtmledit';?>").checked);
	bEd = (bEd==null) ? true : bEd;
	if (!bEd)
		BX("<? echo htmlspecialchars($name).'_object';?>").style.display = "none";
</script>
		<?
		if(!$arParams["bFromTextarea"])
			echo '<input type="hidden" name="'.htmlspecialchars($name).'" id="'.htmlspecialchars($name).'" value="'.htmlspecialchars($content).'">';
		if($arParams["bDisplay"]!==false)
		{
			setEditorEventHandlers(htmlspecialchars($name));
			?>
			<DIV id="editor_wait_window_<? echo htmlspecialchars($name);?>" class = "waitwindow"; style="position: absolute; left: 45%; top: 40%; z-index: 3000;">
			<? echo GetMessage("admin_lib_loading"); ?>
			</DIV>
			<script>
				BX("<? echo htmlspecialchars($name);?>").pMainObj  = new BXHTMLEditor("<? echo htmlspecialchars($name);?>");
			</script>
			<?
		}
	}

	function ShowInitScripts()
	{
	}

	function GetFileTemplates($lang = LANG, $arTemplates=Array())
	{
		return GetFileTemplates($lang, $arTemplates);
	}

	function GetTemplateContent($filename, $lang=LANG, $arTemplates=Array())
	{
		return GetTemplateContent($filename, $lang, $arTemplates);
	}

	function GetScriptFileExt()
	{
		return GetScriptFileExt();
	}

	function ParseFileContent($filesrc, $bCheckProlog = false)
	{
		$res = ParseFileContent($filesrc);
		if ($bCheckProlog)
		{
			$prolog = trim(strtolower($res['PROLOG']));
			if (strlen($prolog) > 0 &&
				strpos($prolog, "prolog_before") === false &&
				strpos($prolog, 'webmin/header.php') === false &&
				strpos($prolog, '$application->settitle') === false &&
				strpos($prolog, '$application->setpageproperty') === false)
			{
				$res['CONTENT'] = $res['PROLOG']."\n".$res['CONTENT'];
				$res['PROLOG'] = '';
			}

			$epilog = trim(strtolower($res['EPILOG']));
			if (strlen($epilog) > 0 &&
				strpos($epilog, 'webmin/footer.php') === false &&
				strpos($epilog, 'epilog.php') === false)
			{
				$res['CONTENT'] = $res['CONTENT']."\n".$res['EPILOG'];
				$res['EPILOG'] = '';
			}
		}
		return $res;
	}

	function SetTitle($prolog, $title)
	{
		return SetPrologTitle($prolog, $title);
	}

	function SetProperty($prolog, $property_key, $property_val)
	{
		return SetPrologProperty($prolog, $property_key, $property_val);
	}

	function IsPHP($src)
	{
		return IsPHP($src);
	}

	function GetAllTemplateParams($templateID, $site, $findcomponent = true, $arAdditionalParams = Array())
	{
		global $APPLICATION;

		$db_templ = CSiteTemplate::GetByID($templateID);
		if(!($ar_templ = $db_templ->Fetch()))
		{
			$templateID = "";
			$db_site_templ = CSite::GetTemplateList($site);
			while($ar_site_templ = $db_site_templ->Fetch())
			{
				if(strlen($ar_site_templ["CONDITION"])<=0)
				{
					$templateID = $ar_site_templ["TEMPLATE"];
					break;
				}
			}

			if(strlen($templateID)>0)
			{
				$db_templ = CSiteTemplate::GetByID($templateID);
				$ar_templ = $db_templ->Fetch();
			}
		}

		if($ar_templ)
		{
			$arResult = Array(
				"ID" => $ar_templ["ID"],
				"NAME" => $ar_templ["NAME"]
				);

			if(is_set($ar_templ, "STYLES"))
			{
				$arResult["STYLES"] = $ar_templ["STYLES"];
				$arResult["STYLES_TITLE"] = $ar_templ["STYLES_TITLE"];
			}
		}
		else
		{
			$arResult = Array("ID" => ".default", "NAME" => GetMessage("FILEMAN_DDEF_TEMPLATE"));
			$templateID = "";
		}

		if(!is_set($arResult, "STYLES") || $arResult["STYLES"]==false)
		{
			if(file_exists($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/".(strlen($site)<=0?LANGUAGE_ID:$site)."/styles.css"))
			{
				$arResult["STYLES"] = $APPLICATION->GetFileContent($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/".(strlen($site)<=0?LANGUAGE_ID:$site)."/styles.css");
				$arResult["STYLES_TITLE"] = CSiteTemplate::__GetByStylesTitle($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/".(strlen($site)<=0?LANGUAGE_ID:$site)."/.styles.php");
			}
			elseif(file_exists($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/php_interface/styles.css"))
			{
				$arResult["STYLES"] = $APPLICATION->GetFileContent($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/styles.css");
				$arResult["STYLES_TITLE"] = CSiteTemplate::__GetByStylesTitle($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/.styles.php");
			}
			else
			{
				$arResult["STYLES"] = $APPLICATION->GetFileContent($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/templates/.default/styles.css");
				$arResult["STYLES_TITLE"] = CSiteTemplate::__GetByStylesTitle($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/templates/.default/.styles.php");
			}
		}

		if (isset($arAdditionalParams['additionalCSS']))
		{
			$additionalCSS = $arAdditionalParams['additionalCSS'];
			for ($i=0; $i<count($additionalCSS);$i++)
			{
				$css_file_path = $additionalCSS[$i];
				$arResult["STYLES"] .= "\r\n".$APPLICATION->GetFileContent($css_file_path);
			}
		}

		if(strlen($templateID)>0 && file_exists($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/templates/".$templateID."/editor.css"))
			$arResult["STYLES"] .= "\r\n".$APPLICATION->GetFileContent($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/templates/".$templateID."/editor.css");
		elseif(file_exists($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/templates/.default/editor.css"))
			$arResult["STYLES"] .= "\r\n".$APPLICATION->GetFileContent($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/templates/.default/editor.css");
		elseif(file_exists($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/".$site."/editor.css"))
			$arResult["STYLES"] .= "\r\n".$APPLICATION->GetFileContent($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/".(strlen($site)<=0?LANGUAGE_ID:$site)."/editor.css");
		elseif(file_exists($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/editor.css"))
			$arResult["STYLES"] .= "\r\n".$APPLICATION->GetFileContent($_SERVER["DOCUMENT_ROOT"].BX_PERSONAL_ROOT."/php_interface/editor.css");

		return $arResult;
	}

	function __CheckOnAllowedComponents($str)
	{
		$allowed_components = trim(COption::GetOptionString('fileman', "~allowed_components", ''));
		if ($allowed_components == '')
			return true;

		$arAC = explode("\n",$allowed_components);
		$arAC = array_unique($arAC);
		$arAllowedComponents = Array();
		foreach ($arAC as $f)
		{
			if (trim($f) == '')
				continue;

			$f = preg_replace("/\s/is", "", $f);
			$f = preg_replace("/\./is", "\\.", $f);
			$f = preg_replace("/\*/is", ".*", $f);
			$arAllowedComponents[] = '/^'.$f.'$/';
		}
		if (count($arAllowedComponents) == 0)
			return true;
		$comp_RE = '/\$application->includecomponent\(\s*?(.*?),/i';
		preg_match_all($comp_RE, $str, $matches);

		for ($i = 0, $l = count($matches[1]); $i < $l; $i++)
		{
			$name = trim($matches[1][$i]);
			$er_name = $name;
			$name = substr($name, 1, -1);
			$bx = 'webmin:';
			$bxlen = strlen($bx);
			if (substr($name, 0, $bxlen) != $bx)
				return $er_name;
			$name = substr($name, $bxlen);
			for ($j = 0, $c = count($arAllowedComponents); $j < $c; $j++)
				if (preg_match($arAllowedComponents[$j], $name))
					continue 2;

			return $er_name;
		}
		return true;
	}

	function CheckOnAllowedComponents($str)
	{
		if (($r = CFileMan::__CheckOnAllowedComponents($str)) !== true)
		{
			$GLOBALS['APPLICATION']->ThrowException(GetMessage("FILEMAN_UNALLOWED_COMPONENTS", Array("#BAD_COMPONENT#" => $r)), "UNALLOWED_COMPONENTS");
			return false;
		}
		return true;
	}

	function GetHTMLEditorSettings($edname, $lightMode, $arTaskbars)
	{
		?>
		<script>

		/* try{ */
		<?
		$str_res = '';
		if (!$lightMode)
		{
			//Get toolbar settings
			$toolbar_settings = stripslashes(CUserOptions::GetOption("fileman", "toolbar_settings_".$edname));
			$rs_tlbrs = stripslashes(CUserOptions::GetOption("fileman", "rs_toolbar_".$edname, 'Y'));

			if ($toolbar_settings)
			{
				?>window.arToolbarSettings = []; window.RS_toolbars = <?echo($rs_tlbrs == "N" ? "false" : "true");?>;<?
				$res = explode("||", $toolbar_settings);
				for ($i = 0, $len = count($res); $i < $len; $i++)
				{
					$tmp = explode(":", $res[$i]);
					$tlbrname = $tmp[0];
					$tmp2 = explode(",", $tmp[1]);
					$show = $tmp2[0];
					$docked = $tmp2[1];
					$arPos = explode(";", substr($tmp2[2], 1, -1));
?>
var _ar = [];
_ar.show = <?echo($show == 'true' ? 'true' : 'false');?>;
_ar.docked = <?echo($docked=='true' ? 'true' : 'false');?>;
<?if ($docked=='true'):?>
	_ar.position = [<?echo$arPos[0];?>,<?echo$arPos[1];?>,<?echo$arPos[2];?>];
<?else:?>
	_ar.position = {
		x : '<?echo(substr($arPos[0],-2)=="px" ? substr($arPos[0],0,-2) : $arPos[0]);?>',
		y : '<?echo(substr($arPos[1],-2)=="px" ? substr($arPos[1],0,-2) : $arPos[1]);?>'
	};
<?endif;?>
window.arToolbarSettings["<?=$tlbrname?>"] = _ar;
<?
				}
			}
			$str_res = 'em'; // extended mode
		}

		//Get taskbar settings
		$taskbars = CUserOptions::GetOption("fileman", "taskbar_settings_".$edname, false);
		if ($taskbars !== false)
			$taskbars = unserialize($taskbars);

		if (is_array($taskbars))
		{
			?>window.arTaskbarSettings = [];<?
			foreach($taskbars as $tname => $tskbr)
			{
				// Display settings
				?>window.arTaskbarSettings["<?=$tname;?>"] = {show: <?= $tskbr['show'] ? 'true' : 'false'?>, set: <?= $tskbr['set'] == 2 ? 2 : 3?>, active: <?= $tskbr['active'] ? 'true' : 'false'?>};<?
				if ($tskbr['show'])
				{
					switch ($tname)
					{
						case 'BXSnippetsTaskbar':
							$str_res .= 's';
							break;
						case 'BXComponents2Taskbar':
							$str_res .= 'c2';
							break;
					}
				}
			}
		}
		else
		{
			if (in_array('BXSnippetsTaskbar', $arTaskbars))
				$str_res .= 's';
			if (in_array('BXComponents2Taskbar', $arTaskbars))
				$str_res .= 'c2';
		}

		//Get taskbarset settings
		$taskbarset = CUserOptions::GetOption("fileman", "taskbarset_settings_".$edname, false);
		if ($taskbarset !== false)
			$taskbarset = unserialize($taskbarset);
		if (is_array($taskbarset))
		{
			?>window.arTBSetsSettings = [];<?
			foreach($taskbarset as $iNum => $tskbrset)
			{
				if ($iNum != 2)
					$iNum = 3;
				?>window.arTBSetsSettings["<?= intVal($iNum)?>"] = {show: <?= $tskbrset['show'] ? 'true' : 'false'?>, size: <?= intVal($tskbrset['size'])?>};
				<?
			}
		}

		$show_tooltips = CUserOptions::GetOption("fileman", "show_tooltips".$edname, "Y");
		$visualEffects = CUserOptions::GetOption("fileman", "visual_effects".$edname, "Y");
		$arC2DS = CUtil::GetPopupSize("bx_edc2_".$edname, array("width" => 650, "height" => 450));
		?>
	window.comp2_dialog_size = {width: '<?= $arC2DS['width']?>', height: '<?= $arC2DS['height']?>'};
	window.__show_tooltips = <?echo $show_tooltips == "N" ? "false" : "true";?>;
	window.__visual_effects = <?echo $visualEffects == "N" ? "false" : "true";?>;

	/*
}catch(e){}
*/
</script><?

		return $str_res;
	}

	function CheckFileName($str)
	{
		if (preg_match("/[^a-zA-Z0-9\s!\$\(\)\[\]\{\}\-\.;=@\^_\~]/is", $str))
			return GetMessage("FILEMAN_NAME_ERROR");
		return true;
	}

	function GetPropstypes($site="")
	{
		$defRes = Array(
			'description' => GetMessage("FILEMAN_OPTION_PROPS_DESCR"),
			'keywords' => GetMessage("FILEMAN_OPTION_PROPS_KEYW")
		);
		$res = COption::GetOptionString('fileman', "propstypes", addslashes(serialize($defRes)), $site);
		$res = unserialize(stripslashes($res));
		return $res;
	}

	function SetPropstypes($arPT = Array(), $desc = false, $site = "")
	{
		COption::SetOptionString('fileman', "propstypes", addslashes(serialize($arPT)), $desc, $site);
	}

	function OnModuleUpdate($arParams)
	{
		if (isset($arParams['successModules']) && count($arParams['successModules']) > 0)
			CFileMan::ClearComponentsListCache();
	}

	function ClearComponentsListCache($id = '')
	{
		$GLOBALS["CACHE_MANAGER"]->CleanDir("fileman_component_tree_array");
	}

	function SecurePathVar($str)
	{
		$str = preg_replace("/\.\.+[\/\\\]+/i", "", $str);
		return $str;
	}

	function GetUnixFilePermissions($file)
	{
		$perms = @fileperms($file);

		if (($perms & 0xC000) == 0xC000)
			$info = 's';	// Socket
		elseif (($perms & 0xA000) == 0xA000)
			$info = 'l';	// Symbolic Link
		elseif (($perms & 0x8000) == 0x8000)
			$info = '-'; // Regular
		elseif (($perms & 0x6000) == 0x6000)
			$info = 'b'; // Block special
		elseif (($perms & 0x4000) == 0x4000)
			$info = 'd'; // Directory
		elseif (($perms & 0x2000) == 0x2000)
			$info = 'c';	// Character special
		elseif (($perms & 0x1000) == 0x1000)
			$info = 'p';	// FIFO pipe
		else
			$info = 'u';	// Unknown

		// Owner
		$info .= (($perms & 0x0100) ? 'r' : '-');
		$info .= (($perms & 0x0080) ? 'w' : '-');
		$info .= (($perms & 0x0040) ? (($perms & 0x0800) ? 's' : 'x' ) : (($perms & 0x0800) ? 'S' : '-'));

		// Group
		$info .= (($perms & 0x0020) ? 'r' : '-');
		$info .= (($perms & 0x0010) ? 'w' : '-');
		$info .= (($perms & 0x0008) ? (($perms & 0x0400) ? 's' : 'x' ) : (($perms & 0x0400) ? 'S' : '-'));

		// World
		$info .= (($perms & 0x0004) ? 'r' : '-');
		$info .= (($perms & 0x0002) ? 'w' : '-');
		$info .= (($perms & 0x0001) ? (($perms & 0x0200) ? 't' : 'x' ) : (($perms & 0x0200) ? 'T' : '-'));

		return array(sprintf("%o", $perms & 0xfff), $info);
	}

	function IsWindows()
	{
		return PATH_SEPARATOR === ';';
	}

	function SaveLastPath($path)
	{
		$path = CFileMan::NormalizePath($path);
		if ($path == "" || $path == "/")
			return;

		$arPathes = CFileMan::GetLastPathes();
		$key = array_search($path, $arPathes);

		if ($key !== false)
			unset($arPathes[$key]);

		$arPathes = array_merge(array($path), $arPathes);

		CFileMan::SetLastPathes($arPathes);
	}

	function GetLastPathes()
	{
		//CUserOptions::SetOption("fileman", "last_pathes", false);
		$arPathes = CUserOptions::GetOption("fileman", "last_pathes", false);
		$arPathes = $arPathes === false ? CFileMan::GetLastPathesDefault() : unserialize($arPathes);
		$arPathes = array_slice($arPathes, 0, 10);

		return $arPathes;
	}

	function SetLastPathes($arPathes = array())
	{
		if (count($arPathes) == 0)
			$arPathes = CFileMan::GetLastPathesDefault();
		$arPathes = array_slice($arPathes, 0, 10);
		CUserOptions::SetOption("fileman", "last_pathes", serialize($arPathes));
	}

	function GetLastPathesDefault()
	{
		return array("/webmin");
	}
}

function is_array_assoc($arr)
{
	$i = 0;
	foreach($arr as $k=>$val)
	{
		if("".$k!="".$i)
			return true;
		$i++;
	}
	return false;
}

function setEditorEventHandlers($name)
{
	?>
	<script>
	function onContextMenu_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnContextMenu(e);}
	function onClick_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnClick(e);}
	function onDblClick_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnDblClick(e);}
	function onMouseUp_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnMouseUp(e);}
	function onDragDrop_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnDragDrop(e);}
	function onKeyPress_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnKeyPress(e);}
	function onKeyDown_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnKeyDown(e);}
	function onPaste_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].OnPaste(e);}

	function OnSubmit_<?echo $name;?>(e){GLOBAL_pMainObj['<?echo $name;?>'].onSubmit(e);}

	function OnDispatcherEvent_pDocument_<?echo $name;?>(e){pBXEventDispatcher.OnEvent(GLOBAL_pMainObj['<?echo $name;?>'].pDocument, e);}
	function OnDispatcherEvent_pEditorDocument_<?echo $name;?>(e){pBXEventDispatcher.OnEvent(GLOBAL_pMainObj['<?echo $name?>'].pEditorDocument, e);}
	</script>
	<?
}

function _replace_br_($str)
{
	return $str;
	$pos2 = strpos(strtolower($str), "\n");
	if ($pos2!==FALSE)
	{
		$str = str_replace("\r"," ",$str);
		$str = str_replace("\n"," ",$str);
		$str = str_replace("\\r"," ",$str);
		$str = str_replace("\\n"," ",$str);
	}
	return $str;
}
?>