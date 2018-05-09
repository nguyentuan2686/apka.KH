<?
if(!defined("B_PROLOG_INCLUDED")||B_PROLOG_INCLUDED!==true)die();
if(!CModule::IncludeModule("fileman"))
	return ShowError(GetMessage("EC_FILEMAN_MODULE_NOT_INSTALLED"));

$toolbarConfig = array(
	'Bold', 'Italic', 'Underline', 'RemoveFormat',
	'CreateLink', 'DeleteLink', 'Image', 'Video',
	'BackColor', 'ForeColor',
	'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyFull',
	//'=|=',
	'InsertOrderedList', 'InsertUnorderedList', 'Outdent', 'Indent',
	'StyleList', 'HeaderList',
	'FontList', 'FontSizeList',
);

if ($arParams['VIDEO_ALLOW_VIDEO'] != 'N')
{
	$videoSettings = array(
		'maxWidth' => $arParams['VIDEO_MAX_WIDTH'],
		'maxHeight' => $arParams['VIDEO_MAX_HEIGHT'],
		'WMode' => $arParams['VIDEO_WMODE'],
		'windowless' => $arParams['VIDEO_WINDOWLESS'] != 'N',
		'bufferLength' => intVal($arParams['VIDEO_BUFFER']),
		'skin' => $arParams['VIDEO_SKIN'],
		'logo' => $arParams['VIDEO_LOGO']
	);
}
else
{
	$ind = array_search('Video', $toolbarConfig);
	if ($ind !== false)
	{
		unset($toolbarConfig[$ind]);
		$toolbarConfig = array_values($toolbarConfig);
	}
	$videoSettings = false;
}

$LHE = new CLightHTMLEditor;
$LHE->Show(array(
	'id' => $arParams['ID'],
	'content' => $arParams['~CONTENT'],
	'inputName' => $arParams['INPUT_NAME'],
	'inputId' => $arParams['INPUT_ID'],
	'width' => $arParams['WIDTH'],
	'height' => $arParams['HEIGHT'],
	'bUseFileDialogs' => $arParams['USE_FILE_DIALOGS'] == 'Y',
	'bFloatingToolbar' => $arParams['FLOATING_TOOLBAR'] == 'Y',
	'bArisingToolbar' => $arParams['ARISING_TOOLBAR'] == 'Y',
	'jsObjName' => $arParams['JS_OBJ_NAME'],
	'toolbarConfig' => $toolbarConfig,
	'videoSettings' => $videoSettings
	//'additionalJS'
	//'OnBeforeInit' =>
	
));
?>