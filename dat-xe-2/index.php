<?
require($_SERVER["DOCUMENT_ROOT"]."/webmin/header.php");
$APPLICATION->SetTitle("Furniture Company");
?>
<?
$APPLICATION->IncludeComponent("webcomp:static", "book.step", array(
    "STEP" => 1
),
    false
);
?>
<?
$APPLICATION->IncludeComponent("webcomp:booking.car.2", "step1", array(
    "STEP" => 1,
    "URL_STEP_1" => "/dat-xe-2/"
),
    false
);
?>
<?require($_SERVER["DOCUMENT_ROOT"]."/webmin/footer.php");?>