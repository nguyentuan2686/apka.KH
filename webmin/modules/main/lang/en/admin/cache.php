<?
$MESS["MCACHE_TITLE"] = "Cache Settings";
$MESS["MAIN_OPTION_HTML_CACHE"] = "HTML page generation";
$MESS["MAIN_TAB_3"] = "Cleaning Cache Files";
$MESS["MAIN_TAB_2"] = "HTML cache";
$MESS["MAIN_TAB_4"] = "Component caching";
$MESS["MAIN_OPTION_CLEAR_CACHE"] = "Cleaning Cache Files";
$MESS["MAIN_OPTION_PUBL"] = "Components Cache settings";
$MESS["MAIN_OPTION_CLEAR_CACHE_OLD"] = "Only outdated";
$MESS["MAIN_OPTION_CLEAR_CACHE_ALL"] = "All";
$MESS["MAIN_OPTION_CLEAR_CACHE_MENU"] = "Menu";
$MESS["MAIN_OPTION_CLEAR_CACHE_MANAGED"] = "All managed cache";
$MESS["MAIN_OPTION_CLEAR_CACHE_STATIC"] = "All pages in HTML cache";
$MESS["MAIN_OPTION_CLEAR_CACHE_CLEAR"] = "Clear";
$MESS["MAIN_OPTION_CACHE_ON"] = "Components Cache is enabled by default";
$MESS["MAIN_OPTION_CACHE_OFF"] = "Components Cache is disabled by default";
$MESS["MAIN_OPTION_CACHE_BUTTON_OFF"] = "Disable Caching";
$MESS["MAIN_OPTION_CACHE_BUTTON_ON"] = "Enable Caching";
$MESS["MAIN_OPTION_HTML_CACHE_WARNING"] = "Attention! The Statistics and/or Advertising modules detected. The data in the HTML cache will be tracked incorrectly.";
$MESS["MAIN_OPTION_HTML_CACHE_WARNING_TRANSID"] = "Attention! session.use_trans_sid parameter is enabled. HTML caching will not work.";
$MESS["MAIN_OPTION_HTML_CACHE_ON"] = "HTML cache is on";
$MESS["MAIN_OPTION_HTML_CACHE_OFF"] = "HTML cache is off";
$MESS["MAIN_OPTION_HTML_CACHE_BUTTON_OFF"] = "Disable HTML cache";
$MESS["MAIN_OPTION_HTML_CACHE_BUTTON_ON"] = "Enable HTML cache";
$MESS["MAIN_OPTION_HTML_CACHE_OPT"] = "HTML cache settings";
$MESS["MAIN_OPTION_HTML_CACHE_INC_MASK"] = "Inclusion mask";
$MESS["MAIN_OPTION_HTML_CACHE_EXC_MASK"] = "Exclusion mask";
$MESS["MAIN_OPTION_HTML_CACHE_QUOTA"] = "Disk quote (MB)";
$MESS["MAIN_OPTION_HTML_CACHE_SUCCESS"] = "The HTML cache mode has been changed successfully.";
$MESS["MAIN_OPTION_HTML_CACHE_STAT"] = "Statistics";
$MESS["MAIN_OPTION_HTML_CACHE_STAT_HITS"] = "Cache hits";
$MESS["MAIN_OPTION_HTML_CACHE_STAT_MISSES"] = "Cache misses";
$MESS["MAIN_OPTION_HTML_CACHE_STAT_QUOTA"] = "Cache cleanups caused by the lack of disk space";
$MESS["MAIN_OPTION_HTML_CACHE_STAT_POSTS"] = "Cache cleanups caused by data modification";
$MESS["MAIN_OPTION_HTML_CACHE_SAVE"] = "Save HTML cache settings";
$MESS["MAIN_OPTION_HTML_CACHE_RESET"] = "Apply default settings";
$MESS["cache_admin_note4"] = "<p>HTML caching is recommended for site section that change rarely and are mostly visited by anonymous users. The following processes take place when the HTML cache is enabled: </p>
<ul style=\"font-size:100%\">
<li>HTML cache processes only pages listed in the inclusion mask and not listed in exclusion mask;</li>
<li>For non-authorized visitors, the system check for the page copy is stored in the HTML cache. If the page is found in the cache, it is displayed with no system modules included. Statistics will not track visitors. Advertising, Kernel and other modules will not be included as well;</li>
<li>Pages will be sent compressed if the Compression module is installed at the time of cache generation;</li>
<li>If there is no cache found for the page, it is processed in the usual way. After finishing the page load, a copy of the page will be saved in HTML cache;</li>
</ul>
<p>Cache cleanup:</p>
<ul style=\"font-size:100%\">
<li>If saving data causes exceeding of the disk quota, the cache is completely dumped;</li>
<li>Complete cache dumping is also performed if any data is changed through the Control Panel;</li>
<li>If data is posted from the public pages of the site (e.g. adding  comments or votes), then only related parts of cache are dumped;</li>
</ul>
<p>Please note that when non-authorized users visit non-cached site pages, a session will be started and HTML-cache will no longer be active.</p>
<p>Important notes:</p>
<ul style=\"font-size:100%\">
<li>Statistics are not tracked;</li>
<li>The Advertising module will work only at the moment of creating the HTML cache. Note that it does not affect external Ad modules (Google Ad Sense etc);</li>
<li>The results of comparing items won't be saved for non-authorized users (a session should be started);</li>
<li>The disk quota should be specified to avoid DOS-attacks on disk space;</li>
<li>All the site section functionality should be checked after enabling HTML cache (e.g. blog comments will not work with old blog templates etc);</li>
</ul>";
$MESS["MAIN_OPTION_CACHE_OK"] = "Cache Files cleaned";
$MESS["MAIN_OPTION_CACHE_SUCCESS"] = "Type of components caching successfully switched";
$MESS["MAIN_OPTION_CACHE_ERROR"] = "Type of components caching is already set to this value";
$MESS["cache_admin_note1"] = "<table width=\"100%\" border=\"0\" cellpadding=\"5\" cellspacing=\"0\">
		<tr>
				<td valign=\"top\">Using Autocache mode speeds up your site amazingly!</td>
		</tr>
		<tr>
				<td valign=\"top\"><br />
				In Autocache mode, information rendered by components is refreshed according to the settings of those components.</td>
		</tr>
		<tr>
				<td valign=\"top\"><br />
				To refresh the cached objects on the page, you can:</td>
		</tr>
</table>
<table width=\"100%\" border=\"0\" cellpadding=\"5\" cellspacing=\"0\">
		<tr>
				<td align=\"center\" valign=\"top\">&nbsp;</td>
		</tr>
		<tr>
				<td valign=\"top\">1. Open the required page and refresh its objects by clicking a special update data button on the administrative toolbar.<br />
				<img src=\"/webmin/images/main/page_cache_en.png\" width=\"210\" height=\"152\" vspace=\"5\" /></td>
		</tr>
		<tr>
				<td align=\"center\" valign=\"top\">&nbsp;</td>
		</tr>
		<tr>
				<td valign=\"top\">2. When in Site Edit mode, you can click the clear cache button of a given component. <br />
				<img src=\"/webmin/images/main/comp_cache_en.png\" width=\"243\" height=\"133\" vspace=\"5\" /></td>
		</tr>
		<tr>
				<td valign=\"top\">&nbsp;</td>
		</tr>
		<tr>

				<td valign=\"top\">3. Go to the component settings and switch the required components to uncached mode.<br>
				<img src=\"/webmin/images/main/spisok_en.gif\" width=\"139\" height=\"71\" vspace=\"5\" /></td>
				</tr>
</table>
<br />
<p>After enabling the caching mode, by default all the components with the Auto cache setting <i>\"Auto\"</i> will be switched to work with cache.<br><br>
		Components with the cache setting <i>\"Cache\"</i> and with cache time greater than 0 (zero), always work in caching mode.<br><br>
		Components with the cache setting <i>\"Do not cache\"</i> or with cache time equal to 0 (zero), always work without caching.</p>";
$MESS["cache_admin_note2"] = "After cleaning cache files all displayed content will be updated according to new data.
		New cache files will be created gradually on requesting pages with cached areas.";
$MESS["main_cache_managed_saved"] = "The managed cache settings has been saved.";
$MESS["main_cache_managed"] = "Managed Cache";
$MESS["main_cache_managed_sett"] = "Managed Cache Parameters";
$MESS["main_cache_managed_on"] = "The managed cache is enabled.";
$MESS["main_cache_managed_off"] = "The managed cache is disabled (not recommended).";
$MESS["main_cache_managed_turn_off"] = "Disable managed cache (not recommended)";
$MESS["main_cache_managed_const"] = "The BX_COMP_MANAGED_CACHE constant is defined. The managed cache is always enabled.";
$MESS["main_cache_managed_turn_on"] = "Enable managed cache";
$MESS["main_cache_managed_note"] = "The <b>Cache Dependencies</b> technology updates the cache every time data change occurs. If this feature is on, you will not have to update the cache manually when updating news or products: the site visitors will always see up-to-date information.

<br><br>Get more information about the Cache Dependencies technology at the Bitrix website.
<br><br><span style=\"color:grey\">Note: not all components can support this feature.</span>";
?>