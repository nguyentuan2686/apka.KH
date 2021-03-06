<?
IncludeModuleLangFile(__FILE__);

Class search extends CModule
{
	var $MODULE_ID = "search";
	var $MODULE_VERSION;
	var $MODULE_VERSION_DATE;
	var $MODULE_NAME;
	var $MODULE_DESCRIPTION;
	var $MODULE_CSS;

	var $errors;

	function search()
	{
		$arModuleVersion = array();

		$path = str_replace("\\", "/", __FILE__);
		$path = substr($path, 0, strlen($path) - strlen("/index.php"));
		include($path."/version.php");

		if (is_array($arModuleVersion) && array_key_exists("VERSION", $arModuleVersion))
		{
			$this->MODULE_VERSION = $arModuleVersion["VERSION"];
			$this->MODULE_VERSION_DATE = $arModuleVersion["VERSION_DATE"];
		}
		else
		{
			$this->MODULE_VERSION = SEARCH_VERSION;
			$this->MODULE_VERSION_DATE = SEARCH_VERSION_DATE;
		}

		$this->MODULE_NAME = GetMessage("SEARCH_MODULE_NAME");
		$this->MODULE_DESCRIPTION = GetMessage("SEARCH_MODULE_DESC");
	}

	function InstallDB()
	{
		global $DB, $DBType, $APPLICATION;
		$this->errors = false;

		// Database tables creation
		if(!$DB->Query("SELECT 'x' FROM b_search_content WHERE 1=0", true))
		{
			$this->errors = $DB->RunSQLBatch($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/db/".strtolower($DB->type)."/install.sql");
			if($this->errors === false && strtolower($DB->type) == "mssql")
			{
				$rs = $DB->Query("
					select c.*
					from sys.tables t
					inner join sys.columns c on t.object_id = c.object_id
					where t.name='b_search_tags'
					and c.name='NAME'
				");
				if($ar = $rs->Fetch())
				{
					if(strpos($ar["collation_name"], "_CI_")!==false)
					{
						$new_collation = str_replace("_CI_", "_CS_", $ar["collation_name"]);
						$rs = $DB->Query("DROP TABLE b_search_tags");
						if($rs)
						{
							$rs = $DB->Query("
								CREATE TABLE b_search_tags
								(
									SEARCH_CONTENT_ID INT NOT NULL,
									SITE_ID CHAR(2) NOT NULL,
									NAME VARCHAR(255) COLLATE ".$new_collation." NOT NULL,
									CONSTRAINT PK_B_SEARCH_TAGS PRIMARY KEY (SEARCH_CONTENT_ID, SITE_ID, NAME)
								)
							");
						}
						if(!$rs)
							$ths->errors = array($DB->db_Error);
					}
				}
			}
		}

		if($this->errors === false && !$DB->Query("SELECT 'x' FROM b_search_phrase WHERE 1=0", true))
		{
			$this->errors = $DB->RunSQLBatch($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/db/".strtolower($DB->type)."/stat_install.sql");
		}

		if($this->errors !== false)
		{
			$APPLICATION->ThrowException(implode("<br>", $this->errors));
			return false;
		}
		else
		{
			RegisterModule("search");

			CModule::IncludeModule("search");

			RegisterModuleDependences("main", "OnChangePermissions", "search", "CSearch", "OnChangeFilePermissions");
			RegisterModuleDependences("main", "OnChangeFile", "search", "CSearch", "OnChangeFile");
			RegisterModuleDependences("main", "OnGroupDelete", "search", "CSearch", "OnGroupDelete");
			RegisterModuleDependences("main", "OnLangDelete", "search", "CSearch", "OnLangDelete");

			CAgent::AddAgent("CSearchSuggest::CleanUpAgent();","search", "N", 86400, "", "Y", "", 10);
			CAgent::AddAgent("CSearchStatistic::CleanUpAgent();","search", "N", 86400, "", "Y", "", 10);

			CSearchStatistic::SetActive(COption::GetOptionString("search", "stat_phrase")=="Y");

			return true;
		}
	}

	function UnInstallDB($arParams = array())
	{
		global $DB, $DBType, $APPLICATION;
		$this->errors = false;

		UnRegisterModuleDependences("main", "OnEpilog", "search", "CSearchStatistic", "OnEpilog");
		UnRegisterModuleDependences("main", "OnChangePermissions", "search", "CSearch", "OnChangeFilePermissions");
		UnRegisterModuleDependences("main", "OnChangeFile", "search", "CSearch", "OnChangeFile");
		UnRegisterModuleDependences("main", "OnGroupDelete", "search", "CSearch", "OnGroupDelete");
		UnRegisterModuleDependences("main", "OnLangDelete", "search", "CSearch", "OnLangDelete");

		if(!array_key_exists("savedata", $arParams) || ($arParams["savedata"] != "Y"))
		{
			$this->errors = $DB->RunSQLBatch($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/db/".strtolower($DB->type)."/uninstall.sql");
		}

		if(!array_key_exists("savestat", $arParams) || ($arParams["savestat"] != "Y"))
		{
			$this->errors = $DB->RunSQLBatch($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/db/".strtolower($DB->type)."/stat_uninstall.sql");
		}

		UnRegisterModule("search");

		if($this->errors !== false)
		{
			$APPLICATION->ThrowException(implode("<br>", $this->errors));
			return false;
		}

		return true;
	}

	function InstallEvents()
	{
		return true;
	}

	function UnInstallEvents()
	{
		return true;
	}

	function InstallFiles($arParams = array())
	{
		if($_ENV["COMPUTERNAME"]!='BX')
		{
			CopyDirFiles($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/admin/", $_SERVER["DOCUMENT_ROOT"]."/bitrix/admin");
			CopyDirFiles($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/js", $_SERVER["DOCUMENT_ROOT"]."/bitrix/js/search/", true, true);
			CopyDirFiles($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/images/", $_SERVER["DOCUMENT_ROOT"]."/bitrix/images/search", true, true);
			//Theme
			CopyDirFiles($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/themes/", $_SERVER["DOCUMENT_ROOT"]."/bitrix/themes/", true, true);
			CopyDirFiles($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/components", $_SERVER["DOCUMENT_ROOT"]."/bitrix/components", True, True);
		}

		$bReWriteAdditionalFiles = ($arParams["public_rewrite"] == "Y");

		if(array_key_exists("public_dir", $arParams) && strlen($arParams["public_dir"]))
		{
			$rsSite = CSite::GetList(($by="sort"),($order="asc"));
			while ($site = $rsSite->Fetch())
			{
				$source = $_SERVER['DOCUMENT_ROOT']."/bitrix/modules/search/install/public/";
				$target = $site['ABS_DOC_ROOT'].$site["DIR"].$arParams["public_dir"]."/";
				if(file_exists($source))
				{
					CheckDirPath($target);
					$dh = opendir($source);
					while($file = readdir($dh))
					{
						if($file == "." || $file == "..")
							continue;
						if($bReWriteAdditionalFiles || !file_exists($target.$file))
						{
							$fh = fopen($source.$file, "rb");
							$php_source = fread($fh, filesize($source.$file));
							fclose($fh);
							if(preg_match_all('/GetMessage\("(.*?)"\)/', $php_source, $matches))
							{
								IncludeModuleLangFile($source.$file, $site["LANGUAGE_ID"]);
								foreach($matches[0] as $i => $text)
								{
									$php_source = str_replace(
										$text,
										'"'.GetMessage($matches[1][$i]).'"',
										$php_source
									);
								}
							}
							$fh = fopen($target.$file, "wb");
							fwrite($fh, $php_source);
							fclose($fh);
						}
					}
				}
			}
		}

		return true;
	}

	function UnInstallFiles()
	{
		if($_ENV["COMPUTERNAME"]!='BX')
		{
			DeleteDirFiles($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/admin/", $_SERVER["DOCUMENT_ROOT"]."/bitrix/admin");
			DeleteDirFiles($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/themes/.default/", $_SERVER["DOCUMENT_ROOT"]."/bitrix/themes/.default");//css
			DeleteDirFilesEx("/bitrix/themes/.default/icons/search/");//icons
			DeleteDirFilesEx("/bitrix/images/search/");//images
			DeleteDirFilesEx("/bitrix/js/search/");//javascript
		}
		return true;
	}

	function DoInstall()
	{
		global $DB, $DOCUMENT_ROOT, $APPLICATION, $step;
		$step = IntVal($step);
		if($step < 2)
		{
			$APPLICATION->IncludeAdminFile(GetMessage("SEARCH_INSTALL_TITLE"), $_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/step1.php");
		}
		elseif($step == 2)
		{
			if($this->InstallDB())
			{
				$this->InstallEvents();
				$this->InstallFiles(array(
					"public_dir" => $_REQUEST["public_dir"],
					"public_rewrite" => $_REQUEST["public_rewrite"],
				));
			}
			$GLOBALS["errors"] = $this->errors;
			$APPLICATION->IncludeAdminFile(GetMessage("SEARCH_INSTALL_TITLE"), $_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/step2.php");
		}
	}

	function DoUninstall()
	{
		global $DB, $DOCUMENT_ROOT, $APPLICATION, $step;
		$step = IntVal($step);
		if($step < 2)
		{
			$APPLICATION->IncludeAdminFile(GetMessage("SEARCH_UNINSTALL_TITLE"), $_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/unstep1.php");
		}
		elseif($step == 2)
		{
			$this->UnInstallDB(array(
				"savedata" => $_REQUEST["savedata"],
				"savestat" => $_REQUEST["savestat"],
			));
			$this->UnInstallFiles();
			$GLOBALS["errors"] = $this->errors;
			$APPLICATION->IncludeAdminFile(GetMessage("SEARCH_UNINSTALL_TITLE"), $_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/search/install/unstep2.php");
		}
	}
}
?>