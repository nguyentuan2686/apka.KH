function OnGoogleMapSettingsEdit(arParams)
{
	if (null != window.jsGoogleCEOpener)
	{
		try {window.jsGoogleCEOpener.Close();}catch (e) {}
		window.jsGoogleCEOpener = null;
	}

	window.jsGoogleCEOpener = new JCEditorOpener(arParams);
}

function JCEditorOpener(arParams)
{
	var _this = this;

	var jsOptions = arParams.data.split('||');

	var obButton = document.createElement('BUTTON');
	arParams.oCont.appendChild(obButton);
	
	obButton.innerHTML = jsOptions[1];
	
	obButton.onclick = function ()
	{
		_this.arElements = arParams.getElements();
		if (!_this.arElements)
			return false;

		if (null == window.jsPopup_google_map)
		{
			var strUrl = '/bitrix/components/bitrix/map.google.view/settings/settings.php?lang=' + jsOptions[0] + 
			'&bxpiheight=430' + 
			'&INIT_MAP_TYPE=' + BX.util.urlencode(_this.arElements.INIT_MAP_TYPE.value) + 
			'&MAP_DATA=' + BX.util.urlencode(arParams.oInput.value);

			window.jsPopup_google_map = new BX.CDialog({
				'content_url': strUrl,
				'width':800, 'height':550, 
				'resizable':false
			});
		}
		
		window.jsPopup_google_map.Show();
		window.jsPopup_google_map.PARAMS.content_url = '';
		return false;
	}
	
	this.saveData = function(strData, view)
	{
		arParams.oInput.value = strData;
		if (null != arParams.oInput.onchange)
			arParams.oInput.onchange();
		
		if (view)
		{
			_this.arElements.INIT_MAP_TYPE.value = view;
			if (null != _this.arElements.INIT_MAP_TYPE.onchange)
				_this.arElements.INIT_MAP_TYPE.onchange();
		}
		
		_this.Close(false);
	}
}

JCEditorOpener.prototype.Close = function(e)
{
	if (false !== e)
		BX.PreventDefault(e);

	if (null != window.jsPopup_google_map)
	{
		window.jsPopup_google_map.Close();
	}
}