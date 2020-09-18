function New-Password{
    param(
        [int]$MinLowerChars = 5,
        [int]$MinUpperChars = 1,
        [int]$MinSpecialChars = 1,
        [int]$MinDigits = 1,
        [int]$PasswordLength = 8,
        [switch]$ReturnAsSecureString
    )

    <#
        .SYNOPSIS
        Generate pseudo-random password.

        .DESCRIPTION
        Generate pseudo-random password. Can return either string or secure string. 

        .PARAMETER MinLowerChars
        (Default = 5)Specify how many chars in lower case should be in the password.

        .PARAMETER MinUpperChars
        (Default = 1)Specify how many chars in upper case should be in the password.

        .PARAMETER MinSpecialChars
        (Default = 2)Specify how many integer and\or special chars should be in the password.

        .PARAMETER PasswordLength
        (Default = 8)Specify password length.

        .PARAMETER ReturnAsSecureString
        (Default = false)Return password as secure string. By default returns plain password.

        .EXAMPLE
        C:\PS> extension -name "File"
        File.txt

        .EXAMPLE
        C:\PS> New-Password
        zSex0=vp

        .EXAMPLE
        C:\PS> New-Password -PasswordLength 10
        z]O9wgtixv

        .EXAMPLE
        C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4
        {yp!@P4alz

        .EXAMPLE
        C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4 -ReturnAsSecureString
        System.Security.SecureString

    #>

    $lower = @("a","b","c","d","e","f","g","h","i","k","l","m","n","o","p","r","s","t","u","v","w","x","y","z")
    $upper = @("A","B","C","D","E","F","G","H","K","L","M","N","O","P","R","S","T","U","V","W","X","Y","Z")
    $specialChars = @("!",'"',"$","%","&","/","(",")","=","?","}","]","[","{","@","#","*","+")
    $ints = @("1","2","3","4","5","6","7","8","9","0")

    #Getting length for summ of all mimnimal chars
    $length = $MinLowerChars + $MinUpperChars + $MinSpecialChars + $MinDigits

    #If actual length less that requested then increase lowercase to match PasswordLength
    if($length -gt $PasswordLength){
        Write-Host -ForegroundColor Yellow "Current password length couldn't fit requested password." `
            "extending to include minimum:" `
            "`n'lower - $MinLowerChars'" `
            "`n'upper - $MinUpperChars'" `
            "`n'special chars - $MinSpecialChars'" `
            "`n'digits - $MinDigits'"`
            "`n'total length - $length'`n" -Separator ""
        $deltalength = $length - $PasswordLength
        $MinLowerChars += $deltalength
    }

    #Merging arrays
    $resultArray = ($lower | Get-Random -Count $MinLowerChars) + ($upper | Get-Random -Count $MinUpperChars) + `
        ($specialChars | Get-Random -Count $MinSpecialChars) + ($ints | Get-Random -Count $MinDigits)

    #Shuffling array
    $resultArray = $resultArray | Sort-Object {Get-Random}

    #Constructing string
    $resultStr = $resultArray -join ""

    if($ReturnAsSecureString){
        return ($resultStr | ConvertTo-SecureString -AsPlainText -Force)
    }else{
        return $resultStr
    }
}