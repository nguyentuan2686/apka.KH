<?
require_once($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/main/include/prolog_admin_before.php");
require_once($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/iblock/iblock.php");
require_once($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/iblock/prolog.php");
IncludeModuleLangFile(__FILE__);

if(!$USER->IsAdmin())
	$APPLICATION->AuthForm(GetMessage("ACCESS_DENIED"));

if($back_url=='')
	$back_url = '/webmin/admin/iblock_type_admin.php?lang='.$lang;

$arIBTLang = Array();
$l = CLanguage::GetList($lby="sort", $lorder="asc");
while($ar = $l->GetNext())
	$arIBTLang[]=$ar;

$strWarning = "";

$aTabs = array();
$aTabs[] = array(
	"DIV" => "edit1",
	"TAB" => GetMessage("IBTYPE_E_TAB1"),
	"ICON" => "iblock_type",
	"TITLE" => GetMessage("IBTYPE_E_TAB1_T"),
);
$aTabs[] = array(
	"DIV" => "edit2",
	"TAB" => GetMessage("IBTYPE_E_TAB2"),
	"ICON" => "iblock_type",
	"TITLE" => GetMessage("IBTYPE_E_TAB2_T"),
);
$tabControl = new CAdminTabControl("tabControl", $aTabs);

$bVarsFromForm = false;
if($REQUEST_METHOD=="POST" && strlen($Update)>0 && check_bitrix_sessid())
{
	$arFields = Array();
	if(strlen($ID)<=0)
		$arFields["ID"] = $NEW_ID;
	$arFields["EDIT_FILE_BEFORE"] = $EDIT_FILE_BEFORE;
	$arFields["EDIT_FILE_AFTER"] = $EDIT_FILE_AFTER;
	$arFields["IN_RSS"] = $IN_RSS;
	$arFields["SECTIONS"] = $SECTIONS;
	$arFields["SORT"] = $SORT;
	$arFields["LANG"] = Array();
	for($i=0; $i<count($arIBTLang); $i++)
		$arFields["LANG"][$arIBTLang[$i]["LID"]] = $LANG_FIELDS[$arIBTLang[$i]["LID"]];

	$obBlocktype = new CIBlockType;
	if(strlen($ID)>0)
		$res = $obBlocktype->Update($ID, $arFields);
	else
	{
		$ID = $obBlocktype->Add($arFields);
		$res = (strlen($ID)>0);
	}

	if(!$res)
	{
		$strWarning.= GetMessage("IBTYPE_E_SAVE_ERROR").": ".$obBlocktype->LAST_ERROR."";
		$DB->Rollback();
		$bVarsFromForm = true;
	}
	else
	{
		$DB->Commit();
		if(strlen($apply)<=0)
		{
			if(strlen($back_url)>0)
				LocalRedirect("/".ltrim($back_url, "/"));
		}
		else
			LocalRedirect($APPLICATION->GetCurPage()."?lang=".$lang."&ID=".UrlEncode($ID)."&".$tabControl->ActiveTabParam());
	}
}

if(strlen($ID)>0)
	$APPLICATION->SetTitle(GetMessage("IBTYPE_E_TITLE", array('#ITYPE#' => $ID)));
else
	$APPLICATION->SetTitle(GetMessage("IBTYPE_E_TITLE_2"));

require($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/main/include/prolog_admin_after.php");

ClearVars("str_");
$str_SECTIONS = "Y";
$str_SORT = "500";

$result = CIBlockType::GetByID($ID);
if(!$result->ExtractFields("str_"))
	$ID='';

if($bVarsFromForm)
{
	$DB->InitTableVarsForEdit("b_iblock_type", "", "str_");
	$str_SECTIONS = $SECTIONS;
}

$aMenu = array(
	array(
		"TEXT" => GetMessage("IBTYPE_E_LIST"),
		"TITLE" => GetMessage("IBTYPE_E_LIST_TITLE"),
		"LINK" => "iblock_type_admin.php?lang=".LANGUAGE_ID,
		"ICON" => "btn_list"
	)
);

if(strlen($ID)>0)
{
	$aMenu[] = array("SEPARATOR"=>"Y");
	$aMenu[] = array(
		"TEXT" => GetMessage("IBTYPE_E_CREATE"),
		"TITLE" => GetMessage("IBTYPE_E_CREATE_TITLE"),
		"LINK" => "iblock_type_edit.php?lang=".LANGUAGE_ID,
		"ICON" => "btn_new"
	);

	$aMenu[] = array(
		"TEXT" => GetMessage("IBTYPE_E_DEL"),
		"TITLE" => GetMessage("IBTYPE_E_DEL_TITLE"),
		"LINK" => "javascript:if(confirm('".GetMessage("IBTYPE_E_DEL_CONF")."')) window.location='/webmin/admin/iblock_type_admin.php?ID=".$ID."&action=delete&lang=".LANGUAGE_ID."&".bitrix_sessid_get()."';",
		"ICON" => "btn_delete"
		);
}

$context = new CAdminContextMenu($aMenu);
$context->Show();
?>
<?CAdminMessage::ShowOldStyleError($strWarning);?>
<form method="POST" id="form" name="form" action="iblock_type_edit.php?lang=<?echo LANG?>">
<?=bitrix_sessid_post()?>
<?echo GetFilterHiddens("find_");?>
<input type="hidden" name="Update" value="Y">
<input type="hidden" name="ID" value="<?echo $ID?>">
<?if(strlen($back_url)>0):?><input type="hidden" name="back_url" value="<?=htmlspecialchars($back_url)?>"><?endif?>
<?
	$tabControl->Begin();
	$tabControl->BeginNextTab();
?>
	<?if(strlen($ID)>0):?>
	<tr>
		<td><?echo GetMessage("IBTYPE_E_ID")?></td>
		<td><?=$str_ID?></td>
	</tr>
	<?else:?>
	<tr>
		<td><span class="required">*</span><?echo GetMessage("IBTYPE_E_ID")?></td>
		<td><input type="text" name="NEW_ID" size="50" maxlength="50" value="<?=htmlspecialchars($NEW_ID)?>"></td>
	</tr>
	<?endif;?>
	<script>
		function __Chk()
		{
			var c = document.getElementById("SECTIONS");
			var frm = document.getElementById("form");
			var inputs = frm.getElementsByTagName("INPUT");
			for(var i=0; i<inputs.length; i++)
				if(inputs[i].name && inputs[i].name.indexOf("[SECTION_NAME]")>0)
					inputs[i].disabled = !c.checked;

			document.getElementById("SECTION_NAME_TITLE").disabled = !c.checked;
		}
	</script>
	<tr>
		<td width="40%"><label for="SECTIONS"><?echo GetMessage("IBTYPE_E_SECTIONS")?></lablel></td>
		<td width="60%"><input type="checkbox" id="SECTIONS" name="SECTIONS" value="Y"<?if($str_SECTIONS=="Y")echo " checked"?> onclick="__Chk()"></td>
	</tr>
	<tr class="heading">
		<td colspan="2"><?echo GetMessage("IBTYPE_E_LANGS")?></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<table border="0" cellspacing="6">
				<tr>
					<td align="center"><?echo GetMessage("IBTYPE_E_LANG");?></td>
					<td align="center"><span class="required">*</span><?echo GetMessage("IBTYPE_E_NAME");?></td>
					<td align="center"><span id="SECTION_NAME_TITLE"><?echo GetMessage("IBTYPE_E_SECTIONS_LABEL");?></span></td>
					<td align="center"><?echo GetMessage("IBTYPE_E_ELEMENTS");?></td>
				</tr>
				<?
				for($i=0; $i<count($arIBTLang); $i++):
					if($bVarsFromForm)
						$ibtypelang = $LANG_FIELDS[$arIBTLang[$i]["LID"]];
					else
						$ibtypelang = CIBlockType::GetByIDLang($str_ID, $arIBTLang[$i]["LID"], false);
				?>
				<tr>
					<td><font class="tablefieldtext"><?echo $arIBTLang[$i]["NAME"]?>:</font></td>
					<td><input type="text" name="LANG_FIELDS[<?echo $arIBTLang[$i]["LID"]?>][NAME]" size="20" maxlength="255" value="<?echo htmlspecialchars($ibtypelang["NAME"])?>"></td>
					<td><input type="text" name="LANG_FIELDS[<?echo $arIBTLang[$i]["LID"]?>][SECTION_NAME]" size="20" maxlength="255" value="<?echo htmlspecialchars($ibtypelang["SECTION_NAME"])?>"></td>
					<td><input type="text" name="LANG_FIELDS[<?echo $arIBTLang[$i]["LID"]?>][ELEMENT_NAME]" size="20" maxlength="255" value="<?echo htmlspecialchars($ibtypelang["ELEMENT_NAME"])?>"></td>
				</tr>
				<?endfor?>
			</table>
		</td>
	</tr>

<?$tabControl->BeginNextTab();?>
	<tr>
		<td width="40%"><?echo GetMessage("IBTYPE_E_USE_RSS")?></td>
		<td width="60%"><input type="checkbox" name="IN_RSS" value="Y"<?if($str_IN_RSS=="Y")echo " checked"?>></td>
	</tr>
	<tr>
		<td><?echo GetMessage("IBTYPE_E_SORT")?>:</td>
		<td><input type="text" name="SORT" size="10"  maxlength="15" value="<?echo $str_SORT?>"></td>
	</tr>
	<tr>
		<td>
		<?
		CAdminFileDialog::ShowScript
		(
			Array(
				"event" => "BtnClick",
				"arResultDest" => array("FORM_NAME" => "form", "FORM_ELEMENT_NAME" => "EDIT_FILE_BEFORE"),
				"arPath" => array("SITE" => SITE_ID, "PATH" => GetDirPath($str_EDIT_FILE_BEFORE)),
				"select" => 'F',// F - file only, D - folder only
				"operation" => 'O',// O - open, S - save
				"showUploadTab" => true,
				"showAddToMenuTab" => false,
				"fileFilter" => 'php',
				"allowAllFiles" => true,
				"SaveConfig" => true,
			)
		);
		?>
		<?echo GetMessage("IBTYPE_E_FILE_BEFORE")?></td>
		<td><input type="text" name="EDIT_FILE_BEFORE" size="50"  maxlength="255" value="<?echo $str_EDIT_FILE_BEFORE?>">&nbsp;<input type="button" name="browse" value="..." onClick="BtnClick()"></td>
	</tr>
	<tr>
		<td>
		<?
		CAdminFileDialog::ShowScript
		(
			Array(
				"event" => "BtnClick2",
				"arResultDest" => array("FORM_NAME" => "form", "FORM_ELEMENT_NAME" => "EDIT_FILE_AFTER"),
				"arPath" => array("SITE" => SITE_ID, "PATH" => GetDirPath($str_EDIT_FILE_AFTER)),
				"select" => 'F',// F - file only, D - folder only
				"operation" => 'O',// O - open, S - save
				"showUploadTab" => true,
				"showAddToMenuTab" => false,
				"fileFilter" => 'php',
				"allowAllFiles" => true,
				"SaveConfig" => true,
			)
		);
		?>
		<?echo GetMessage("IBTYPE_E_FILE_AFTER")?></td>
		<td><input type="text" name="EDIT_FILE_AFTER" size="50"  maxlength="255" value="<?echo $str_EDIT_FILE_AFTER?>">&nbsp;<input type="button" name="browse" value="..." onClick="BtnClick2()"></td>
	</tr>


<?
	$tabControl->Buttons(array("disabled"=>false, "back_url"=>$back_url));
	$tabControl->End();
?>
</form>
<script>__Chk();</script>
<?
require($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/main/include/epilog_admin.php");
?>
