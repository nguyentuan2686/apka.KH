<?require_once($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/main/include/prolog_before.php");?>

<?
session_start();

$rsResult = $_POST['PROPERTY'][$_POST['select']];

$gia = 150000;// co the cau hinh
$khoangcachmacdinh = 25; //co the cau hinh
$giodem = 22; //co the cau hinh
$phutdem = 30; //co the cau hinh
$giosang = 5; //co the cau hinh
$phutsang = 30; //co the cau hinh

$khoangcach = $_POST['Km'];

if($khoangcach > $khoangcachmacdinh)
{
    $gia = $gia + ($khoangcach - 25) * $rsResult['GIA'];
}
$searchTimeFormat = CIBlockFormatProperties::DateFormat("m/d/Y H:i", MakeTimeStamp($_POST["TIME"], CSite::GetDateFormat()));
$date = new DateTime($searchTimeFormat);
$hours = $date->format('H');
$minutes = $date->format('i');

if($hours > $giodem || $hours < $giosang )
{
    $gia = $gia + 30000;
}


$_SESSION["BOOKING"]['INFO']['DIA_DIEM_DON'] = $rsResult['DIEM_DI'];
$_SESSION["BOOKING"]['INFO']['DIA_DIEM_TRA'] = $rsResult['DIEM_DEN'];
$_SESSION["BOOKING"]['INFO']['THOI_GIAN'] = $_POST['TIME'];
$_SESSION["BOOKING"]['INFO']['SO_CHO_NGOI'] = $rsResult['SO_CHO'];
$_SESSION["BOOKING"]['INFO']['GIA_CHUAN'] = $gia;

$_SESSION["BOOKING"]['STEP'] =2;
$json = json_encode($rsResult);
echo $json;
exit();
?>