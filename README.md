# New-Password

### Function that can help you create pseudo-random passwords

Generate pseudo-random password. Can return either string or secure string. 

### Params
```
MinLowerChars
(Default = 5)Specify how many chars in lower case should be in the password.

MinUpperChars
(Default = 1)Specify how many chars in upper case should be in the password.

MinSpecialChars
(Default = 2)Specify how many integer and\or special chars should be in the password.

PasswordLength
(Default = 8)Specify password length.
        
ReturnAsSecureString
(Default = false)Return password as secure string. By default returns plain password.
```

### Examples
```csharp
C:\PS> extension -name "File"
File.txt

C:\PS> New-Password
zSex0=vp

C:\PS> New-Password -PasswordLength 10
z]O9wgtixv

C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4
{yp!@P4alz

C:\PS> New-Password -MinLowerChars 5 -MinUpperChars 1 -MinSpecialChars 4 -ReturnAsSecureString
System.Security.SecureString
```     