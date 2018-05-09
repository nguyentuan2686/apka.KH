<?
$MESS ['SEF_MODE_TIP'] = "Checking this option enables the SEF mode and the corresponding fields.";
$MESS ['IBLOCK_TYPE_TIP'] = "Select one of the existing information block types in the list and click <b>OK</b>. This will load information blocks of the selected type.";
$MESS ['IBLOCK_ID_TIP'] = "Select an information block of the selected type. If you have chosen <i>other</i>, specify the information block ID in the next field.";
$MESS ['USE_FILTER_TIP'] = "Check this option to activate the filter on an information block sections page. If checked, the filter configuration fields are enabled.";
$MESS ['USE_REVIEW_TIP'] = "Displays a feedback form on a catalog item details page. Checking this option enables feedback configuration fields.";
$MESS ['USE_COMPARE_TIP'] = "Checking this option gives visitors an opportunity to compare catalog elements (by clicking <b>Compare</b>).";
$MESS ['SHOW_TOP_ELEMENTS_TIP'] = "If checked, the top-rated elements of an information block will be displayed.";
$MESS ['PAGE_ELEMENT_COUNT_TIP'] = "Defines the number of elements per page. Other elements will be available via the breadcrumb navigation.";
$MESS ['LINE_ELEMENT_COUNT_TIP'] = "Defines the number of elements per row when displaying elements of a section.";
$MESS ['ELEMENT_SORT_FIELD_TIP'] = "The fields by which items are to be sorted within a section.";
$MESS ['ELEMENT_SORT_ORDER_TIP'] = "Defines the sorting order.";
$MESS ['LIST_PROPERTY_CODE_TIP'] = "Select information block properties that you want to display in an element list. Selecting <i>none</i> and not specifying property codes below will cause properties to be not displayed.";
$MESS ['DETAIL_PROPERTY_CODE_TIP'] = "Select information block properties that you want to display in an element details view. Selecting <i>none</i> and not specifying property codes below will cause properties to be not displayed.";
$MESS ['BASKET_URL_TIP'] = "The path to a customer's shopping cart page. The default value is /personal/basket.php";
$MESS ['ACTION_VARIABLE_TIP'] = "The name of a variable to which actions (ADD_TO_COMPARE_LIST, ADD2BASKET etc.) will be passed. The default value is <i>action</i>.";
$MESS ['PRODUCT_ID_VARIABLE_TIP'] = "The name of a variable in which the product ID will be passed.";
$MESS ['SECTION_ID_VARIABLE_TIP'] = "The name of a variable in which the information block section ID will be passed.";
$MESS ['DISPLAY_PANEL_TIP'] = "If checked, the editor buttons will display in the Site Edit mode on the Control Panel toolbar, and in the component toolbox area.";
$MESS ['CACHE_TYPE_TIP'] = "<i>Auto</i>: the cache is valid during the time predefined in the cache settings;<br /><i>Cache</i>: always cache for the period specified in the next field;<br /><i>Do not cahce</i>: no caching is performed.";
$MESS ['CACHE_TIME_TIP'] = "Specify here the period of time during which the cache is valid.";
$MESS ['CACHE_FILTER_TIP'] = "Instructs to cache every result obtained from the filter.";
$MESS ['SET_TITLE_TIP'] = "Checking this option will set the title appropriately: to a section name when opening a section, or to an element name when opening the element details view.";
$MESS ['PRICE_CODE_TIP'] = "Specifies the price type to display in the catalog. If none of the types is chosen, the price and <b>Buy</b> and </b>Add to basket</b> buttons will not display.";
$MESS ['USE_PRICE_COUNT_TIP'] = "Displays prices of all price types.";
$MESS ['SHOW_PRICE_COUNT_TIP'] = "The amount of product items for which the price is specified (e.g. 1 or 10); depends on the product nature.";
$MESS ['LINK_IBLOCK_TYPE_TIP'] = "If elements of one of information blocks are bound to elements of a current information block, specify here the type of bound information block.";
$MESS ['LINK_IBLOCK_ID_TIP'] = "An information block whose elements are bound to the information block to be displayed.";
$MESS ['LINK_PROPERTY_SID_TIP'] = "Select here the element binding property, or specify it as a code in the next field.";
$MESS ['DISPLAY_TOP_PAGER_TIP'] = "If checked, the breadcrumb navigation links will be displayed at the page top.";
$MESS ['DISPLAY_BOTTOM_PAGER_TIP'] = "If checked, the breadcrumb navigation links will be displayed at the page bottom.";
$MESS ['PAGER_TITLE_TIP'] = "The name of an item unit for navigation. For example: products, items, books etc.";
$MESS ['PAGER_SHOW_ALWAYS_TIP'] = "If checked, the breadcrumb navigation controls will be shown even if all elements fit on a page.";
$MESS ['PAGER_TEMPLATE_TIP'] = "Name of a breadcrumb navigation template. If empty, the default template (<i>.default</i>) will be used. Alternatively, you can use the <i>orange</i> template.";
$MESS ['PAGER_DESC_NUMBERING_TIP'] = "Use this option if you want new elements to be placed on top. Thus, only the last page in the breadcrumb navigation structure is modified. All other pages can be cached for a considerably long time.";
$MESS ['PAGER_DESC_NUMBERING_CACHE_TIME_TIP'] = "Time to cache first pages, in seconds, for backward navigation.";
$MESS ['TOP_ELEMENT_COUNT_TIP'] = "Number of elements to be displayed at the top rated elements page.";
$MESS ['TOP_LINE_ELEMENT_COUNT_TIP'] = "Number of elements per row at the top rated elements page.";
$MESS ['TOP_ELEMENT_SORT_FIELD_TIP'] = "Field by which items will be sorted at the top rated elements page.";
$MESS ['TOP_ELEMENT_SORT_ORDER_TIP'] = "Item sorting order at the top rated elements page.";
$MESS ['TOP_PROPERTY_CODE_TIP'] = "Here you can choose information block properties to be displayed at the top rated elements page. If you select <b>none</b> and do not specify property ID's,  properties will not be displayed.";
$MESS ['VARIABLE_ALIASES_SECTION_ID_TIP'] = "The name of a variable in which the section ID will be passed, e.g. <b>SECTION_ID</b>.";
$MESS ['VARIABLE_ALIASES_ELEMENT_ID_TIP'] = "The name of a variable in which the element ID will be passed, e.g. <b>ELEMENT_ID</b>.";
$MESS ['SEF_FOLDER_TIP'] = "The path to a component working folder. This path may or may not be the same as the physical path.";
$MESS ['SEF_URL_TEMPLATES_sections_TIP'] = "The path to an initial page of the component - the section list page. If this page is an index page for a current section, leave this field empty.";
$MESS ['SEF_URL_TEMPLATES_section_TIP'] = "The path to a page containing the section elements. The path should contain the section ID; by default it is #SECTION_ID#/.";
$MESS ['SEF_URL_TEMPLATES_element_TIP'] = "The path to a page containing the element details. The path should contain the element ID; e.g. #SECTION_ID#/#ELEMENT_ID#/.";
$MESS ['SEF_URL_TEMPLATES_compare_TIP'] = "The path to an item compare page. The default value is <b>compare.php?action=#ACTION_CODE#</b>.";
$MESS ['FILTER_NAME_TIP'] = "The name of a variable in which the filter settings will be passed. You can leave the field empty to use the default name.";
$MESS ['FILTER_FIELD_CODE_TIP'] = "Here you can choose the fields of an information block element by which the filter can be applied. You can add custom fields as codes in the input fields below.";
$MESS ['FILTER_PROPERTY_CODE_TIP'] = "This field displays the information block element properties available to be used for filtering. You can add custom fields as a code in the input fields below.";
$MESS ['FILTER_PRICE_CODE_TIP'] = "Choose here price types by which the filter can be set.";
$MESS ['MESSAGES_PER_PAGE_TIP'] = "If any customer's feedback exist, this field defines the maximum number of messages per page.";
$MESS ['USE_CAPTCHA_TIP'] = "If checked, CAPTCHA fields will be shown in the feedback form in the public section.";
$MESS ['PATH_TO_SMILE_TIP'] = "The path to a folder with smileys.";
$MESS ['FORUM_ID_TIP'] = "Select here the forum in which visitors can leave their opinions.";
$MESS ['URL_TEMPLATES_READ_TIP'] = "The path to a forum thread page (e.g. <b>/communication/forum/index.php?PAGE_NAME=read&FID=#FORUM_ID#&TID=#TOPIC_ID#</b>). If empty, the path template will be taken from the forum settings.";
$MESS ['COMPARE_NAME_TIP'] = "The name of a variable to pass the list of elements to compare. The default value is <b>CATALOG_COMPARE_LIST</b>.";
$MESS ['COMPARE_FIELD_CODE_TIP'] = "Choose here the fields by which the items will be compared in the product comparison table.";
$MESS ['COMPARE_PROPERTY_CODE_TIP'] = "Choose here the properties by which the items will be compared in the product comparison table.";
$MESS ['DISPLAY_ELEMENT_SELECT_BOX_TIP'] = "If enabled, displays a drop-down list of information block elements on the product compare page. These elements can be added to the comparison table.";
$MESS ['ELEMENT_SORT_FIELD_BOX_TIP'] = "Choose fields by which the information block elements will be sorted in the drop-down list.";
$MESS ['ELEMENT_SORT_ORDER_BOX_TIP'] = "Sorting order in the drop-down list.";
$MESS ['COMPARE_ELEMENT_SORT_FIELD_TIP'] = "Field by which the selected items will be sorted in the comparison table.";
$MESS ['COMPARE_ELEMENT_SORT_ORDER_TIP'] = "The sorting order of items in the comparison table.";
$MESS ['LINK_ELEMENTS_URL_TIP'] = "URL of a page to display bound elements.";
$MESS ['INCLUDE_SUBSECTIONS_TIP'] = "If checked, elements of subsections of the section will be shown.";
$MESS ['AJAX_MODE_TIP'] = "Enables AJAX in the component.";
$MESS ['AJAX_OPTION_SHADOW_TIP'] = "Specifies to shade modifiable area on AJAX transition.";
$MESS ['AJAX_OPTION_JUMP_TIP'] = "Specifies to scroll to component when AJAX transition completes.";
$MESS ['AJAX_OPTION_STYLE_TIP'] = "Specifies to download and process CSS styles of component on AJAX transition.";
$MESS ['AJAX_OPTION_HISTORY_TIP'] = "Allows \"Back\" and \"Forward\" browser buttons for AJAX transitions.";
$MESS ['PRICE_VAT_INCLUDE_TIP'] = "Checking this option specifies to include tax in the display prices.";
$MESS ['PRICE_VAT_SHOW_VALUE_TIP'] = "Specifies to show the tax value.";
?>