#
# 0. парсинг конфиг файла
#

function Get-Parameter($FindStr, $config){
	$result = $config | Select-String $FindStr

	$result = $result.ToString().Replace($FindStr, "")
	$result = $result.ToString().Replace("	", "")
	$result = $result.ToString().Replace(" ",  "")
	
	return $result
}



# считывание конфиг файл в строку
$ConfigFile = Get-Content .\config.ini -encoding utf8

# получение параметров из конфига
$MailModule = Get-Parameter "MailModule" $ConfigFile





# получение абсолютного пути файла программы
$location = Get-Location
$location = $location.ToString()


# создание лог файла
$LogFile = New-Item -Path ($location + "\log.txt") -Force -ItemType Fil


# вычисление времени следующего действия пользователя
$NextHop = Get-Date
$NextHop = $NextHop.AddMinutes(3)




# главный  цикл выполнения программы
while ($true)
{

	if ((Get-Date) -lt $NextHop)
	{
		# do nothing
		'do nothing'
	}
	else
	{
		'KEKW'
		
		# запускаем действие
		# логируем действие
		# переходим к следующей итерации цикла
	}
	
	sleep(3)
}


