<?require_once($_SERVER["DOCUMENT_ROOT"]."/webmin/modules/main/include/prolog_before.php");?>
<?
$rsResult = $_POST['GIA'];
$arr = array();
foreach ($rsResult as $key => $value)
{
    $gia = 150000;// co the cau hinh 
    $khoangcachmacdinh = 25; //co the cau hinh 
    $giodem = 22; //co the cau hinh 
    $phutdem = 30; //co the cau hinh 
    $giosang = 5; //co the cau hinh 
    $phutsang = 30; //co the cau hinh 

    $khoangcach = $_POST['Km'];

    if($khoangcach > $khoangcachmacdinh)
    {
        $gia = $gia + ($khoangcach - 25) * $value;
    }
    $searchTimeFormat = CIBlockFormatProperties::DateFormat("m/d/Y H:i", MakeTimeStamp($_POST["TIME"], CSite::GetDateFormat()));
    $date = new DateTime($searchTimeFormat);
    $hours = $date->format('H');
    $minutes = $date->format('i');

    if($hours > $giodem || $hours < $giosang )
    {
        $gia = $gia + 30000;
    }
    $arr[$key] = number_format($gia,3);
}

$json = json_encode($arr);
echo $json;
exit();
?>