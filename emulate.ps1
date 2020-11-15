#
# 0. парсинг конфиг файл
#

function Get-Parameter($FindStr, $config){
	$result = $config | Select-String $FindStr

	$result = $result.ToString().Replace($FindStr, "")
	$result = $result.ToString().Replace("	", "")
	$result = $result.ToString().Replace(" ", "")
	
	return $result
}


$ConfigFile = Get-Content .\config.ini -encoding utf8



$MailModule = Get-Parameter "MailModule" $ConfigFile





# get script location
$loc =  Get-Location
$locstr = $loc.ToString()

$locstr