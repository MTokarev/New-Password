function New-Password{

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
        (Default = 1)Specify how many special chars should be in the password.

        .PARAMETER MinDigits
        (Default = 1)Specify how many integer and\or special chars should be in the password.

        .PARAMETER ReturnAsSecureString
        (Default = false)Return password as secure string. By default returns plain password.

        .EXAMPLE
        C:\PS> extension -name "File"
        File.txt

        .EXAMPLE
        C:\PS> New-Password
        zSex0=vp

        .EXAMPLE
        C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4
        {yp!@P4alz

        .EXAMPLE
        C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4 -ReturnAsSecureString
        System.Security.SecureString

    #>

    param(
        [int]$MinLowerChars = 5,
        [int]$MinUpperChars = 1,
        [int]$MinSpecialChars = 1,
        [int]$MinDigits = 1,
        [switch]$ReturnAsSecureString
    )

    #This array will have all types that were requested by script params
    $resultArray = @()

    #Initialize array
    $db = @(
        @("a","b","c","d","e","f","g","h","i","k","l","m","n","o","p","r","s","t","u","v","w","x","y","z"),
        @("A","B","C","D","E","F","G","H","I","K","L","M","N","O","P","R","S","T","U","V","W","X","Y","Z"),
        @("!",'"',"$","%","&","/","(",")","=","?","}","]","[","{","@","#","*","+"),
        @("1","2","3","4","5","6","7","8","9","0")
    )

    $minParamArray = @(
        $MinLowerChars,
        $MinUpperChars,
        $MinSpecialChars,
        $MinDigits
    )

    #Merging arrays
    For($i = 0; $i -lt $db.Length; $i++ ) {
        #If we have at least one symbol requested
        if($minParamArray[$i]){
            #Handling case when requested symbols could be greater that we have
            if($minParamArray[$i] -gt $db[$i].Count){
                $multilpeBy = [System.Math]::Ceiling($minParamArray[$i] / $db[$i].Count)
                $db[$i] *= $multilpeBy
            }
            $resultArray += $db[$i] | Get-Random -Count $minParamArray[$i]
        }
    }

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