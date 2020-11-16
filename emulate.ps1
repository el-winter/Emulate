
#
# 1. GUI
#

# функция вызывается при нажатии кнопки Start
Workflow Start-Work
{
	# проверить в конфиге запущена ли работа
	# записываем в конфиг флаг начала работы
	# запускаем core.ps1
}

# функция вызывается при нажатии кнопки Stop
Workflow Stop-Work
{
	# записываем в конфиг флаг окончания работы
}


Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Emulate'
$form.Size = New-Object System.Drawing.Size(460,400)
$form.StartPosition = 'CenterScreen'

# TextBox
$logonBox = New-Object System.Windows.Forms.TextBox
$logonBox.Location = New-Object System.Drawing.Point(10,40)
$logonBox.Size = New-Object System.Drawing.Size(200,20)
$form.Controls.Add($logonBox)


# Start button
$StartButton = New-Object System.Windows.Forms.Button
$StartButton.Location = New-Object System.Drawing.Point(145,320)
$StartButton.Size = New-Object System.Drawing.Size(75,23)
$StartButton.Text = 'Start'
#$StartButton.DialogResult = [System.Windows.Forms.DialogResult]::Ok
#$form.CancelButton = $StartButton
$StartButton.add_click({ Start-Work	})
$form.Controls.Add($StartButton)


# Stop button
$StopButton = New-Object System.Windows.Forms.Button
$StopButton.Location = New-Object System.Drawing.Point(220,320)
$StopButton.Size = New-Object System.Drawing.Size(75,23)
$StopButton.Text = 'Stop'
#$StartButton.DialogResult = [System.Windows.Forms.DialogResult]::Ok
#$form.CancelButton = $StartButton
$StopButton.add_click({ Stop-Work })
$form.Controls.Add($StopButton)



# форма поверх всех окон
$form.Topmost = $true

#$form.Add_Shown({$logonBox.Select()})
$result = $form.ShowDialog()




# if cancel button - stop the program
#if ($result -eq [System.Windows.Forms.DialogResult]::Cancel){exit}




