
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Say-Hello {
    param (
        $Label
    )
    $Label.Text = "Greetings from PowerShell!"
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "PowerShell GUI"
$form.Size = New-Object System.Drawing.Size(300, 350)
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Fixed3D
$form.StartPosition = "CenterScreen"

$label1 = New-Object Windows.Forms.Label
$label1.Size = New-Object Drawing.Size(260, 50)
$label1.Location = New-Object Drawing.Point(10, 10)
$label1.BackColor = [System.Drawing.Color]::Black
$label1.ForeColor = [System.Drawing.Color]::White
$label1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$label1.Text = "Hello World!"
$form.Controls.Add($label1)

$button1 = New-Object Windows.Forms.Button
$button1.Size = New-Object Drawing.Size(216, 50)
$button1.Location = New-Object Drawing.Point(31, 75)
$button1.Text = "Say Hello!"
$button1.Add_Click({
        Write-Host "Hello World!"
        Say-Hello $label1
    })
$form.Controls.Add($button1)

$form.ShowDialog()