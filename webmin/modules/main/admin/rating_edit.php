<?
##############################################
# Bitrix Site Manager                        #
# Copyright (c) 2002-2010 Bitrix             #
# http://www.bitrixsoft.com                  #
# mailto:admin@bitrixsoft.com                #
##############################################

require_once(dirname(__FILE__)."/../include/prolog_admin_before.php");

ClearVars();

if(!$USER->CanDoOperation('edit_other_settings') && !$USER->CanDoOperation('view_other_settings'))
	$APPLICATION->AuthForm(GetMessage("ACCESS_DENIED"));

IncludeModuleLangFile(__FILE__);

$ID = intval($ID);
$message = null;
$bVarsFromForm = false;

if($_SERVER['REQUEST_METHOD']=="POST" && ($_POST['save']<>"" || $_POST['apply']<>"") && check_bitrix_sessid())
{
	$arFields = array(
		"ACTIVE"				=> isset($_POST['ACTIVE'])? $_POST['ACTIVE'] : 'N',
		"NAME"					=> $_POST['NAME'],
		"ENTITY_ID"		 		=> $_POST['ENTITY_ID'],
		"CALCULATION_METHOD"	=> $_POST['CALCULATION_METHOD'],
		"CONFIGS"				=> $_POST['CONFIGS'],
		"NEW_CALC"				=> isset($_POST['NEW_CALC'])? 'Y' : 'N',
	);
	if($ID>0)
		$res = CRatings::Update($ID, $arFields);
	else
	{
		$ID = CRatings::Add($arFields);
		$res = ($ID>0);
	}

	if($res)
	{
		if($apply <> "")
		{
			$_SESSION["SESS_ADMIN"]["RATING_EDIT_MESSAGE"]=array("MESSAGE"=>GetMessage("RATING_EDIT_SUCCESS"), "TYPE"=>"OK");
			LocalRedirect("rating_edit.php?ID=".$ID."&lang=".LANG);
		}
		else
			LocalRedirect(($_REQUEST["addurl"]<>""? $_REQUEST["addurl"]:"rating_list.php?lang=".LANG));
	}
	else
	{
		if($e = $APPLICATION->GetException())
			$message = new CAdminMessage(GetMessage("RATING_EDIT_ERROR"), $e);
		$bVarsFromForm = true;
	}
}

$bTypeChange =  isset($_POST["action"]) && $_POST["action"] == 'type_changed' ? true : false;
$str_NAME = isset($_REQUEST["NAME"]) ? htmlspecialchars($_REQUEST["NAME"]) : GetMessage("RATING_DEF_NAME");
$str_ENTITY_ID = isset($_REQUEST["ENTITY_ID"]) ? htmlspecialchars($_REQUEST["ENTITY_ID"]) : 'USER';
$str_CALCULATION_METHOD = isset($_REQUEST["CALCULATION_METHOD"]) ? IntVal($_REQUEST["CALCULATION_METHOD"]) : '1';
$str_ACTIVE  = isset($_REQUEST["ACTIVE"]) && $_REQUEST["ACTIVE"] == 'Y' ? 'Y' : 'N';
$str_CONFIGS = null;

if ($ID <= 0 && !$bTypeChange)
	$str_ACTIVE = 'Y';
	
if($ID>0 && !$bTypeChange)
{
	$raging = CRatings::GetByID($ID);
	if(!($raging_arr = $raging->ExtractFields("str_")))
		$ID=0;
	$str_CONFIGS = unserialize(htmlspecialcharsback($str_CONFIGS));
}

if($bVarsFromForm)
	$DB->InitTableVarsForEdit("b_rating", "", "str_");

$sDocTitle = ($ID>0? GetMessage("MAIN_RATING_EDIT_RECORD", array("#ID#"=>$ID)) : GetMessage("MAIN_RATING_NEW_RECORD"));
$APPLICATION->SetTitle($sDocTitle);
$APPLICATION->SetAdditionalCSS("/webmin/themes/.default/ratings.css");

require($_SERVER["DOCUMENT_ROOT"].BX_ROOT."/modules/main/include/prolog_admin_after.php");

$aMenu = array(
	array(
		"TEXT"=>GetMessage("RATING_LIST"),
		"TITLE"=>GetMessage("RATING_LIST_TITLE"),
		"LINK"=>"rating_list.php?lang=".LANG,
		"ICON"=>"btn_list",
	)
);
if($ID>0)
{
	
	$aMenu[] = array("SEPARATOR"=>"Y");
	$aMenu[] = array(
		"TEXT"=>GetMessage("RATING_EDIT_ADD"),
		"TITLE"=>GetMessage("RATING_EDIT_ADD_TITLE"),
		"LINK"=>"rating_edit.php?lang=".LANG,
		"ICON"=>"btn_new",
	);
	$aMenu[] = array(
		"TEXT"=>GetMessage("RATING_EDIT_DEL"),
		"TITLE"=>GetMessage("RATING_EDIT_DEL_TITLE"),
		"LINK"=>"javascript:if(confirm('".GetMessage("RATING_EDIT_DEL_CONF")."')) window.location='rating_list.php?ID=".$ID."&action=delete&lang=".LANG."&".bitrix_sessid_get()."';",
		"ICON"=>"btn_delete",
	);
}
$context = new CAdminContextMenu($aMenu);
$context->Show();

if(is_array($_SESSION["SESS_ADMIN"]["RATING_EDIT_MESSAGE"]))
{
	CAdminMessage::ShowMessage($_SESSION["SESS_ADMIN"]["RATING_EDIT_MESSAGE"]);
	$_SESSION["SESS_ADMIN"]["RATING_EDIT_MESSAGE"]=false;
}

if($message)
	echo $message->Show();

$aTabs = array(
	array("DIV" => "edit1", "TAB" => GetMessage("RATING_EDIT_TAB_MAIN"), "TITLE"=>GetMessage("RATING_EDIT_TAB_MAIN_TITLE")),
	array("DIV" => "edit2", "TAB" => GetMessage("RATING_EDIT_TAB_CALC"), "TITLE"=>GetMessage("RATING_EDIT_TAB_CALC_TITLE")),
);

$tabControl = new CAdminForm("rating", $aTabs);
$tabControl->BeginEpilogContent();
?>
<?=bitrix_sessid_post()?>
	<input type="hidden" name="ID" value=<?=$ID?>>
	<input type="hidden" name="lang" value="<?=LANGUAGE_ID?>">
	<input type="hidden" name="action" value="" id="action">
<?if($_REQUEST["addurl"]<>""):?>
	<input type="hidden" name="addurl" value="<?echo htmlspecialchars($_REQUEST["addurl"])?>">
<?endif;?>
<?
$tabControl->EndEpilogContent();
$tabControl->Begin();

$tabControl->BeginNextFormTab();
$tabControl->BeginCustomField("ACTIVE", GetMessage('RATING_EDIT_FRM_ACTIVE'), false);
?>
	<tr>
		<td><?=GetMessage("RATING_EDIT_FRM_ACTIVE")?></td>
		<td><input type="checkbox" name="ACTIVE" value="Y"<?if($str_ACTIVE=="Y") echo " checked"?>></td>
	</tr>
<?
$tabControl->EndCustomField("ACTIVE");
$tabControl->AddEditField("NAME", GetMessage('RATING_EDIT_FRM_NAME'), true, array("size"=>54, "maxlength"=>255), $str_NAME);
$tabControl->BeginCustomField("ENTITY_ID", GetMessage('RATING_EDIT_FRM_TYPE_ID'), true);
$arObjects = CRatings::GetRatingObjects();
?>
	<tr>
		<td><span class="required">*</span><?=GetMessage("RATING_EDIT_FRM_TYPE_ID")?></td>
		<td><?=SelectBoxFromArray("ENTITY_ID", array('reference_id' => $arObjects, 'reference' => $arObjects), $str_ENTITY_ID, "", "onChange=\"jsTypeChanged('rating_form')\"");?></td>
	</tr>
<?
$tabControl->EndCustomField("ENTITY_ID");

$tabControl->BeginNextFormTab();
$tabControl->AddSection("CAT_HOW_CALC", GetMessage("RATING_EDIT_CAT_HOW_CALC"));
$tabControl->BeginCustomField("CALCULATION_METHOD", GetMessage('RATING_EDIT_FRM_CALC_METHOD'), true);
$arCalcMethod = array(
	"reference" => Array(GetMessage('RATING_EDIT_CALC_METHOD_SUM'), GetMessage('RATING_EDIT_CALC_METHOD_AVG')), 
	"reference_id" => Array("SUM", "AVG"), 
);
?>
	<tr>
		<td width="40%"><span class="required">*</span><?=GetMessage("RATING_EDIT_FRM_CALC_METHOD")?></td>
		<td width="60%"><?=SelectBoxFromArray("CALCULATION_METHOD", $arCalcMethod, $str_CALCULATION_METHOD);?></td>
	</tr>
<?
$tabControl->EndCustomField("CALCULATION_METHOD");
$tabControl->AddSection("CAT_WHAT_CNT", GetMessage("RATING_EDIT_CAT_WHAT_CNT"));
$arRatingConfigs = CRatings::GetRatingConfigs($str_ENTITY_ID);


$tabControl->BeginCustomField("CAT_WHAT_CNT_FORM", '', true);
?>
	<tr>
		<td width="100%" colspan="100%">
		
<?

$aTabs2 = Array();
foreach ($arRatingConfigs as $arConfigModule => $arConfigModuleValue)
{
	$aTabs2[] = Array("DIV"=>"panel_".$arConfigModule, "TAB" => $arConfigModuleValue['MODULE_NAME'], "TITLE" => $arConfigModuleValue['MODULE_NAME']);
}
$tabControl2 = new CAdminViewTabControl("tabControl2", $aTabs2);
$tabControl2->Begin();

foreach ($arRatingConfigs as $arConfigModule => $arConfigModuleValue)
{	
	$tabControl2->BeginNextTab();
	foreach ($arConfigModuleValue as $arConfigType => $arConfigTypeValue)
	{
		if (is_array($arConfigTypeValue)) 
		{
			foreach ($arConfigTypeValue as $configId => $arConfig)
			{
				$bBlockException = false;
				if (isset($arConfig['EXCEPTION_METHOD']))
				{
					$exceptionText = call_user_func(array($arConfig['CLASS'], $arConfig['EXCEPTION_METHOD']));
					if (!($exceptionText == null || $exceptionText === false)) 
					{
						$bBlockException = true;
						?>
						<div class="rating-component-exception"><?=$exceptionText?></div><br>
						<?
					}
				}
				
				$FIELD_COUNT = count($arConfig['FIELDS']);
				// define a default value
				$bGroupFieldStatus = isset($_POST['CONFIGS'][$arConfigModule][$arConfigType][$arConfig['ID']]['ACTIVE']) ? 
									 ($_POST['CONFIGS'][$arConfigModule][$arConfigType][$arConfig['ID']]['ACTIVE']) : ($ID>0 ? false : true);
				
				// if exist editing data and block configuration is active
				if (isset($str_CONFIGS[$arConfigModule][$arConfigType][$arConfig['ID']]['ACTIVE']) &&
					$str_CONFIGS[$arConfigModule][$arConfigType][$arConfig['ID']]['ACTIVE'] == 'Y')
					$bGroupFieldStatus = true;
					
				
				?>
				<table cellpadding="0" cellspacing="0" width="100%">
				<tr><td colspan="2" class="rating-component-gap"></td></tr>
				<tr class="heading-left">
					<td colspan="2">
						<input type="checkbox" name="CONFIGS[<?=$arConfigModule?>][<?=$arConfigType?>][<?=$arConfig['ID']?>][ACTIVE]" value="Y" <?=($bGroupFieldStatus && !$bBlockException ? "checked" : "")?> <?=($bBlockException ? "disabled" : "")?> id="<?=$configId?>_block" onclick="jsChangeDisplayRatingBlock('<?=$configId?>')">
						<label for="<?=$configId?>_block" onclick="jsChangeDisplayRatingBlock('<?=$configId?>')"><?=$arConfig['NAME']?></label>
					</td>
				</tr>
				<tr valign="top" style="">
					<td colspan="2" class="rating-component-td">
						<div id="<?=$configId?>_div" style="display:<?=($bGroupFieldStatus && !$bBlockException ? "block" : "none")?>; padding: 4px">
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="edit-table">
							<tr valign="top" style="">
								<td class="field-name">
								<? if(isset($arConfig['FIELDS'][0]['NAME'])): ?>
									<label><?=$arConfig['FIELDS'][0]['NAME']?></label>
								<? else: ?>
									<label><?=GetMessage('RATING_FIELDS_DEF_NAME')?></label>
								<? endif; ?>
								</td>
									<?
									// define a default value
									$strFieldValue = isset($_POST['CONFIGS'][$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][0]['ID']]) ? 
													($_POST['CONFIGS'][$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][0]['ID']]) : $arConfig['FIELDS'][0]['DEFAULT'];
									// if exist editing data and block configuration is active
									if (isset($str_CONFIGS[$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][0]['ID']]))
										$strFieldValue = $str_CONFIGS[$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][0]['ID']];
									?>
							    <td width="20%"><input type="text" name="CONFIGS[<?=$arConfigModule?>][<?=$arConfigType?>][<?=$arConfig['ID']?>][<?=$arConfig['FIELDS'][0]['ID']?>]" value="<?=$strFieldValue?>"></td>
							    <td width="50%" class="rating-component-descr" rowspan="<?=$FIELD_COUNT?>">
							    <? if(isset($arConfig['DESC'])): ?>
					    			<p><?=$arConfig['DESC']?></p>
					    		<? else: ?>
									<p><?=GetMessage('RATING_FIELDS_DEF_DESC')?></p>
								<? endif; ?>	
					    		<? if(isset($arConfig['FORMULA'])): ?>
					  				<p class="formula"><?=$arConfig['FORMULA']?></p>
					  			<? else: ?>
									<p class="formula"><?=GetMessage('RATING_FIELDS_DEF_FORMULA')?></p>
								<? endif; ?>
					  			<? if(isset($arConfig['FORMULA_DESC'])): ?>
					  				<p><?=$arConfig['FORMULA_DESC']?></p>
					  			<? else: ?>
									<p><?=GetMessage('RATING_FIELDS_DEF_FORMULA_DESC')?></p>
								<? endif; ?>
					  			</td>
					  		</tr>
					  		<?
					  		for ($i=1; $i<$FIELD_COUNT; $i++)
					  		{
					  			// define a default value
								$strFieldValue = isset($_POST['CONFIGS'][$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][$i]['ID']]) ? 
												($_POST['CONFIGS'][$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][$i]['ID']]) : $arConfig['FIELDS'][$i]['DEFAULT'];
								// if exist editing data and block configuration is active
								if (isset($str_CONFIGS[$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][$i]['ID']]))
									$strFieldValue = $str_CONFIGS[$arConfigModule][$arConfigType][$arConfig['ID']][$arConfig['FIELDS'][$i]['ID']];
								
					  			?>
					  			<tr valign="top" style="">
					  				<td class="field-name"><label><?=$arConfig['FIELDS'][$i]['NAME']?></label></td>
					  				<td width="20%"><input type="text" name="CONFIGS[<?=$arConfigModule?>][<?=$arConfigType?>][<?=$arConfig['ID']?>][<?=$arConfig['FIELDS'][$i]['ID']?>]" value="<?=$strFieldValue?>"></td>
					  			</tr>
					  			<?
					  		}
				    	   ?>
					       </table>
				       </div>
		       		</td>
		        </tr>
		        <tr><td colspan="2" class="rating-component-gap"></td></tr>
		        </table>
			    <?	
				
			}
		}
	}
	
}
$tabControl2->End();

?>
		</td>
	</tr>
<?
$tabControl->EndCustomField("CAT_WHAT_CNT_FORM");


if($ID>0) 
{
	$tabControl->AddSection("CAT_WHAT_NEW_CALC", GetMessage("RATING_EDIT_CAT_WHAT_NEW_CALC"));
	$tabControl->AddCheckBoxField("NEW_CALC", GetMessage('RATING_EDIT_FRM_NEW_CALC'), false, "Y", false, array());
}
$tabControl->Buttons(array(
	"disabled"=>false,
	"back_url"=>($_REQUEST["addurl"]<>""? $_REQUEST["addurl"]:"rating_list.php?lang=".LANG),
));
$tabControl->Show();
$tabControl->ShowWarnings($tabControl->GetName(), $message);

if($ID>0)
{
?>
<script language="javascript">
rating.SelectTab('edit2');
</script>
<?
}

?>
<script language="javascript">
function jsTypeChanged(form_id)
{
	var _form = document.forms[form_id];
	var _flag = document.getElementById('action');
	if(_form)
	{
		_flag.value = 'type_changed';
		_form.submit();
	}
} 
function jsChangeDisplayRatingBlock(block_id)
{
	var _div = document.getElementById(block_id+'_div');
	var _input = document.getElementById(block_id+'_block');
	
	_div.style.display = (_input.checked  ? "block" : "none");
}
</script>
<?echo BeginNote();?>
<span class="required">*</span> <?echo GetMessage("REQUIRED_FIELDS")?><br>
<?echo EndNote();?>
<?
require_once($_SERVER["DOCUMENT_ROOT"].BX_ROOT."/modules/main/include/epilog_admin.php"); 
?>
