
function Get-DBFileName {
    "$PSScriptRoot/crappy_db.txt"
}

function Add-Data {

    # add some records
    $records = @(
        @('w0000001', 'john', 'smith'),
        @('w0000002', 'jane', 'doe'),
        @('w0000003', 'jack', 'sprat')
    )

    # insert each record into the crappy database
    Set-Content -Path (Get-DBFileName) -Value "" -NoNewline
    foreach ($r in $records) {
        # insert the record
        $data = "$($r[0]),$($r[1]),$($r[2])"
        Add-Content -Path (Get-DBFileName) -Value $data
    }
}
function Add-Data2 {

    # add some records
    $records = @(
        @('w0000001', 'john', 'smith'),
        @('w0000002', 'jane', 'doe'),
        @('w0000003', 'jack', 'sprat')
    )

    # insert each record into the crappy database
    $fs = [System.IO.StreamWriter]::new((Get-DBFileName))
    foreach ($r in $records) {
        # insert the record
        $data = "$($r[0]),$($r[1]),$($r[2])"
        $fs.WriteLine($data)
    }
    $fs.Close()
}

function Select-Data {
    $contents = Get-Content -Path (Get-DBFileName)

    foreach ($line in $contents) {
        $id, $firstName, $lastName = $line.Split(',')
        if ($lastName -eq "doe") {
            Write-Host $line
        }
    }
}

function Update-Data {

    $contents = Get-Content -Path (Get-DBFileName)

    Remove-Item -Path (Get-DBFileName)
    foreach ($line in $contents) {
        $id, $firstName, $lastName = $line.Split(',')
        if ($id -eq 'w0000002') {
            $id = 'W123456'
        }
        "$id,$firstName,$lastName" | Add-Content -Path (Get-DBFileName)
    }

}

function Remove-Data {
    $contents = Get-Content -Path (Get-DBFileName)

    Remove-Item -Path (Get-DBFileName)
    foreach ($line in $contents) {
        $id, $firstName, $lastName = $line.Split(',')
        if ($id -ne 'W123456') {
            "$id,$firstName,$lastName" | Add-Content -Path (Get-DBFileName)
        }
    }
}

function Write-Hello {

}

Export-ModuleMember -Function Add-Data, Add-Data2, Select-Data, Update-Data, Remove-Data